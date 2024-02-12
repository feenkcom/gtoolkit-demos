Extension { #name : #Number }

{ #category : #'*GToolkit-Tutorial-Prices' }
Number >> euros [
	^ GtTCurrencyMoney new amount: self; currency: GtTCurrency euros
]

{ #category : #'*GToolkit-Tutorial-Prices' }
Number >> usd [
	^ GtTCurrencyMoney new amount: self; currency: GtTCurrency usd
]
