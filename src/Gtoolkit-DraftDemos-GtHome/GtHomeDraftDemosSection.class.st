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
				cardForPageNamed: 'GToolkit Draft Demos'
				fromDatabase: 'feenkcom/gtoolkit-demos/lepiter').

	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]
