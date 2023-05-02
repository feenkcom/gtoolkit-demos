Class {
	#name : #BaselineOfGToolkitDemoSPL,
	#superclass : #BaselineOf,
	#category : #'BaselineOfGToolkitDemoSPL-SPL'
}

{ #category : #baseline }
BaselineOfGToolkitDemoSPL >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.8.982/src' ].
		spec
			baseline: 'LepiterEngineCore' with: [
				spec repository: 'github://feenkcom/lepiter:v0.6.1462/src' ].
		spec
			baseline: 'LepiterEngineExtensions' with: [
				spec repository: 'github://feenkcom/lepiter:v0.6.1462/src' ].
		spec
			baseline: 'GToolkit4PetitParser2' with: [
				spec repository: 'github://feenkcom/gt4petitparser2:v0.8.31/src' ].

		spec package: 'GToolkit-Demo-Slideshows'.
		spec package: 'GToolkit-Demo-SPL' with: [
			spec requires: #('GToolkitPhlow' 'GToolkit4PetitParser2' 'LepiterEngineCore' 'LepiterEngineExtensions' 'GToolkit-Demo-Slideshows') ].
	]
]
