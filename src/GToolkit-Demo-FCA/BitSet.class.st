"
I am a Set where each element is represented as a bit in my `bits` slot (a small or large integer).
My `map` slot maps the bits to the objects in my set.
"
Class {
	#name : #BitSet,
	#superclass : #Collection,
	#instVars : [
		'bits',
		'map'
	],
	#category : #'GToolkit-Demo-FCA-BitSets'
}

{ #category : #'instance creation' }
BitSet class >> newFrom: aCollection [
	^ self withAll: aCollection
]

{ #category : #'instance creation' }
BitSet class >> withAll: aCollection [
	^ self new
		addAll: aCollection;
		yourself
]

{ #category : #accessing }
BitSet >> = other [
	| otherBitSet |
	self == other ifTrue: [ ^ true ].

	(other isKindOf: self class)
		ifTrue: [ self map == other map
				ifTrue: [ otherBitSet := other ]
				ifFalse: [ otherBitSet := self newFrom: other ].
			^ self bits = otherBitSet bits ].

	^ false
]

{ #category : #adding }
BitSet >> add: anObject [
	| index |
	index := map at: anObject ifAbsentPut: [ map size + 1 ].

	bits := bits bitAt: index put: 1
]

{ #category : #converting }
BitSet >> asBitSet [
	^ self
]

{ #category : #accessing }
BitSet >> bits [
	^ bits
]

{ #category : #accessing }
BitSet >> bits: anObject [
	bits := anObject
]

{ #category : #enumerating }
BitSet >> do: aBlock [
	self map
		keysAndValuesDo: [ :object :index | (self bits bitAt: index) == 1 ifTrue: [ aBlock value: object ] ]
]

{ #category : #'instance creation' }
BitSet >> empty [
	"Return a new empty BitSet sharing my mutable map."

	^ self class new
		map: self map;
		yourself
]

{ #category : #accessing }
BitSet >> gtMapFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Map';
		priority: 60;
		items: [ self map associations ];
		actionUpdateButtonTooltip: 'Update item list';
		column: 'Index' 
			text: [ :eachItem :eachIndex | 
				eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Item' 
			text: [ :eachItem | eachItem gtDisplayText ].
]

{ #category : #initialization }
BitSet >> initialize [
	"Perhaps better to use WeakKeyDictionary?"
	bits := 0.
	map := Dictionary new.
]

{ #category : #accessing }
BitSet >> intersection: other [
	^ self empty bits: ((self newFrom: other) bits bitAnd: self bits)
]

{ #category : #accessing }
BitSet >> map [
	^ map
]

{ #category : #accessing }
BitSet >> map: aDictionary [
	map := aDictionary
]

{ #category : #'instance creation' }
BitSet >> newFrom: other [
	"I create a new BitSet that shares a (mutable) map with me.
	Do nothing if the other collection already shares a map with me."

	self assert: other isCollection.

	((other isKindOf: self class) and: [ other map == self map ])
		ifTrue: [ ^ other ].

	^ self empty
		addAll: other;
		yourself
]

{ #category : #accessing }
BitSet >> union: other [
	^ self empty bits: ((self newFrom: other) bits bitOr: self bits)
]
