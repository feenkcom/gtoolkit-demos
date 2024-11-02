Class {
	#name : #SubtitleParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'cr',
		'separator',
		'line',
		'crLine',
		'number',
		'digits',
		'time',
		'timestamp',
		'lines',
		'sub',
		'sepSub',
		'subFile',
		'subs'
	],
	#category : #'GToolkit-Demo-Subtitles-PParser'
}

{ #category : #grammar }
SubtitleParser >> cr [
	^ #newline asPParser
]

{ #category : #grammar }
SubtitleParser >> crLine [
	^ (cr , line) ==> #second
]

{ #category : #grammar }
SubtitleParser >> digits [
	^ #digit asPParser plus
]

{ #category : #grammar }
SubtitleParser >> line [
	^ cr negate plus flatten
]

{ #category : #grammar }
SubtitleParser >> lines [
	^ (line , crLine star) ==> [ :node | node second copyWithFirst: node first ]
]

{ #category : #grammar }
SubtitleParser >> number [
	^ (#digit asPParser plus flatten , cr) ==> [ :node | node first asNumber ]
]

{ #category : #grammar }
SubtitleParser >> sepSub [
	^ (separator , sub) ==> #second
]

{ #category : #grammar }
SubtitleParser >> separator [
	^ cr plus
]

{ #category : #accessing }
SubtitleParser >> start [
	^ subs
]

{ #category : #grammar }
SubtitleParser >> sub [
	^ (number , timestamp , lines)
		==> [ :nodes | 
			Subtitle new
				number: nodes first;
				startAsDuration: nodes second first;
				endAsDuration: nodes second third;
				lines: nodes third ]
]

{ #category : #grammar }
SubtitleParser >> subFile [
	^ (sub , sepSub star , cr star)
		==> [ :node | 
			node second
				addFirst: node first;
				yourself ]
]

{ #category : #grammar }
SubtitleParser >> subs [
	^ subFile end
]

{ #category : #grammar }
SubtitleParser >> time [
	^ (digits , $: asPParser , digits , $: asPParser , digits , $, asPParser
		, digits) flatten
]

{ #category : #grammar }
SubtitleParser >> timestamp [
	^ time , ' --> ' asPParser , time , cr
]
