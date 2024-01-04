Class {
	#name : #GtP3F1Collection,
	#superclass : #GtP3F1ClientObject,
	#instVars : [
		'collection'
	],
	#category : #'GToolkit-Demo-P3-F1'
}

{ #category : #accessing }
GtP3F1Collection class >> tableName [
	self subclassResponsibility
]

{ #category : #accessing }
GtP3F1Collection >> collection [
	^ collection
]

{ #category : #accessing }
GtP3F1Collection >> collection: aCollection [
	collection := aCollection
]

{ #category : #accessing }
GtP3F1Collection >> gtViewRowsFor: composite [
	<gtView>
	^ composite forward
		title: 'Rows';
		priority: 90;
		object: [ self collection ]
]

{ #category : #accessing }
GtP3F1Collection >> tableName [
	^ self class tableName
]
