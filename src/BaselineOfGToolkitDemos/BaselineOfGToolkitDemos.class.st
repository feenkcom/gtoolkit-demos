Class {
	#name : #BaselineOfGToolkitDemos,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemos
}

{ #category : #accessing }
BaselineOfGToolkitDemos class >> loadLepiter [
	"BaselineOfGToolkitDemos loadLepiter"
	| currentProperties registry |
	registry := self class environment at: #LeDatabasesRegistry.
	currentProperties := registry defaultLogicalDatabase
		                     properties.
	currentProperties addRegisteredDirectory:
		FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'feenkcom'
		/ 'gtoolkit-demos' / 'lepiter'.

	registry default defaultLogicalDatabase reload
]

{ #category : #baseline }
BaselineOfGToolkitDemos >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'GToolkitCognitiveServiceDemo'
			with: [ 
				spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
			baseline: 'GToolkitObjectNeuralNetworkDemo'
			with: [ 
				spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
			baseline: 'GToolkitGitHubApiDemo'
			with: [ 
				spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
			baseline: 'GToolkitWhatMakesBlocSpecialDemo'
			with: [ 
				spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
			baseline: 'GToolkitMoldableDevelopmentDemo'
			with: [ 
				spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
			baseline: 'GToolkitPharo101'
			with: [ 
				spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
			baseline: 'GToolkitMoldableAnalysisDemo'
			with: [ 
				spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
			baseline: 'GToolkitMemoryDemo'
			with: [ 
				spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
			baseline: 'GToolkitLudoDemo'
			with: [ 
				spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
			baseline: 'GToolkitDemoSlideshows'
			with: [ 
				spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ] ]
]
