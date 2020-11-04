Class {
	#name : #GtArgoUMLDeprecatedClassesWithNoDeprecatedClients,
	#superclass : #GtArgoUMLConstraint,
	#category : #'GToolkit-Demo-Argouml-ArchitectureRules'
}

{ #category : #accessing }
GtArgoUMLDeprecatedClassesWithNoDeprecatedClients >> description [
	^ 'Deprecated classes should not be used from classes that are not themselves deprecated.'
]

{ #category : #'gt extensions' }
GtArgoUMLDeprecatedClassesWithNoDeprecatedClients >> gtViewDependenciesFor: aView [
	<gtView>
	^ aView mondrian 	
		title: 'Graph';
		painting: [ :view |
			| stillUsedClasses |
			stillUsedClasses := self issues.
			view nodes
				stencil: [:each |
					BlElement new
						size: 5@5;
						geometry: BlCircle new;
						background:((each isAnnotatedWith: 'Deprecated')
							ifTrue: [Color red]
							ifFalse: [Color gray]) ];
				with: (stillUsedClasses, (stillUsedClasses flatCollect: #clientTypes)) asSet.

			view edges connectFromAll: #clientTypes. 
			view layout force. 
			view ]
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
