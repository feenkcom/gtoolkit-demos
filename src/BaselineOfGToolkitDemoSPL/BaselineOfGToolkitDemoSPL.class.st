Class {
	#name : #BaselineOfGToolkitDemoSPL,
	#superclass : #BaselineOf,
	#category : #'BaselineOfGToolkitDemoSPL-SPL'
}

{ #category : #accessing }
BaselineOfGToolkitDemoSPL >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'PetitParser2Core'
				with: [ spec repository: 'github://kursjan/petitparser2:master' ].
			spec
				package: 'GToolkit-Demo-SPL'
				with: [ spec requires: #('PetitParser2Core') ] ]
]
