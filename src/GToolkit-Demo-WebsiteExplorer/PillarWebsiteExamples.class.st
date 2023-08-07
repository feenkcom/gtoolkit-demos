Class {
	#name : #PillarWebsiteExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-WebsiteExplorer-Examples'
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
	self assert: website pages size equals: 20.
	self assert: website rootPages size equals: 3.
	^ website
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
