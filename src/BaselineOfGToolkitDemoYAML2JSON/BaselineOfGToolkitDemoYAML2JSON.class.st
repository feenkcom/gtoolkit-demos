Class {
	#name : #BaselineOfGToolkitDemoYAML2JSON,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemoYAML2JSON
}

{ #category : #accessing }
BaselineOfGToolkitDemoYAML2JSON >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'gt4smacc'
					with: [ spec repository: 'github://feenkcom/gt4smacc:main/src' ].
			spec
				package: 'GToolkit-Demo-YAM2JSON'
				with: [ spec requires: #('GT4SmaCC') ] ]
]
