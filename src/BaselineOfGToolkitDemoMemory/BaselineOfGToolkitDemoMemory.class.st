Class {
	#name : #BaselineOfGToolkitDemoMemory,
	#superclass : #BaselineOf,
	#category : #'BaselineOfGToolkitDemoMemory-BaselineOfGToolkitDemoMemory'
}

{ #category : #accessing }
BaselineOfGToolkitDemoMemory >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec package: 'GToolkit-Demo-Memory'. ].
]
