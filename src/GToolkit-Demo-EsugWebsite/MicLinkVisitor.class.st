Class {
	#name : #MicLinkVisitor,
	#superclass : #MicrodownVisitor,
	#instVars : [
		'links'
	],
	#category : #'GToolkit-Demo-EsugWebsite-Visitors'
}

{ #category : #accessing }
MicLinkVisitor >> initialize [
	super initialize.
	links := OrderedCollection new
]

{ #category : #accessing }
MicLinkVisitor >> links [
	^ links
]

{ #category : #accessing }
MicLinkVisitor >> visitLink: aLink [
	links add: aLink substring -> aLink url
]
