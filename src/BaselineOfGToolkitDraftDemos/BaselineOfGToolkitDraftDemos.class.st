Class {
	#name : #BaselineOfGToolkitDraftDemos,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDraftDemos
}

{ #category : #'lepiter-store' }
BaselineOfGToolkitDraftDemos class >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'feenkcom' / 'gtoolkit-demos' / 'lepiter'.
	LeDatabasesRegistry default defaultLogicalDatabase reload
]

{ #category : #baseline }
BaselineOfGToolkitDraftDemos >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'GToolkit-Demos-GtHome'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'Gtoolkit-Demos-PetitParser'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkit-Demo-SPL'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ] ]
]
