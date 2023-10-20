"
I am a convenience class to instantiate the ESUG website. I cache my instance in a class variable.

```
EsugWebsite instance
```

Send `EsugWebsite reset` to clear the cache.
"
Class {
	#name : #EsugWebsite,
	#superclass : #PillarWebsite,
	#classInstVars : [
		'esug'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Demo'
}

{ #category : #'instance creation' }
EsugWebsite class >> esugRepoDir [
	<gtExample>
	<noTest>
	^ (FileLocator imageDirectory / 'esug.github.io') asFileReference
]

{ #category : #constant }
EsugWebsite class >> esugRepoUrl [
	^ 'https://github.com/ESUG/esug.github.io'
]

{ #category : #constant }
EsugWebsite class >> esugUrl [
	^ 'https://esug.github.io'
]

{ #category : #'instance creation' }
EsugWebsite class >> instance [
	"Cache the website for demos."

	<gtExample>
	<noTest>
	^ esug
		ifNil: [ esug := self new
					repoUrl: self esugRepoUrl;
					repoDir: self esugRepoDir;
					url: self esugUrl;
					yourself ]
]

{ #category : #accessing }
EsugWebsite class >> reset [
	"Clear the cache and reload the website."

	<gtExample>
	<noTest>
	esug := nil.
	^ self instance
]
