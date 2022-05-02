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
	spec for: #'common' do: [
		spec
			baseline: 'GToolkitCognitiveServiceDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.635/src' ].
		spec
			baseline: 'GToolkitObjectNeuralNetworkDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.635/src' ].
		spec
			baseline: 'GToolkitGitHubApiDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.635/src' ].
		spec
			baseline: 'GToolkitWhatMakesBlocSpecialDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.635/src' ].
		spec
			baseline: 'GToolkitMoldableDevelopmentDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.635/src' ].
		spec
			baseline: 'GToolkitPharo101' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.635/src' ].
		spec
			baseline: 'GToolkitMoldableAnalysisDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.635/src' ].
		spec
			baseline: 'GToolkitMemoryDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.635/src' ].
		spec
			baseline: 'GToolkitLudoDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.635/src' ].
	]
]
