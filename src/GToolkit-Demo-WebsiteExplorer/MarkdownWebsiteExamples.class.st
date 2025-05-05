Class {
	#name : #MarkdownWebsiteExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-WebsiteExplorer-Examples'
}

{ #category : #accessing }
MarkdownWebsiteExamples >> onWebsiteOct23 [
	"This example is a reduced snapshot of the actual GitHub pages website, just for testing purposes."

	<gtExample>
	<return: #MarkdownWebsite>
	| webUrl repoDir navMenuLinks website |
	webUrl := 'https://www.oscar.nierstrasz.org'.	"NB: Use this instead of FileLocator ..., which apparently only works in a development image."
	repoDir := (FileLocator gtResource / 'feenkcom' / 'gtoolkit-demos' / 'data'
			/ 'onierstrasz.github.io') asFileReference.
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
	self assert: website links size equals: 373.
	self assert: website httpLinks size equals: 288.
	self assert: website internalLinks size equals: 85.
	self assert: website missingLinks size equals: 70.
	self assert: website reachable size equals: 15.
	self assert: website unreachable size equals: 7.
	self assert: website rootPages size equals: 5.

	^ website
]
