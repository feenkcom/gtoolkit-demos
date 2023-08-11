Class {
	#name : #ESUG2023Slideshow,
	#superclass : #PrioritySlideshow,
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

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

Let''s take an easy domain that we are all familiar with, namely the ESUG website.

Here we are inspecting the cloned repo of the ESUG website.

We can browse the pages of the website, see the contents of a page, the list of links, and the pages that are reachable from this page, as well as a map of the reachable pages.

*(Click on a few pages, then go to Conference 2014. Look at Contents, etc. Show the map, hover over a reachable page, and open it.)*

We can also open the page in a web browser.

From the website we also see all the links, possibly missing internal links, and the reachable pages, as well as an overall map.

In red we see the pages that seemingly are unreachable from the root.

We can also check the status of links.

*(Go the missing status and click on the check status button. NB: click on Inspect object to get a new view with Broken HTTP links.)*

Here we can see which links may be broken.

Let''s stop the background check.

Finally, we can search for pages or links by title or content.

*(Enter a query for "hotel".)*

## Recap

So what have we seen?

We have domain objects representing a website, the web pages and the links.

We have custom views for each domain object allowing us to explore the information that interests us, and to navigate to other objects.

We also have custom actions to open a web browser or to start an analysis, and we have a custom search to query lists of pages and links.

Each of these custom tools is implemented in just a few lines of code in a method of the domain object concerned annotated with a dedicated pragma.

For example, here is a view, an action, and a search.

*(Show each of these.)*

Now we get the key question:

How hard is it to teach people to build their own explainable system for their domain of interest?'>

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

{ #category : #slides }
ESUG2023Slideshow >> patternsPage: aSlide [
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
	^ aSlide lepiterPage
		priority: (self priorityFor: #lepiterPage:);
		pageNamed: 'Moldable Development patterns' from: 'Glamorous Toolkit Book';
		yourself
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
			patternsPage:

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

Moldable development is a way of developing software in which you mold the development environment itself with custom tools to support your application domain.

In this way the system becomes *explainable*, and thus supports decision making for a range of stakeholders.

Let''s look at a simple example.'>

	^ aSlide paragraph
		priority: (self priorityFor: #whatIsMD:);
		subtitleWithFormat: (self asTitle: 'What is Moldable Development?');
		paragraphWithFormat: (self
				asBigText: '

Moldable development supports decision making by making domain concepts visible, explorable and explainable.')
]
