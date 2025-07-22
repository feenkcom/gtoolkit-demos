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
				spec repository: 'github://feenkcom/gtoolkit-constrainer:v0.8.20/src' ].

		spec package: 'GToolkit-Demo-Argouml-ArchitectureRules' with: [
			spec requires: #(#GToolkitConstrainer) ].
		spec package: 'GToolkit-Demo-MoldableAnalysis'.
	]
]
