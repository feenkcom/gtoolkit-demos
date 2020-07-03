Class {
	#name : #TDUser,
	#superclass : #TDModel,
	#instVars : [
		'searchType',
		'userId'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #requirements }
TDUser class >> empty [
	^ TDNullUserId uniqueInstance.
]

{ #category : #accessing }
TDUser >> allSearchResultsFromThisUser [
	| client |
	(self searchType == #Todo)
		ifTrue: [ 
			client := TDClient new getAllTodosForUserId: self idValue.
			^ client todos ].
	(self searchType == #Post)
		ifTrue: [ 
			client := TDClient new getAllPostsForUserId: self idValue.
			^ client posts ].
	^ OrderedCollection new.
]

{ #category : #accessing }
TDUser >> gtResultsListFor: aView [
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
TDUser >> idValue [
	^ userId.
]

{ #category : #accessing }
TDUser >> idValue: anInteger [
	userId := anInteger.
]

{ #category : #accessing }
TDUser >> initialize [
	super initialize.
	userId := 0.
	searchType := nil.
]

{ #category : #accessing }
TDUser >> searchType [
	^ searchType.
]

{ #category : #accessing }
TDUser >> searchType: aByteSymbol [
	searchType := aByteSymbol.
]
