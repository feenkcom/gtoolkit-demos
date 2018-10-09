Class {
	#name : #GtEditorElementWithLayoutDoneEvent,
	#superclass : #BrEditorElement,
	#category : #'GToolkit-Demo-WhatMakesBlocSpecial'
}

{ #category : #'hooks - layout' }
GtEditorElementWithLayoutDoneEvent >> onLayoutDone [
	super onLayoutDone.
	self fireEvent: GtLayoutDoneEvent new.
]
