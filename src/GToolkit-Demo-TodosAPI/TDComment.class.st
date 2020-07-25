Class {
	#name : #TDComment,
	#superclass : #TDModel,
	#instVars : [
		'postId',
		'id',
		'name',
		'email',
		'body',
		'post'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #requirements }
TDComment class >> empty [
	^ TDNullComment uniqueInstance.
]

{ #category : #accessing }
TDComment >> body [
	^ body.
]

{ #category : #accessing }
TDComment >> body: aString [
	body := aString.
]

{ #category : #accessing }
TDComment >> email [
	^ email.
]

{ #category : #accessing }
TDComment >> email: aString [
	email := aString.
]

{ #category : #accessing }
TDComment >> gtCommentBodyFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Content' translated;
		priority: 10;
		look: BrGlamorousCodeEditorLook;
		text: self body.
]

{ #category : #accessing }
TDComment >> gtCommentInfoFor: aView [
	<gtView>
	self requestPostForThisComment.
	^ aView columnedList
		title: 'Details' translated;
		priority: 10;
		items: [ {('Post Id: ' -> self postId).
			('Comment Id: ' -> self id).
			('Name: ' -> self name).
			('Email: ' -> self email)} ];
		column: 'Property' translated text: [ :assoc | assoc key ];
		column: 'Value' translated text: [ :assoc | assoc value ]
]

{ #category : #accessing }
TDComment >> id [
	^ id.
]

{ #category : #accessing }
TDComment >> id: anInteger [
	id := anInteger.
]

{ #category : #accessing }
TDComment >> initialize [
	super initialize.
	post := TDPost empty.
	postId := 0.
	id := 0.
	name := ''.
	email := ''.
	body := ''.
]

{ #category : #accessing }
TDComment >> name [
	^ name.
]

{ #category : #accessing }
TDComment >> name: aString [
	name := aString.
]

{ #category : #accessing }
TDComment >> post [
	^ post.
]

{ #category : #accessing }
TDComment >> postId [
	^ postId.
]

{ #category : #accessing }
TDComment >> postId: anInteger [
	postId := anInteger.
]

{ #category : #accessing }
TDComment >> requestPostForThisComment [
	post := TDClient new getPostWithId: self postId.
]
