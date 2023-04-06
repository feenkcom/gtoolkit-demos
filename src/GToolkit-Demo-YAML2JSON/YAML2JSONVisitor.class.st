Class {
	#name : #YAML2JSONVisitor,
	#superclass : #YAMLParseNodeVisitor,
	#category : #'GToolkit-Demo-YAML2JSON'
}

{ #category : #visiting }
YAML2JSONVisitor >> visitFile: aFile [
	| result |
	result := aFile documents collect: [ :each | each acceptVisitor: self ].
	^ result size = 1 ifTrue: [ result first ] ifFalse: [ result asArray ]
]

{ #category : #visiting }
YAML2JSONVisitor >> visitList: aList [
	^ (aList items collect: [ :each | each acceptVisitor: self ]) asArray
]

{ #category : #visiting }
YAML2JSONVisitor >> visitListItem: aListItem [
	^ aListItem value acceptVisitor: self
]

{ #category : #visiting }
YAML2JSONVisitor >> visitMapping: aMapping [
	"In YAML mappings may have nil values. nil keys should not happen, but the YAMParser sometimes produces them."

	| key value |
	key := aMapping key
			ifNil: [ 'key' , 1000 atRandom asString ]
			ifNotNil: [ aMapping key acceptVisitor: self ].
	value := aMapping value
			ifNil: [ 'nil' ]
			ifNotNil: [ aMapping value acceptVisitor: self ].
	^ key -> value
]

{ #category : #visiting }
YAML2JSONVisitor >> visitMappingList: aMappingList [
	^ (aMappingList mappings collect: [ :each | each acceptVisitor: self ])
		asDictionary
]

{ #category : #visiting }
YAML2JSONVisitor >> visitNumber: aNumber [
	"TO DO: asNumber?"

	^ aNumber value value
]

{ #category : #generated }
YAML2JSONVisitor >> visitSmaCCError: aSmaCCError [
	^ self visitSmaCCParseNode: aSmaCCError
]

{ #category : #generated }
YAML2JSONVisitor >> visitSmaCCParseNode: aSmaCCParseNode [
	self acceptNodes: aSmaCCParseNode sortedChildren.
	^ aSmaCCParseNode
]

{ #category : #visiting }
YAML2JSONVisitor >> visitString: aString [
	^ aString parts first value
]
