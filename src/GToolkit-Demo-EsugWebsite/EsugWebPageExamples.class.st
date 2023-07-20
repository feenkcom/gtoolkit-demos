Class {
	#name : #EsugWebPageExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-EsugWebsite-Examples'
}

{ #category : #accessing }
EsugWebPageExamples >> esug2014 [
	<gtExample>
	^ EsugWebsite pageNamed: '/2014-Conference/conf2014.pillar'
]

{ #category : #accessing }
EsugWebPageExamples >> esug2014NormalizeRelativeLink [
	<gtExample>
	| result |
	result := self esug2014 normalize: 'foo'.
	^ result
]
