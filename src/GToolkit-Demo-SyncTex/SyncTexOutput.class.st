"
This is a viewer of the output of SyncTex.

An example of how to get the ouput is:

```language=shell
synctex view -i 1:1:moldableExceptions.tex -o moldableExceptions.pdf
```
"
Class {
	#name : #SyncTexOutput,
	#superclass : #Object,
	#instVars : [
		'outputItems'
	],
	#category : #'GToolkit-Demo-SyncTex'
}

{ #category : #accessing }
SyncTexOutput class >> fromSyncTexConsoleOutput: aString [
	| numberParser outputParser pageParser xParser yParser hParser vParser wParser hcapParser synctexParser items |
	numberParser := #endOfLine asPParser negate star flatten ==> #asNumber.
	outputParser := 'Output:' asPParser , #endOfLine asPParser negate star flatten.
	pageParser := 'Page:' asPParser , numberParser.
	xParser := 'x:' asPParser , numberParser.
	yParser := 'y:' asPParser , numberParser.
	hParser := 'h:' asPParser , numberParser.
	vParser := 'v:' asPParser , numberParser.
	wParser := 'W:' asPParser , numberParser.
	hcapParser := 'H:' asPParser , numberParser.
	synctexParser := outputParser trim , pageParser trim , xParser trim
			, yParser trim , hParser trim , vParser trim , wParser trim , hcapParser trim.
	items := (synctexParser sea
			==> [ :tokens | SyncTexOutputItem new rawData: tokens second ]) star
			parse: aString.
	^ self new outputItems: items
]

{ #category : #accessing }
SyncTexOutput >> gtItemsFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Items';
		items: [ outputItems sorted: [ :a :b | (a x < b x) or: [ (a x = b x) and: [a h < b h]] ] ];
		column: 'Page' text: [:each | each pageNumber ];
		column: 'x' text: [ :each | each x ];
		column: 'v' text: [ :each | each v ]
]

{ #category : #accessing }
SyncTexOutput >> outputItems: items [ 
	outputItems := items
]
