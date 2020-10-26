Class {
	#name : #TDComment,
	#superclass : #TDModel,
	#instVars : [
		'rawData'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #requirements }
TDComment class >> empty [
	^ TDNullComment uniqueInstance.
]

{ #category : #accessing }
TDComment >> body [
	^ self rawData at: #body.
]

{ #category : #accessing }
TDComment >> email [
	^ self rawData at: #email.
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
	^ aView columnedList
		title: 'Details' translated;
		priority: 10;
		items: [ {
			('Id: ' -> self id).
			('Name: ' -> self name).
			('Email: ' -> self email).
			('Post: ' -> self post)} ];
		column: 'Property' translated text: [ :assoc | assoc key ];
		column: 'Value' translated text: [ :assoc | assoc value ];
		send: [:association | association value].
]

{ #category : #accessing }
TDComment >> id [
	^ self rawData at: #id.
]

{ #category : #accessing }
TDComment >> name [
	^ self rawData at: #name.
]

{ #category : #accessing }
TDComment >> post [
	^ TDClient new getPostWithId: self postId.
]

{ #category : #accessing }
TDComment >> postId [
	^ self rawData at: #postId.
]

{ #category : #accessing }
TDComment >> rawData [
	^ rawData.
]

{ #category : #accessing }
TDComment >> rawData: aDictionary [
	rawData := aDictionary.
]
