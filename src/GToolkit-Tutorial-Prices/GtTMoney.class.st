Class {
	#name : #GtTMoney,
	#superclass : #Object,
	#category : #'GToolkit-Tutorial-Prices-Model'
}

{ #category : #operations }
GtTMoney >> * aNumber [
	^ self multiplyBy: aNumber
]

{ #category : #operations }
GtTMoney >> + aMoney [
	^ self add: aMoney
]

{ #category : #operations }
GtTMoney >> - aMoney [
	^ self decreaseBy: aMoney
]

{ #category : #operations }
GtTMoney >> / aDivisor [
	^ aDivisor gtDividingMoney: self
]

{ #category : #testing }
GtTMoney >> = aMoney [
	self subclassResponsibility
]

{ #category : #operations }
GtTMoney >> add: aMoney [
	^ self subclassResponsibility
]

{ #category : #operations }
GtTMoney >> addCurrencyMoney: aCurrencyMoney [
	^ self subclassResponsibility
]

{ #category : #operations }
GtTMoney >> addMoneyBag: aMoneyBag [
	^ self subclassResponsibility
]

{ #category : #operations }
GtTMoney >> decreaseBy: aMoney [
	^ self add: aMoney negative
]

{ #category : #operations }
GtTMoney >> divideBy: aNumber [
	^ self subclassResponsibility
]

{ #category : #ui }
GtTMoney >> gtDetailsFor: aView [
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
GtTMoney >> gtDiscountFrom: aPrice [
	^ GtDPriceDiscountedByMoney new price: aPrice; discountMoney: self
]

{ #category : #operations }
GtTMoney >> gtDividingMoney: aMoney [
	<return: #Number>
	"this means that we divide aMoney by self"
	self subclassResponsibility
]

{ #category : #testing }
GtTMoney >> isZero [
	self subclassResponsibility
]

{ #category : #operations }
GtTMoney >> multiplyBy: aNumber [
	^ self subclassResponsibility
]

{ #category : #operations }
GtTMoney >> negative [
	^ self subclassResponsibility
]
