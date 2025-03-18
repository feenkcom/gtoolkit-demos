Class {
	#name : #BitSetExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-FCA-Examples'
}

{ #category : #example }
BitSetExamples >> assertCachedUnchanged: aBlock [
	"Verify that test code does not modify the cachedMap value."
	| result oldCachedMapSize |
	oldCachedMapSize := BitSet cachedMap size.
	result := aBlock value.
	self assert: BitSet cachedMap size equals: oldCachedMapSize.
	^ result
]

{ #category : #example }
BitSetExamples >> emptyBitSet [
	"Empty BitSet with a new, empty map."

	<gtExample>
	| bitSet |
	self
		assertCachedUnchanged: [ bitSet := BitSet new
					map: self emptyMap;
					yourself.
			self assert: bitSet isEmpty.
			self assert: bitSet map isEmpty ].
	^ bitSet
]

{ #category : #example }
BitSetExamples >> emptyFoo [
	"Create a new empty BitSet with the same map as foo."

	<gtExample>
	| emptyFoo foo |
	self
		assertCachedUnchanged: [ foo := self foo.
			emptyFoo := foo empty.
			self assert: emptyFoo size equals: 0.
			self assert: emptyFoo map size equals: 2.
			self assert: foo map equals: emptyFoo map ].
	^ emptyFoo
]

{ #category : #example }
BitSetExamples >> emptyMap [
	"Fresh maps to be used just for these tests."

	<gtExample>
	| map |
	self
		assertCachedUnchanged: [ map := Dictionary new.
			self assert: map isEmpty ].
	^ map
]

{ #category : #example }
BitSetExamples >> foo [
	"Create a foo BitSet using the test map"

	<gtExample>
	| foo |
	self
		assertCachedUnchanged: [ foo := self newBitSetWithAll: 'foo'.
			self assert: foo size equals: 2.
			self assert: foo map size equals: 2 ].
	^ foo
]

{ #category : #example }
BitSetExamples >> fooRemoveF [
	<gtExample>
	| foo |
	self
		assertCachedUnchanged: [ foo := self foo.
			foo remove: $f.
			self assert: foo equals: (foo empty withAll: {$o}).
			self assert: foo equals: (self newBitSetWithAll: {$o}) ].
	^ foo
]

{ #category : #example }
BitSetExamples >> fooSubsetFoobar [
	<gtExample>
	| foo foobar |
	self
		assertCachedUnchanged: [ foo := self foo.
			foobar := self foobar.

			self assert:(foo hasSameMapAs: foobar) not.
			self assert: foobar <= foobar.
			self assert: foo <= foobar.
			self assert: foo < foobar.
			self assert: foobar >= foobar.
			self assert: foobar >= foo.
			self assert: foobar > foo.
			self assert: (foo >= self hello) not ].

	^ foobar
]

{ #category : #example }
BitSetExamples >> fooUnionBar [
	<gtExample>
	| union |
	self
		assertCachedUnchanged: [ union := self foo union: 'bar'.
			self assert: union equals: self foobar ].
	^ union
]

{ #category : #example }
BitSetExamples >> foobar [
	"Create a foobar BitSet using a fresh test map."

	<gtExample>
	| foobar |
	self
		assertCachedUnchanged: [ foobar := self newBitSetWithAll: 'foobar'.
			self assert: foobar size equals: 5.
			self assert: foobar map size equals: 5.
			self assert: (foobar hasSameMapAs: self foo) not ].
	^ foobar
]

{ #category : #example }
BitSetExamples >> foobarDifferenceBaz [
	<gtExample>
	| foobar difference |
	self
		assertCachedUnchanged: [ foobar := self fooUnionBar.
			difference := foobar difference: 'baz'.
			self assert: difference equals: (foobar empty withAll: 'for') ].
	^ difference
]

{ #category : #example }
BitSetExamples >> foobarIncludesAllFoo [
	<gtExample>
	| foobar |
	self
		assertCachedUnchanged: [ foobar := self fooUnionBar.
			self assert: (foobar includesAll: 'foo') ].
	^ foobar
]

{ #category : #example }
BitSetExamples >> foobarIncludesAllHelloNot [
	<gtExample>
	| foobar |
	self
		assertCachedUnchanged: [ foobar := self fooUnionBar.
			self assert: (foobar includesAll: 'hello') not ].
	^ foobar
]

{ #category : #example }
BitSetExamples >> foobarIntersectFoobaz [
	<gtExample>
	| foobar intersection |
	self
		assertCachedUnchanged: [ foobar := self fooUnionBar.
			intersection := foobar intersection: 'foobaz'.
			self assert: intersection equals:(foobar empty withAll: 'foba' ) ].
	^ intersection
]

{ #category : #example }
BitSetExamples >> foobarRemoveAllBaz [
	<gtExample>
	| result |
	self
		assertCachedUnchanged: [ result := self foobar.
			result removeAllFoundIn: 'baz'.
			self assert: result equals: (result empty withAll: 'for') ].
	^ result
]

{ #category : #example }
BitSetExamples >> hello [
	<gtExample>
	| hello |
	self
		assertCachedUnchanged: [ hello := self newBitSetWithAll: 'hello'.
			self assert: hello size equals: 4.
			self assert: hello map size equals: 4.
			self assert: (hello hasSameMapAs: self foo) not ].
	^ hello
]

{ #category : #example }
BitSetExamples >> helloBasicSetOperations [
	"Illustrates use of #includes:, #coillect:, #reject: etc"

	<gtExample>
	| hello mapResult copy |
	hello := self hello.

	self assert: (hello includes: $h).
	self assert: (hello includes: $f) not.

	self
		assert: (hello collect: #asInteger)
		equals: (self newBitSetWithAll: ('hello' asSet collect: #asInteger)).

	self
		assert: (hello select: [ :ch | ch > $k ])
		equals: (self newBitSetWithAll: 'lo').

	self
		assert: (hello reject: [ :item | item = $h ])
		equals: (self newBitSetWithAll: 'leo').

	mapResult := self emptyBitSet.
	hello inject: mapResult into: [ :result :item | result add: item ].
	self assert: mapResult equals: hello.

	copy := hello copy.
	self assert: copy ~~ hello.
	self assert: copy equals: hello.

	^ hello
]

{ #category : #example }
BitSetExamples >> helloEquality [
	<gtExample>
	| hello helo foo |
	self
		assertCachedUnchanged: [ hello := self hello.
			helo := hello empty withAll: 'helo'.
			foo := hello empty withAll: 'foo'.

			self assert: (hello hasSameMapAs: helo).
			self assert: (hello hasSameMapAs: foo).

			self assert: hello == hello.
			self assert: hello equals: hello.
			self assert: hello equals: helo.
			self assert: (hello = foo) not ].

	^ hello
]

{ #category : #example }
BitSetExamples >> helloEqualityWithDifferentMaps [
	"Normally maps should not be reset, but in case two BitSets have different maps, we still want equality to work. For the comparison, helo will be converted to a BitSet with the same map."

	<gtExample>
	| hello helo |
	hello := self hello.

	helo := self newBitSetWithAll: 'helo'.
	self assert: (hello hasSameMapAs: helo) not.
	self assert: hello equals: helo.

	^ hello
]

{ #category : #utility }
BitSetExamples >> newBitSetWithAll: aCollection [
	"Return a new BitSet with a new map."
	^ self emptyBitSet withAll: aCollection
]
