Class {
	#name : #TDPost,
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
TDPost class >> empty [
	^ TDNullPost uniqueInstance.
]

{ #category : #accessing }
TDPost class >> rawData: aDictionary [
	^ self new
		body: (aDictionary at: 'body' value);
		title: (aDictionary at: 'title' value);
		id: (aDictionary at: 'id' value);
		userId: (aDictionary at: 'userId' value).
]

{ #category : #accessing }
TDPost >> body [
	^ body.
]

{ #category : #accessing }
TDPost >> body: aString [
	body := aString.
]

{ #category : #accessing }
TDPost >> comments [
	^ comments ifEmpty: [ comments := self requestCommentsForThisPost ].
]

{ #category : #accessing }
TDPost >> gtCommentsListFor: aView [
	<gtView>
	self comments ifEmpty: [^ aView empty].
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
TDPost >> gtPostBodyFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Content' translated;
		priority: 10;
		look: BrGlamorousCodeEditorLook;
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
			('User ID: ' -> self userId)} ];
		column: 'Property' translated text: [ :assoc | assoc key ];
		column: 'Value' translated text: [ :assoc | assoc value ]
]

{ #category : #accessing }
TDPost >> id [
	^ id.
]

{ #category : #accessing }
TDPost >> id: anInteger [
	id := anInteger.
]

{ #category : #accessing }
TDPost >> initialize [
	super initialize.
	user := TDUser empty.
	id := 0.
	title := ''.
	body := ''.
	comments := OrderedCollection new.
]

{ #category : #accessing }
TDPost >> requestCommentsForThisPost [
	^ TDClient new getCommentsForPostId: self id.
]

{ #category : #accessing }
TDPost >> title [
	^ title.
]

{ #category : #accessing }
TDPost >> title: aString [
	title := aString.
]

{ #category : #accessing }
TDPost >> user [
	^ user.
]

{ #category : #accessing }
TDPost >> user: anObject [
	user := anObject.
]

{ #category : #accessing }
TDPost >> userId [
	^ self user id.
]

{ #category : #accessing }
TDPost >> userId: anInteger [
	self user: (TDUser new id: anInteger).
]
