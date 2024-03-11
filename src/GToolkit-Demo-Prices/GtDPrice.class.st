Class {
	#name : #GtDPrice,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Prices-Model'
}

{ #category : #'as yet unclassified' }
GtDPrice class >> gtViewClassHierarchyIn: aView [
	<gtView>
	^ aView mondrian
		title: 'Map';
		priority: 101;
		painting: [ :view |
			| classes |
			classes := {UPrice. UConcretePrice}, 
				UModifiedPrice withAllSubclasses.
			view nodes
				umlClassShapeWithName: [:x | x name ];
				"shape: [ :aClass |
					BlTextElement new
						text: aClass name asRopedText ];"
				with: classes.
			view edges 
				fromCenterBottom;
				toCenterTop;
				connectFrom: #superclass.
			view layout custom: GtGradVerticalTreeLayout new.
			view ]
]

{ #category : #operations }
GtDPrice >> * aNumber [
	self assert: [ aNumber isKindOf: Number ].
	^ GtDMultipliedPrice new
		price: self;
		multiplier: aNumber
]

{ #category : #operations }
GtDPrice >> + anAdditionalPrice [
	self assert: [ anAdditionalPrice isKindOf: GtDPrice ].
	^ GtDSummedPrice new
		price: self;
		additionalPrice: anAdditionalPrice
]

{ #category : #operations }
GtDPrice >> - anotherPrice [
	[ anotherPrice isKindOf: GtDPrice ] assert.
	^ (self money - anotherPrice money) asPrice.
]

{ #category : #operations }
GtDPrice >> / aDivisor [
	^ aDivisor gtDividingPrice: self

]

{ #category : #comparing }
GtDPrice >> < aPrice [
	^ (aPrice isKindOf: GtDPrice) and: [ 
		self money < aPrice money ]
]

{ #category : #comparing }
GtDPrice >> = aPrice [
	^ (aPrice isKindOf: GtDPrice) and: [ 
		aPrice money = self money ]
]

{ #category : #comparing }
GtDPrice >> > aPrice [
	^ (aPrice isKindOf: GtDPrice) and: [ 
		self money > aPrice money ]
]

{ #category : #operations }
GtDPrice >> adaptToNumber: aNumber andSend: aString [
	^self perform: aString asSymbol withArguments: { aNumber }
]

{ #category : #ui }
GtDPrice >> asOverviewChildrenIn: containerElement [
	| childrenElement |
	childrenElement := BlElement new
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ];
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 10).
	containerElement addChild: childrenElement.
	self children
		do: [ :child | child asOverviewElementIn: childrenElement ]
]

{ #category : #ui }
GtDPrice >> asOverviewElementIn: aParentElement [
	| containerElement contentElement labelElement className |
	containerElement := BlElement new
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ];
		background: Color white;
		aptitude: BrShadowAptitude;
		margin: (BlInsets all: 10);
		layout: BlLinearLayout vertical.
	aParentElement addChild: containerElement.
	className := ((self class name first isVowel
		ifTrue: [ 'an ' ]
		ifFalse: [ 'a ' ]) , self class name) asRopedText
		foreground: Color gray.
	containerElement
		addChild:
			(BrLabel new
				aptitude: (BrGlamorousLabelAptitude new fontSize: 8);
				text: className;
				padding: (BlInsets all: 5);
				constraintsDo: [ :c | 
					c vertical exact: 10.
					c horizontal fitContent ]).
	contentElement := BlElement new
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ];
		layout: BlLinearLayout horizontal.
	labelElement := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ];
		text: self money gtDisplayString;
		padding: (BlInsets all: 10).
	contentElement addChild: labelElement.
	containerElement addChild: contentElement.
	self children notEmpty
		ifTrue: [ | equalElement childrenElement |
			equalElement := BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: '=';
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent.
					c linear vertical alignCenter ].
			contentElement addChild: equalElement.
			childrenElement := BlElement new
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal fitContent ];
				padding: (BlInsets all: 10);
				layout: BlLinearLayout horizontal alignCenter.
			contentElement addChild: childrenElement.
			self asOverviewChildrenIn: childrenElement ].
	containerElement
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: ' ';
				padding: (BlInsets all: 5);
				constraintsDo: [ :c | 
					c vertical exact: 10.
					c horizontal fitContent ])
]

{ #category : #accessing }
GtDPrice >> children [
	^ {  }
]

{ #category : #operations }
GtDPrice >> discountedBy: aMoneyOrPercentage [
	^ aMoneyOrPercentage gtDiscountFrom: self
]

{ #category : #printing }
GtDPrice >> gtDisplayOn: stream [
	self moneyDisplayOn: stream
]

{ #category : #operations }
GtDPrice >> gtDividingPrice: aPrice [
	^ aPrice money / self money
]

{ #category : #ui }
GtDPrice >> gtOverviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Overview';
		priority: 10;
		stencil: [ 
			| parentElement |
			parentElement := BlElement new 
				constraintsDo: [ :c | c vertical fitContent. c horizontal fitContent ];
				layout: BlLinearLayout new.
			self asOverviewElementIn: parentElement.
			parentElement asPannableElement ]
]

{ #category : #ui }
GtDPrice >> gtViewChildrenStructureIn: aView [
	<gtView>
	^ aView columnedTree
		title: 'Children';
		priority: 20;
		items: {self};
		children: [ :aPrice | aPrice children ];
		column: 'Total'
			text: [ :aTreeNode | aTreeNode value gtDisplayString ];
		column: 'Price/Operation'
			text: [ :aTreeNode | 
			String
				streamContents:
					[ :stream | aTreeNode value localWithPossibleParanthesesDisplayOn: stream ] ]
]

{ #category : #printing }
GtDPrice >> localWithPossibleParanthesesDisplayOn: stream [
	self moneyDisplayOn: stream
]

{ #category : #accessing }
GtDPrice >> max: aUprice [

	self > aUprice
		ifTrue: [ ^self ]
		ifFalse: [ ^ aUprice ]
]

{ #category : #accessing }
GtDPrice >> money [
	^ self subclassResponsibility
]

{ #category : #printing }
GtDPrice >> moneyDisplayOn: stream [
	self money gtDisplayOn: stream
]

{ #category : #printing }
GtDPrice >> printOn: stream [
	super printOn: stream.
	stream space.
	self money gtDisplayOn: stream
]
