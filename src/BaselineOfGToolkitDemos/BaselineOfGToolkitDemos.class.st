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
	spec for: #'common' do: [
		spec
			baseline: 'GToolkitCognitiveServiceDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitObjectNeuralNetworkDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitGitHubApiDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitWhatMakesBlocSpecialDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitMoldableDevelopmentDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitPharo101' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitMoldableAnalysisDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitMemoryDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitLudoDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoSlideshows' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoSPL' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoYAML2JSON' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoStackMachine' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoWebsiteExplorer' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoParseNodeVisitor' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoPetitParser' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoPrices' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitTutorialPrices' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoReflection' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoSubtitles' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoFCA' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitLampSortDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitPythonDemo' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoGPT' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoSnippets' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
		spec
			baseline: 'GToolkitDemoScripter' with: [
				spec repository: 'github://feenkcom/gtoolkit-demos:v0.8.3024/src' ].
	]
]
