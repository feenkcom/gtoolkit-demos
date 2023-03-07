"
I provide a context for evaluating SPL programs.
I hold an environment of variables, an output stream, and a program state.
See {{gtClass:name=SPLContextExamples}} for examples.
"
Class {
	#name : #SPLContext,
	#superclass : #Object,
	#instVars : [
		'environment',
		'outputHolder',
		'traceHolder',
		'nodeHolder'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLContext class >> for: anSPLProgramSource [
	^ self forProgram: anSPLProgramSource
]

{ #category : #accessing }
SPLContext class >> forExpression: anSPLProgramSource [
	^ self new
		continuation: (self parseExpression: anSPLProgramSource);
		yourself
]

{ #category : #accessing }
SPLContext class >> forProgram: anSPLProgramSource [
	^ self new
		continuation: (self parse: anSPLProgramSource);
		yourself
]

{ #category : #parsing }
SPLContext class >> parse: anSPLProgramSource [
	^ self parserClass parse: anSPLProgramSource
]

{ #category : #parsing }
SPLContext class >> parseExpression: anSPLProgramSource [
	^ self parserClass new expression end parse: anSPLProgramSource
]

{ #category : #parsing }
SPLContext class >> parserClass [
	^ SPLParser
]

{ #category : #comparing }
SPLContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self continuation = anObject continuation
		and: [ self environment = anObject environment
				and: [ self outputHolder value = anObject outputHolder value ] ]
]

{ #category : #view }
SPLContext >> composedStateElement [
	| continuation envt output verticalContainer horizontalContainer |
	continuation := (self gtContinuationFor: GtPhlowEmptyView new) asElementDo: [ :e | e ].

	envt := (self environment gtVariablesFor: GtPhlowEmptyView new)
			asElementDo: [ :e | e ].

	output := (self gtOutputFor: GtPhlowEmptyView new) asElementDo: [ :e | e ].

	{continuation.
		envt.
		output}
		do: [ :each | each border: (BlBorder paint: Color lightGray width: 1) ].

	verticalContainer := BlElement new.
	verticalContainer
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ].
	verticalContainer
		addChildren: {envt.
				output}.

	horizontalContainer := BlElement new.
	horizontalContainer
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ].
	horizontalContainer
		addChildren: {continuation.
				verticalContainer}.
	^ horizontalContainer asScalableElement
]

{ #category : #accessing }
SPLContext >> continuation [
	^ nodeHolder value
]

{ #category : #accessing }
SPLContext >> continuation: anSPLCodeNode [
	| copy |
	self nodeHolder value: anSPLCodeNode.
	copy := self copy.
	self trace addLast:  copy.
	self traceHolder valueChanged
]

{ #category : #accessing }
SPLContext >> environment [
	^ environment
]

{ #category : #accessing }
SPLContext >> environment: anObject [
	environment := anObject
]

{ #category : #accessing }
SPLContext >> gtContextStateFor: aView [
	"<gtView>"
	^ aView explicit
		title: 'Context state';
		priority: 10;
		stencil: [ "self composedStateElement" ]
		
]

{ #category : #accessing }
SPLContext >> gtContinuationFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Continuation';
		priority: 30;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self continuation printString asRopedText ];
		actionUpdateButton;
		updateWhen: ValueChanged in: self stateHolder announcer
]

{ #category : #accessing }
SPLContext >> gtEnvironmentFor: aView [
<gtView>
^ aView forward

		title: 'Environment';
		priority: 40;
		object: [ self environment ];
		view: #gtVariablesFor:;
		actionUpdateButton;
		updateWhen: ValueChanged in: self environment announcer
]

{ #category : #accessing }
SPLContext >> gtExpressionFor: aView [
	<gtView>
	^ aView empty
]

{ #category : #accessing }
SPLContext >> gtOutputFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Output';
		priority: 50;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self output asRopedText ];
		actionUpdateButton;
		updateWhen: ValueChanged in: self outputHolder announcer
]

{ #category : #accessing }
SPLContext >> gtStateFor: aView [
	<gtView>
	^ aView explicit
		title: 'State';
		priority: 10;
		stencil: [  self composedStateElement ]
]

{ #category : #accessing }
SPLContext >> gtTraceFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Trace';
		priority: 60;
		items: [ self trace ];
		column: 'Next statement'
			text: [ :aContext | 
				aContext continuation statements
					ifEmpty: [ 'empty' ]
					ifNotEmpty: [ aContext continuation statements last printString ] ];
		column: 'Environment'
			text: [ :aContext | 
				aContext environment variables
					ifEmpty: [ 'empty' ]
					ifNotEmpty:  [ aContext environment variables size printString  ] ];
		column: 'Output'
			text: [ :aContext | 
				aContext outputHolder value
					ifEmpty: [ 'empty' ]
					ifNotEmpty: [ aContext outputHolder value last ] ];
		actionUpdateButton;
		updateWhen: ValueChanged in: self outputHolder announcer
]

{ #category : #comparing }
SPLContext >> hash [
	"Not really needed. Contexts should not be used as dictionary keys."

	^ self environment hash
]

{ #category : #initialization }
SPLContext >> initialize [
	nodeHolder := NewValueHolder new.
	environment := SPLEnvironment new.
	outputHolder := NewValueHolder value: OrderedCollection new.
	traceHolder := NewValueHolder value: OrderedCollection new.
]

{ #category : #accessing }
SPLContext >> nodeHolder [
	^ nodeHolder
]

{ #category : #accessing }
SPLContext >> output [
	"The output as a String"

	| result |
	result := '' writeStream.
	self outputHolder value
		do: [ :each | 
			result
				nextPutAll: each;
				cr ].
	^ result contents
]

{ #category : #accessing }
SPLContext >> outputHolder [
	^ outputHolder
]

{ #category : #copying }
SPLContext >> postCopy [
	"This is called by Object>>#copy to clean up after the shallow copy is  made.
	The continuation in the nodeHolder is immutable, so doesn't need to be copied.
	The environment is updated, so must be copied. It has its own copy method.
	The output and trace are collections, so we just need shallow copies of those.
	"

	super postCopy.
	environment := environment copy.
	outputHolder value: outputHolder value copy.
	traceHolder value: traceHolder value copy. 
	^ self
]

{ #category : #accessing }
SPLContext >> printLn: aString [
	self outputHolder value addLast: aString.
	self outputHolder valueChanged
]

{ #category : #evaluating }
SPLContext >> program: anSPLProgramSource [
	"Mainly for interactive testing to change the program on the fly."
	^ self
		continuation: (self class parse: anSPLProgramSource);
		yourself
]

{ #category : #evaluating }
SPLContext >> reduce [
	[ self continuation isReduced not ] whileTrue: [ self step ].
	^ self continuation
]

{ #category : #evaluating }
SPLContext >> run: anSPLProgramSource [
	"Mainly for interactive testing to change the program on the fly."

	self program: anSPLProgramSource.
	^ self reduce
]

{ #category : #accessing }
SPLContext >> stateHolder [
	^ nodeHolder
]

{ #category : #evaluating }
SPLContext >> step [
	self continuation: (self continuation stepInContext: self).
	^ self continuation
]

{ #category : #accessing }
SPLContext >> trace [
	^ self traceHolder value
]

{ #category : #accessing }
SPLContext >> traceHolder [
	^ traceHolder
]
