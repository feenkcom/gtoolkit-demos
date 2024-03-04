Class {
	#name : #FCALepiterContextExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-FCA-Examples'
}

{ #category : #accessing }
FCALepiterContextExamples >> gtBook [
	"NB: Will clutter the BitSet map, so noTest."

	<gtExample>
	<noTest>
	^ FCAContext
		elements: LeDatabase gtBook pages
		properties: (LeDatabase gtBook pages flatCollect: #tags) asSet
		propertyMap: #tags
]
