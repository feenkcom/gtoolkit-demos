"
Illustrates the use of an anonymous class to change the behavior of a single instance.
"
Class {
	#name : #AnonymousClassExample,
	#superclass : #TestCase,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #accessing }
AnonymousClassExample >> anonymousCollectionInstance [
	"We create an anonymous subclass of OrderedCollection with an add: method that adds the printString of an object rather than the object itself. We change the class of a collection back and forth, verifying that the number added is a string while the class is changed."

	<gtExample>
	<return: #OrderedCollection>
	| anonCollectionClass collection |
	anonCollectionClass := OrderedCollection newAnonymousSubclass.
	anonCollectionClass
		compile: 'add: anObject
			^ super add: anObject printString'.
	collection := OrderedCollection new.
	collection add: 1.
	self assert: collection last equals: 1.
	collection primitiveChangeClassTo: anonCollectionClass basicNew.
	collection add: 2.	"The second value is converted to a String."
	self assert: collection last equals: '2'.
	collection primitiveChangeClassTo: OrderedCollection new.

	collection add: 3.
	self assert: collection last equals: 3.
	^ collection
]

{ #category : #accessing }
AnonymousClassExample >> anonymousSetInstance [
	"We create an anonymous subclass of Set with a logging #add: method. We dynamically change the class of an instance of Set to be of the new anonymous class and back again."

	<gtExample>
	| anonClass set |
	anonClass := Set newAnonymousSubclass.

	anonClass
		compile: 'add: anObject
			Transcript show: ''adding '', anObject printString; cr.
			^ super add: anObject'.

	set := Set new.
	set add: 1.
	self assert: set size equals: 1.

	set primitiveChangeClassTo: anonClass basicNew.
	set add: 2.
	self assert: set size equals: 2.

	^ set
]
