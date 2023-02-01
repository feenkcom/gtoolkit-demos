"
This is a minimal example of parsing text files.
See `Using PetitParser to parse a text file`.

"
Class {
	#name : #SimpleLineParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'cr',
		'emptyLine',
		'nonEmptyLine',
		'file'
	],
	#category : #'PetitParserDemo-PetitParser'
}

{ #category : #accessing }
SimpleLineParser >> cr [
	^ #newline asPParser
]

{ #category : #accessing }
SimpleLineParser >> emptyLine [
	^ cr flatten
]

{ #category : #accessing }
SimpleLineParser >> file [
	^ (emptyLine / nonEmptyLine) star
]

{ #category : #accessing }
SimpleLineParser >> nonEmptyLine [
	^ (cr negate plus flatten , cr optional) ==> #first
]

{ #category : #accessing }
SimpleLineParser >> start [
	^ file
]
