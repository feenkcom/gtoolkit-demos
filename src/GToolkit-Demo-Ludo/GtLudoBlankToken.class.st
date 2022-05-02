Class {
	#name : #GtLudoBlankToken,
	#superclass : #GtLudoToken,
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #accessing }
GtLudoBlankToken >> blankName [
	^ ' '
]

{ #category : #accessing }
GtLudoBlankToken >> initialize [
	super initialize.
	self name: self blankName
]

{ #category : #accessing }
GtLudoBlankToken >> isBlank [
	^ true
]
