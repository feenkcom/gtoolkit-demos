Class {
	#name : #BaselineOfGToolkitDemoSPL,
	#superclass : #BaselineOf,
	#category : #'BaselineOfGToolkitDemoSPL-SPL'
}

{ #category : #accessing }
BaselineOfGToolkitDemoSPL class >> gtDependencyAnalysisPreloadedBaselines [
	^ super gtDependencyAnalysisPreloadedBaselines
		copyWith: BaselineOfGToolkit
]

{ #category : #accessing }
BaselineOfGToolkitDemoSPL >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'GToolkit4PetitParser2'
				with: [ spec repository: 'github://feenkcom/gt4petitparser2:main/src' ].
			spec package: 'GToolkit-Demo-Slideshows'.
			spec
				package: 'GToolkit-Demo-SPL'
				with: [ spec requires: #('GToolkit4PetitParser2' 'GToolkit-Demo-Slideshows') ] ]
]
