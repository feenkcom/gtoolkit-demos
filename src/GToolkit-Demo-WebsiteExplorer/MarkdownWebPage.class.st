"
To be refactored as a peer instead of a subclass of PillarWebPage.
"
Class {
	#name : #MarkdownWebPage,
	#superclass : #PillarWebPage,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #forbidden }
MarkdownWebPage >> gtPillarlinksFor: aView [
	<gtView>
	^ aView empty
]

{ #category : #accessing }
MarkdownWebPage >> links [
	"Lookup the PillarWebLink instances for each link."

	^ self markdownLinks collect: [ :assoc | self linkForPath: assoc value ]
]

{ #category : #forbidden }
MarkdownWebPage >> pillarLinks [
	self shouldNotImplement
]

{ #category : #links }
MarkdownWebPage >> reachable [
	^ WebPageGroup withAll: (self reachableFrom: {self})
]

{ #category : #parsing }
MarkdownWebPage >> titleParser [
	^ MDWebPageParser
]
