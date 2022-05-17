Class {
	#name : #BaselineOfGToolkitDemos,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemos
}

{ #category : #baseline }
BaselineOfGToolkitDemos >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'GToolkitCognitiveServiceDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.671/src' ].
		spec
			baseline: 'GToolkitObjectNeuralNetworkDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.671/src' ].
		spec
			baseline: 'GToolkitGitHubApiDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.671/src' ].
		spec
			baseline: 'GToolkitWhatMakesBlocSpecialDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.671/src' ].
		spec
			baseline: 'GToolkitMoldableDevelopmentDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.671/src' ].
		spec
			baseline: 'GToolkitPharo101' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.671/src' ].
		spec
			baseline: 'GToolkitMoldableAnalysisDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.671/src' ].
		spec
			baseline: 'GToolkitMemoryDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.671/src' ].
		spec
			baseline: 'GToolkitLudoDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.671/src' ].
		spec
			baseline: 'GToolkitDemoSlideshows' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.671/src' ].
	]
]
