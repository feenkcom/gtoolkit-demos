Class {
	#name : #PillarWebsiteExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-EsugWebsite-Examples'
}

{ #category : #accessing }
PillarWebsiteExamples >> esug2014 [
	"A small website for testing"
	<gtExample>
	| website |
	website := PillarWebsite new.
	website
		repoDir: self esug2014repoDir;
		url: self esug2014url.
	self assert: website pages size equals: 18.
	^ website
]

{ #category : #accessing }
PillarWebsiteExamples >> esug2014homePage [
	<gtExample>
	| website page |
	website := self esug2014.
	page := website pageNamed: '/2014-Conference/conf2014.pillar'.
	self assert: page pillarLinks size equals: 21.
	self assert: page markdownLinks size equals: 0.
	^ page
]

{ #category : #constant }
PillarWebsiteExamples >> esug2014repoDir [
	^ FileLocator imageDirectory
		/ 'pharo-local/iceberg/feenkcom/gtoolkit-demos/data/esug.github.io'
]

{ #category : #constant }
PillarWebsiteExamples >> esug2014url [
	^ PillarWebsite esugUrl
]
