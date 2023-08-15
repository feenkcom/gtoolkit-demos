Class {
	#name : #EsugWebsite,
	#superclass : #EsugWebsiteWrapper,
	#category : #'GToolkit-Demo-WebsiteExplorer-Demo'
}

{ #category : #accessing }
EsugWebsite class >> esug [
	^ self new repoDir: self esugRepoDir
]

{ #category : #accessing }
EsugWebsite class >> esugRepoDir [
	^ (FileLocator imageDirectory / 'esug.github.io') asFileReference
]

{ #category : #accessing }
EsugWebsite >> gtPagesFor: aView [
	<gtView>
	^ aView forward
		title: 'Pages';
		priority: 10;
		object: [ self pages ];
		view: #gtItemsFor:
]

{ #category : #accessing }
EsugWebsite >> pages [
	^ (repoDir allChildrenMatching: '*.pillar')
		collect: [ :each | EsugPage for: each ]
]
