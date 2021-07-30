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
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.420/src' ];
			baseline: 'GToolkitObjectNeuralNetworkDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.420/src' ];
			baseline: 'GToolkitGitHubApiDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.420/src' ];
			baseline: 'GToolkitWhatMakesBlocSpecialDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.420/src' ];
			baseline: 'GToolkitMoldableDevelopmentDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.420/src' ];
			baseline: 'GToolkitPharo101' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.420/src' ];
			baseline: 'GToolkitMoldableAnalysisDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.420/src' ]. ].

]
