Class {
	#name : #BaselineOfGToolkitDemoSPL,
	#superclass : #BaselineOf,
	#category : #'BaselineOfGToolkitDemoSPL-SPL'
}

{ #category : #accessing }
BaselineOfGToolkitDemoSPL >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'GToolkit-Demo-SPL' ]
]
