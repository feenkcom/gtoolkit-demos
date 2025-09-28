Class {
	#name : #BaselineOfGToolkitDemoPetitParser,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemoPetitParser
}

{ #category : #baseline }
BaselineOfGToolkitDemoPetitParser >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'GToolkit4PetitParser2' with: [
				spec repository: 'github://feenkcom/gt4petitparser2:v0.8.53/src' ].

		spec package: 'GToolkit-Demo-PetitParser' with: [
			spec requires: #(#GToolkit4PetitParser2) ].
	]
]
