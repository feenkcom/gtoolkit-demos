"
I am a special nil value for uninitialized variables.
I have no syntax in SPL,but am only used in interpretation.
"
Class {
	#name : #SPLNil,
	#superclass : #SPLValue,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #testing }
SPLNil >> isNil [
	^ true
]

{ #category : #testing }
SPLNil >> isSPLNil [
	^ true
]
