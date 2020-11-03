Class {
	#name : #GtArgoUMLConstraintStakeholder,
	#superclass : #GtConstraintStakeholder,
	#classInstVars : [
		'developmentTeam',
		'architectureTeam'
	],
	#category : #'GToolkit-Demo-Argouml-ArchitectureRules'
}

{ #category : #'instance creation' }
GtArgoUMLConstraintStakeholder class >> architectureTeam [
  ^ architectureTeam ifNil: [
      architectureTeam := self new name: 'Architecture Team' ]
]

{ #category : #'instance creation' }
GtArgoUMLConstraintStakeholder class >> developmentTeam [
	^ developmentTeam ifNil: [
      developmentTeam := self new name: 'Development Team' ]
]
