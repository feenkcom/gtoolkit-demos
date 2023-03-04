Class {
	#name : #SPLInitializedDeclaration,
	#superclass : #SPLDeclaration,
	#instVars : [
		'expression'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLInitializedDeclaration class >> for: aVariable with: anExpression [ 
	^ self new
		variable: aVariable;
		expression: anExpression;
		yourself
]

{ #category : #accessing }
SPLInitializedDeclaration >> expression [
	^ expression
]

{ #category : #'instance creation' }
SPLInitializedDeclaration >> expression: anExpression [
	expression := anExpression
]

{ #category : #printing }
SPLInitializedDeclaration >> printOn: aStream [
	aStream nextPutAll: 'var '.
	self variable printOn: aStream.
	aStream nextPutAll: ' = '.
	self expression printOn: aStream.
	aStream nextPut: $;
]
