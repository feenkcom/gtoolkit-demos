Class {
	#name : #TDPost,
	#superclass : #TDModel,
	#instVars : [
		'rawData',
		'commentsGroup'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #requirements }
TDPost class >> empty [
	^ TDNullPost uniqueInstance.
]

{ #category : #accessing }
TDPost >> body [
	^ self rawData at: #body.
]

{ #category : #accessing }
TDPost >> commentsGroup [
	^ commentsGroup ifNil: [ commentsGroup := self requestCommentsForThisPost ].
]

{ #category : #accessing }
TDPost >> gtCommentsListFor: aView [
	<gtView>
	self commentsGroup comments ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Comments';
		object: [ self commentsGroup ];
		view: #gtCommentsListFor:
]

{ #category : #accessing }
TDPost >> gtPostBodyFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Content' translated;
		priority: 10;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: self body.
]

{ #category : #accessing }
TDPost >> gtPostInfoFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details' translated;
		priority: 10;
		items: [ {('Title: ' -> self title).
			('Id: ' -> self id).
			('User: ' -> self user)} ];
		column: 'Property' translated text: [ :assoc | assoc key ];
		column: 'Value' translated text: [ :assoc | assoc value ];
		send: [:association | association value].
]

{ #category : #accessing }
TDPost >> id [
	^ self rawData at: #id.
]

{ #category : #accessing }
TDPost >> rawData [
	^ rawData.
]

{ #category : #accessing }
TDPost >> rawData: aDictionary [
	rawData := aDictionary.
]

{ #category : #accessing }
TDPost >> requestCommentsForThisPost [
	^ TDClient new getCommentsForPostId: self id.
]

{ #category : #accessing }
TDPost >> title [
	^ self rawData at: #title.
]

{ #category : #accessing }
TDPost >> user [
	^ TDClient new getUserWithId: self userId.
]

{ #category : #accessing }
TDPost >> userId [
	^ self rawData at: #userId.
]
