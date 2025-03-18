"
I am a Set where each element is represented as a bit in my `bits` slot (a small or large integer).
My `map` slot maps the bits to the objects in my set.

*Caveat:* the map to be shared across instances of BitSet is stored as a class variable. 
If the  map gets large, it won't get garbage-collected. Use {{gtMethod:name=BitSet class>>#reset}} to clear it.

It is also possible to avoid using the cached map. See {{gtClass:name=BitSetExamples}}. 
"
Class {
	#name : #BitSet,
	#superclass : #Collection,
	#instVars : [
		'bits',
		'map'
	],
	#classInstVars : [
		'cachedMap'
	],
	#category : #'GToolkit-Demo-FCA-BitSets'
}

{ #category : #cache }
BitSet class >> cachedMap [
	"A map to share across all current instances."

	^ cachedMap ifNil: [ cachedMap := Dictionary new ]
]

{ #category : #cache }
BitSet class >> cachedMap: aDictionary [
	"Could be used to set the cache to a particular map to share amongst a number of BitSets."

	cachedMap := aDictionary
]

{ #category : #'instance creation' }
BitSet class >> newFrom: aCollection [
	^ self withAll: aCollection
]

{ #category : #cache }
BitSet class >> reset [
	"Clear the cache. Only needed if there is a need for many BitSets with different maps
	(or to aid in garbage collection)."

	^ cachedMap := nil
]

{ #category : #'instance creation' }
BitSet class >> withAll: aCollection [
	"I created a new BitSet with the cachedMap."

	^ self new
		addAll: aCollection;
		yourself
]

{ #category : #comparing }
BitSet >> < aBitSet [
	^ aBitSet > self
]

{ #category : #comparing }
BitSet >> <= aBitSet [
	^ aBitSet >= self
]

{ #category : #comparing }
BitSet >> = other [
	| otherBitSet |
	self == other ifTrue: [ ^ true ].

	(other isKindOf: self class)
		ifTrue: [ otherBitSet := self map == other map
					ifTrue: [ other ]
					ifFalse: [ self withAll: other ].
			^ self bits = otherBitSet bits ].

	^ false
]

{ #category : #comparing }
BitSet >> > aBitSet [
	^ (self >= aBitSet) and: [ self ~= aBitSet ]
]

{ #category : #comparing }
BitSet >> >= aBitSet [
	^ self includesAll: aBitSet
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

{ #category : #'instance creation' }
BitSet >> bitSetFor: otherCollection [
	"I create a new BitSet that shares a (mutable) map with me.
	Do nothing if the other collection already shares a map with me."
	self
		deprecated: 'Use withAll:'
		transformWith: 
			'`@receiver newFrom: `@args' 
			-> '`@receiver withAll: `@args'.
			
	^ self withAll: otherCollection
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
BitSet >> difference: other [
	^ self empty
		bits: (self bits bitClear: (self withAll: other) bits);
		yourself
]

{ #category : #enumerating }
BitSet >> do: aBlock [
	self map
		keysAndValuesDo: [ :object :index | (self bits bitAt: index) == 1 ifTrue: [ aBlock value: object ] ]
]

{ #category : #'instance creation' }
BitSet >> empty [
	"Create a new empty BitSet with the same map as mine."

	^ self class new
		map: self map;
		yourself
]

{ #category : #view }
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

{ #category : #view }
BitSet >> gtResetFor: anAction [
	"<gtAction>"
	^ anAction button
		tooltip: 'Clear the cached map';
		priority: 10;
		icon: BrGlamorousIcons close;
		action: [ self class reset ]
]

{ #category : #testing }
BitSet >> hasSameMapAs: other [
	^ (other isKindOf: self class) and: [ other map == self map ]
]

{ #category : #comparing }
BitSet >> hash [
	^ bits hash
]

{ #category : #comparing }
BitSet >> includesAll: aCollection [
	| other |
	other := self withAll: aCollection.
	^ (self bits bitAnd: other bits) = other bits
]

{ #category : #initialization }
BitSet >> initialize [
	bits := 0.
	map := self class cachedMap.
]

{ #category : #enumerating }
BitSet >> intersection: other [
	^ self empty
		bits: (self bits bitAnd: (self withAll: other) bits);
		yourself
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
	self
		deprecated: 'Use withAll:'
		transformWith: 
			'`@receiver newFrom: `@args' 
			-> '`@receiver withAll: `@args'.

	^ self bitSetFor: other
]

{ #category : #removing }
BitSet >> remove: oldObject ifAbsent: anExceptionBlock [
	| index |
	index := map at: oldObject ifAbsent: [ ^ anExceptionBlock value ].
	self bits: (self bits bitAt: index put: 0).
	^ oldObject
]

{ #category : #enumerating }
BitSet >> union: other [
	^ self empty
		bits: (self bits bitOr: (self withAll: other) bits);
		yourself
]

{ #category : #'instance creation' }
BitSet >> withAll: otherCollection [
	"I create a new BitSet that shares a (mutable) map with me.
	Do nothing if the other collection already shares a map with me."

	self assert: otherCollection isCollection.
	(self hasSameMapAs: otherCollection) ifTrue: [ ^ otherCollection ].
	^ self empty
		addAll: otherCollection;
		yourself
]
