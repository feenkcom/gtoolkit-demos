Class {
	#name : #SPLEvaluationError,
	#superclass : #Error,
	#instVars : [
		'context',
		'exception'
	],
	#category : #'GToolkit-Demo-SPL-Exceptions'
}

{ #category : #'instance creation' }
SPLEvaluationError class >> forError: anException in: anSPLContext [
	^ self new
		exception: anException;
		context: anSPLContext;
		yourself
]

{ #category : #accessing }
SPLEvaluationError >> context [
	^ context
]

{ #category : #accessing }
SPLEvaluationError >> context: anObject [
	context := anObject
]

{ #category : #accessing }
SPLEvaluationError >> exception [
	^ exception
]

{ #category : #accessing }
SPLEvaluationError >> exception: anObject [
	exception := anObject
]

{ #category : #accessing }
SPLEvaluationError >> expression [
	^ self context continuation
]

{ #category : #view }
SPLEvaluationError >> gtContextFor: aView [
	<gtView>
	<gtExceptionView>
	^ aView forward
		title: 'Context';
		priority: 20;
		object: [self context];
		view: #gtStateFor:
]

{ #category : #view }
SPLEvaluationError >> gtExpressionFor: aView [
	<gtView>
	<gtExceptionView>
	^ aView forward
		title: 'Expression';
		priority: 10;
		object: [self expression];
		view: #gtASTFor:
]

{ #category : #view }
SPLEvaluationError >> gtHistoryFor: aView [
	<gtView>
	<gtExceptionView>
	^ aView forward
		title: 'History';
		priority: 30;
		object: [self context];
		view: #gtHistoryFor:
]

{ #category : #accessing }
SPLEvaluationError >> messageText [
	"Return an exception's message text."

	^ messageText
		ifNil: [ self exception messageText ifNil: [ self exception printString ] ]
]
