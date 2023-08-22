Class {
	#name : #PillarWebPage,
	#superclass : #AWebPage,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #accessing }
PillarWebPage >> rawLinks [
	^ rawLinks
		ifNil: [ rawLinks := PillarLinkSeaParser parse: self contents ]
]

{ #category : #accessing }
PillarWebPage >> title [
	^ title
		ifNil: [ | dict |
			dict := self titleParser parse: self contents.
			 ]
]

{ #category : #parsing }
PillarWebPage >> titleParser [
	"Generate a PP parser on the fly. Could be extracted to a class."

	^ ((${ asPParser trim , '"title"' asPParser trim , $: asPParser trim
		, $" asPParser , $" asPParser negate plus flatten , $" asPParser
		, $} asPParser trim) ==> #fifth)
		/ (#any asPParser ==> [ :node | self missingTitle ])
]

{ #category : #constant }
PillarWebPage >> webPageGroupClass [
	"Which class should be used to instantiate groups of web pages."

	^ PillarWebPageGroup
]
