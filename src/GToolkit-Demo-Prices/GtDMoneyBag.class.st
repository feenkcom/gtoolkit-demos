Class {
	#name : #GtDMoneyBag,
	#superclass : #GtDMoney,
	#instVars : [
		'monies'
	],
	#category : #'GToolkit-Demo-Prices-Model'
}

{ #category : #testing }
GtDMoneyBag >> = aMoneyBag [
	^ aMoneyBag class = self class and: [ 
		self monies size = aMoneyBag monies size and: [
			self monies allSatisfy: [ :myMoney | 
				aMoneyBag monies anySatisfy: [ :otherMoney | myMoney = otherMoney ]]]]
]

{ #category : #operations }
GtDMoneyBag >> add: aMoney [
	"We know that I am a ${class:UMoneyBag}$, so I dispatch through that method"
	^ aMoney addMoneyBag: self
]

{ #category : #operations }
GtDMoneyBag >> addCurrencyMoney: aMoney [
	| newMonies |
	self monies 
		detect: [ :each | each currency = aMoney currency ]
		ifFound: [ :sameCurrencyMoney | 
			sameCurrencyMoney amount: sameCurrencyMoney amount + aMoney amount ]
		ifNone: [ self monies add: aMoney copy ].
	newMonies := self monies reject: [ :each | each isZero ].
	^ newMonies size = 1 
		ifTrue: [ newMonies anyOne ]
		ifFalse: [ self monies: newMonies ]
]

{ #category : #adding }
GtDMoneyBag >> addMoneyBag: aMoneyBag [
	self monies do: [ :money |
		aMoneyBag addCurrencyMoney: money ].
	^ aMoneyBag
		
	
]

{ #category : #operations }
GtDMoneyBag >> divideBy: aNumber [
	^ self class new 
		monies: (self monies collect: [:money | money divideBy: aNumber ])
]

{ #category : #printing }
GtDMoneyBag >> gtDisplayOn: stream [
	self monies 
		do: [ :money | money gtDisplayOn: stream ]
		separatedBy: [ stream nextPutAll: ' + ' ] 
]

{ #category : #'as yet unclassified' }
GtDMoneyBag >> gtMoniesListFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Contained Monies';
		priority: 10;
		items: [ self monies ];
		column: 'Amount' text: [ :each | each amount ];
		column: 'Currency' text: [ :each | each currency ]
]

{ #category : #initialization }
GtDMoneyBag >> initialize [
	super initialize.
	monies := OrderedCollection new
]

{ #category : #testing }
GtDMoneyBag >> isZero [
	^ self monies allSatisfy: [ :money | money isZero ]
]

{ #category : #accessing }
GtDMoneyBag >> monies [
	^ monies
]

{ #category : #accessing }
GtDMoneyBag >> monies: anObject [
	monies := anObject
]

{ #category : #operations }
GtDMoneyBag >> multiplyBy: aNumber [
	^ self class new 
		monies: (self monies collect: [:money | money multiplyBy: aNumber ])
]

{ #category : #operations }
GtDMoneyBag >> negative [
	^ self class new 
		monies: (self monies collect: [:money | money negative])
]
