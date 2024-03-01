Class {
	#name : #BitSetExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-FCA-Examples'
}

{ #category : #accessing }
BitSetExamples >> fooUnionBar [
	<gtExample>
	| foo bar union |
	foo := 'foo' asBitSet.
	bar := 'bar' asBitSet.
	union := foo union: bar.
	self assert: union equals: 'foobar' asBitSet.
	^ union
]

{ #category : #accessing }
BitSetExamples >> foobarIntersectFoobaz [
	<gtExample>

	| foobar foobaz intersection |
	foobar := self fooUnionBar.
	foobaz := foobar newFrom: 'foobaz'.
	intersection := foobar intersection: foobaz.
	self assert: intersection equals: 'foba' asBitSet.
	^ intersection
]

{ #category : #accessing }
BitSetExamples >> hello [
	<gtExample>
	| bitset |
	bitset := BitSet newFrom: 'hello'.
	self assert: bitset == bitset.
	self assert: bitset equals: bitset.
	self assert: bitset equals: (bitset newFrom: 'hello').
	self assert: bitset equals: (bitset newFrom: 'helo').
	self assert: bitset equals: (BitSet newFrom: 'hello').
	
	self assert:( bitset == (Set newFrom: 'foobar')) not.
	self assert:( bitset == (BitSet newFrom: 'hello')) not.

	^ bitset
]
