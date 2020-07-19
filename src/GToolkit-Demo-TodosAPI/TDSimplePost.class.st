Class {
	#name : #TDSimplePost,
	#superclass : #TDModel,
	#instVars : [
		'body',
		'title',
		'id',
		'user',
		'comments'
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
TDSimplePost >> comments [
	^ comments.
]

{ #category : #accessing }
TDSimplePost >> gtCommentsListFor: aView [
	<gtView>
	(comments := self requestCommentsForThisPost) ifEmpty: [^ aView empty].
	^ aView columnedList
		title: 'Comments' translated;
		priority: 5;
		items: [ self comments ];
		column: 'Id' translated do: [ :aColumn | 
			aColumn item: [ :aComment | aComment id ] ];
		column: 'Name' translated do: [ :aColumn | 
			aColumn item: [ :aComment | aComment name ] ].
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
		items: [ {('Title: ' -> self title).
			('Id: ' -> self id).
			('User ID: ' -> self userId)} ];
		column: 'Property' translated text: [ :assoc | assoc key ];
		column: 'Value' translated text: [ :assoc | assoc value ]
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
	comments := OrderedCollection new.
]

{ #category : #accessing }
TDSimplePost >> requestCommentsForThisPost [
	^ TDClient new request requestCommentsForPostId: self id.
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
	^ self user id.
]

{ #category : #accessing }
TDSimplePost >> userId: anInteger [
	self user: (TDUser new id: anInteger).
]
