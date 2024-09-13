Class {
	#name : #BaselineOfGToolkitDemoGPT,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemoGPT
}

{ #category : #'as yet unclassified' }
BaselineOfGToolkitDemoGPT >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'GToolkit-Demo-GPT';
				package: 'GToolkit-Demo-Tokenizer' ]
]
