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
	| hello helo foo |
	hello := 'hello' asBitSet.
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
