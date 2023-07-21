Class {
	#name : #EsugWebsiteExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-EsugWebsite-Examples'
}

{ #category : #accessing }
EsugWebsiteExamples >> esug2014 [
	"A small website for testing"

	<gtExample>
	| website |
	website := EsugWebsite new.
	website
		repoDir: FileLocator imageDirectory
				/ 'pharo-local/iceberg/feenkcom/gtoolkit-demos/data/esug.github.io'.
	self assert: website pages size equals: 18.
	^ website
]
