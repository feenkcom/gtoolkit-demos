"
I am a basic wrapper for the ESUG website, used to demonstrate the Moldable Development pattern *Wrap data to create an explorable model* in {{gtClass:name=ESUG2023Slideshow}}. 
"
Class {
	#name : #EsugWebsiteWrapper,
	#superclass : #Object,
	#instVars : [
		'repoDir'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Demo'
}

{ #category : #accessing }
EsugWebsiteWrapper class >> esug [
	"This is what we will eventually see after some moldable development iterations."

	^ EsugWebsite instance 
]

{ #category : #accessing }
EsugWebsiteWrapper >> example [
	<gtExample>
	<noTest>
	^ self
		repoDir: EsugWebsite esugRepoDir;
		yourself
]

{ #category : #accessing }
EsugWebsiteWrapper >> repoDir: repo [
	repoDir := repo
]
