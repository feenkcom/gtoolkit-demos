Class {
	#name : #BaselineOfGToolkitObjectNeuralNetworkDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitObjectNeuralNetworkDemo
}

{ #category : #baseline }
BaselineOfGToolkitObjectNeuralNetworkDemo >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'Bloc' with: [
				spec repository: 'github://feenkcom/Bloc:v0.8.513/src' ].

		spec package: 'GToolkit-Demo-ObjectNeuralNetwork'.
	]
]
