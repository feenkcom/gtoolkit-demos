Class {
	#name : #BaselineOfGToolkitMoldableAnalysisDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitMoldableAnalysisDemo
}

{ #category : #baseline }
BaselineOfGToolkitMoldableAnalysisDemo >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'GToolkitConstrainer' with: [
				spec repository: 'github://feenkcom/gtoolkit-constrainer/src' ].
		spec 
			package: 'GToolkit-Demo-Argouml-ArchitectureRules' with: [
				spec requires: #('GToolkitConstrainer' ) ];
			package: 'GToolkit-Demo-MoldableAnalysis' ].
]
