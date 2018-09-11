Class {
	#name : #GtDemoPlayPage,
	#superclass : #GTPlayPage,
	#instVars : [
		'steps',
		'currentIndex'
	],
	#category : 'GToolkit-Demos'
}

{ #category : #demos }
GtDemoPlayPage class >> moldableEditorTitle [
	^ self of: { 
'container := BlElement new.
container layout: BlFrameLayout new.
container constraintsDo: [ :c |
	c horizontal matchParent.
	c vertical matchParent ].

moldable := BlTextElement new.
moldable text: (''The Moldable Editor'' asRopedText attributes: {
	BrFontFamilyAttribute named: ''Helvetica Neue''.
	BrFontSizeAttribute size: 80.
	BrFontWeightAttribute thin
}).
moldable constraintsDo: [ :c | c linear horizontal alignCenter ].

author := BlTextElement new.
author text: (''Aliaksei Syrel'' asRopedText attributes: {
	BrFontFamilyAttribute named: ''Helvetica Neue''.
	BrFontSizeAttribute size: 60.
	BrFontWeightAttribute thin.
}).
author constraintsDo: [ :c | c linear horizontal alignCenter ].

container addChild: (BlElement new
	layout: BlLinearLayout vertical;
	constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c frame horizontal alignCenter.
		c frame vertical alignCenter ];
	addChildren: { moldable . author })'	
	}
]

