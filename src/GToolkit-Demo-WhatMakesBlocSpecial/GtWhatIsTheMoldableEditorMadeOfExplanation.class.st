"
1. What is the moldable editor made of
This very document is rendered using the moldable editor.

There are three layers that make the editor: 
- In Sparta: A low level text model, font handling, text measurements, the generic rope data structure. This has little to do with the editor per se, but should be considered an object-oriented replacement to what would otherwise be an FFI call.
- In Bloc: Basic text element, rope text, paragraph model, text attributes, infinite list.
- In Brick: The interactive editor part.

Let's take them one by one.
1. # Sparta text support

The Sparta text support is concerned with drawing actual text on a canvas.

A specific concern is placed on pixel perfect text measurements that can be controlled from the image.

{{gtExample:SkiaCanvasTextExamples class>>#exampleTextMeasure|noCode=|previewHeight=400}}
1. # Bloc text model

Bloc introduces {{gtClass:BlTextElement}}, the basic piece in a text editor.
1. # Brick editor

[[TODO]] 


"
Class {
	#name : #GtWhatIsTheMoldableEditorMadeOfExplanation,
	#superclass : #Object,
	#category : #'GToolkit-Demo-WhatMakesBlocSpecial'
}
