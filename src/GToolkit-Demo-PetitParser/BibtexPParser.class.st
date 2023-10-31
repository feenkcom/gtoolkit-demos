"
A demo of a parser for BibTex files useing PetitParser.
See {{gtMethod:name=BibtexPParserExamples>>#scgPub}} for a full example.
"
Class {
	#name : #BibtexPParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'type',
		'citeKey',
		'fieldName',
		'rawFieldString',
		'fieldCharWithinQuotes',
		'fieldStringWithinQuotes',
		'fieldValueInQuotes',
		'fieldCharWithinBraces',
		'fieldStringWithinBraces',
		'fieldValueInBraces',
		'fieldValue',
		'field',
		'fields',
		'bibEntry',
		'bibFile'
	],
	#category : #'GToolkit-Demo-PetitParser-PetitParser'
}

{ #category : #grammar }
BibtexPParser >> bibEntry [
	^ (type trim , ${ asPParser trim , citeKey , $, asPParser trim , fields
		, $} asPParser trim)
		==> [ :node | 
			({'entryType' -> node first.
				'citeKey' -> node third} copyWithAll: node fifth) asOrderedDictionary ]
]

{ #category : #grammar }
BibtexPParser >> bibFile [
	^ (bibEntry , #space asPParser star) star end ==> [ :node | node collect: #first ]
]

{ #category : #grammar }
BibtexPParser >> citeKey [
	^ (#word asPParser / $- asPParser / $_ asPParser / $: asPParser) plus flatten
]

{ #category : #grammar }
BibtexPParser >> field [
	^ (fieldName trim , $= asPParser trim , fieldValue)
		==> [ :node | node first -> node third ]
]

{ #category : #grammar }
BibtexPParser >> fieldCharWithinBraces [
	^ ($\ asPParser / ${ asPParser / $} asPParser) negate
]

{ #category : #grammar }
BibtexPParser >> fieldCharWithinQuotes [
	^ ($\ asPParser / $" asPParser) negate
]

{ #category : #grammar }
BibtexPParser >> fieldName [
	^ (#word asPParser / $- asPParser / $_ asPParser) plus flatten
]

{ #category : #grammar }
BibtexPParser >> fieldStringWithinBraces [
	^ (fieldCharWithinBraces / ($\ asPParser , #any asPParser)
		/ (${ asPParser , fieldStringWithinBraces , $} asPParser)) star flatten
]

{ #category : #grammar }
BibtexPParser >> fieldStringWithinQuotes [
	^ (fieldCharWithinQuotes / ($\ asPParser , #any asPParser)) star flatten
]

{ #category : #grammar }
BibtexPParser >> fieldValue [
	^ fieldValueInQuotes / fieldValueInBraces / rawFieldString
]

{ #category : #grammar }
BibtexPParser >> fieldValueInBraces [
	^ (${ asPParser , fieldStringWithinBraces , $} asPParser) ==> #second
]

{ #category : #grammar }
BibtexPParser >> fieldValueInQuotes [
	^ ($" asPParser , fieldStringWithinQuotes , $" asPParser) ==> #second
]

{ #category : #grammar }
BibtexPParser >> fields [
	^ (field , ($, asPParser trim , field) star)
		==> [ :node | 
			(node second collect: #second)
				addFirst: node first;
				yourself ]
]

{ #category : #grammar }
BibtexPParser >> rawFieldString [
	^ #word asPParser plus flatten
]

{ #category : #accessing }
BibtexPParser >> start [
	^ bibFile
]

{ #category : #grammar }
BibtexPParser >> type [
	^ ($@ asPParser , #letter asPParser plus flatten) ==> #second
]
