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
