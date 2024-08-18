"
I flatten a CSV AST produced by the CSVParser into a collection of lines each of which is a collection of values.
For an example, see {{gtMethod:name=CSV2JSONExamples>>#kurosawaJson}}. 
"
Class {
	#name : #CSV2JSON,
	#superclass : #CSVParseNodeVisitor,
	#instVars : [
		'ast'
	],
	#category : #'GToolkit-Demo-ParseNodeVisitor-Visitor'
}

{ #category : #accessing }
CSV2JSON class >> for: aCsvString [
	^ self new
		csv: aCsvString;
		yourself
]

{ #category : #accessing }
CSV2JSON >> ast [
	"Should be initialized with CSV2JSON class>>#for: or CSV2JSON>>#csv:"

	self assert: ast notNil.
	^ ast
]

{ #category : #initalization }
CSV2JSON >> csv: aCsvString [
	ast := CSVParser parse: (aCsvString trimRight: #isSeparator)
]

{ #category : #accessing }
CSV2JSON >> entries [
	"We start with data being a collection of lines, each of which is a collection of values, and we produce a collection of lines, each of which is a Dictionary."

	| data result currentIndex headerLine currentLine |
	data := self ast acceptVisitor: self.

	result := OrderedCollection new.

	currentIndex := 1.
	headerLine := data first.

	[ currentIndex < data size ]
		whileTrue: [ currentIndex := currentIndex + 1.
			currentLine := data at: currentIndex.
			result addLast: (self entryForLine: currentLine withHeader: headerLine) ].
	^ result asArray
]

{ #category : #accessing }
CSV2JSON >> entryForLine: currentLine withHeader: headerLine [
	| dict |
	dict := Dictionary new.
	1
		to: headerLine size
		do: [ :index | 
			index <= currentLine size
				ifTrue: [ dict at: (headerLine at: index) put: (currentLine at: index) ] ].
	^ dict
]

{ #category : #accessing }
CSV2JSON >> json [
	"The nicely formatted GtJson entity."

	^ self entries asGtJson
]

{ #category : #accessing }
CSV2JSON >> jsonObject [
	"The underlying tree of Dictionaries and Arrays."

	^ self json jsonObject
]

{ #category : #visiting }
CSV2JSON >> visitFile: aFile [
	^ aFile lines collect: [ :each | self visitLine: each ]
]

{ #category : #visiting }
CSV2JSON >> visitLine: aLine [
	^ aLine values collect: #value
]
