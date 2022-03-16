Class {
	#name : #BaselineOfGToolkitMemoryDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitMemoryDemo
}

{ #category : #accessing }
BaselineOfGToolkitMemoryDemo >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec package: 'GToolkit-Demo-Memory' ]
]
