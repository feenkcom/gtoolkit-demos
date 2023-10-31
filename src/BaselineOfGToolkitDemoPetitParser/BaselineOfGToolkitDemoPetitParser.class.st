Class {
	#name : #BaselineOfGToolkitDemoPetitParser,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemoPetitParser
}

{ #category : #baselines }
BaselineOfGToolkitDemoPetitParser >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'GToolkit4PetitParser2'
				with: [ spec repository: 'github://feenkcom/gt4petitparser2:main/src' ].
			spec
				package: 'GToolkit-Demo-PetitParser'
				with: [ spec requires: #('GToolkit4PetitParser2') ] ]
]
