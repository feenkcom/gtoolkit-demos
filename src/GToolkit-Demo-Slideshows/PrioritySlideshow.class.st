"
A convenience class for creating slideshows.

Instead of explicitly setting the priority for a given page, just list the names of the pages in a `pages` method, and then lookup the priority in that list.

See, for example, {{gtMethod:name=SmalltalkIntroSlideshow>>#titleSlideFor:}}.

There are also numerous convenience methods, such as `asTitle:`.

"
Class {
	#name : #PrioritySlideshow,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Slideshows-GToolkit-Demo-Slideshows'
}

{ #category : #accessing }
PrioritySlideshow class >> show [
	GtPresenterSlideShow openInSpace: self
]

{ #category : #text }
PrioritySlideshow >> asBigText: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		fontSize: 40
]

{ #category : #text }
PrioritySlideshow >> asHeader: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		bold;
		fontSize: 40
]

{ #category : #text }
PrioritySlideshow >> asSubtitle: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		bold;
		fontSize: 60
]

{ #category : #text }
PrioritySlideshow >> asText: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		fontSize: 30
]

{ #category : #text }
PrioritySlideshow >> asTitle: aString [
	^ (aString asRopedText)
		glamorousRegularFont;
		bold;
		fontSize: 70
]

{ #category : #slides }
PrioritySlideshow >> gtBook [
	^ 'Glamorous Toolkit Book'
]

{ #category : #slides }
PrioritySlideshow >> myLepiterDB [
	"Default Lepiter DB to use"
	^ self gtBook
]

{ #category : #accessing }
PrioritySlideshow >> pages [
	"Override this method in the subclass.
	Instead of manually setting priorities, just list the slides in order here.
	NB: the names can be the same as the method selectors, but need not be."
	
	<gtExample>
	^ #( 
		"Add the names of the slides here ..."
		)
]

{ #category : #accessing }
PrioritySlideshow >> priorityFor: aSlideMethodSelector [
	^ self pages indexOf: aSlideMethodSelector
]
