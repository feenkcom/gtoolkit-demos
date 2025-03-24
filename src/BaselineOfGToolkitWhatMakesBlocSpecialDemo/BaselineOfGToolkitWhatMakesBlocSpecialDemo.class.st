"
1. What makes Bloc special
Learn more about it in {{gtClass:GtWhatMakesBlocSpecialExplanation}}


"
Class {
	#name : #BaselineOfGToolkitWhatMakesBlocSpecialDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitWhatMakesBlocSpecialDemo
}

{ #category : #baseline }
BaselineOfGToolkitWhatMakesBlocSpecialDemo >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'Bloc' with: [
				spec repository: 'github://feenkcom/Bloc:v0.8.797/src' ].

		spec package: 'GToolkit-Demo-WhatMakesBlocSpecial'.
	]
]
