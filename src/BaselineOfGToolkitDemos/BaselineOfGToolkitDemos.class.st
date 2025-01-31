Class {
	#name : #BaselineOfGToolkitDemos,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemos
}

{ #category : #loading }
BaselineOfGToolkitDemos class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gtoolkit-demos' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

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
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoPrices'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitTutorialPrices'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoReflection'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoSubtitles'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoFCA'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitLampSortDemo'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitPythonDemo'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoGPT'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoSnippets'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ];
				baseline: 'GToolkitDemoScripter'
					with: [ spec repository: 'github://feenkcom/gtoolkit-demos:main/src' ] ]
]