{ #category : #'instance creation' }
GtDemoPlayPage class >> of: aCollectionOfString [
	^ self new steps: aCollectionOfString
]

{ #category : #demos }
GtDemoPlayPage class >> ropeTree [
	"Rope tree demo"

	^ self stepping: {
'text := ''The moldable editor'' asRopedText.'.
'text attributes: { BrFontSizeAttribute size: 20 }.'.
'text insertString: '' can be adapted'' at: text size.'.
'text insertString: '' to the context.'' at: text size.'.

'text 
	attributes: { 
		BrFontGenericFamilyAttribute monospace . 
		BrTextForegroundAttribute paint: Color blue } 
	from: 5
	to: 12.'.
'text
	attributes: { BrFontGenericFamilyAttribute monospace } 
	from: 43
	to: 49.'.
'text
		attributes: { BrTextExpandButtonAttribute new 
			attributesCreatingBlock: [
				BrTextAdornmentDynamicAttribute new 	
					beAppend;
					elementBlock: [ (BlEllipse radius: 20) asElement
						constraintsDo: [ :c | c textFlow pushLine ] ] ] } 
		from: 28
		to: 34'
	}
]

{ #category : #'instance creation' }
GtDemoPlayPage class >> stepping: aCollectionOfString [
	^ self of: (aCollectionOfString inject: OrderedCollection new into: [ :aCollection :anAddition |
		aCollection
			ifEmpty: [ aCollection add: anAddition ]
			ifNotEmpty: [ aCollection add: (aCollection last, String cr, anAddition) ].
		aCollection
	])
]

{ #category : #demos }
GtDemoPlayPage class >> transcriptAnimation [
	^ self of: { 
'animation := GtTranscriptExamples new blocAnimation.
animation start'.

'animation := GtTranscriptExamples new blocAnimation.
animation start.

space := BlSpace new.
space extent: 150@150.
space root addChild: animation target.
space show.'.

'transcript := GtTranscript new.

animation := GtTranscriptExamples new blocAnimation.
animation
	addEventHandlerOn: BlAnimationStepEvent
	do: [ :anEvent |
		transcript next
			cr;
			putAll: ''Animation progress: '';
			putAll: anEvent progress asString;
			putAll: '', position: '', animation target children first transformedBounds origin asString ].
animation start.

transcript'.

'transcript := GtTranscript new.

animation := GtTranscriptExamples new blocAnimation.
animation
	addEventHandlerOn: BlAnimationStepEvent
	do: [ :anEvent |
		| snapshot |
		snapshot := animation target asSpartaForm.
		transcript next
			cr;
			expanded: [
				BlElement new
					constraintsDo: [ :c | c textFlow pushLine ];
					size: snapshot extent;
					background: (BlBackground image: snapshot) ];
			putAll: ''Animation progress: '';
			putAll: anEvent progress asString;
			putAll: '', position: '', animation target children first transformedBounds origin asString ].
animation start.

transcript'
}
]

{ #category : #demos }
GtDemoPlayPage class >> transcriptApi [
	"Transcript api demo"

	^ self stepping: {
		'transcript := GtTranscript new.'.
		'
transcript 
	nextPutAll: ''This is an example of'';
	space;
	nextPutAll: ''the new GT Transcript'';
	nextPut: ''.'';
	cr.
transcript.'.
	'
transcript next
	putAll: ''Beside typical text, it can also handle:'';
	cr.
transcript next
	tab;
	color: Color blue;
	putAll: ''Colored text'';
	cr.
transcript.'.
	'
transcript tab.
transcript next	
	fontSize: 20;
	putAll: ''Varying size text'';
	cr.
transcript.'.
	'
transcript next
	tab;
	expanding: [ BlElement new
		background: Color indexedColors atRandom;
		yourself ];
	putAll: ''Embelished with extra expansion''.
transcript cr.
transcript.'.
	'
[ 1/0 ] on: Error do: [ :err | 
	transcript next 
		cr;
		tab;
		putAll: ''Exception: '';
		showException: err.
	transcript cr ].
transcript'

	}
]

{ #category : #demos }
GtDemoPlayPage class >> transcriptIntro [
	^ self of: { 
'transcript := GtTranscript new.

[ 50 timesRepeat: [
	| element |
	element := GtTranscriptExamples new randomElement.

	transcript next
		cr;
		putAll: ''Shape '', element geometry class name;
		putAll: '', size: '', element extent asString;
		putAll: '', color '', element background paint color asString;
		space.
	20 milliSeconds wait
] ] fork.

transcript'.

'transcript := GtTranscript new.

[ 50 timesRepeat: [
	"| element |
	element := GtTranscriptExamples new randomElement.

	transcript next
		cr;
		putAll: ''Shape '', element geometry class name;
		putAll: '', size: '', element extent asString;
		putAll: '', color '', element background paint color asString;
		space.	"
	
	transcript next
		expanded: [ GtTranscriptExamples new randomElement ];
		cr.

	20 milliSeconds wait
] ] fork.

transcript'
}
]

{ #category : #demos }
GtDemoPlayPage class >> uiModel [
	"Interaction between model and UI of the editor"

	^ self stepping: {
		'container := GtDemoEditorScg cointainer.
view := GtDemoEditorScg view.
view contentElement: container.

model := GtDemoEditorScg model.
ui := GtDemoEditorScg ui.
container addChildren: { model . ui }.
view.'.
	'
GtDemoEditorScg link: ui to: model.
view.'.

	'
GtDemoEditorScg requestFrom: ui to: model in: container.
view.'.
	'
GtDemoEditorScg announceFrom: model to: ui in: container.
view'

	}
]

{ #category : #testing }
GtDemoPlayPage >> hasNext [

	^ steps isNotEmpty and: [ currentIndex < steps size ]
]

{ #category : #initialization }
GtDemoPlayPage >> initialize [
	super initialize.
	
	steps := OrderedCollection new.
	currentIndex := 0
]

{ #category : #accessing }
GtDemoPlayPage >> steps [
	^ steps
]

{ #category : #accessing }
GtDemoPlayPage >> steps: anObject [
	steps := anObject.
	self switchNext
]

{ #category : #'as yet unclassified' }
GtDemoPlayPage >> switchNext [
	self hasNext
		ifFalse: [ ^ self ].
		
	currentIndex := currentIndex + 1.
	self content: (steps at: currentIndex)
]
