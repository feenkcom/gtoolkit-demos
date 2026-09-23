Class {
	#name : #GhOrganizationExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-GitHubAPI-Examples'
}

{ #category : #accessing }
GhOrganizationExamples >> feenkcomOrganization [
	<gtExample>
	<noTest>
	| json dictionary |
	json := self httpClient get: 'https://api.github.com/orgs/feenkcom'.
	dictionary := STON fromString: json.
	^ GhOrganization new rawData: dictionary
]

{ #category : #accessing }
GhOrganizationExamples >> feenkcomRepos [
	<gtExample>
	<noTest>
	^ self feenkcomOrganization repos
]

{ #category : #examples }
GhOrganizationExamples >> feenkcomReposAgreeWithTheStream [
	"#repos is the drained #reposStream, so both answer the same repositories in the same order."

	<gtExample>
	<noTest>
	| aStreamed aRepos |
	aStreamed := self feenkcomReposStreamReachesEveryPage.
	aRepos := self feenkcomReposAreComplete.
	self
		assert: (aRepos collect: [ :each | each name ]) asArray
		equals: (aStreamed collect: [ :each | each name ]) asArray.
	^ aRepos
]

{ #category : #examples }
GhOrganizationExamples >> feenkcomReposAreComplete [
	"#repos answers every repository, not just the first page of the GitHub default size."

	<gtExample>
	<noTest>
	| anOrganization aRepos |
	anOrganization := self feenkcomOrganization.
	aRepos := anOrganization repos.
	self assert: aRepos class equals: GhRepos.
	self assert: aRepos size > GhConstants pageSize.
	self assert: aRepos size equals: (anOrganization rawData at: 'public_repos').
	^ aRepos
]

{ #category : #examples }
GhOrganizationExamples >> feenkcomReposStream [
	<gtExample>
	<noTest>
	<return: #TAsyncStream>
	^ self feenkcomOrganization reposStream
]

{ #category : #examples }
GhOrganizationExamples >> feenkcomReposStreamFirstPage [
	"Taking one page's worth of repositories costs a single request, because the stream is lazy."

	<gtExample>
	<noTest>
	| aTaken |
	aTaken := ((self feenkcomReposStream take: GhConstants pageSize) toArray
			await: GhConstants executionConfiguration) wait.
	self assert: aTaken size equals: GhConstants pageSize.
	self assert: (aTaken allSatisfy: [ :each | each isKindOf: GhRepo ]).
	^ aTaken
]

{ #category : #examples }
GhOrganizationExamples >> feenkcomReposStreamReachesEveryPage [
	"Draining the stream reaches past the first page, which is what #createFrom:with:onError: could not do."

	<gtExample>
	<noTest>
	| anOrganization aDrained |
	anOrganization := self feenkcomOrganization.
	aDrained := ((anOrganization reposStream) toArray
			await: GhConstants executionConfiguration) wait.
	self assert: aDrained size > GhConstants pageSize.
	"While the token carries only the public_repo scope, private repositories stay invisible, 
	so the reachable count is exactly public_repos."
	self assert: aDrained size equals: (anOrganization rawData at: 'public_repos').
	self assert: (aDrained collect: [ :each | each name ]) asSet size equals: aDrained size.
	^ aDrained
]

{ #category : #accessing }
GhOrganizationExamples >> gtoolkitRepo [
	<gtExample>
	<noTest>
	| json dictionary |
	json := self httpClient get: 'https://api.github.com/repos/feenkcom/gtoolkit'.
	dictionary := STON fromString: json.
	^ GhRepo new rawData: dictionary
]

{ #category : #accessing }
GhOrganizationExamples >> httpClient [
	<gtExample>
	<return: #ZnClient>
	^ ZnClient new
		setBearerAuthentication: GtGitHubTokenHolder token;
		yourself
]

{ #category : #examples }
GhOrganizationExamples >> pharoPullRequestsAgreeWithTheStream [
	"#pullRequests and #pullRequestsStream reach the same pull requests."

	<gtExample>
	<noTest>
	| aRepo aStreamed |
	aRepo := self pharoRepo.
	aStreamed := ((aRepo pullRequestsStream) toArray
			await: GhConstants executionConfiguration) wait.
	self assert: aStreamed size equals: aRepo numberOfPullRequests.
	self assert: (aStreamed allSatisfy: [ :each | each isKindOf: GhPullRequest ]).
	^ aStreamed
]

{ #category : #examples }
GhOrganizationExamples >> pharoPullRequestsCountEveryPage [
	"#numberOfPullRequests counts past the GitHub default page size of 30, which the previous 
	single-page implementation could not do."

	<gtExample>
	<noTest>
	<return: #Number>
	| aRepo aCount |
	aRepo := self pharoRepo.
	aCount := aRepo numberOfPullRequests.
	self assert: aCount > 30.
	self assert: aCount equals: aRepo pullRequests size.
	^ aCount
]

{ #category : #examples }
GhOrganizationExamples >> pharoRepo [
	"A repository with more open pull requests than the GitHub default page size, so that the 
	paginated counting is actually exercised."

	<gtExample>
	<noTest>
	<return: #GhRepo>
	| json |
	json := self httpClient get: 'https://api.github.com/repos/pharo-project/pharo'.
	^ GhRepo new rawData: (STON fromString: json)
]
