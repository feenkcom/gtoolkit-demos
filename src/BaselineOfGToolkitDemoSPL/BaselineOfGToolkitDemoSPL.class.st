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
				baseline: 'GToolkit-Demo-SPL'
				with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ] ]
]
