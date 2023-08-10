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
'## Challenges

People hate change
People focus on the first things they see
It''s hard to break habits (coding from the editor)


'>

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
'## Conclusions 


Or "What works", or "Lessons"?

Discord is a great platform.
Make it easy for people to ask questions and get answers fast.
Build live documentation into the system. (Not just class comments.)
Make the system explorable. 
Short, dense videos are appreciated (but a lot of work).
Exploration is a skill that can be learned.

'>

	^ aSlide paragraph
		priority: (self priorityFor: #conclusions:);
		subtitleWithFormat: (self asTitle: 'Conclusions');
		paragraphWithFormat: (self
				asBigText: '


')
]

{ #category : #slides }
ESUG2023Slideshow >> esugWebsite [
	"^ PillarWebsite esug"
	^ PillarWebsiteExamples new esug2014
]

{ #category : #slides }
ESUG2023Slideshow >> exploringESUGWebsite: aSlide [
	<gtSlide>
	<text:
'## Exploring the ESUG website

Stuff to look at:

• Wrapping the website and files
• Creating simple views, searches and actions
• Island parser to extract pillar links
• Example class
• Using Lepiter to document the process.
'>
	^ aSlide element
		priority: (self priorityFor: #exploringESUGWebsite:);
		element: [ (GtPager createWrappedOn: (GtInspector forObject: self esugWebsite))
				maximized ]
]

{ #category : #initialization }
ESUG2023Slideshow >> initializeDb [
	db := nil.

]

{ #category : #slides }
ESUG2023Slideshow >> patterns: aSlide [
	<gtSlide>
	<text:
'## Moldable Development Patterns

Which of these to cover?

Start coding from a live object, not its class
Wrap data to create an explorable model
Prototype new behavior in an Inspector Playground
Replace navigation by view
Replace repeated tasks by custom actions



'>

	^ aSlide paragraph
		priority: (self priorityFor: #patterns:);
		subtitleWithFormat: (self asTitle: 'Moldable Development Patterns');
		paragraphWithFormat: (self
				asBigText: '


')
]

{ #category : #accessing }
ESUG2023Slideshow >> slidePriorities [
	"This method defines the slide priorities implicitly by their order instead of by fixed numbers.
	See also: PrioritySlideshow>>#priorityFor:"
	<gtExample>
	^ #( 
		titleSlide:
		
		whatIsMD:
			exploringESUGWebsite:


		patterns:

		challenges:
		
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


Moldable Development is a way to *support decision-making* by developing software in a way that makes it *explainable*. 

This is done by *molding the tools and environment* to your domain. 

In essence, you create *custom tools* for every problem you encounter. 

This makes the domain objects visible and explorable by means of custom views, actions, searches, advices, and other tools.




'>

	^ aSlide paragraph
		priority: (self priorityFor: #whatIsMD:);
		subtitleWithFormat: (self asTitle: 'What is Moldable Development?');
		paragraphWithFormat: (self
				asBigText: '


')
]
