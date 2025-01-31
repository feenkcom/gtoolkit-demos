Class {
	#name : #BaselineOfGToolkitDemoSnippets,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemoSnippets
}

{ #category : #dependencies }
BaselineOfGToolkitDemoSnippets class >> gtDependencyAnalysisPreloadedBaselines [
	^ super gtDependencyAnalysisPreloadedBaselines
		copyWith: BaselineOfGToolkit
]

{ #category : #baseline }
BaselineOfGToolkitDemoSnippets >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec package: 'GToolkit-Demo-Snippets' ]
]
