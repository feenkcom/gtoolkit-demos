Extension { #name : #GtSlider }

{ #category : #'*GToolkit-Demo-Pharo101' }
GtSlider >> addNewSlide: aSlide [
	(slides ifNil: [ slides := OrderedCollection new ] ) add: aSlide.
]
