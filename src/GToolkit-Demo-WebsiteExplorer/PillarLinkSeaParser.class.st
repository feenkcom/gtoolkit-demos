Class {
	#name : #PillarLinkSeaParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'textOrUrl',
		'linkNoText',
		'linkWithText',
		'linkSea'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Parser'
}

{ #category : #grammar }
PillarLinkSeaParser >> linkNoText [
	^ ($* asPParser , textOrUrl , $* asPParser)
		==> [ :node | node second trim -> node second trim ]
]

{ #category : #grammar }
PillarLinkSeaParser >> linkSea [
	^ (linkNoText sea / linkWithText sea ==> #second) star
]

{ #category : #grammar }
PillarLinkSeaParser >> linkWithText [
	^ ($* asPParser , textOrUrl , $> asPParser , textOrUrl , $* asPParser)
		==> [ :node | node second trim -> node fourth trim ]
]

{ #category : #accessing }
PillarLinkSeaParser >> start [
	^ linkSea
]

{ #category : #grammar }
PillarLinkSeaParser >> textOrUrl [
	^ (#newline asPParser / $* asPParser / $> asPParser) negate plus flatten
]
