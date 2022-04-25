Class {
	#name : #GtLudoGameTest,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #accessing }
GtLudoGameTest >> emptyGame [
	<gtExample>
	| game |
	game := GtLudoGame new.
	^ game
]
