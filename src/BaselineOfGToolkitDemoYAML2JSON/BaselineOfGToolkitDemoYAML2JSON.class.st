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
				baseline: 'GToolkit4SmaCC'
				with: [ spec repository: 'github://feenkcom/gt4smacc:main/src' ].
			spec package: 'GToolkit-Demo-YAML2JSON' with: [ spec requires: #('GToolkit4SmaCC') ] ]
]
