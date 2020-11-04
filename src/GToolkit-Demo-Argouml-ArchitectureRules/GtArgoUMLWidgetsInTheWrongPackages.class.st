Class {
	#name : #GtArgoUMLWidgetsInTheWrongPackages,
	#superclass : #GtArgoUMLConstraint,
	#category : #'GToolkit-Demo-Argouml-ArchitectureRules'
}

{ #category : #accessing }
GtArgoUMLWidgetsInTheWrongPackages >> description [
	^ 'Classes representing widgets (inherit from ''java.awt.Component'') should be placed in packages that contain the ''ui'' component in their name.'
]

{ #category : #accessing }
GtArgoUMLWidgetsInTheWrongPackages >> issues [
	| allWidgetClasses |
	allWidgetClasses := self model allModelClasses select: [ :aClass |
 		aClass superclassHierarchyGroup anySatisfy: [ :aSuperclass |
			aSuperclass mooseName = 'java::awt::Component' ] ].
	^ allWidgetClasses reject: [ :aClass ||containerName|
		containerName := aClass container mooseName.
		(containerName includesSubstring: '::ui::') or: [
			containerName endsWith: '::ui'] ].
]

{ #category : #accessing }
GtArgoUMLWidgetsInTheWrongPackages >> name [
	 ^ 'Widgets placed in the wrong package'
]

{ #category : #accessing }
GtArgoUMLWidgetsInTheWrongPackages >> stakeholder [
 ^ GtArgoUMLConstraintStakeholder developmentTeam
]
