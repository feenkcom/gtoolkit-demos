Class {
	#name : #BaselineOfGToolkitDemoSlideshows,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemoSlideshows
}

{ #category : #accessing }
BaselineOfGToolkitDemoSlideshows class >> gtDependencyAnalysisPreloadedBaselines [
	^ super gtDependencyAnalysisPreloadedBaselines
		copyWith: BaselineOfGToolkit
]

{ #category : #accessing }
BaselineOfGToolkitDemoSlideshows >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec package: 'GToolkit-Demo-Slideshows' ]
]
