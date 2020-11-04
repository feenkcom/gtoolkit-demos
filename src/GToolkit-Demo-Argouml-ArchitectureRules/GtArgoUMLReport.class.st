Class {
	#name : #GtArgoUMLReport,
	#superclass : #GtConstrainerReport,
	#instVars : [
		'model'
	],
	#category : #'GToolkit-Demo-Argouml-ArchitectureRules'
}

{ #category : #'instance creation' }
GtArgoUMLReport class >> onModel: aModel [
	^ self basicNew
		model: aModel;
		initialize
]

{ #category : #private }
GtArgoUMLReport >> build: aComposite [
	aComposite name: 'ArgoUML Report'.
	aComposite
		addConstraint: (GtArgoUMLDeprecatedClassesWithNoDeprecatedClients new 
			model: self model);
		addConstraint: (GtArgoUMLWidgetsInTheWrongPackages new 
			model: self model);
		addConstraint: (GtArgoUMLInvalidUMLModulesDependencies new 
			model: self model)

]

{ #category : #accessing }
GtArgoUMLReport >> model [
	^ model
]

{ #category : #accessing }
GtArgoUMLReport >> model: aModel [
	model := aModel
]
