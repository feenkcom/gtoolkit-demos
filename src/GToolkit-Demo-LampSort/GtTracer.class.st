"
I am GtTracer, a tool to use `<gtTrace>` pragmas to trace method invocations.

I work together with GtTraceAnnouncement.

I use MetaLink to attach tracing to methods.
I act as the MetaObject for those MetaLinks.

I record the receiver, method, arguments and result of each invocation. 
"
Class {
	#name : #GtTracer,
	#superclass : #Object,
	#instVars : [
		'packages',
		'classes'
	],
	#classVars : [
		'TracingAccouncer'
	],
	#category : #'GToolkit-Demo-LampSort-Tracing'
}

{ #category : #accessing }
GtTracer class >> announcer [
	^ TracingAccouncer ifNil: [ TracingAccouncer := Announcer new ]
]

{ #category : #public }
GtTracer class >> disableAll [
	^ self new disableAll
]

{ #category : #testing }
GtTracer class >> isMyMetaLink: aMetaLink [
]

{ #category : #initalization }
GtTracer >> addClass: className [
	self classes add: className
]

{ #category : #accessing }
GtTracer >> addNumbers: numberCollection [
	<gtTrace>
	^ numberCollection sum
]

{ #category : #initalization }
GtTracer >> addPackage: packageName [
	self packages add: packageName
]

{ #category : #accessing }
GtTracer >> announcer [
	^ self class announcer
]

{ #category : #accessing }
GtTracer >> classes [
	^ classes ifNil: [ classes := OrderedCollection new ]
]

{ #category : #public }
GtTracer >> disable [
	self tracedMethods do: [ :each | self removeMyMetaLinksFrom: each ]
]

{ #category : #public }
GtTracer >> disableAll [
	"Remove all MetaLinks from all methods marked with <gtTrace>,
	independent of package or class"

	| count |
	count := 0.
	#gtTrace gtPragmas contents
		do: [ :eachMethod | count := count + (self removeMyMetaLinksFrom: eachMethod) ].
	^ count
]

{ #category : #public }
GtTracer >> enable [
	| metaLink |
	metaLink := MetaLink new
			metaObject: self;
			selector: self myMetaLinkSelector;
			arguments: #(originalmethod receiver arguments);
			control: #instead.
	self tracedMethods do: [ :each | each ast link: metaLink ]
]

{ #category : #examples }
GtTracer >> gtExampleAddNumbers [
	<gtExample>
	<return: #MemoryLogger>
	| memoryLogger result recordings |
	self addClass: self class name.
	self assert: self tracedMethods equals: {self class >> #addNumbers:}.
	self enable.
	memoryLogger := MemoryLogger new
			name: 'GtTrace';
			beacon: self announcer;
			runFor: GtTraceAnnouncement
				during: [ result := self addNumbers: (1 to: 10) asArray ].
	self assert: result equals: 55.
	recordings := memoryLogger recordings.
	self disable.
	self assert: recordings isNotEmpty.
	self assert: recordings first receiver class equals: self class.
	self assert: recordings first method methodClass equals: self class.
	self assert: recordings first method selector equals: #addNumbers:.
	self assert: recordings first args first equals: (1 to: 10) asArray.
	self assert: recordings first result equals: 55.
	^ memoryLogger
]

{ #category : #examples }
GtTracer >> gtExampleSortRandom [
	<gtExample>
	<return: #MemoryLogger>
	self addClass: #GtLampSort.
	^ self traceDuring: [ GtLampSort new gtExampleSortRandom ]
]

{ #category : #examples }
GtTracer >> gtExampleSortSpecific [
	<gtExample>
	<return: #MemoryLogger>
	self addClass: #GtLampSort.
	^ self traceDuring: [ GtLampSort new gtExampleSortSpecific ]
]

{ #category : #testing }
GtTracer >> isMyMetaLink: aMetaLink [
	^ aMetaLink metaObject class = self class
		and: [ aMetaLink selector = self myMetaLinkSelector ]
]

{ #category : #'meta actions' }
GtTracer >> method: aMethod sendTo: aReceiver withArguments: arguments [
	| time duration result traceAnnouncement |
	traceAnnouncement := GtTraceAnnouncement new
			receiver: aReceiver copy;
			method: aMethod;
			args: (arguments collect: #copy);
			yourself.
	time := Time millisecondClockValue.
	result := aMethod valueWithReceiver: aReceiver arguments: arguments.
	duration := Time millisecondsSince: time.
	traceAnnouncement
		result: result copy;
		duration: duration.
	self announcer announce: traceAnnouncement.
	^ result
]

{ #category : #accessing }
GtTracer >> myMetaLinkSelector [
	^ #method:sendTo:withArguments:
]

{ #category : #accessing }
GtTracer >> packages [
	^ packages ifNil: [ packages := OrderedCollection new ]
]

{ #category : #public }
GtTracer >> removeMyMetaLinksFrom: aMethod [
	| methodNode count |
	count := 0.
	methodNode := aMethod ast.
	methodNode links copy
		do: [ :eachLink | 
			(self isMyMetaLink: eachLink)
				ifTrue: [ 
					methodNode removeLink: eachLink.
					count := count + 1 ] ].
	^ count
]

{ #category : #public }
GtTracer >> traceDuring: block [
	| memoryLogger |
	self enable.
	memoryLogger := MemoryLogger new
		name: 'Trace';
		beacon: self announcer;
		runFor: GtTraceAnnouncement during: block.
	self disable.
	^ memoryLogger
]

{ #category : #public }
GtTracer >> tracedMethods [
	| query packagesQuery classesQuery |
	query := #gtTrace gtPragmas.
	self packages ifNotEmpty: [
		packagesQuery := self packages first gtPackageMatches.
		self packages allButFirstDo: [ :each |
			packagesQuery := packagesQuery | each gtPackageMatches ].
		query := query & packagesQuery ].
	self classes ifNotEmpty: [
		classesQuery := self classes first gtClassMatches.
		self classes allButFirstDo: [ :each |
			classesQuery := classesQuery | each gtClassMatches ].
		query := query & classesQuery ].
	^ query contents
]
