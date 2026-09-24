"
I exemplify GhPullRequest, in particular reading the two payload shapes it can be built from: the search payload, which carries 'repository_url', and the full pull request payload, which carries the repository under base -> repo. My examples build the payloads by hand, so they need no network access and run as tests.
"
Class {
	#name : #GhPullRequestExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-GitHubAPI-Examples'
}

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
