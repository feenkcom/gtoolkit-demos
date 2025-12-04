Class {
	#name : #BaselineOfGToolkitMoldableDevelopmentDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitMoldableDevelopmentDemo
}

{ #category : #baseline }
BaselineOfGToolkitMoldableDevelopmentDemo >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'GToolkitPresenter' with: [
				spec repository: 'github://feenkcom/gtoolkit-presenter:v0.9.30/src' ].

		spec package: 'GToolkit-Demo-MoldableDevelopment'.
	]
]
