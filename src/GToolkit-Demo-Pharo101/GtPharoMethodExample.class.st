Class {
	#name : #GtPharoMethodExample,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Pharo101'
}

{ #category : #accessing }
GtPharoMethodExample >> exampleWithNumber: x [
    "A method that illustrates every part of Smalltalk method syntax
    except primitives. It has unary, binary, and keyword messages,
    declares arguments and temporaries, accesses a global variable
    (but not an instance variable), uses literals (array, character,
    symbol, string, integer, float), uses the pseudo variables
    true, false, nil, self, and super, and has sequence, assignment,
    return and cascade. It has both zero argument and one argument blocks."
    <syntaxOn: #postcard>
	<gtIgnoreConstraint: #GtSendersOfHaltSelectorsInGtPackagesConstraint>
    | y |
    true & false not & (nil isNil) 
		ifTrue: [100] ifFalse: [self halt].
    y := self size + super size.
    #($a #a "a" 1 1.0)
        do: [ :each |
            Transcript show: (each class name);
                       show: ' '].
    ^x < y
]
