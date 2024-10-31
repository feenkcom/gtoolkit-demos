Class {
	#name : #PillarWebPageExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-WebsiteExplorer-Examples'
}

{ #category : #accessing }
PillarWebPageExamples >> esug2014NormalizeAbsoluteLink [
	<gtExample>
	| result url |
	url := '/index.pillar'.
	result := self esug2014homePage normalize: url.
	self assert: result equals: url.
	^ result
]

{ #category : #accessing }
PillarWebPageExamples >> esug2014NormalizeHttpLink [
	<gtExample>
	| result url |
	url := 'https://esug.github.io'.
	result := self esug2014homePage normalize: url.
	self assert: result equals: url.
	^ result
]

{ #category : #accessing }
PillarWebPageExamples >> esug2014NormalizeNestedLink [
	<gtExample>
	| result url |
	url := 'foo/bar.pillar'.
	result := self esug2014homePage normalize: url.
	self assert: result equals: '/2014-Conference/foo/bar.pillar'.
	^ result
]

{ #category : #accessing }
PillarWebPageExamples >> esug2014NormalizeParentLink [
	<gtExample>
	| result url |
	url := '../foo.pillar'.
	result := self esug2014homePage normalize: url.
	self assert: result equals: '/foo.pillar'.
	^ result
]

{ #category : #accessing }
PillarWebPageExamples >> esug2014NormalizeRelativeLink [
	<gtExample>
	| result url |
	url := 'foo.pillar'.
	result := self esug2014homePage normalize: url.
	self assert: result equals: '/2014-Conference/foo.pillar'.
	^ result
]

{ #category : #accessing }
PillarWebPageExamples >> esug2014Website [
	<gtExample>
	^ PillarWebsiteExamples new esug2014
]

{ #category : #accessing }
PillarWebPageExamples >> esug2014bikesPage [
	<gtExample>
	| website page |
	website := self esug2014Website.
	page := website pageNamed: '/2014-Conference/bikes.pillar'.
	self assert: page rawLinks size equals: 1.
	self assert: page markdownLinks size equals: 0.
	^ page
]

{ #category : #accessing }
PillarWebPageExamples >> esug2014homePage [
	<gtExample>
	| website page |
	website := self esug2014Website.
	page := website pageNamed: '/2014-Conference/conf2014.pillar'.
	self assert: page rawLinks size equals: 21.
	self assert: page markdownLinks size equals: 0.
	^ page
]
