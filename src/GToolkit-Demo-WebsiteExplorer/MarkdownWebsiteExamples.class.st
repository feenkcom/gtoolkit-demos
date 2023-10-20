Class {
	#name : #MarkdownWebsiteExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-WebsiteExplorer-Examples'
}

{ #category : #accessing }
MarkdownWebsiteExamples >> onWebsiteOct23 [
	"This example is a reduced snapshot of the actual GitHub pages website, just for testing purposes."

	<gtExample>
	| webUrl repoDir navMenuLinks website |
	webUrl := 'https://www.oscar.nierstrasz.org'.
	repoDir := (FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'feenkcom'
			/ 'gtoolkit-demos' / 'data' / 'onierstrasz.github.io') asFileReference.
	navMenuLinks := {'/cv/'.
			'/low-road-blog/'.
			'/oddsAndEnds/'.
			'/publications/'.
			'/talks/'.
			'/teaching/'}.

	website := MarkdownWebsite new
			repoDir: repoDir;
			url: webUrl;
			navigationMenuLinks: navMenuLinks;
			yourself.

	self assert: website pages size equals: 22.
	self assert: website links size equals: 310.
	self assert: website httpLinks size equals: 247.
	self assert: website internalLinks size equals: 63.
	self assert: website missingLinks size equals: 53.
	self assert: website reachable size equals: 14.
	self assert: website unreachable size equals: 8.
	self assert: website rootPages size equals: 5.

	^ website
]
