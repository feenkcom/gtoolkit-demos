Class {
	#name : #PillarLinkSeaParserExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-WebsiteExplorer-Parser'
}

{ #category : #accessing }
PillarLinkSeaParserExamples >> emailLink [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self parse: 'Email: *Roel.Wuyts@ulb.ac.be*'.
	self assert: links size equals: 1.
	self assert: links first key equals: 'Roel.Wuyts@ulb.ac.be'.
	self assert: links first value equals: 'Roel.Wuyts@ulb.ac.be'.
	^ links
]

{ #category : #accessing }
PillarLinkSeaParserExamples >> linkWithSpaces [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self parse: '* foo > bar *'.
	self assert: links size equals: 1.
	self assert: links first key equals: 'foo'.
	self assert: links first value equals: 'bar'.
	^ links
]

{ #category : #accessing }
PillarLinkSeaParserExamples >> multiLineNoLinks [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self
			parse: '*
foo>bar*'.
	self assert: links isEmpty.
	^ links
]

{ #category : #accessing }
PillarLinkSeaParserExamples >> noLinks [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self parse: '... *someLink* '.
	self assert: links size equals: 1.
	self assert: links first key equals: 'someLink'.
	self assert: links first value equals: 'someLink'.
	^ links
]

{ #category : #accessing }
PillarLinkSeaParserExamples >> noTextLink [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self parse: '... *someLink* '.
	self assert: links size equals: 1.
	self assert: links first key equals: 'someLink'.
	self assert: links first value equals: 'someLink'.
	^ links
]

{ #category : #accessing }
PillarLinkSeaParserExamples >> oneLink [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self parse: '*foo>bar*'.
	self assert: links size equals: 1.
	self assert: links first key equals: 'foo'.
	self assert: links first value equals: 'bar'.
	^ links
]

{ #category : #accessing }
PillarLinkSeaParserExamples >> parse: aString [ 
^ self parserClass parse: aString
]

{ #category : #accessing }
PillarLinkSeaParserExamples >> parserClass [
	^ PillarLinkSeaParser
]

{ #category : #accessing }
PillarLinkSeaParserExamples >> twoLinks [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self
			parse: '
""stuff toignore""
*foo>bar*
*fuzz>baz*
'.
	self assert: links size equals: 2.
	self assert: links first key equals: 'foo'.
	self assert: links first value equals: 'bar'.
	self assert: links second key equals: 'fuzz'.
	self assert: links second value equals: 'baz'.
	^ links
]

{ #category : #accessing }
PillarLinkSeaParserExamples >> twoStarsNoLinks [
	<gtExample>
	<return: #OrderedCollection>
	| links |
	links := self parse: '**'.
	self assert: links isEmpty.
	^ links
]
