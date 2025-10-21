Class {
	#name : #BaselineOfGToolkitPharo101,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitPharo101
}

{ #category : #baseline }
BaselineOfGToolkitPharo101 >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'Brick' with: [
				spec repository: 'github://feenkcom/Brick:v0.8.1719/src' ].

		spec package: 'GToolkit-Demo-Pharo101' with: [
			spec requires: #(#Brick) ].
	]
]
