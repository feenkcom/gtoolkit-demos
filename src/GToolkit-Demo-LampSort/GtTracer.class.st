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
]

{ #category : #public }
GtTracer >> disableAll [
]

{ #category : #public }
GtTracer >> enable [
]

{ #category : #accessing }
GtTracer >> packages [
	^ packages ifNil: [ packages := OrderedCollection new ]
]

{ #category : #public }
GtTracer >> tracedMethods [
	| query packagesQuery classesQuery|
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
