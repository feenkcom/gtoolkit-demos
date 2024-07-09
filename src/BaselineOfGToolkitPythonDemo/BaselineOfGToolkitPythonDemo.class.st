Class {
	#name : #BaselineOfGToolkitPythonDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitPythonDemo
}

{ #category : #accessing }
BaselineOfGToolkitPythonDemo >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec package: 'GToolkit-Demo-Python' ]
]
