Class {
	#name : #ESUG2023Slideshow,
	#superclass : #PrioritySlideshow,
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

{ #category : #slides }
ESUG2023Slideshow >> bestPracticePatterns: aSlide [
	<gtSlide>
	<text:
''>

	^ aSlide paragraph
		priority: (self priorityFor: #bestPracticePatterns:);
		subtitleWithFormat: (self asTitle: 'Moldable Development Patterns');
		paragraphWithFormat: (self
				asBigText: '


')
]

{ #category : #slides }
ESUG2023Slideshow >> challenges: aSlide [
	<gtSlide>
	<text:
''>

	^ aSlide paragraph
		priority: (self priorityFor: #challenges:);
		subtitleWithFormat: (self asTitle: 'Challenges');
		paragraphWithFormat: (self
				asBigText: '


')
]

{ #category : #slides }
ESUG2023Slideshow >> communityBuilding: aSlide [
	<gtSlide>
	<text:
''>

	^ aSlide paragraph
		priority: (self priorityFor: #communityBuilding:);
		subtitleWithFormat: (self asTitle: 'Community building');
		paragraphWithFormat: (self
				asBigText: '


')
]

{ #category : #slides }
ESUG2023Slideshow >> conclusions: aSlide [
	<gtSlide>
	<text:
''>

	^ aSlide paragraph
		priority: (self priorityFor: #conclusions:);
		subtitleWithFormat: (self asTitle: 'Conclusions');
		paragraphWithFormat: (self
				asBigText: '


')
]

{ #category : #initialization }
ESUG2023Slideshow >> initializeDb [
	db := nil.

]

{ #category : #accessing }
ESUG2023Slideshow >> slidePriorities [
	"This method defines the slide priorities implicitly by their order instead of by fixed numbers.
	See also: PrioritySlideshow>>#priorityFor:"
	<gtExample>
	^ #( 
		titleSlide:
		
		whatIsMD:
		
		challenges:
		
		communityBuilding:
		
		bestPracticePatterns:
		
		conclusions:
			
		)
]

{ #category : #slides }
ESUG2023Slideshow >> titleSlide: aSlide [
	<gtSlide>
	<text: 
'# Teaching Moldable Development

Hi. My name is Oscar Nierstrasz.

Today I''d like to report on the challenges and and insights we have experienced in teaching moldable development to newcomers.'>

	^ aSlide titleWithFooter
		priority: (self priorityFor: #titleSlide:);
		titleBottomPadding: 20;
		subtitleBottomPadding: 40;
		titleWithFormat: (self asTitle: 'Teaching Moldable Development');
		footerWithFormat: (self asBigText: 'oscar.nierstrasz@feenk.com')
]

{ #category : #slides }
ESUG2023Slideshow >> whatIsMD: aSlide [
	<gtSlide>
	<text:
'## What is Moldable Development?



What is it?


How do you do it?






'>

	^ aSlide paragraph
		priority: (self priorityFor: #whatIsMD:);
		subtitleWithFormat: (self asTitle: 'What is Moldable Development?');
		paragraphWithFormat: (self
				asBigText: '


')
]
