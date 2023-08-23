"
I am a simple PP parser for Markdown web pages.
I just recognize the YAML header and the body, and I extract the title from the header using the YAMLParser.
"
Class {
	#name : #YamlHeaderParser,
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
YamlHeaderParser >> body [
	^ (header optional , newline star, paragraph , (newline plus , paragraph) star , newline star)
		==> [ :node | 
			| paragraphs |
			paragraphs := node fourth
					ifEmpty: [ {node third} asOrderedCollection ]
					ifNotEmpty: [ (node fourth collect: #second) asOrderedCollection
							addFirst: node third;
							yourself ].
			node first
				ifNil: [ {#body -> paragraphs} asDictionary ]
				ifNotNil: [ node first
						at: #body put: paragraphs;
						yourself ] ]
]

{ #category : #grammar }
YamlHeaderParser >> file [
	^ body end
]

{ #category : #grammar }
YamlHeaderParser >> header [
	^ ('---' asPParser , newline , ('---' asPParser not , #any asPParser) star
		, '---' asPParser , newline) flatten
		==> [ :node | (YAMLParser parse: node) object	"at: 'title'" ]
]

{ #category : #grammar }
YamlHeaderParser >> newline [
	^ #newline asPParser
]

{ #category : #grammar }
YamlHeaderParser >> paragraph [
	^ (newline negate plus / (newline , newline not)) plus token flatten
]

{ #category : #accessing }
YamlHeaderParser >> start [
	^ file
]

{ #category : #grammar }
YamlHeaderParser >> title [
	^ newline negate plus token
]
