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
	| rawData context dolphins intelligent thumbed |
	rawData := FCAContextExamples new mammalsData.

	context := FCAContext
			elements: (rawData at: #elements)
			properties: (rawData at: #properties)
			propertyMap: (rawData at: #e2pMap).

	dolphins := context elements detect: [ :elt | elt value = #Dolphins ].
	intelligent := context properties detect: [ :prop | prop value = #intelligent ].
	thumbed := context properties detect: [ :prop | prop value = #thumbed ].
	self assert: (dolphins hasProperty: intelligent).
	self assert: (dolphins hasProperty: thumbed) not.

	^ context
]

{ #category : #accessing }
FCAContextExamples >> mammalsData [
	"This is the raw data for the example from Appendix B of Gabriela Arévalo's PhD thesis, “High Level Views in Object-Oriented Systems using Formal Concept Analysis”, University of Bern, 2005."

	<gtExample>
	| map properties elements e2p |
	elements := #(Cats Dogs Dolphins Gibbons Humans Whales).
	properties := #(fourLegged hairCovered intelligent marine thumbed).

	map := {#Cats -> #(fourLegged hairCovered).
			#Dogs -> #(fourLegged hairCovered).
			#Dolphins -> #(intelligent marine).
			#Gibbons -> #(hairCovered intelligent thumbed).
			#Humans -> #(intelligent thumbed).
			#Whales -> #(intelligent marine)} asDictionary.

	e2p := e2p := [ :element | map at: element ].
	^ {#elements -> elements.
		#properties -> properties.
		#e2pMap -> e2p} asDictionary
]
