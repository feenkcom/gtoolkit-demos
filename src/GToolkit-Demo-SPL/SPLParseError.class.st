Class {
	#name : #SPLParseError,
	#superclass : #Error,
	#instVars : [
		'source',
		'failure'
	],
	#category : #'GToolkit-Demo-SPL-Exceptions'
}

{ #category : #'instance creation' }
SPLParseError class >> forFailure: aParseNode andSource: anSPLProgramSource [
	^ self new
		failure: aParseNode;
		source: anSPLProgramSource;
		yourself
]

{ #category : #accessing }
SPLParseError >> failure: aParseNode [
	failure := aParseNode
]

{ #category : #views }
SPLParseError >> gtSourceFor: aView [
	<gtView>
	<gtExceptionView>
	^ aView textEditor
		title: 'Source';
		priority: 20;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ source asRopedText ];
		actionUpdateButton
]

{ #category : #views }
SPLParseError >> gtTreeFor: aView [
	<gtView>
	<gtExceptionView>
	"self debugResult children isEmpty ifTrue: [ ^ aView empty ]."
	^ aView columnedTree
		title: 'Parse error';
		priority: 10;
		items: [ {failure debugResult children first} ];
		column: 'Parser' text: [ :debuggerResult | debuggerResult gtFormattedText ];
		column: 'Value' text: [ :debuggerResult | 
			debuggerResult result printStringLimitedTo: 50 ];
		children: [ :debuggerResult | debuggerResult children ]
]

{ #category : #accessing }
SPLParseError >> source: anSPLProgramSource [
	source := anSPLProgramSource
]
