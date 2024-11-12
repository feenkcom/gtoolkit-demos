Class {
	#name : #BaselineOfGToolkitGitHubApiDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitGitHubApiDemo
}

{ #category : #baseline }
BaselineOfGToolkitGitHubApiDemo >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'GToolkit4GraphQL' with: [
				spec repository: 'github://feenkcom/gt4graphql:v0.6.1680/src' ].

		spec package: 'GToolkit-Demo-GitHubAPI' with: [
			spec requires: #(#GToolkit4GraphQL) ].
	]
]
