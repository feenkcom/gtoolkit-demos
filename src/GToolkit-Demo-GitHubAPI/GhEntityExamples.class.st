"
I exemplify GhEntity, in particular the Link header parsing that drives pagination. My examples build ZnResponse objects by hand, so they need no network access and run as tests.
"
Class {
	#name : #GhEntityExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-GitHubAPI-Examples'
}

{ #category : #examples }
GhEntityExamples >> firstPageUrlCarriesThePageSizeAndDropsTheTemplate [
	"The '{...}' URL template suffix is stripped and per_page is set to the configured page size."

	<gtExample>
	<return: #String>
	| anEntity anUrl |
	anEntity := GhRepo new
			rawData: (Dictionary new
					at: 'pulls_url'
						put: 'https://api.github.com/repos/feenkcom/gtoolkit/pulls{/number}';
					yourself).
	anUrl := anEntity firstPageUrlFor: 'pulls_url'.
	self
		assert: anUrl
		equals: 'https://api.github.com/repos/feenkcom/gtoolkit/pulls?per_page='
				, GhConstants pageSize asString.
	^ anUrl
]

{ #category : #examples }
GhEntityExamples >> firstPageUrlForAnAbsentKeyIsNil [
	<gtExample>
	| anEntity |
	anEntity := GhRepo new rawData: Dictionary new.
	self assert: (anEntity firstPageUrlFor: 'pulls_url') isNil.
	^ anEntity
]

{ #category : #examples }
GhEntityExamples >> nextPageUrlOnTheLastPage [
	"The last page carries prev and first but no next, which ends the stream."

	<gtExample>
	| aResponse |
	aResponse := self
			responseWithLinkHeader: '<https://api.github.com/organizations/22122366/repos?per_page=100&page=2>; rel="prev", <https://api.github.com/organizations/22122366/repos?per_page=100&page=1>; rel="first"'.
	self assert: (GhOrganization new nextPageUrlFrom: aResponse) isNil.
	^ aResponse
]

{ #category : #examples }
GhEntityExamples >> nextPageUrlWhenAFurtherPageExists [
	"A Link header carrying rel=""next"" answers that page's URL."

	<gtExample>
	<return: #String>
	| aResponse aNextUrl |
	aResponse := self
			responseWithLinkHeader: '<https://api.github.com/organizations/22122366/repos?per_page=100&page=2>; rel="next", <https://api.github.com/organizations/22122366/repos?per_page=100&page=3>; rel="last"'.
	aNextUrl := GhOrganization new nextPageUrlFrom: aResponse.
	self
		assert: aNextUrl
		equals: 'https://api.github.com/organizations/22122366/repos?per_page=100&page=2'.
	^ aNextUrl
]

{ #category : #examples }
GhEntityExamples >> nextPageUrlWithoutALinkHeader [
	"An unpaginated response carries no Link header at all."

	<gtExample>
	| aResponse |
	aResponse := ZnResponse ok: (ZnEntity text: '[]').
	self assert: (GhOrganization new nextPageUrlFrom: aResponse) isNil.
	^ aResponse
]

{ #category : #examples }
GhEntityExamples >> paginatedItemsFromAnAbsentKeyIsEmpty [
	"An entity whose raw data lacks the key answers no items rather than failing."

	<gtExample>
	| anEntity |
	anEntity := GhOrganization new rawData: Dictionary new.
	self assert: (anEntity paginatedItemsFrom: 'repos_url') isEmpty.
	^ anEntity
]

{ #category : #examples }
GhEntityExamples >> paginatedStreamFromAnAbsentKeyIsEmpty [
	"An entity whose raw data lacks the key answers an empty stream rather than failing."

	<gtExample>
	| anOrganization anItems |
	anOrganization := GhOrganization new rawData: Dictionary new.
	anItems := ((anOrganization paginatedStreamFrom: 'repos_url') toArray
			await: GhConstants executionConfiguration) wait.
	self assert: anItems isEmpty.
	^ anItems
]

{ #category : #private }
GhEntityExamples >> responseWithLinkHeader: aString [
	| aResponse |
	aResponse := ZnResponse ok: (ZnEntity text: '[]').
	aResponse headers at: 'Link' put: aString.
	^ aResponse
]
