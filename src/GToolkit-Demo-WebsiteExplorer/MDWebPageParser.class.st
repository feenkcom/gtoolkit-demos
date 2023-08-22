"
I am a simple PP parser for Markdown web pages.
I just recognize the YAML header and the body, and I extract the title from the header using the YAMLParser.
"
Class {
	#name : #MDWebPageParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'title',
		'newline',
		'header',
		'paragraph',
		'body',
		'file'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Parser'
}

{ #category : #grammar }
MDWebPageParser >> body [
	^ (header optional , paragraph , (newline plus , paragraph) star , newline star)
		==> [ :node | 
			| paragraphs |
			paragraphs := node third
					ifEmpty: [ {node second} asOrderedCollection ]
					ifNotEmpty: [ (node third collect: #second) asOrderedCollection
							addFirst: node second;
							yourself ].
			node first
				ifNil: [ {#body -> paragraphs} asDictionary ]
				ifNotNil: [ node first
						at: #body put: paragraphs;
						yourself ] ]
]

{ #category : #grammar }
MDWebPageParser >> file [
	^ body end
]

{ #category : #grammar }
MDWebPageParser >> header [
	^ ('---' asPParser , newline 
		, ('---' asPParser not , #any asPParser) star
		, '---' asPParser , newline) flatten
		==> [ :node | (YAMLParser parse: node) object "at: 'title'" ]
]

{ #category : #grammar }
MDWebPageParser >> newline [
	^ #newline asPParser
]

{ #category : #grammar }
MDWebPageParser >> paragraph [
	^ (newline negate plus / (newline , newline not)) plus token flatten
]

{ #category : #accessing }
MDWebPageParser >> start [
	^ file
]

{ #category : #grammar }
MDWebPageParser >> title [
	^ newline negate plus token
]
