Class {
	#name : #BaselineOfGToolkitPharo101,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitPharo101
}

{ #category : #baselines }
BaselineOfGToolkitPharo101 >> baseline: spec [
	<baseline>
	spec for: #'common' do: [ 
		spec baseline: 'Brick' with: [
			spec repository: 'github://feenkcom/Brick/src' ].
		spec package: 'GToolkit-Demo-Pharo101' with: [
			spec requires: #(#Brick) ] ].
]
