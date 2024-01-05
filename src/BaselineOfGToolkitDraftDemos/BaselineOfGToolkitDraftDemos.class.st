Class {
	#name : #BaselineOfGToolkitDraftDemos,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDraftDemos
}

{ #category : #baseline }
BaselineOfGToolkitDraftDemos >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Gtoolkit-Demos-PetitParser'
				with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ] ]
]
