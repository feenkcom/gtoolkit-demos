Class {
	#name : #BaselineOfGToolkitGitHubApiDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitGitHubApiDemo
}

{ #category : #baselines }
BaselineOfGToolkitGitHubApiDemo >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'GToolkit4GraphQL'
				with: [ spec repository: 'github://feenkcom/gt4graphql:main/src' ].
			spec
				package: 'GToolkit-Demo-GitHubAPI'
				with: [ spec requires: #(GToolkit4GraphQL) ] ]
]
