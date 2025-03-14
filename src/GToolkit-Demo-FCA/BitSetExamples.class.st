Class {
	#name : #BitSetExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-FCA-Examples'
}

{ #category : #accessing }
BitSetExamples >> foo [
	<gtExample>
	<noTest>
	^ 'foo' asBitSet
]

{ #category : #accessing }
BitSetExamples >> fooRemoveF [
	<noTest>
	<gtExample>
	| result |
	result := 'foo' asBitSet.
	result remove: $f.
	self assert: result equals: 'o' asBitSet.
	^ result
]

{ #category : #accessing }
BitSetExamples >> fooSubsetFoobar [
	<gtExample>
	<noTest>
	| foo foobar |
	foo := self foo.
	foobar := self foobar.
	self assert: foobar <= foobar.
	self assert: foo <= foobar.
	self assert: foo < foobar.
	self assert: foobar >= foobar.
	self assert: foobar >= foo.
	self assert: foobar > foo.
	self assert: (foo >= self hello) not.
	
	^ foobar
]

{ #category : #accessing }
BitSetExamples >> fooUnionBar [
	<gtExample>
	<noTest>
	| union |
	union := self foo union: 'bar'.
	self assert: union equals: self foobar.
	^ union
]

{ #category : #accessing }
BitSetExamples >> foobar [
	<gtExample>
	<noTest>
	^ 'foobar' asBitSet
]

{ #category : #accessing }
BitSetExamples >> foobarDifferenceBaz [
	<gtExample>
	<noTest>
	| foobar difference |
	foobar := self fooUnionBar.
	difference := foobar difference: 'baz'.
	self assert: difference equals: 'for' asBitSet.
	^ difference
]

{ #category : #accessing }
BitSetExamples >> foobarIncludesAllFoo [
	<gtExample>
	<noTest>
	| foobar difference |
	foobar := self fooUnionBar.
	self assert: (foobar includesAll: 'foo').
	^ difference
]

{ #category : #accessing }
BitSetExamples >> foobarIntersectFoobaz [
	<gtExample>
	<noTest>
	| foobar intersection |
	foobar := self fooUnionBar.
	intersection := foobar intersection: 'foobaz'.
	self assert: intersection equals: 'foba' asBitSet.
	^ intersection
]

{ #category : #accessing }
BitSetExamples >> foobarRemoveAllBaz [
	<gtExample>
	<noTest>
	| result |
	result := 'foobar' asBitSet.
	result removeAll: 'baz'.
	self assert: result equals: 'for' asBitSet.
	^ result
]

{ #category : #accessing }
BitSetExamples >> hello [
	<gtExample>
	<noTest>
	^ 'hello' asBitSet
]

{ #category : #accessing }
BitSetExamples >> helloBasicSetOperations [
	<gtExample>
	<noTest>
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
	<noTest>
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
	<noTest>
	| hello helo |
	hello := self hello.

	BitSet reset.
	helo := 'helo' asBitSet.
	self assert: (hello hasSameMapAs: helo) not.
	self assert: hello equals: helo.

	^ hello
]
