"
I model a simple note about a contact
"
Class {
	#name : #GtABContactNote,
	#superclass : #GtABDomainObject,
	#instVars : [
		'title',
		'content'
	],
	#category : #'GToolkit-Demo-AddressBook-Models'
}

{ #category : #accessing }
GtABContactNote >> content [
	^ content.
]

{ #category : #accessing }
GtABContactNote >> content: someContent [
	content := someContent.
]

{ #category : #'as yet unclassified' }
GtABContactNote >> gtViewNoteContentOn: aView [
	<gtView>
	
	^ aView textEditor
		title: 'Content' translated;
		look: BrGlamorousCodeEditorLook new;
		text: self content.
]

{ #category : #accessing }
GtABContactNote >> title [
	^ title.
]

{ #category : #accessing }
GtABContactNote >> title: aTitle [
	title := aTitle.
]
