"
I provide a context for evaluating SPL programs.

I hold an environment of variables, an output stream, and a program state.
See {{gtClass:name=SPLContextExamples}} for examples.

Here is a typical usage example: {{gtExample:name=SPLContextExamples>>#splContextUsage}}

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
	| parseNode |
	parseNode := self parserClass parse: anSPLProgramSource.
	parseNode isPetit2Failure
		ifTrue: [ (SPLParseError forFailure: parseNode andSource: anSPLProgramSource)
				signal: 'SPL Parse error' ].
	^ parseNode
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
	continuation := (self gtContinuationFor: GtPhlowEmptyView new)
			asElementDo: [ :e | e ].

	envt := (self environment gtVariablesFor: GtPhlowEmptyView new)
			asElementDo: [ :e | e ].

	output := (self gtOutputFor: GtPhlowEmptyView new)
			asElementDo: [ :e | 
				BrVerticalPane new
					matchParent;
					addChild: e ].
	{envt.
		output}
		do: [ :each | 
			each
				aptitude: BrShadowAptitude;
				background: Color white;
				margin: (BlInsets all: 10) ].

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
SPLContext >> gtASTFor: aView [
	<gtView>
	^ aView forward
		title: 'AST';
		priority: 35;
		object: [ self continuation ];
		view: #gtASTFor:;
		actionUpdateButton
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
		actionButtonIcon: BrGlamorousVectorIcons right
			tooltip: 'Step'
			action: [ :aButton :aTab | 
				self updateProgramIfChanged: aButton phlow textViewContent asString.
				self step ];
		actionButtonIcon: BrGlamorousVectorIcons tohere
			tooltip: 'Run'
			action: [ :aButton :aTab | 
				self updateProgramIfChanged: aButton phlow textViewContent asString.
				self run ];
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
SPLContext >> gtHistoryFor: aView [
	<gtView>
	^ aView columnedList
		title: 'History';
		priority: 60;
		items: [ self trace ];
		column: 'Index' 
			text: [ :eachItem :eachIndex | 
				eachIndex asRopedText foreground: Color gray ]
			width: 45;

		column: 'Next statement'
			text: [ :aContext | 
				aContext continuation statements
					ifEmpty: [ '' ]
					ifNotEmpty: [ aContext continuation statements first summary ] ];
		column: 'Environment'
			text: [  "aContext environment printString":aContext | aContext newBindings ];
		column: 'Output'
			text: [ :aContext | aContext newOutput ]
			width: 100;
		actionUpdateButton;
		updateWhen: ValueChanged in: self traceHolder announcer
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
		stencil: [ self composedStateElement ];
		actionButtonIcon: BrGlamorousVectorIcons right
			tooltip: 'Step'
			action: [ :aButton :aTab | 
				self updateProgramIfChanged: aButton phlow textViewContent asString.
				self step ];
		actionButtonIcon: BrGlamorousVectorIcons tohere
			tooltip: 'Run'
			action: [ :aButton :aTab | 
				self updateProgramIfChanged: aButton phlow textViewContent asString.
				self run ]
]

{ #category : #comparing }
SPLContext >> hash [
	"Not really needed. Contexts should not be used as dictionary keys."

	^ self environment hash
]

{ #category : #initialization }
SPLContext >> initialize [
	nodeHolder := NewValueHolder value: (self class parse: '').
	environment := SPLEnvironment new.
	outputHolder := NewValueHolder value: OrderedCollection new.
	traceHolder := NewValueHolder value: OrderedCollection new
]

{ #category : #accessing }
SPLContext >> newBindings [
	"The new bindings, if any"

	| difference aStream |
	self trace size < 1 ifTrue: [ ^ '' ].

	difference := self environment variables
			difference: self trace last environment variables.
	
	aStream := '' writeStream.
	difference
		associationsDo: [ :assoc | 
			aStream
				print: assoc key;
				nextPut: $=;
				print: assoc value;
				nextPut: $; ].
	^ aStream contents
]

{ #category : #accessing }
SPLContext >> newOutput [
	"Return the last output, if there was a new one"

	self trace size < 1 ifTrue: [ ^ '' ].
	^ self outputCollection size > self trace last outputCollection size
		ifTrue: [ self outputCollection last ]
		ifFalse: [ '' ]
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
	self outputCollection
		do: [ :each | 
			result
				nextPutAll: each;
				cr ].
	^ result contents
]

{ #category : #accessing }
SPLContext >> outputCollection [
	^ self outputHolder value
]

{ #category : #accessing }
SPLContext >> outputHolder [
	^ outputHolder
]

{ #category : #copying }
SPLContext >> postCopy [
	"This is called by Object>>#copy to clean up after the shallow copy is  made.
	We start with a shallow copy. We make copies of the values, initialize our state, and copy back the snapshotted values.
	The node is immutable, so should not need to be copied.
	The other values need to be cloned, as they will be updated.
	"

	| environmentCopy nodeCopy outputCopy traceCopy |
	super postCopy.

	nodeCopy := nodeHolder value.
	environmentCopy := environment copy.
	outputCopy := outputHolder value copy.
	traceCopy := traceHolder value copy.

	self initialize.

	nodeHolder value: nodeCopy.
	environment := environmentCopy.
	outputHolder value: outputCopy.
	traceHolder value: traceCopy.
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
SPLContext >> run [
	self reduce.
	^ self output
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
	self
		continuation: ([ self continuation stepInContext: self ]
				onErrorDo: [ :ex | (SPLEvaluationError forError: ex in: self) signal ]).
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

{ #category : #evaluating }
SPLContext >> updateProgramIfChanged: anSPLProgramSource [
	self continuation printString = anSPLProgramSource
		ifFalse: [ self program: anSPLProgramSource ]
]
