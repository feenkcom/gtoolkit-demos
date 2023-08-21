"
This version of the wrapper has a `pages` method, but no Pages view. We navigate to the pages, find a view we like, and add a gtPagesFor: view from the inspector.
"
Class {
	#name : #EsugWebsiteWrapperWithPages,
	#superclass : #EsugWebsiteWrapper,
	#category : #'GToolkit-Demo-WebsiteExplorer-Demo'
}

{ #category : #accessing }
EsugWebsiteWrapperWithPages class >> esug [
	^ self new repoDir: self esugRepoDir
]

{ #category : #accessing }
EsugWebsiteWrapperWithPages class >> esugRepoDir [
	^ (FileLocator imageDirectory / 'esug.github.io') asFileReference
]

{ #category : #accessing }
EsugWebsiteWrapperWithPages >> pages [
	^ (repoDir allChildrenMatching: '*.pillar')
		collect: [ :each | EsugPage for: each ]
]
