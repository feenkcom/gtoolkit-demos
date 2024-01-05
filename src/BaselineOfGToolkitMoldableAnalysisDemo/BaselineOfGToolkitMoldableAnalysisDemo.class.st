Class {
	#name : #BaselineOfGToolkitMoldableAnalysisDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitMoldableAnalysisDemo
}

{ #category : #loading }
BaselineOfGToolkitMoldableAnalysisDemo class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gtoolkit-demos' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGToolkitMoldableAnalysisDemo >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'GToolkitConstrainer' with: [
				spec repository: 'github://feenkcom/gtoolkit-constrainer:main/src' ].
		spec 
			package: 'GToolkit-Demo-Argouml-ArchitectureRules' with: [
				spec requires: #('GToolkitConstrainer' ). ];
			package: 'GToolkit-Demo-MoldableAnalysis'. ].

]
