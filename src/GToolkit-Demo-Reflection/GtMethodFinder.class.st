"
I replace the (broken) Pharo 12 implementation of the `MethodFinder` with the Pharo 11 implementation.
See also `GtMethodFinderExamples`.
"
Class {
	#name : #GtMethodFinder,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-MethodFinder'
}

{ #category : #'public access' }
GtMethodFinder >> findMethodsByExampleInput: inputCollection andExpectedResult: expectedResult [
	"Search for methods which giving each elements of input returns the corresponding elements of outputs."

	^ (self possibleSolutionsForInput: inputCollection)
			select: [ :send | send resultIn: expectedResult ]
]

{ #category : #private }
GtMethodFinder >> possibleSolutionsForInput: inputCollection [
	| sends |
	sends := OrderedCollection new.
	inputCollection
		permutationsDo: [ :permutation |
			| foundPermutationSends args receiver |
			args := permutation allButFirst.
			receiver := permutation first.
			foundPermutationSends := (receiver class
				allSelectorsToTestInMethodFinderWithArity: inputCollection size - 1)
				collect:
					[ :method | GtMethodFinderSend
									receiver: receiver deepCopy
									selector: method
									withArguments: args deepCopy ].
			sends addAll: foundPermutationSends ].
	^ sends
]
