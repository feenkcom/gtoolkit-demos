"
These Scripter examples are used to illustrate Moldable Development Patterns.
They can also be used as tutorial examples for Scripter scripts.
"
Class {
	#name : #PatternScripterExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Scripter-Examples'
}

{ #category : #'as yet unclassified' }
PatternScripterExamples >> moldableToolViewCodeScript [
	<gtExample>
	| scripter game |
	scripter := BlScripter new.
	game := GtLudoRecordingGameExamples new gameShowingAllMoves6.
	scripter element: (GtInspector createOn: game) maximized.
	scripter click
		id: #bar index: 5;
		play.	"Select the Moves view."
	scripter click
		id: #bar index: 2;
		modifiers: BlKeyModifiers alt;
		play.	"Open the source view."
	^ scripter	"elementWithoutParent"
]
