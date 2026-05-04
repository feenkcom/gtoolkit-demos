Class {
	#name : #GtMethodFinderSend,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'selector',
		'arguments'
	],
	#category : #'GToolkit-Demo-Reflection-MethodFinder'
}

{ #category : #'instance creation' }
GtMethodFinderSend class >> receiver: r selector: s1 withArguments: args [

	^ self new
		receiver: r;
		selector: s1;
		arguments: args;
		yourself
]

{ #category : #accessing }
GtMethodFinderSend >> arguments [

	^arguments
]

{ #category : #accessing }
GtMethodFinderSend >> arguments: anObject [

	arguments := anObject
]

{ #category : #'public access' }
GtMethodFinderSend >> evaluate [

	^ receiver perform: selector withArguments: arguments
]

{ #category : #printing }
GtMethodFinderSend >> printOn: aStream [

	aStream print: receiver.
	aStream space.
	arguments ifEmpty: [^ aStream nextPutAll: selector].
	arguments
		with: selector keywords
		do: [:arg :word |
				aStream nextPutAll: word asString.
				aStream space.
				aStream print: arg.
				aStream space ].
	aStream skip: -1
]

{ #category : #accessing }
GtMethodFinderSend >> receiver [

	^ receiver
]

{ #category : #accessing }
GtMethodFinderSend >> receiver: anObject [
	receiver := anObject
]

{ #category : #'public access' }
GtMethodFinderSend >> resultIn: expectedResult [

	[ [ ^ expectedResult = self evaluate ]
		onErrorDo: [ :anError | ^ false ] ]
			on: Deprecation
			do: [ :depr | ^ false ]
]

{ #category : #accessing }
GtMethodFinderSend >> selector [

	^ selector
]

{ #category : #accessing }
GtMethodFinderSend >> selector: anObject [

	selector := anObject
]
