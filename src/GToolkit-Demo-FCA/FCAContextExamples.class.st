Class {
	#name : #FCAContextExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-FCA-Examples'
}

{ #category : #accessing }
FCAContextExamples >> bottomConcept [
	<gtExample>
	| bottom mammals |
	mammals := self mammals.
	bottom := mammals closureFor: BitSet empty.
	self assert: bottom intent = mammals properties.
	^ bottom
]

{ #category : #accessing }
FCAContextExamples >> cats [
	<gtExample>
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
	| dolphinsClosure |
	dolphinsClosure := self mammals closureFor: {self dolphins} asBitSet.
	self
		assert: (dolphinsClosure intent asSet collect: #value)
		equals: #(marine intelligent) asSet.
	^ dolphinsClosure
]

{ #category : #accessing }
FCAContextExamples >> gibbons [
	<gtExample>
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
	| gibbonsClosure |
	gibbonsClosure := self mammals closureFor: {self gibbons} asBitSet.

	self
		assert: (gibbonsClosure intent asSet collect: #value)
		equals: #(hairCovered thumbed intelligent) asSet.

	^ gibbonsClosure
]

{ #category : #accessing }
FCAContextExamples >> hairCovered [
	<gtExample>
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
	| humansClosure |
	humansClosure := self mammals closureFor: {self humans} asBitSet.
	self
		assert: (humansClosure intent asSet collect: #value)
		equals: #(thumbed intelligent) asSet.
	^ humansClosure
]

{ #category : #accessing }
FCAContextExamples >> humansDolphinsComparison [
	<gtExample>
	| humans dolphins |
	humans := FCAContextExamples new humansClosureConcept.
	dolphins := FCAContextExamples new dolphinsClosureConcept.
	self assert: humans <> dolphins.
	^ humans
]

{ #category : #accessing }
FCAContextExamples >> humansGibbonsComparison [
	<gtExample>
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
	| intelligentConcept |
	intelligentConcept := self mammals closureFor: self intelligent elements.

	self assert: intelligentConcept intent equals: {self intelligent} asBitSet.

	^ intelligentConcept
]

{ #category : #accessing }
FCAContextExamples >> joinHumansDolphins [
	<gtExample>
	| humans dolphins bottom joinHumansDolphins |
	humans := FCAContextExamples new humansClosureConcept.
	dolphins := self mammals closureFor: {self dolphins} asBitSet.
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
FCAContextExamples >> meetHumansGibbons [
	<gtExample>
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

{ #category : #accessing }
FCAContextExamples >> sigmaCatsGibbons [
	<gtExample>
	| sigmaCatsGibbons |
	sigmaCatsGibbons := self mammals
			sigma: {self cats.
					self gibbons} asBitSet.
	self
		assert: (sigmaCatsGibbons asSet collect: #value)
		equals: #(hairCovered) asSet.
	^ sigmaCatsGibbons
]

{ #category : #accessing }
FCAContextExamples >> sigmaDolphins [
	<gtExample>
	| sigmaDolphins |
	sigmaDolphins := self mammals sigma: (BitSet with: self dolphins).
	self
		assert: (sigmaDolphins asSet collect: #value)
		equals: #(marine intelligent) asSet.
	^ sigmaDolphins
]

{ #category : #accessing }
FCAContextExamples >> sigmaEmpty [
	<gtExample>
	| sigmaEmpty mammals |
	mammals := self mammals.
	sigmaEmpty := mammals sigma: BitSet empty.
	self
		assert: (sigmaEmpty asSet collect: #value)
		equals: (mammals properties asSet collect: #value).
	^ sigmaEmpty
]

{ #category : #accessing }
FCAContextExamples >> tauEmpty [
	<gtExample>
	| tauEmpty mammals |
	mammals := self mammals.
	tauEmpty := mammals tau: BitSet empty.
	self assert: tauEmpty equals: mammals elements.
	^ tauEmpty
]

{ #category : #accessing }
FCAContextExamples >> tauHairCovered [
	<gtExample>
	| tauHairCovered |
	tauHairCovered := self mammals tau: {self hairCovered} asBitSet.
	self
		assert: (tauHairCovered asSet collect: #value)
		equals: #(Gibbons Dogs Cats) asSet.
	^ tauHairCovered
]
