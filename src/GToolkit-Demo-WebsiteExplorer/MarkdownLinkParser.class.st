Class {
	#name : #MarkdownLinkParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'textOrUrl',
		'linkSea',
		'start',
		'linkWithText',
		'linkNoText'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Parser'
}

{ #category : #grammar }
MarkdownLinkParser >> linkNoText [
	^ ('[](' asPParser , textOrUrl , ')' asPParser)
		==> [ :node | node second trim -> node second trim ]
]

{ #category : #grammar }
MarkdownLinkParser >> linkSea [
	^ (linkNoText sea / linkWithText sea ==> #second) star
]

{ #category : #grammar }
MarkdownLinkParser >> linkWithText [
	^ ('[' asPParser , textOrUrl , '](' asPParser , textOrUrl , ')' asPParser)
		==> [ :node | node second trim -> node fourth trim ]
]

{ #category : #accessing }
MarkdownLinkParser >> start [
	^ linkSea
]

{ #category : #grammar }
MarkdownLinkParser >> textOrUrl [
	^ (#newline asPParser / $) asPParser / $] asPParser) negate plus flatten
]
