Class {
	#name : #BaselineOfGToolkitDemoScripter,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemoScripter
}

{ #category : #'as yet unclassified' }
BaselineOfGToolkitDemoScripter class >> gtDependencyAnalysisPreloadedBaselines [
	^ super gtDependencyAnalysisPreloadedBaselines
		copyWith: BaselineOfGToolkit
]

{ #category : #'as yet unclassified' }
BaselineOfGToolkitDemoScripter >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'GToolkit-Demo-Scripter' ]
]
