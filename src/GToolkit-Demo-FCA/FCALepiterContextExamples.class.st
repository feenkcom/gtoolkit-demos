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
	^ FCAContext forDatabaseNamed: 'Glamorous Toolkit Book'
]

{ #category : #example }
FCALepiterContextExamples >> gtBookOnlyTopTenTags [
	<gtExample>
	<noTest>
	^ FCAContext forDatabaseNamed: 'Glamorous Toolkit Book' withOnlyTopTags: 10
]

{ #category : #example }
FCALepiterContextExamples >> gtBookTaggedPagesOnly [
	"We take only pages with tags, excluding the TOC, and consider only the top 10 tags as properties."

	<gtExample>
	<noTest>
	| gtBook pages tags toc |
	gtBook := LeDatabase gtBook.
	toc := gtBook pageNamed: 'Glamorous Toolkit Book'.
	pages := (gtBook pages reject: [ :each | each tags isEmpty ]) copyWithout: toc.

	tags := ((pages flatCollect: #tags) asBag sortedCounts copyFrom: 1 to: 10)
			collect: #value.

	^ (FCAContext
		elements: pages
		properties: tags
		propertyMap: [ :page | page tags intersection: tags ])
		printMessage: #title;
		yourself
]

{ #category : #example }
FCALepiterContextExamples >> gtBookTopTenTags [
	<gtExample>
	<noTest>
	^ FCAContext forDatabaseNamed: 'Glamorous Toolkit Book' topTags: 10
]

{ #category : #example }
FCALepiterContextExamples >> privateDatabase [
	"The default database. Could be very large."

	<gtExample>
	<noTest>
	^ FCAContext forDatabaseNamed: 'Documents/lepiter/default'
]

{ #category : #example }
FCALepiterContextExamples >> privateDatabaseTop10 [
	"The default database."

	<gtExample>
	<noTest>
	^ FCAContext forDatabaseNamed: 'Documents/lepiter/default' topTags: 10
]

{ #category : #example }
FCALepiterContextExamples >> privateDatabaseTop20 [
	"The default database."

	<gtExample>
	<noTest>
	^ FCAContext forDatabaseNamed: 'Documents/lepiter/default' topTags: 20
]
