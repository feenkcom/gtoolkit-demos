Class {
	#name : #PetitParserSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'GToolkit-Demo-SPL-Slideshows'
}

{ #category : #accessing }
PetitParserSlideshow >> slidePriorities [
	"Override this method in the subclass.
	Instead of manually setting priorities, just list the slides in order here.
	NB: the names can be the same as the method selectors, but need not be."
	
	<gtExample>
	^ #( 
		title:
		)
]

{ #category : #slides }
PetitParserSlideshow >> title: aSlide [
	<gtSlide>
	<text: '# Building composable parsers with PetitParser

This slideshow is for the PetitParser lecture of the [compiler construction course](https://seg.inf.unibe.ch/teaching/current/cc/) at UniBE.

The slideshow can be explored live by downloading [GToolkit](https://gtoolkit.com) and inspecting:
```
SPLPetitParserSlideshow new
```
'>
	^ aSlide titleWithFooter
		setPriority;
		titleBottomPadding: 30;
		subtitleBottomPadding: 40;
		titleWithFormat: (self asTitle: 'PEGs, Packrats and Parser Combinators');
		"subtitleWithFormat: (self asTitle: 'with PetitParser');"
		footerWithFormat: (self asBigText: 'oscar.nierstrasz@feenk.com')
]
