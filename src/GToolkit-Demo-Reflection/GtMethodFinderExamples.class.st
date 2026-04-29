Class {
	#name : #GtMethodFinderExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #examples }
GtMethodFinderExamples >> findConcatenation [
	<gtExample>
	| result |
	result := GtMethodFinder new
			findMethodsByExampleInput: {'a'.
					'b'}
			andExpectedResult: 'ab'.
	self assert: result size equals: 2.
	self assert: (result at: 1) selector equals: #copyWithAll:.
	self assert: (result at: 2) selector equals: #,.
	^ result
]

{ #category : #examples }
GtMethodFinderExamples >> findGrouping [
	<gtExample>
	| result |
	result := GtMethodFinder new
			findMethodsByExampleInput: {
				#(1 2 3 4 5 6 7 8 9 10 11 12).
				3 }
			andExpectedResult: {
					#(1 2 3).
					#(4 5 6).
					#(7 8 9).
					#(10 11 12) } asOrderedCollection.
	self assert: result size equals: 1.
	self assert: result first selector equals: #groupsOf:.
	^ result
]

{ #category : #examples }
GtMethodFinderExamples >> findPrefixRemoval [
	<gtExample>
	| result |
	result := GtMethodFinder new
			findMethodsByExampleInput: {'abc'.
					'abcde'}
			andExpectedResult: 'de'.
	self assert: result size equals: 7.
	self assert: (result collect: [ :each | each selector ]) asSet equals: { #\. #removePrefix:. #copyWithoutAll:. #difference:. #gtRemovePrefix:. #famixRemovePrefix:. #withoutPrefix: } asSet.
	^ result
]

{ #category : #examples }
GtMethodFinderExamples >> findSubstringReplacement [
	<gtExample>
	| result |
	result := GtMethodFinder new
			findMethodsByExampleInput: {'foobar'. 'ob'. 'rget me de'}
			andExpectedResult: 'forget me dear'.
	self assert: result size equals: 3.
	self assert: (result collect: [ :each | each selector ]) asSet equals: { #replaceAllRegex:with:. #copyWithRegex:matchesReplacedWith:. #copyReplaceAll:with: } asSet.
	^ result
]

{ #category : #examples }
GtMethodFinderExamples >> findWords [
	<gtExample>
	| result |
	result := GtMethodFinder new
			findMethodsByExampleInput: {'The quick brown fox'}
			andExpectedResult: {'The'.
					'quick'.
					'brown'.
					'fox'} asArray.
	self assert: result size equals: 3.
	self assert: (result collect: [ :each | each selector ]) asSet equals: { #gtExampleSubstrings. #substrings. #parseLiterals } asSet.
	^ result
]
