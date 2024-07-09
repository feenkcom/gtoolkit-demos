Class {
	#name : #BaselineOfGToolkitPythonDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtoolkitPythonDemo
}

{ #category : #accessing }
BaselineOfGToolkitPythonDemo >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec package: 'GToolkit-Demo-Python' ]
]
