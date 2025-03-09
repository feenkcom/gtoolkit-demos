Class {
	#name : #GhRelease,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI'
}

{ #category : #accessing }
GhRelease >> createdAt [
	^ rawData at: 'created_at'
]

{ #category : #views }
GhRelease >> gtWebViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'WebView';
		stencil: [ GtWebViewElement new url: self htmlUrl ]
]

{ #category : #accessing }
GhRelease >> htmlUrl [
	^ rawData at: 'html_url'
]

{ #category : #accessing }
GhRelease >> publishedAt [
	^ rawData at: 'published_at'
]

{ #category : #accessing }
GhRelease >> tagName [
	^ rawData at: 'tag_name'
]
