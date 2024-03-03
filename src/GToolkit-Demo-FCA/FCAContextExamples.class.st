Class {
	#name : #FCAContextExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-FCA-Examples'
}

{ #category : #example }
FCAContextExamples >> gtBook [
	<gtExample>
	^ FCAContext
		elements: LeDatabase gtBook pages
		properties: (LeDatabase gtBook pages flatCollect: #tags) asSet
		propertyMap: #tags
]

{ #category : #example }
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

{ #category : #data }
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

{ #category : #accessing }
FCAContextExamples >> mammalsSigma [
	<gtExample>
	| cats sigmaCatsGibbons dolphins mammals gibbons sigmaDolphins sigmaEmpty |
	mammals := self mammals.

	sigmaEmpty := mammals sigma: BitSet empty.
	self
		assert: (sigmaEmpty asSet collect: #value)
		equals: (mammals properties asSet collect: #value).

	dolphins := mammals elements detect: [ :elt | elt value = #Dolphins ].
	cats := mammals elements detect: [ :elt | elt value = #Cats ].
	gibbons := mammals elements detect: [ :elt | elt value = #Gibbons ].

	sigmaDolphins := mammals sigma: (BitSet with: dolphins).
	self
		assert: (sigmaDolphins asSet collect: #value)
		equals: #(marine intelligent) asSet.

	sigmaCatsGibbons := mammals
			sigma: {cats.
					gibbons} asBitSet.
	self
		assert: (sigmaCatsGibbons asSet collect: #value)
		equals: #(hairCovered) asSet.
	^ mammals
]

{ #category : #accessing }
FCAContextExamples >> mammalsTau [
	<gtExample>
	| example tauHairCovered hairCovered mammals tauEmpty |
	mammals := self mammals.

	tauEmpty := mammals tau: BitSet empty.

	example
		assert: (tauEmpty asSet collect: #value)
		equals: (mammals elements asSet collect: #value).

	hairCovered := mammals properties detect: [ :elt | elt value = #hairCovered ].

	tauHairCovered := mammals tau: {hairCovered} asBitSet.
	example
		assert: (tauHairCovered asSet collect: #value)
		equals: #(Gibbons Dogs Cats) asSet.
	^ mammals
]
