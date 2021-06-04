"
I model a simple note about a contact


"
Class {
	#name : #GtABContactNote,
	#superclass : #GtABContactField,
	#instVars : [
		'title',
		'content'
	],
	#category : #'GToolkit-Demo-AddressBook-Models'
}

{ #category : #comparing }
GtABContactNote >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ title = anObject title and: [ content = anObject content ]
]

{ #category : #accessing }
GtABContactNote >> content [
	^ content.
]

{ #category : #accessing }
GtABContactNote >> content: someContent [
	content := someContent.
]

{ #category : #'gt-extensions' }
GtABContactNote >> gtViewNoteContentOn: aView [
	<gtView>
	
	^ aView textEditor
		title: 'Content' translated;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: self content.
]

{ #category : #comparing }
GtABContactNote >> hash [
	^ self class hash 
		bitXor: (title hash 
		bitXor: content hash)
]

{ #category : #accessing }
GtABContactNote >> title [
	^ title.
]

{ #category : #accessing }
GtABContactNote >> title: aTitle [
	title := aTitle.
]
