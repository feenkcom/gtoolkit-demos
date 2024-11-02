"
Load in a subtitle file as follows:

```
subs := Subtitles for: 'subs.srt' asFileReference
```

Adjust the subs like this:
```
subs
	scaleAll: 1
	to: 2 minutes + 30 seconds
	and: 415
	to: 1 hour + 33 minutes
```
where 1 and 415 are indices of the two references subtitles to be mapped to the new times.

Then write out the new subs:
```
subs writeNewContents
```

"
Class {
	#name : #Subtitles,
	#superclass : #Object,
	#instVars : [
		'file',
		'entries',
		'parser'
	],
	#category : #'GToolkit-Demo-Subtitles-Model'
}

{ #category : #'instance creation' }
Subtitles class >> for: aFileReference [
	^ self new file: aFileReference
]

{ #category : #conversion }
Subtitles >> asDuration: aTime [
	self deprecated: 'Moved to Subtitle'.
	"Add a DAYS field and change the comma to a period."
	^ ('00:' , aTime replaceAll: $, with: $.) asDuration
]

{ #category : #conversion }
Subtitles >> durationAsTime: aDuration [
	"Adapted from Duration>>#printOn:"

	| h m s n stream |
	stream := WriteStream on: String new.
	h := aDuration hours abs.
	m := aDuration minutes abs.
	s := aDuration seconds abs truncated.
	n := aDuration nanoSeconds abs.
	aDuration negative ifTrue: [ stream nextPut: $- ].
	h < 10 ifTrue: [ stream nextPut: $0 ].
	h printOn: stream.
	stream nextPut: $:.
	m < 10 ifTrue: [ stream nextPut: $0 ].
	m printOn: stream.
	stream nextPut: $:.
	s < 10 ifTrue: [ stream nextPut: $0 ].
	s printOn: stream.
	n = 0
		ifFalse: [ | ps |
			stream nextPut: $,.
			ps := n asString padLeftTo: 9 with: $0.
			ps
				from: 1
				to: 3
				do: [ :c | stream nextPut: c ] ].
	^ stream contents
]

{ #category : #accessing }
Subtitles >> entries [
	entries ifNil: [
		"self initializeEntries"
		self parseFile ].
	^ entries
]

{ #category : #accessing }
Subtitles >> entries: anObject [
	entries := anObject
]

{ #category : #accessing }
Subtitles >> file [
	^ file
]

{ #category : #initialization }
Subtitles >> file: aFileReference [
	file := aFileReference
]

{ #category : #accessing }
Subtitles >> gtActionWebBrowseFor: anAction [
	<gtAction>
	self file exists ifFalse: [ ^ anAction noAction ].

	^ anAction button
		icon: BrGlamorousIcons go;
		tooltip: 'Open in OS';
		action: [ WebBrowser openOn: file fullName ]
]

{ #category : #ui }
Subtitles >> gtEntriesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Entries';
		priority: 10;
		items: [ self entries ];
		actionUpdateButtonTooltip: 'Update item list';
		column: 'Index' text: [ :entry :index | index ] width: 50;
		column: 'Start' text: [ :entry | entry start ] width: 100;
		column: 'End' text: [ :entry | entry end ] width: 100;
		column: 'Lines' text: [ :entry | entry joinedLines ]
]

{ #category : #accessing }
Subtitles >> gtFileContentsFor: aView [
	<gtView>
	^ aView forward
		title: 'File Contents';
		priority: 30;
		object: [file];
		view: #gtContentsFor:
]

{ #category : #accessing }
Subtitles >> gtFilePathFor: aView [
	<gtView>
	^ aView forward
		title: 'Path';
		priority: 35;
		object: [file];
		view: #gtPathFor:
]

{ #category : #ui }
Subtitles >> gtNewEntriesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'New Entries';
		priority: 20;
		items: [ self entries ];
		actionUpdateButtonTooltip: 'Update item list';
		column: 'Index' text: [ :entry :index | index ] width: 50;
	
		column: 'New Start' text: [ :entry | entry newStart ] width: 100;
		column: 'New End' text: [ :entry | entry newEnd ] width: 100;
		column: 'Lines' text: [ :entry | entry joinedLines ]
]

{ #category : #deprecated }
Subtitles >> initializeEntries [
	self deprecated: 'Use parseFile instead'.
	entries := ((String crlf repeat: 2) split: self file asFileReference contents)
			collectWithIndex: [ :each :index | 
				| lines times |
				lines := String crlf split: each.
				times := '--> ' split: lines second.
				Subtitle new
					number: index;
					startAsDuration: times first;
					endAsDuration: times second;
					lines: (lines allButFirst: 2) ]
]

{ #category : #conversion }
Subtitles >> newContents [
	| stream |
	stream := WriteStream on: String new.
	self entries
		doWithIndex: [ :each :index | 
			stream
				nextPutAll: index asString;
				nextPutAll: String crlf;
				nextPutAll: (self durationAsTime: (each newStart));
				nextPutAll: ' --> ';
				nextPutAll: (self durationAsTime: (each newEnd));
				nextPutAll: String crlf.
			(each lines)
				do: [ :line | 
					stream
						nextPutAll: line;
						nextPutAll: String crlf ].
			stream
				nextPutAll: String crlf ].
	^ stream contents
]

{ #category : #'instance creation' }
Subtitles >> parseFile [
	self entries: (self parser parse: self file contents)
]

{ #category : #accessing }
Subtitles >> parser [
	"NB: optimizing the parser does not actually speed it up."

	^ parser ifNil: [ parser := SubtitleParser new ]
]

{ #category : #printing }
Subtitles >> printOn: aStream [
	aStream nextPutAll: self file basename
]

{ #category : #conversion }
Subtitles >> scale: aScalingArray [
	"Scale subtitles using multiple synchronization points.
	self scale: { 1 -> aDuration . ... }"
	1
		to: aScalingArray size - 1
		do: [ :index | 
			| start end |
			start := aScalingArray at: index.
			end := aScalingArray at: index + 1.
			self
				scale: start key
				to: start value
				and: end key
				to: end value ]
]

{ #category : #conversion }
Subtitles >> scale: firstIndex to: newFirst and: lastIndex to: newLast [
	"Scale just the subs from firstIndex to lastIndex
	self scale: 1 to: 2 minutes + 30 seconds and: 415 to: 1 hour + 33 minutes.
	This can be used multiple times to map a series of ranges to different times."

	| oldFirst oldLast scale |
	oldFirst := (self entries at: firstIndex) start.
	oldLast := (self entries at: lastIndex) start.
	scale := (newLast - newFirst) asMilliSeconds
			/ (oldLast - oldFirst) asMilliSeconds.
	firstIndex to: lastIndex
		do: [ :index | 
			| newStart newEnd each |
			each := self entries at: index.
			newStart := (((each start) - oldFirst) * scale + newFirst)
					asMilliSeconds milliseconds asDuration.
			newEnd := (((each end) - oldFirst) * scale + newFirst) asMilliSeconds
					milliseconds asDuration.
			each newStart: newStart.
			each newEnd: newEnd ]
]

{ #category : #conversion }
Subtitles >> scaleAll: firstIndex to: newFirst and: lastIndex to: newLast [
	"scale all the subs using just two reference points
	self scaleAll: 1 to: 2 minutes + 30 seconds and: 415 to: 1 hour + 33 minutes"

	| oldFirst oldLast scale |
	oldFirst := (self entries at: firstIndex) start.
	oldLast := (self entries at: lastIndex) start.
	scale := (newLast - newFirst) asMilliSeconds
			/ (oldLast - oldFirst) asMilliSeconds.
	self entries
		do: [ :each | 
			| newStart newEnd |
			newStart := (((each start) - oldFirst) * scale + newFirst)
					asMilliSeconds milliseconds asDuration.
			newEnd := (((each end) - oldFirst) * scale + newFirst) asMilliSeconds
					milliseconds asDuration.
			each newStart: newStart.
			each newEnd: newEnd ]
]

{ #category : #conversion }
Subtitles >> writeNewContents [
	self file parent / (self file basename replaceSuffix: '.srt' with: '-NEW.srt')
		writeStreamDo: [ :s | s nextPutAll: self newContents ]
]
