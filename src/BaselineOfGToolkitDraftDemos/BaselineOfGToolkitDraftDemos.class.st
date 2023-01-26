Class {
	#name : #BaselineOfGToolkitDraftDemos,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDraftDemos
}

{ #category : #accessing }
BaselineOfGToolkitDraftDemos >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'Gtoolkit-DraftDemos-GtHome'
			with: [ 
				spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ]]
]

{ #category : #accessing }
BaselineOfGToolkitDraftDemos >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'feenkcom' / 'gtoolkit-demos' / 'lepiter'.
	LeDatabasesRegistry default defaultLogicalDatabase reload
]
