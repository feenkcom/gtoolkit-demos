Class {
	#name : #YAML2JSONVisitor,
	#superclass : #Object,
	#traits : 'TYAMLParseNodeVisitor',
	#classTraits : 'TYAMLParseNodeVisitor classTrait',
	#category : #'GToolkit-Demo-YAML2JSON'
}

{ #category : #visiting }
YAML2JSONVisitor >> visitFile: aFile [
	| result |
	result := aFile documents collect: [ :each | each acceptVisitor: self ].
	^ result size = 1 ifTrue: [ result first ] ifFalse: [ result ]
]

{ #category : #visiting }
YAML2JSONVisitor >> visitList: aList [
	^ aList items collect: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
YAML2JSONVisitor >> visitMapping: aMapping [
	^ (aMapping key acceptVisitor: self)
		-> (aMapping value
				ifNil: [  "nil" ]
				ifNotNil: [ aMapping value acceptVisitor: self ])
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

{ #category : #visiting }
YAML2JSONVisitor >> visitString: aString [
	^ aString parts first value
]
