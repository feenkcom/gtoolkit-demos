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
				spec repository: 'github://feenkcom/Bloc:v0.5.20/src' ].
		spec package: 'GToolkit-Demo-WhatMakesBlocSpecial'. ].

]
