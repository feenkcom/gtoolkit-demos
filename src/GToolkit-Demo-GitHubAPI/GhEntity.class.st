Class {
	#name : #GhEntity,
	#superclass : #GhObject,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhEntity >> createFrom: aKey with: aBlock onError: anErrorBlock [
	^ rawData 
		at: aKey
		ifPresent: [ :url | 
			| trimmedUrl |
			trimmedUrl := url
				copyWithRegex: '{.*}'
				matchesTranslatedUsing: [ :each | ''].
			self httpClient 
				get: trimmedUrl
				onSuccess: [ :result | 
					[
						aBlock value: (STON fromString: result)
					] on: Error do: [ :e | anErrorBlock value ] ]
				onError: [ anErrorBlock value ] ]
		ifAbsent: [ {} ]
]

{ #category : #private }
GhEntity >> fetchPageAt: anUrl [
	"Answer an association of this page's raw items and the URL of the next page, nil when there is none.
	Answer an empty page on any failure, which simply ends the stream. This mirrors the #onError: 
	behaviour of #createFrom:with:onError:, so a failing request truncates rather than raising."

	^ [ | aClient |
		aClient := self httpClient.
		aClient
			get: anUrl
			onSuccess: [ :aResult | 
				(STON fromString: aResult) -> (self nextPageUrlFrom: aClient response) ]
			onError: [ #() -> nil ] ]
		on: Error
		do: [ :anError | #() -> nil ]
]

{ #category : #private }
GhEntity >> firstPageUrlFor: aKey [
	"Answer the URL of the first page of the paginated collection at aKey, or nil when the key is 
	absent. The '{...}' URL template suffix is stripped, as #createFrom:with:onError: does."

	^ rawData
		at: aKey
		ifPresent: [ :anUrl | 
			| aTrimmedUrl |
			aTrimmedUrl := anUrl
					copyWithRegex: '{.*}'
					matchesTranslatedUsing: [ :each | '' ].
			(aTrimmedUrl asZnUrl
				queryAt: 'per_page' put: GhConstants pageSize asString;
				yourself) asString ]
		ifAbsent: [ nil ]
]

{ #category : #accessing }
GhEntity >> gtRawDataFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Raw data';
		priority: 60;
		items: [ self rawData isDictionary 
			ifTrue: [ self rawData associations sorted: [:a :b | a key < b key ] ]
			ifFalse: [ self rawData ] ];
		column: 'Property' text: #key; 
		column: 'Value' text: #value;
		send: [ :each | 
			(each key endsWith: '_url')
				ifTrue: [ 
					self 
						createFrom: each key 
						with: [ :dictionary | 
							self propertyToClass 
								at: (each key withoutSuffix: '_url') 
								ifPresent: [ :aClass | aClass new rawData: dictionary ]
								ifAbsent: [ dictionary ]] 
						onError: [each value] ]
				ifFalse: [ each value ] ]
]

{ #category : #accessing }
GhEntity >> htmlUrl [
	^ rawData at: 'html_url'
]

{ #category : #accessing }
GhEntity >> httpClient [
	^ ZnClient new
		setBearerAuthentication: GtGitHubTokenHolder token;
		yourself
]

{ #category : #'as yet unclassified' }
GhEntity >> llmRawDataViewFor: aDataView [
	<gtLlmDataView>
	^ aDataView jsonData
			title: 'Raw data';
			data: [ 
				self rawData  ]
]

{ #category : #private }
GhEntity >> nextPageUrlFrom: aResponse [
	"Answer the URL of the next page taken from the Link header, or nil when this is the last page.
	Following the Link header is the traversal GitHub documents."

	| nextUrl |
	nextUrl := nil.
	((aResponse headers at: 'Link' ifAbsent: [ '' ]) substrings: ',')
		do: [ :each | 
			(each includesSubstring: 'rel="next"')
				ifTrue: [ nextUrl := (each copyAfter: $<) copyUpTo: $> ] ].
	^ nextUrl
]

{ #category : #accessing }
GhEntity >> paginatedItemsFrom: aKey [
	"Answer all raw items of the paginated collection at aKey, fetching one page after another.
	Unlike #paginatedStreamFrom:, this schedules no futures, so it is safe to send from inside a 
	future that is already running - such as a Phlow #textFuture: block - where awaiting a nested 
	future would block the running worker."

	<return: #Array>
	| anUrlToFetch anItems |
	anItems := OrderedCollection new.
	anUrlToFetch := self firstPageUrlFor: aKey.
	[ anUrlToFetch isNil ]
		whileFalse: [ 
			| aPage |
			aPage := self fetchPageAt: anUrlToFetch.
			anItems addAll: aPage key.
			anUrlToFetch := aPage value ].
	^ anItems asArray
]

{ #category : #accessing }
GhEntity >> paginatedStreamFrom: aKey [
	"Answer a stream over all raw items of the paginated collection found at aKey, following the 
	Link header across pages. Unlike #createFrom:with:onError:, which reads a single page of the 
	GitHub default size, this reaches every page."

	<return: #TAsyncStream>
	^ (self firstPageUrlFor: aKey)
		ifNil: [ #() asAsyncStream ]
		ifNotNil: [ :anUrl | self paginatedStreamStartingAt: anUrl ]
]

{ #category : #private }
GhEntity >> paginatedStreamStartingAt: anUrl [
	"Answer a stream over the raw items of every page reachable from anUrl."

	<return: #TAsyncStream>
	| aPageStream |
	aPageStream := AsyncPaginationStream
			for: anUrl
			future: [ :eachUrl | [ self fetchPageAt: eachUrl ] asAsyncFuture ]
			next: [ :anAssociation | anAssociation value ].
	"Chained, never cascaded: a cascade would send #flatCollect: to the pagination stream itself
	and yield one item per page instead of one item per entry."
	^ aPageStream flatCollect: [ :anAssociation | anAssociation key asAsyncStream ]
]

{ #category : #accessing }
GhEntity >> propertyToClass [
	^ Dictionary new
]
