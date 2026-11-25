"
I exemplify GhPullRequest, in particular reading the two payload shapes it can be built from: the search payload, which carries 'repository_url', and the full pull request payload, which carries the repository under base -> repo. My examples build the payloads by hand, so they need no network access and run as tests.
"
Class {
	#name : #GhPullRequestExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-GitHubAPI-Examples'
}

{ #category : #examples }
GhPullRequestExamples >> commentFromAPayload [
	"Comment payloads come from the GitHub JSON with String keys"

	<gtExample>
	<return: #GhPullRequestComment>
	| aComment |
	aComment := GhPullRequestComment new
			rawData: (Dictionary new
					at: 'body' put: 'Looks good';
					at: 'created_at' put: '2026-11-24T10:00:00Z';
					at: 'user' put: (Dictionary new at: 'login' put: 'octocat'; yourself);
					yourself).

	self assert: aComment body equals: 'Looks good'.
	self assert: aComment createdAt year equals: 2026.
	self assert: aComment user loginName equals: 'octocat'.

	^ aComment
]

{ #category : #examples }
GhPullRequestExamples >> isDraftDefaultsToFalse [
	"Payloads that carry no 'draft' field are not drafts."

	<gtExample>
	self assert: (GhPullRequest new rawData: Dictionary new) isDraft not.
	self
		assert: (GhPullRequest new rawData: (Dictionary new at: 'draft' put: true; yourself)) isDraft.
	^ true
]

{ #category : #examples }
GhPullRequestExamples >> pendingStatusFromAPayload [
	"The state of a status payload is a String from the GitHub JSON"

	<gtExample>
	<return: #GhPullRequestStatus>
	| aStatus |
	aStatus := GhPullRequestStatus new
			rawData: (Dictionary new
					at: 'state' put: 'pending';
					at: 'context' put: 'ci/build';
					yourself).
	self assert: aStatus isPendingState.
	self assert: self statusFromAPayload isPendingState not.
	^ aStatus
]

{ #category : #examples }
GhPullRequestExamples >> repositoryFullNameFromAFullPullRequestPayload [
	"Full pull request payloads name the repository under base -> repo -> full_name."

	<gtExample>
	<return: #GhPullRequest>
	| aPullRequest |
	aPullRequest := GhPullRequest new
			rawData: (Dictionary new
					at: 'base'
						put: (Dictionary new
								at: 'repo'
									put: (Dictionary new
											at: 'full_name' put: 'feenkcom/gtoolkit';
											yourself);
								yourself);
					yourself).
	self assert: aPullRequest repositoryFullName equals: 'feenkcom/gtoolkit'.
	self assert: aPullRequest repositoryName equals: 'gtoolkit'.
	^ aPullRequest
]

{ #category : #examples }
GhPullRequestExamples >> repositoryFullNameFromASearchPayload [
	"Search payloads name the repository through 'repository_url'."

	<gtExample>
	<return: #GhPullRequest>
	| aPullRequest |
	aPullRequest := GhPullRequest new
			rawData: (Dictionary new
					at: 'repository_url' put: 'https://api.github.com/repos/feenkcom/gt4llm';
					yourself).
	self assert: aPullRequest repositoryFullName equals: 'feenkcom/gt4llm'.
	self assert: aPullRequest repositoryName equals: 'gt4llm'.
	^ aPullRequest
]

{ #category : #examples }
GhPullRequestExamples >> repositoryNameIsNilWhenThePayloadSaysNothing [
	"The 'Repo' column must cope with a payload that names no repository."

	<gtExample>
	| aPullRequest |
	aPullRequest := GhPullRequest new rawData: Dictionary new.
	self assert: aPullRequest repositoryFullName isNil.
	self assert: aPullRequest repositoryName isNil.
	^ aPullRequest
]

{ #category : #examples }
GhPullRequestExamples >> statusFromAPayload [
	"Status payloads come from the GitHub JSON with String keys"

	<gtExample>
	<return: #GhPullRequestStatus>
	| aStatus |
	aStatus := GhPullRequestStatus new
			rawData: (Dictionary new
					at: 'state' put: 'success';
					at: 'context' put: 'ci/build';
					at: 'description' put: 'The build passed';
					yourself).

	self assert: aStatus state equals: 'success'.
	self assert: aStatus context equals: 'ci/build'.
	self assert: aStatus description equals: 'The build passed'.

	^ aStatus
]
