Class {
	#name : #GtHomeDraftDemosSection,
	#superclass : #GtHomeSection,
	#category : #'Gtoolkit-DraftDemos-GtHome-Sections'
}

{ #category : #accessing }
GtHomeDraftDemosSection >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'Get started').
	cardsContainer := self newCardsContainer.

	cardsContainer
		addChild: (self
				newLepiterPageCardForPageNamed: 'GToolkit Draft Demos'
				inDatabaseNamed: 'feenkcom/gtoolkit-demos/lepiter'
				withTitle: 'GToolkit Draft Demos'
				andDescription: 'GToolkit Draft Demos').

	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]
