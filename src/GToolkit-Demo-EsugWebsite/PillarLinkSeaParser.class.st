Class {
	#name : #PillarLinkSeaParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'textOrUrl',
		'linkNoText',
		'linkWithText',
		'linkSea'
	],
	#category : #'GToolkit-Demo-EsugWebsite-Parser'
}

{ #category : #grammar }
PillarLinkSeaParser >> linkNoText [
	^ ($* asPParser , textOrUrl , $* asPParser)
		==> [ :node | node second -> node second ]
]

{ #category : #grammar }
PillarLinkSeaParser >> linkSea [
	^ (linkNoText sea / linkWithText sea ==> #second) star
]

{ #category : #grammar }
PillarLinkSeaParser >> linkWithText [
	^ ($* asPParser , textOrUrl , $> asPParser , textOrUrl , $* asPParser)
		==> [ :node | node second -> node fourth ]
]

{ #category : #accessing }
PillarLinkSeaParser >> start [
	^ linkSea
]

{ #category : #grammar }
PillarLinkSeaParser >> textOrUrl [
	^ ($* asPParser / $> asPParser) negate star flatten
]
