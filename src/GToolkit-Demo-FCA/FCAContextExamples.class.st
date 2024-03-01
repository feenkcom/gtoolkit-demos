Class {
	#name : #FCAContextExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-FCA-Examples'
}

{ #category : #accessing }
FCAContextExamples >> mammals [
	"This is the example from Appendix B of Gabriela Arévalo's PhD thesis, 
	“High Level Views in Object-Oriented Systems using Formal Concept Analysis”, University of Bern, 2005."

	<gtExample>
	| map properties elements incidence context |
	elements := #(Cats Dogs Dolphins Gibbons Humans Whales).
	properties := #(#'four-legged' #'hair-covered' intelligent marine thumbed).

	map := {#Cats -> #(#'four-legged' #'hair-covered' i).
			#Dogs -> #(#'four-legged' #'hair-covered').
			#Dolphins -> #(intelligent marine).
			#Gibbons -> #(#'hair-covered' intelligent thumbed).
			#Humans -> #(intelligent thumbed).
			#Whales -> #(intelligent marine)} asDictionary.

	incidence := [ :e :p | (map at: e) includes: p ].

	context := FCAContext
			elements: elements
			properties: properties
			incidence: incidence.

	self assert: (context element: #Dolphins hasProperty: #intelligent).
	self assert: (context element: #Dolphins hasProperty: #thumbed) not.
	^ context
]
