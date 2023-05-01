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
				baseline: 'GToolkitPhlow'
					with: [ spec repository: 'github://feenkcom/gtoolkit-phlow:main/src' ];
				baseline: 'LepiterEngineCore'
					with: [ spec repository: 'github://feenkcom/lepiter:main/src' ];
				baseline: 'LepiterEngineExtensions'
					with: [ spec repository: 'github://feenkcom/lepiter:main/src' ];
				baseline: 'GToolkit4PetitParser2'
					with: [ spec repository: 'github://feenkcom/gt4petitparser2:main/src' ].
			spec package: 'GToolkit-Demo-Slideshows'.
			spec
				package: 'GToolkit-Demo-SPL'
				with: [ spec
						requires: #('GToolkitPhlow' 'GToolkit4PetitParser2' 'LepiterEngineCore' 'LepiterEngineExtensions' 'GToolkit-Demo-Slideshows') ] ]
]
