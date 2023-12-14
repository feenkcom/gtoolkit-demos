"
Various demonstrations of reflective capabilities of Squeak.
Examples from Marcus Denker and Stéphane Ducasse
"
Class {
	#name : #ReflectionTest,
	#superclass : #TestCase,
	#category : #'GToolkit-Demo-Reflection'
}

{ #category : #running }
ReflectionTest >> testBecome [
	| pt1 pt2 pt3 |
	pt1 := 0@0.
	pt2 := pt1.
	pt3 := 100@100.
	pt1 become: pt3.
	self assert: pt1 equals: (100@100).
	self assert: pt1 == pt2.
	self assert: pt3 equals: (0@0).
]

{ #category : #running }
ReflectionTest >> testBecomeForward [
	| pt1 pt2 pt3 |
	pt1 := 0@0.
	pt2 := pt1.
	pt3 := 100@100.
	pt1 becomeForward: pt3.
	self assert: pt1 equals: (100@100).
	self assert: pt1 == pt2.
	self assert: pt2 == pt3.

]

{ #category : #running }
ReflectionTest >> testPrimitiveChangeClassTo [

	| anon anObject |
	anon := Object newAnonymousSubclass.

	anObject := Object new.
	anObject primitiveChangeClassTo: anon new.
	anon compile: 'thisIsATest ^ 2'.
	self assert: anObject thisIsATest equals: 2.
	self should: [ Object new thisIsATest ] raise: MessageNotUnderstood
]
