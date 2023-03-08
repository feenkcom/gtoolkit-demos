"
I am an abstract superclass for statements with a condition to evaluate. (If, If-else and while.)

"
Class {
	#name : #SPLConditionStatement,
	#superclass : #SPLAbstractExpressionStatement,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLConditionStatement >> condition [
	^ self expression
]
