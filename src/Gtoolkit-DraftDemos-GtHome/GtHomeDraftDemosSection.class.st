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
				newCardForPageNamed: 'GToolkit Draft Demos'
				fromDatabase: 'feenkcom/gtoolkit-demos/lepiter').

	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]

{ #category : #accessing }
GtHomeDraftDemosSection >> newCardForPageNamed: pageName fromDatabase: databaseName [
	^ self
		newHeaderCardWithTitle: pageName
		description: pageName
		size: 200 @ 150
		content: (BrLabel new
				text: pageName;
				aptitude: BrGlamorousLabelAptitude new bold;
				padding: (BlInsets all: 20)) asScalableElement
		action: [ :card | 
			| database startPage |
			database := LeDatabasesRegistry default currentLoadedDefaultLogicalDatabase
					databaseNamed: databaseName.
			startPage := database pageNamed: pageName.
			GtWorldUtility
				showSpaceWithTitle: startPage title
				inPagerWith: [ startPage asLepiterPagePhlowTool asElementDo: [ :e | e ] ]
						asStencil
				from: card ]
]
