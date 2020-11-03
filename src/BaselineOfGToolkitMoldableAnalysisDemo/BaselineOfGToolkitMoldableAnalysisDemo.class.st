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
			package: 'GToolkit-Demo-Argouml-ArchitectureRules';
			package: 'GToolkit-Demo-MoldableAnalysis' ].
]
