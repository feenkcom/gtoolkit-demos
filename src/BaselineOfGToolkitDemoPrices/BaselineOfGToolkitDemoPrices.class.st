Class {
	#name : #BaselineOfGToolkitDemoPrices,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemoPrices
}

{ #category : #accessing }
BaselineOfGToolkitDemoPrices >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: #'GToolkit-Demo-Prices' ]
]
