Class {
	#name : #GtArgoUMLDeprecatedClassesWithNoDeprecatedClients,
	#superclass : #GtArgoUMLConstraint,
	#category : #'GToolkit-Demo-Argouml-ArchitectureRules'
}

{ #category : #accessing }
GtArgoUMLDeprecatedClassesWithNoDeprecatedClients >> description [
	^ 'Deprecated classes should not be used from classes that are not themselves deprecated.'
]

{ #category : #accessing }
GtArgoUMLDeprecatedClassesWithNoDeprecatedClients >> issues [
	| allDeprecatedClasses |
	allDeprecatedClasses := self model allModelClasses select: [ :each |
		each isAnnotatedWith: 'Deprecated' ].
	^ allDeprecatedClasses select: [ :each |
		each clientTypes anySatisfy: [ :aClient |
			(aClient isAnnotatedWith: 'Deprecated') not ] ]
]

{ #category : #accessing }
GtArgoUMLDeprecatedClassesWithNoDeprecatedClients >> name [
	^ 'Deprecated classes with no deprecated clients'
]

{ #category : #accessing }
GtArgoUMLDeprecatedClassesWithNoDeprecatedClients >> stakeholder [
  ^ GtArgoUMLConstraintStakeholder developmentTeam
]

{ #category : #accessing }
GtArgoUMLDeprecatedClassesWithNoDeprecatedClients >> status [ 
	^ GtNeutralConstraintStatus new
]
