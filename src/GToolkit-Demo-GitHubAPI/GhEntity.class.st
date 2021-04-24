Class {
	#name : #GhEntity,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhEntity >> gtRawDataFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Raw data';
		items: [ self rawData isDictionary 
			ifTrue: [ self rawData associations ]
			ifFalse: [ self rawData ] ];
		column: 'Property' text: #key;
		column: 'Value' text: #value;
		send: [ :each | 
			(each key endsWith: '_url')
				ifTrue: [ 
					ZnClient new 
						get: each value
						onSuccess: [ :result | 
							[ | dictionary |
							dictionary := STON fromString: result.
							self propertyToClass 
								at: (each key removeSuffix: '_url') 
								ifPresent: [ :aClass | aClass new rawData: dictionary ]
								ifAbsent: [ dictionary ] ] 
								on: Error 
								do: [:e | each value ] ]
						onError: [ each value ] ]
				ifFalse: [ each value ] ]
]

{ #category : #accessing }
GhEntity >> propertyToClass [
	^ Dictionary new
]

{ #category : #accessing }
GhEntity >> rawData [
	^ rawData
]

{ #category : #accessing }
GhEntity >> rawData: dictionary [ 
	rawData := dictionary
]
