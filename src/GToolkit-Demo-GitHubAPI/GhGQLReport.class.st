Class {
	#name : #GhGQLReport,
	#superclass : #GtGQLReport,
	#category : #'GToolkit-Demo-GitHubAPI-GraphQL'
}

{ #category : #'gt - extensions' }
GhGQLReport >> gtOrganizationRepositoriesFor: aView [
	<gtView>
	self isOrganization ifFalse: [ ^ aView empty ].
	self login ifNil: [ ^ aView empty ].

	^ aView columnedList
		title: 'Repositories';
		items: [ | aResult |
			aResult := self context client
					operation: 'query Repositories($count: Int!, $login: String!, $after: String, $privacy: RepositoryPrivacy, $states: [IssueState!]) {
	organization (login: $login) {
		login
		name
		url
		repositories(first: $count, after: $after, privacy: $privacy) {
			totalCount
			totalDiskUsage
			edges {
				node {
					__typename
					id
					name
					sshUrl
					url
					owner {
						__typename
						id 
						login
						url
					}
					issues(states: $states) {
						totalCount
					}
					forks {
						totalCount
					}
				}
			}
			pageInfo {
				hasNextPage
				startCursor
				endCursor
			}
		}
	}
}'
					input: (Dictionary new
							at: #count put: 5;
							at: #login put: self login;
							at: #after put: nil;
							at: #privacy put: 'PUBLIC';
							at: #states put: #(OPEN);
							yourself).

			aResult paginator
				connectorPath: #(organization repositories);
				collect: [ :each | 
					GtGQLValueBuilder new
						context: aResult context;
						data: each asJson;
						query: aResult query;
						build;
						value ] ];
		column: 'Index'
			text: [ :aValue :anIndex | anIndex ]
			width: 40;
		column: 'Name' text: [ :aValue | (aValue fieldNamed: #name) value ];
		"column: 'Open Issues'
			text: [ :aValue | (aValue fieldNamed: #issues) totalCount ];"
		send: [ :aValue | self newReportWithValue: aValue ]
]

{ #category : #'gt - extensions' }
GhGQLReport >> gtRepositoryIssuesFor: aView [
	<gtView>
	self isRepository ifFalse: [ ^ aView empty ].

	^ aView columnedList
		title: 'Opened Issues';
		items: [ | aResult |
			aResult := self context client
					operation: 'query RepositoryIssues($owner: String!, $name: String!, $count: Int!, $after: String, $states: [IssueState!]) {
	repository (owner: $owner, name: $name) {
		__typename
		id
		owner {
			__typename
			id 
			login
			url
		}
		name
		nameWithOwner
		issues(first: $count, after: $after, states: $states) {
			__typename
			totalCount
			edges {
				node {
					__typename
					id
					number 
					title 
					state
					url
				}
			}
			pageInfo {
				endCursor
				hasNextPage
				hasPreviousPage
				startCursor
			}
		}
	}
}'
					input: (Dictionary new
							at: #count put: 5;
							at: #owner put: self ownerLogin;
							at: #name put: self name;
							at: #after put: nil;
							at: #states put: #(OPEN);
							yourself).

			aResult paginator
				connectorPath: #(repository issues);
				collect: [ :each | 
					GtGQLValueBuilder new
						context: aResult context;
						data: each asJson;
						query: aResult query;
						build;
						value ] ];
		column: 'Index'
			text: [ :aValue :anIndex | anIndex asRopedText foreground: BrGlamorousColors disabledButtonTextColor ]
			width: 40;
		column: 'Issue'
			text: [ :aValue | (aValue fieldNamed: #number) value ]
			width: 50;
		column: 'Title' text: [ :aValue | (aValue fieldNamed: #title) value ];
		column: 'State'
			text: [ :aValue | (aValue fieldNamed: #state) value ]
			width: 80;
		send: [ :aValue | self newReportWithValue: aValue ]
]

{ #category : #testing }
GhGQLReport >> isOrganization [
	^ self baseType name = 'Organization'
]

{ #category : #testing }
GhGQLReport >> isRepository [
	^ self baseType name = 'Repository'
]

{ #category : #'api - computed fields' }
GhGQLReport >> login [
	^ self value
		fieldNamed: #login
		ifPresent: [ :aValue | aValue value ]
		ifAbsent: [ nil ]
]

{ #category : #'api - computed fields' }
GhGQLReport >> name [
	^ self value
		fieldNamed: #name
		ifPresent: [ :aValue | aValue value ]
		ifAbsent: [ nil ]
]

{ #category : #'api - computed fields' }
GhGQLReport >> ownerLogin [
	^ self value
		fieldNamed: #owner
		ifPresent: [ :aValue | 
			aValue
				fieldNamed: #login
				ifPresent: [ :aLoginValue | aLoginValue value ]
				ifAbsent: [ nil ] ]
		ifAbsent: [ nil ]
]
