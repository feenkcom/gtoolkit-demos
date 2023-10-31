Class {
	#name : #BaselineOfGToolkitDemos,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemos
}

{ #category : #baseline }
BaselineOfGToolkitDemos >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'GToolkitCognitiveServiceDemo'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitObjectNeuralNetworkDemo'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitGitHubApiDemo'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitWhatMakesBlocSpecialDemo'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitMoldableDevelopmentDemo'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitPharo101'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitMoldableAnalysisDemo'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitMemoryDemo'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitLudoDemo'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoSlideshows'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoSPL'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoYAML2JSON'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoStackMachine'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoWebsiteExplorer'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoParseNodeVisitor'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoPetitParser'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ] ]
]
