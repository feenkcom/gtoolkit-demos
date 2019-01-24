"
!What makes Bloc special

Learn more about it in ${class:GtWhatMakesBlocSpecialExamples}$
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
		spec baseline: 'Bloc' with: [
				spec repository: 'github://pharo-graphics/Bloc:v0.4.4/src' ].
		spec package: 'GToolkit-Demo-WhatMakesBlocSpecial'. ].

]
