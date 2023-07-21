Class {
	#name : #EsugWebPageExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-EsugWebsite-Examples'
}

{ #category : #accessing }
EsugWebPageExamples >> esug2014 [
	<gtExample>
	^ self esug2014Website pageNamed: '/2014-Conference/conf2014.pillar'
]

{ #category : #accessing }
EsugWebPageExamples >> esug2014NormalizeAbsoluteLink [
	<gtExample>
	| result url |
	url := '/index.pillar'.
	result := self esug2014 normalize: url.
	self assert: result equals: url.
	^ result
]

{ #category : #accessing }
EsugWebPageExamples >> esug2014NormalizeHttpLink [
	<gtExample>
	| result url |
	url := 'https://esug.github.io'.
	result := self esug2014 normalize: url.
	self assert: result equals: url.
	^ result
]

{ #category : #accessing }
EsugWebPageExamples >> esug2014NormalizeNestedLink [
	<gtExample>
	| result url |
	url := 'foo/bar.pillar'.
	result := self esug2014 normalize: url.
	self assert: result equals: '/2014-Conference/foo/bar.pillar'.
	^ result
]

{ #category : #accessing }
EsugWebPageExamples >> esug2014NormalizeParentLink [
	<gtExample>
	| result url |
	url := '../foo.pillar'.
	result := self esug2014 normalize: url.
	self assert: result equals: '/foo.pillar'.
	^ result
]

{ #category : #accessing }
EsugWebPageExamples >> esug2014NormalizeRelativeLink [
	<gtExample>
	| result url |
	url := 'foo.pillar'.
	result := self esug2014 normalize: url.
	self assert: result equals: '/2014-Conference/foo.pillar'.
	^ result
]

{ #category : #accessing }
EsugWebPageExamples >> esug2014Website [
	<gtExample>
	^ EsugWebsiteExamples new esug2014
]
