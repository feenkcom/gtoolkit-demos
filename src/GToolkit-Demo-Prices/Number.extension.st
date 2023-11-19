Extension { #name : #Number }

{ #category : #'*GToolkit-Demo-Prices' }
Number >> gtEUR [
	^ GtDCurrencyMoney new amount: self; currency: GtDCurrency gtEUR
]

{ #category : #'*GToolkit-Demo-Prices' }
Number >> gtUSD [
	^ GtDCurrencyMoney new amount: self; currency: GtDCurrency gtUSD
]
