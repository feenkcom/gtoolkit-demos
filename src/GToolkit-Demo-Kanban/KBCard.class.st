Class {
	#name : #KBCard,
	#superclass : #Object,
	#instVars : [
		'page'
	],
	#category : #'GToolkit-Demo-Kanban-Model'
}

{ #category : #'instance creation' }
KBCard class >> forPage: aPage [
	^ self new
		page: aPage;
		yourself
]

{ #category : #view }
KBCard >> gtPageFor: aView [
	<gtView>
	^ aView forward
		title: 'Page';
		priority: 10;
		object: page;
		view: #gtLiveFor:
]

{ #category : #accessing }
KBCard >> page [
	^ page
]

{ #category : #accessing }
KBCard >> page: anObject [
	page := anObject
]

{ #category : #printing }
KBCard >> printOn: aStream [
	aStream nextPutAll: page title
]

{ #category : #accessing }
KBCard >> tags [
	^ page tags
]

{ #category : #accessing }
KBCard >> title [
	^ page title
]
