Class {
	#name : #GtP3F1Object,
	#superclass : #GtP3F1ClientObject,
	#instVars : [
		'object'
	],
	#category : #'GToolkit-Demo-P3-F1'
}

{ #category : #accessing }
GtP3F1Object class >> tableName [
	self subclassResponsibility
]

{ #category : #accessing }
GtP3F1Object >> gtDetails [
	^ #()
]

{ #category : #accessing }
GtP3F1Object >> gtViewDetailsFor: composite [
	<gtView>
	^ composite columnedList
		title: 'Details';
		priority: 20;
		items: [ self gtDetails ];
		column: 'Key' text: #first;
		column: 'Value' text: #second weight: 3;
		send: #last
]

{ #category : #accessing }
GtP3F1Object >> gtViewRowFor: composite [
	<gtView>
	^ composite forward
		title: 'Row';
		priority: 90;
		object: [ self object ]
]

{ #category : #accessing }
GtP3F1Object >> object [
	^ object
]

{ #category : #accessing }
GtP3F1Object >> object: anObject [
	object := anObject
]

{ #category : #accessing }
GtP3F1Object >> tableName [
	^ self class tableName
]
