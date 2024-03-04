Class {
	#name : #FCALepiterContextExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-FCA-Examples'
}

{ #category : #example }
FCALepiterContextExamples >> gtBook [
	"The entire book with all tags as properties."

	<gtExample>
	<noTest>
	^ FCAContext
		elements: LeDatabase gtBook pages
		properties: (LeDatabase gtBook pages flatCollect: #tags) asSet
		propertyMap: #tags
]

{ #category : #example }
FCALepiterContextExamples >> gtBookTaggedPagesOnly [
	"We take only pages with tags, and consider only the top 20 tags as properties."

	<gtExample>
	<noTest>
	| gtBook pages tags |
	gtBook := LeDatabase gtBook.
	pages := gtBook pages reject: [ :each | each tags isEmpty ].
	tags := ((pages flatCollect: #tags) asBag sortedCounts copyFrom: 1 to: 20)
			collect: #value.

	^ (FCAContext
		elements: pages
		properties: tags
		propertyMap: [ :page | page tags intersection: tags ])
		printMessage: #title;
		yourself
]
