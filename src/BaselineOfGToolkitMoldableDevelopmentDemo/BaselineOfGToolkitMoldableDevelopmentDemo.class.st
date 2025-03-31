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
				spec repository: 'github://feenkcom/gtoolkit-presenter:v0.8.2228/src' ].

		spec package: 'GToolkit-Demo-MoldableDevelopment'.
	]
]
