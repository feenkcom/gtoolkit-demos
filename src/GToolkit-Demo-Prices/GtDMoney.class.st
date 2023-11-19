Class {
	#name : #GtDMoney,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Prices'
}

{ #category : #operations }
GtDMoney >> * aNumber [
	^ self multiplyBy: aNumber
]

{ #category : #operations }
GtDMoney >> + aMoney [
	^ self add: aMoney
]

{ #category : #operations }
GtDMoney >> - aMoney [
	^ self decreaseBy: aMoney
]

{ #category : #operations }
GtDMoney >> / aDivisor [
	^ aDivisor dividingMoney: self
]

{ #category : #testing }
GtDMoney >> = aMoney [
	self subclassResponsibility
]

{ #category : #operations }
GtDMoney >> add: aMoney [
	^ self subclassResponsibility
]

{ #category : #operations }
GtDMoney >> addCurrencyMoney: aCurrencyMoney [
	^ self subclassResponsibility
]

{ #category : #operations }
GtDMoney >> addMoneyBag: aMoneyBag [
	^ self subclassResponsibility
]

{ #category : #converting }
GtDMoney >> asPrice [
	^ GtDConcretePrice new money: self
]

{ #category : #operations }
GtDMoney >> decreaseBy: aMoney [
	^ self add: aMoney negative
]

{ #category : #operations }
GtDMoney >> divideBy: aNumber [
	^ self subclassResponsibility
]

{ #category : #operations }
GtDMoney >> dividingMoney: aMoney [
	<return: #Number>
	"this means that we divide aMoney by self"
	self subclassResponsibility
]

{ #category : #ui }
GtDMoney >> gtDetailsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Details';
		stencil: [ BrLabel new
				aptitude: BrGlamorousLabelAptitude new;
				text: self gtDisplayString asRopedText;
				padding: (BlInsets all: 10);
				asScalableElement ]
]

{ #category : #operations }
GtDMoney >> gtDiscountFrom: aPrice [
	^ GtDPriceDiscountedByMoney new price: aPrice; discountMoney: self
]

{ #category : #testing }
GtDMoney >> isZero [
	self subclassResponsibility
]

{ #category : #operations }
GtDMoney >> multiplyBy: aNumber [
	^ self subclassResponsibility
]

{ #category : #operations }
GtDMoney >> negative [
	^ self subclassResponsibility
]
