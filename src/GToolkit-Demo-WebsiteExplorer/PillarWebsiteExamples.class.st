Class {
	#name : #PillarWebsiteExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-WebsiteExplorer-Examples'
}

{ #category : #accessing }
PillarWebsiteExamples >> esug2014 [
	"A small website for testing"

	<gtExample>
	<return: #PillarWebsite>
	| website |
	website := PillarWebsite new.
	website
		repoDir: self esug2014repoDir;
		url: self esug2014url.
	self assert: website pages size equals: 21.
	self assert: website rootPages size equals: 3.
	^ website
]

{ #category : #constant }
PillarWebsiteExamples >> esug2014repoDir [
	<gtExample>
	<return: #FileLocator>
	| aDirectory |
	aDirectory := FileLocator gtResource / 'feenkcom' / 'gtoolkit-demos' / 'data'
			/ 'esug.github.io'.

	self assert: [ aDirectory exists ] description: [ 'ESUG Directory must exist' ].

	^ aDirectory
]

{ #category : #constant }
PillarWebsiteExamples >> esug2014url [
	^ EsugWebsite esugUrl
]
