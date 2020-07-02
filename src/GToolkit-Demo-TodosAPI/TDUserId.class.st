Class {
	#name : #TDUserId,
	#superclass : #TDModel,
	#instVars : [
		'searchType',
		'userId'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #requirements }
TDUserId class >> empty [
	^ TDNullUserId uniqueInstance.
]

{ #category : #accessing }
TDUserId >> allSearchResultsFromThisUser [
	| client |
	(self searchType == #Todo)
		ifTrue: [ 
			client := TDClient new getAllTodosFromUserWithId: self idValue.
			^ client todos ].
	(self searchType == #Post)
		ifTrue: [ 
			client := TDClient new getAllPostsFromUserWithId: self idValue.
			^ client posts ].
	^ OrderedCollection new.
]

{ #category : #accessing }
TDUserId >> gtResultsListFor: aView [
	<gtView>
	| viewName |
	
	(self searchType == #Todo)
		ifTrue: [viewName := 'Todos'].
	(self searchType == #Post)
		ifTrue: [viewName := 'Posts'].
		
	^ aView columnedList
		title: viewName translated;
		items: [self allSearchResultsFromThisUser];
		column: 'Id' translated do: [ :aColumn | 
			aColumn item: [ :aResult | aResult id ] ];
		column: 'Title' translated do: [ :aColumn | 
			aColumn item: [ :aResult | aResult title ] ].
]

{ #category : #accessing }
TDUserId >> idValue [
	^ userId.
]

{ #category : #accessing }
TDUserId >> idValue: anInteger [
	userId := anInteger.
]

{ #category : #accessing }
TDUserId >> initialize [
	super initialize.
	userId := 0.
	searchType := nil.
]

{ #category : #accessing }
TDUserId >> searchType [
	^ searchType.
]

{ #category : #accessing }
TDUserId >> searchType: aByteSymbol [
	searchType := aByteSymbol.
]
