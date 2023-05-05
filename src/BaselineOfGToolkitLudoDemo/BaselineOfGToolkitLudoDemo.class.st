Class {
	#name : #BaselineOfGToolkitLudoDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitLudoDemo
}

{ #category : #accessing }
BaselineOfGToolkitLudoDemo class >> gtDependencyAnalysisPreloadedBaselines [
	^ super gtDependencyAnalysisPreloadedBaselines
		copyWith: BaselineOfGToolkit
]

{ #category : #accessing }
BaselineOfGToolkitLudoDemo >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec package: 'GToolkit-Demo-Ludo' ]
]
