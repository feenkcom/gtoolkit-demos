Class {
	#name : #TDSimplePost,
	#superclass : #TDModel,
	#instVars : [
		'body',
		'title',
		'id',
		'user'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #requirements }
TDSimplePost class >> empty [
	^ TDNullSimplePost uniqueInstance.
]

{ #category : #accessing }
TDSimplePost >> body [
	^ body.
]

{ #category : #accessing }
TDSimplePost >> body: aString [
	body := aString.
]

{ #category : #accessing }
TDSimplePost >> gtPostBodyFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Content' translated;
		priority: 10;
		look: BrGlamorousCodeEditorLook;
		text: self body.
]

{ #category : #accessing }
TDSimplePost >> gtPostInfoFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details' translated;
		priority: 10;
		items: [ { 
			'Title: ' -> self title asString.
			'Id: ' -> self id asString.
			'User ID: ' -> self userId asString } ];
		column: 'Property' translated format: [ :assoc | assoc key ];
		column: 'Value' translated format: [ :assoc | assoc value ].
]

{ #category : #accessing }
TDSimplePost >> id [
	^ id.
]

{ #category : #accessing }
TDSimplePost >> id: anInteger [
	id := anInteger.
]

{ #category : #accessing }
TDSimplePost >> initialize [
	super initialize.
	user := TDUser empty.
	id := 0.
	title := ''.
	body := ''.
]

{ #category : #accessing }
TDSimplePost >> title [
	^ title.
]

{ #category : #accessing }
TDSimplePost >> title: aString [
	title := aString.
]

{ #category : #accessing }
TDSimplePost >> user [
	^ user.
]

{ #category : #accessing }
TDSimplePost >> user: anObject [
	user := anObject.
]

{ #category : #accessing }
TDSimplePost >> userId [
	^ user idValue.
]

{ #category : #accessing }
TDSimplePost >> userId: anInteger [
	self user: (TDUser new 
		idValue: anInteger;
		searchType: #Post).
]
