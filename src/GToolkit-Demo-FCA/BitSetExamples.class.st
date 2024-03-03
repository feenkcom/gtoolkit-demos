Class {
	#name : #BitSetExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-FCA-Examples'
}

{ #category : #accessing }
BitSetExamples >> fooRemoveF [
	<gtExample>
	| result |
	result := 'foo' asBitSet.
	result remove: $f.
	self assert: result equals: 'o' asBitSet.
	^ result
]

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
BitSetExamples >> foobarDifferenceBaz [
	<gtExample>

	| foobar baz difference |
	foobar := self fooUnionBar.
	baz := foobar newFrom: 'baz'.
	difference := foobar difference: baz.
	self assert: difference equals: 'for' asBitSet.
	^ difference
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
BitSetExamples >> foobarRemoveAllBaz [
	<gtExample>
	| result |
	result := 'foobar' asBitSet.
	result removeAll: 'baz' asBitSet.
	self assert: result equals: 'for' asBitSet.
	^ result
]

{ #category : #accessing }
BitSetExamples >> hello [
	<gtExample>
	^ 'hello' asBitSet
]

{ #category : #accessing }
BitSetExamples >> helloBasicSetOperations [
	<gtExample>
	| hello mapResult copy |
	hello := self hello.

	self assert: (hello includes: $h).
	self assert: (hello includes: $f) not.

	self
		assert: (hello collect: #asInteger)
		equals: ('hello' asSet collect: #asInteger) asBitSet.


	self assert: (hello reject: [ :item | item = $h ]) 
		equals: 'leo' asBitSet.

	mapResult := BitSet empty.
	hello inject: mapResult 
		into: [ :result :item | result add: item ].
	self assert: mapResult equals: hello.

	copy := hello copy.
	self assert: copy ~~ hello.
	self assert: copy equals: hello.

	^ hello
]

{ #category : #accessing }
BitSetExamples >> helloEquality [
	<gtExample>
	| hello helo foo |
	hello := self hello.
	helo := 'helo' asBitSet.
	foo := 'foo' asBitSet.

	self assert: (hello hasSameMapAs: helo).
	self assert: (hello hasSameMapAs: foo).

	self assert: hello == hello.
	self assert: hello equals: hello.
	self assert: hello equals: helo.
	self assert: (hello = foo) not.

	^ hello
]

{ #category : #accessing }
BitSetExamples >> helloWithReset [
	"For the comparison, helo will be converted to a BitSet with the same map."

	<gtExample>
	| hello helo |
	hello := self hello.

	BitSet reset.
	helo := 'helo' asBitSet.
	self assert: (hello hasSameMapAs: helo) not.
	self assert: hello equals: helo.

	^ hello
]
