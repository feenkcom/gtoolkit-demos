Class {
	#name : #FCAContextExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-FCA-Examples'
}

{ #category : #accessing }
FCAContextExamples >> bottomConcept [
	<gtExample>
	<return: #FCAConcept>
	| bottom mammals |
	mammals := self mammals.
	bottom := mammals closureFor: self emptyBitSet.
	self assert: bottom intent = mammals properties.
	^ bottom
]

{ #category : #accessing }
FCAContextExamples >> cats [
	<gtExample>
	<return: #FCAElement>
	| cats |
	cats := self mammals elements detect: [ :elt | elt value = #Cats ].
	self
		assert: (cats properties asSet collect: #value)
		equals: #(hairCovered fourLegged) asSet.
	^ cats
]

{ #category : #accessing }
FCAContextExamples >> dolphins [
	<gtExample>
	<return: #FCAElement>
	| dolphins |
	dolphins := self mammals elements detect: [ :elt | elt value = #Dolphins ].

	self
		assert: (dolphins properties asSet collect: #value)
		equals: #(marine intelligent) asSet.

	^ dolphins
]

{ #category : #accessing }
FCAContextExamples >> dolphinsClosureConcept [
	<gtExample>
	<return: #FCAConcept>
	| dolphinsClosure |
	dolphinsClosure := self mammals
			closureFor: (self newBitSetWithAll: {self dolphins}).
	self
		assert: (dolphinsClosure intent asSet collect: #value)
		equals: #(marine intelligent) asSet.
	^ dolphinsClosure
]

{ #category : #'as yet unclassified' }
FCAContextExamples >> emptyBitSet [
	"Empty BitSet with a new, empty map to avoid polluting BitSet>>#cachedMap."

	<gtExample>
	<return: #BitSet>
	| bitSet |
	bitSet := BitSetExamples new emptyBitSet.
	^ bitSet
]

{ #category : #accessing }
FCAContextExamples >> gibbons [
	<gtExample>
	<return: #FCAElement>
	| gibbons |
	gibbons := self mammals elements detect: [ :elt | elt value = #Gibbons ].

	self
		assert: (gibbons properties asSet collect: #value)
		equals: #(hairCovered thumbed intelligent) asSet.

	^ gibbons
]

{ #category : #accessing }
FCAContextExamples >> gibbonsClosureConcept [
	<gtExample>
	<return: #FCAConcept>
	| gibbonsClosure |
	gibbonsClosure := self mammals
			closureFor: (self newBitSetWithAll: {self gibbons}).

	self
		assert: (gibbonsClosure intent asSet collect: #value)
		equals: #(hairCovered thumbed intelligent) asSet.

	^ gibbonsClosure
]

{ #category : #accessing }
FCAContextExamples >> hairCovered [
	<gtExample>
	<return: #FCAProperty>
	| hairCovered |
	hairCovered := self mammals properties
			detect: [ :elt | elt value = #hairCovered ].
	self
		assert: (hairCovered elements asSet collect: #value)
		equals: #(Gibbons Dogs Cats) asSet.

	^ hairCovered
]

{ #category : #accessing }
FCAContextExamples >> humans [
	<gtExample>
	<return: #FCAElement>
	| humans |
	humans := self mammals elements detect: [ :elt | elt value = #Humans ].

	self
		assert: (humans properties asSet collect: #value)
		equals: #(thumbed intelligent) asSet.

	^ humans
]

{ #category : #accessing }
FCAContextExamples >> humansClosureConcept [
	<gtExample>
	<return: #FCAConcept>
	| humansClosure |
	humansClosure := self mammals
			closureFor: (self newBitSetWithAll: {self humans}).
	self
		assert: (humansClosure intent asSet collect: #value)
		equals: #(thumbed intelligent) asSet.
	^ humansClosure
]

{ #category : #accessing }
FCAContextExamples >> humansDolphinsComparison [
	<gtExample>
	<return: #FCAConcept>
	| humans dolphins |
	humans := FCAContextExamples new humansClosureConcept.
	dolphins := FCAContextExamples new dolphinsClosureConcept.
	self assert: humans <> dolphins.
	^ humans
]

{ #category : #accessing }
FCAContextExamples >> humansGibbonsComparison [
	<gtExample>
	<return: #FCAConcept>
	| humans gibbons bottom |
	humans := FCAContextExamples new humansClosureConcept.
	gibbons := FCAContextExamples new gibbonsClosureConcept.
	bottom := FCAContextExamples new bottomConcept.

	self assert: bottom < gibbons.
	self assert: bottom < humans.
	self assert: gibbons < humans.
	self assert: humans <= humans.

	^ humans
]

{ #category : #accessing }
FCAContextExamples >> intelligent [
	<gtExample>
	<return: #FCAProperty>
	| intelligent |
	intelligent := self mammals properties
			detect: [ :elt | elt value = #intelligent ].

	self
		assert: (intelligent elements asSet collect: #value)
		equals: #(#Dolphins #Gibbons #Humans #Whales) asSet.

	^ intelligent
]

{ #category : #accessing }
FCAContextExamples >> intelligentConcept [
	<gtExample>
	<return: #FCAConcept>
	| intelligentConcept |
	intelligentConcept := self mammals closureFor: self intelligent elements.

	self
		assert: intelligentConcept intent
		equals: (self newBitSetWithAll: {self intelligent}).

	^ intelligentConcept
]

{ #category : #accessing }
FCAContextExamples >> joinHumansDolphins [
	<gtExample>
	<return: #FCAConcept>
	| humans dolphins bottom joinHumansDolphins |
	humans := FCAContextExamples new humansClosureConcept.
	dolphins := self mammals closureFor: (self newBitSetWithAll: {self dolphins}).
	bottom := FCAContextExamples new bottomConcept.

	joinHumansDolphins := humans join: dolphins.

	self assert: (humans meet: dolphins) equals: bottom.
	self assert: joinHumansDolphins equals: self intelligentConcept.

	^ joinHumansDolphins
]

{ #category : #example }
FCAContextExamples >> mammals [
	"This is the example from Appendix B of Gabriela Arévalo's PhD thesis, 
	“High Level Views in Object-Oriented Systems using Formal Concept Analysis”, University of Bern, 2005."

	<gtExample>
	<return: #FCAContext>
	| rawData mammals |
	rawData := FCAContextExamples new mammalsData.

	mammals := FCAContext
			elements: (rawData at: #elements)
			properties: (rawData at: #properties)
			propertyMap: (rawData at: #e2pMap).

	self assert: mammals concepts size equals: 8.

	^ mammals
]

{ #category : #data }
FCAContextExamples >> mammalsData [
	<gtExample>
	<return: #Dictionary>
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

{ #category : #example }
FCAContextExamples >> mammalsLatticeWithPositions [
	"A manually laid-out version of the lattice."

	<gtExample>
	<return: #GtMondrian>
	^ self mammals
		latticeFor: GtMondrian new
		withPositions: {378.9166666666667 @ 453.318827311198.
				348.6666666666667 @ 440.318827311198.
				356.4166666666667 @ 469.318827311198.
				357.4166666666667 @ 487.318827311198.
				363.9166666666667 @ 454.318827311198.
				337.4166666666667 @ 453.318827311198.
				372.4166666666667 @ 442.318827311198.
				359.4166666666667 @ 424.318827311198.
				360.78030303030306 @ 459.318827311198.
				351.225988700565 @ 444.318827311198.
				342.61309523809524 @ 444.318827311198.
				358.9880952380953 @ 474.318827311198.
				360.1666666666667 @ 459.318827311198.
				342.1439393939394 @ 459.318827311198.
				375.6666666666667 @ 446.318827311198.
				368.01666666666665 @ 446.318827311198.
				352.0104166666667 @ 428.318827311198.
				362.86111111111114 @ 428.318827311198}
]

{ #category : #accessing }
FCAContextExamples >> meetHumansGibbons [
	<gtExample>
	<return: #FCAConcept>
	| humans gibbons meetHumansGibbons |
	humans := FCAContextExamples new humansClosureConcept.
	gibbons := FCAContextExamples new gibbonsClosureConcept.

	meetHumansGibbons := humans meet: gibbons.

	self assert: (humans meet: humans) equals: humans.
	self assert: meetHumansGibbons equals: gibbons.

	self assert: (humans join: humans) equals: humans.
	self assert: (humans join: gibbons) equals: humans.

	^ meetHumansGibbons
]

{ #category : #utility }
FCAContextExamples >> newBitSetWithAll: aCollection [
	"Return a new BitSet with a new map.
	NB: We use this instead of #asBitSet to avoid polluting BitSet>>#cachedMap."
	^ self emptyBitSet withAll: aCollection
]

{ #category : #accessing }
FCAContextExamples >> sigmaCatsGibbons [
	<gtExample>
	<return: #BitSet>
	| sigmaCatsGibbons |
	sigmaCatsGibbons := self mammals
			sigma: (self
					newBitSetWithAll: {self cats.
							self gibbons}).
	self
		assert: (sigmaCatsGibbons asSet collect: #value)
		equals: #(hairCovered) asSet.
	^ sigmaCatsGibbons
]

{ #category : #accessing }
FCAContextExamples >> sigmaDolphins [
	<gtExample>
	<return: #BitSet>
	| sigmaDolphins |
	sigmaDolphins := self mammals sigma: (self newBitSetWithAll: {self dolphins}).
	self
		assert: (sigmaDolphins asSet collect: #value)
		equals: #(marine intelligent) asSet.
	^ sigmaDolphins
]

{ #category : #accessing }
FCAContextExamples >> sigmaEmpty [
	<gtExample>
	<return: #BitSet>
	| sigmaEmpty mammals |
	mammals := self mammals.
	sigmaEmpty := mammals sigma: self emptyBitSet.
	self
		assert: (sigmaEmpty asSet collect: #value)
		equals: (mammals properties asSet collect: #value).
	^ sigmaEmpty
]

{ #category : #accessing }
FCAContextExamples >> tauEmpty [
	<gtExample>
	<return: #BitSet>
	| tauEmpty mammals |
	mammals := self mammals.
	tauEmpty := mammals tau: self emptyBitSet.
	self assert: tauEmpty equals: mammals elements.
	^ tauEmpty
]

{ #category : #accessing }
FCAContextExamples >> tauHairCovered [
	<gtExample>
	<return: #BitSet>
	| tauHairCovered |
	tauHairCovered := self mammals tau: (self newBitSetWithAll: {self hairCovered}).
	self
		assert: (tauHairCovered asSet collect: #value)
		equals: #(Gibbons Dogs Cats) asSet.
	^ tauHairCovered
]
