Class {
	#name : #GtTMoneyBag,
	#superclass : #GtTMoney,
	#instVars : [
		'monies'
	],
	#category : #'GToolkit-Tutorial-Prices-Model'
}

{ #category : #testing }
GtTMoneyBag >> = aMoneyBag [
	^ aMoneyBag class = self class and: [ 
		self monies size = aMoneyBag monies size and: [
			self monies allSatisfy: [ :myMoney | 
				aMoneyBag monies anySatisfy: [ :otherMoney | myMoney = otherMoney ]]]]
]

{ #category : #operations }
GtTMoneyBag >> add: aMoney [
	"We know that I am a ${class:UMoneyBag}$, so I dispatch through that method"
	^ aMoney addMoneyBag: self
]

{ #category : #operations }
GtTMoneyBag >> addCurrencyMoney: aMoney [
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
GtTMoneyBag >> addMoneyBag: aMoneyBag [
	self monies do: [ :money |
		aMoneyBag addCurrencyMoney: money ].
	^ aMoneyBag
		
	
]

{ #category : #operations }
GtTMoneyBag >> divideBy: aNumber [
	^ self class new 
		monies: (self monies collect: [:money | money divideBy: aNumber ])
]

{ #category : #printing }
GtTMoneyBag >> gtDisplayOn: stream [
	self monies 
		do: [ :money | money gtDisplayOn: stream ]
		separatedBy: [ stream nextPutAll: ' + ' ] 
]

{ #category : #initialization }
GtTMoneyBag >> initialize [
	super initialize.
	monies := OrderedCollection new
]

{ #category : #testing }
GtTMoneyBag >> isZero [
	^ self monies allSatisfy: [ :money | money isZero ]
]

{ #category : #accessing }
GtTMoneyBag >> monies [
	^ monies
]

{ #category : #accessing }
GtTMoneyBag >> monies: anObject [
	monies := anObject
]

{ #category : #operations }
GtTMoneyBag >> multiplyBy: aNumber [
	^ self class new 
		monies: (self monies collect: [:money | money multiplyBy: aNumber ])
]

{ #category : #operations }
GtTMoneyBag >> negative [
	^ self class new 
		monies: (self monies collect: [:money | money negative])
]
