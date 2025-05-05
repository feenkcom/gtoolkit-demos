Class {
	#name : #MarkdownLinkParserExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-WebsiteExplorer-Parser'
}

{ #category : #accessing }
MarkdownLinkParserExamples >> emailLink [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self parse: 'Email: [](Roel.Wuyts@ulb.ac.be)'.
	self assert: links size equals: 1.
	self assert: links first key equals: 'Roel.Wuyts@ulb.ac.be'.
	self assert: links first value equals: 'Roel.Wuyts@ulb.ac.be'.
	^ links
]

{ #category : #accessing }
MarkdownLinkParserExamples >> linkWithSpaces [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self parse: '[ foo ]( bar )'.
	self assert: links size equals: 1.
	self assert: links first key equals: 'foo'.
	self assert: links first value equals: 'bar'.
	^ links
]

{ #category : #accessing }
MarkdownLinkParserExamples >> multiLineNoLinks [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self
			parse: '[
foo](bar)'.
	self assert: links isEmpty.
	^ links
]

{ #category : #accessing }
MarkdownLinkParserExamples >> noLinks [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self parse: '... (someLink) '.
	self assert: links size equals: 0.
	^ links
]

{ #category : #accessing }
MarkdownLinkParserExamples >> noTextLink [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self parse: '... [](someLink) '.
	self assert: links size equals: 1.
	self assert: links first key equals: 'someLink'.
	self assert: links first value equals: 'someLink'.
	^ links
]

{ #category : #accessing }
MarkdownLinkParserExamples >> oneLink [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self parse: '[foo](bar)'.
	self assert: links size equals: 1.
	self assert: links first key equals: 'foo'.
	self assert: links first value equals: 'bar'.
	^ links
]

{ #category : #accessing }
MarkdownLinkParserExamples >> parse: aString [ 
^ self parserClass parse: aString
]

{ #category : #accessing }
MarkdownLinkParserExamples >> parserClass [
	^ MarkdownLinkParser
]

{ #category : #accessing }
MarkdownLinkParserExamples >> twoLinks [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self
			parse: '
""stuff to ignore""
[foo](bar)
[fuzz](baz)
'.
	self assert: links size equals: 2.
	self assert: links first key equals: 'foo'.
	self assert: links first value equals: 'bar'.
	self assert: links second key equals: 'fuzz'.
	self assert: links second value equals: 'baz'.
	^ links
]

{ #category : #accessing }
MarkdownLinkParserExamples >> twoStarsNoLinks [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self parse: '[]()'.
	self assert: links isEmpty.
	^ links
]
