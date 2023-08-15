Class {
	#name : #ESUG2023Slideshow,
	#superclass : #PrioritySlideshow,
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

{ #category : #slides }
ESUG2023Slideshow >> challenges: aSlide [
	<gtSlide>
	<text:
'TODO # Challenges

People hate change
People focus on the first things they see

'>

	^ aSlide paragraph
		priority: (self priorityFor: #challenges:);
		subtitleWithFormat: (self asTitle: 'Challenges');
		paragraphWithFormat: (self
				asBigText: '


')
]

{ #category : #slides }
ESUG2023Slideshow >> codeFromALiveObject: aSlide [
	<gtSlide>
	<text:
'## Pattern: Start coding from a live object, not its class

This is perhaps the hardest pattern to learn.

Where would you rather be when you are developing code?

Staring at the source code, or viewing the live object that you are working on?

Here we see at the top a typical Coder view of a class where we can browse and edit the methods.

But this is actually the least interesting view we can have because each method is seen divorced from the context in which it is used and interacts with other methods.

From the very first day that we start to program, we learn to write some code in a text editor, and we compile it and run it.

It always takes a few steps to see the end result.

But why not reverse this?

Below here we see a live instance of the PillarWebsite object that we can interact with.

While it can be cumbersome to navigate from the code view to see its effect, it is usually easy to navigate from the live object to its code.

Suppose for, for example, that we don''t like the way the *Links* are displayed.

We can directly go to the code and change, for example, the width of the *Link* column.

*(Opt-click on the Links tab and change the `300` width to `200`.)*

From the live object view we can experiment with new features, extract methods and examples or tests, and immediately see the effect.'>

	^ aSlide lepiterPage
		priority: (self priorityFor: #codeFromALiveObject:);
		startPage:  (self db pageNamed: 'Pattern: Start coding from a live object, not its class')
]

{ #category : #page }
ESUG2023Slideshow >> codeFromALiveObjectPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Start coding from a live object, not its class')
		addSnippet: (LeTextSnippet new
				string: '## Would you rather be here?';
				yourself);
		addSnippet: (LeElementSnippet new
				code: 'GtCoder forClass: PillarWebsite';
				codeVisible: false;
				elementHeight: 318;
				codeHeight: 50;
				yourself);
		addSnippet: (LeTextSnippet new
				string: '## or here?';
				yourself);
		addSnippet: (LeElementSnippet new
				code: 'GtInspector newOn: PillarWebsite esug';
				codeVisible: false;
				elementHeight: 302;
				codeHeight: 50;
				yourself);
		yourself
]

{ #category : #slides }
ESUG2023Slideshow >> conclusions: aSlide [
	<gtSlide>
	<text:
'TODO # Conclusions 

?

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
	<gtExample>
	<noTest>
	^ PillarWebsite esug
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

{ #category : #slides }
ESUG2023Slideshow >> gtBookPatternsPage: aSlide [
	<gtSlide>
	<text:
'TODO ## GT Book: Moldable Development patterns

TODO ADD EXPLANATION

'>

	^ aSlide lepiterPage
		priority: (self priorityFor: #gtBookPatternsPage:);
		pageNamed: 'Moldable Development patterns' from: 'Glamorous Toolkit Book';
		yourself
]

{ #category : #initialization }
ESUG2023Slideshow >> initializeDb [
	self db addPage: self codeFromALiveObjectPage.
	self db addPage: self wrapDataPage.
	self db addPage: self prototypeInAPlaygroundPage.
	self db addPage: self replaceNavigationByViewPage.
	self db addPage: self replaceTasksByActionsPage.
]

{ #category : #slides }
ESUG2023Slideshow >> patterns: aSlide [
	<gtSlide>
	<text:
'# Moldable Development Patterns

Since Moldable Development is a *way* to develop explainable systems, rather than focusing on technology, it makes sense to start from the *patterns* that we observe when building such systems.

Let''s have a look a few of these patterns.'>

	^ aSlide paragraph
		priority: (self priorityFor: #patterns:);
		subtitleWithFormat: (self asTitle: 'Moldable Development Patterns');
		paragraphWithFormat: (self
				asBigText: '

express  best practices in the process of molding software to make it explainable.')
]

{ #category : #slides }
ESUG2023Slideshow >> peopleFocusOnWhatTheySeeFirst: aSlide [
	<gtSlide>
	<text:
'TODO ## People focus on what they see first


'>

	^ aSlide paragraph
		priority: (self priorityFor: #peopleFocusOnWhatTheySeeFirst:);
		subtitleWithFormat: (self asTitle: 'People focus on what they see first');
		paragraphWithFormat: (self
				asBigText: '


')
]

{ #category : #slides }
ESUG2023Slideshow >> peopleHateChange: aSlide [
	<gtSlide>
	<text:
'TODO ## People hate change

It''s hard to break habits (coding from the editor)



'>

	^ aSlide paragraph
		priority: (self priorityFor: #peopleHateChange:);
		subtitleWithFormat: (self asTitle: 'People hate change');
		paragraphWithFormat: (self
				asBigText: '


')
]

{ #category : #slides }
ESUG2023Slideshow >> prototypeInAPlayground: aSlide [
	<gtSlide>
	<text:
'TODO ## Pattern: Prototype new behavior in an Inspector Playground



'>

	^ aSlide lepiterPage
		priority: (self priorityFor: #prototypeInAPlayground:);
		startPage:  (self db pageNamed: 'Pattern: Prototype new behavior in an Inspector Playground')
]

{ #category : #page }
ESUG2023Slideshow >> prototypeInAPlaygroundPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Prototype new behavior in an Inspector Playground')
		addSnippet: (LeTextSnippet new
				string: '## Start by inspecting an instance.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'EsugWebsiteWrapper new repoDir: (FileLocator imageDirectory / ''esug.github.io'')';
				yourself);
		addSnippet: (LeTextSnippet new
				string: '## Code directly in the Playground:';
				yourself);
		addSnippet: (LeElementSnippet new
				code: '(GtInspectorScripterExamples new
	scriptedInspectorOn: (EsugWebsiteWrapper new repoDir: FileLocator imageDirectory / ''esug.github.io'')
	WithPlaygroundText: ''repoDir allChildrenMatching: ''''*.pillar'''''')
	elementWithoutParent';
				codeVisible: false;
				elementHeight: 437;
				codeHeight: 50;
				yourself);
		addSnippet: (LeTextSnippet new
				string: '## Extract useful code as methods, examples or tests.';
				yourself);
		yourself
]

{ #category : #slides }
ESUG2023Slideshow >> replaceNavigationByView: aSlide [
	<gtSlide>
	<noTest>
	<text:
'TODO ## Pattern: Replace navigation by view



'>

	^ aSlide lepiterPage
		priority: (self priorityFor: #replaceNavigationByView:);
		startPage:  (self db pageNamed: 'Pattern: Replace navigation by view')
]

{ #category : #page }
ESUG2023Slideshow >> replaceNavigationByViewPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Replace navigation by view')
		addSnippet: (LeTextSnippet new
				string: '## We are inspecting the ESUG website and navigate to the pages.';
				yourself);
		addSnippet: (LeElementSnippet new
				code: '(GtInspectorScripterExamples new
	scriptedInspectorOn: EsugWebsite esug
	WithPlaygroundText: ''self pages first'')
	elementWithoutParent';
				codeVisible: false;
				elementHeight: 530;
				codeHeight: 50;
				yourself);
		addSnippet: (LeTextSnippet new
				string: '## We like this and want to make it a custom view.';
				addSnippet: (LeElementSnippet new
						code: '''gtPagesFor: aView
	<gtView>
	^ aView forward
		title: ''''Pages'''';
		priority: 10;
		object: [ self pages ];
		view: #gtItemsFor:'' gtStringFor: GtPhlowView new';
						codeVisible: false;
						elementHeight: 166;
						codeHeight: 50;
						yourself);
				yourself);
		yourself
]

{ #category : #slides }
ESUG2023Slideshow >> replaceTasksByActions: aSlide [
	"LEAVE THIS OUT FOR NOW
	
	<gtSlide>"
	<text:
'TODO ## Pattern: Replace repeated tasks by custom actions



'>

	^ aSlide lepiterPage
		priority: (self priorityFor: #replaceTasksByActions:);
		startPage:  (self db pageNamed: 'Pattern: Replace repeated tasks by custom actions')
]

{ #category : #page }
ESUG2023Slideshow >> replaceTasksByActionsPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Replace repeated tasks by custom actions')
		addSnippet: (LeTextSnippet new
				string: '';
				yourself);
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
			codeFromALiveObject:
			wrapData:
			prototypeInAPlayground:
			replaceNavigationByView:
			"replaceTasksByActions:"
			gtBookPatternsPage:

		whatWorks:
		
		challenges:
			peopleHateChange:
			peopleFocusOnWhatTheySeeFirst:
		
		
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
'# What is Moldable Development?

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

{ #category : #slides }
ESUG2023Slideshow >> whatWorks: aSlide [
	<gtSlide>
	<text:
'TODO # What works 


Or "Lessons"?


Discord is a great platform.
Make it easy for people to ask questions and get answers fast.
Build live documentation into the system. (Not just class comments.)
Make the system explorable. 
Short, dense videos are appreciated (but a lot of work).
Exploration is a skill that can be learned.

Save one or two of these for the conclusion slide?


'>

	^ aSlide paragraph
		priority: (self priorityFor: #whatWorks:);
		subtitleWithFormat: (self asTitle: 'What works');
		paragraphWithFormat: (self
				asBigText: '


')
]

{ #category : #slides }
ESUG2023Slideshow >> wrapData: aSlide [
	<gtSlide>
	<text:
'## Pattern: Wrap data to create an explorable model

Although sometimes you may have the luxury to work on a greenfield project, most projects start from some existing data and code.

When we load the data into our environment, we will obtain the default views for that data.

Here, for example, we have loaded the cloned ESUG website repo and are inspecting the contents.

We obtain a completely generic view of the folders and files that tells us nothing about the domain.

*(Evaluate the first snippet showing the FileLocator views.)*

We would like to turn this into a proper domain object that tells us interesting things about itself.

As a first step, then, we can *wrap* the data into a dedicated object.

When we do this, at first glance the result appears to be even worse, as now we just get a generic *Raw* view of the new object.

*(Inspect the first EsugWebsiteWrapper.)* 

But now we have the possibility to explore it, add behavior, and add new views.

After some iterations we obtain the view we have seen earlier.

*(Inspect the last snippet.)*'>

	^ aSlide lepiterPage
		priority: (self priorityFor: #wrapData:);
		startPage:  (self db pageNamed: 'Pattern: Wrap data to create an explorable model')
]

{ #category : #page }
ESUG2023Slideshow >> wrapDataPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Wrap data to create an explorable model')
		addSnippet: (LeTextSnippet new
				string: '## Start by grabbing your data.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'repoDir := FileLocator imageDirectory / ''esug.github.io''.

"Clone the repo if we haven''t already done so."
repoDir exists
	ifFalse: [ repo := ''git@github.com:ESUG/esug.github.io.git''.
		repository := IceRepositoryCreator fromUrl: repo to: repoDir ].
repoDir';
				yourself);
		addSnippet: (LeTextSnippet new
				string: '## Wrap it in a new class.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'EsugWebsiteWrapper new repoDir: repoDir';
				yourself);
		addSnippet: (LeTextSnippet new
				string: '## Add views to answer questions about the data.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'EsugWebsiteWrapper esug';
				yourself);
		yourself
]
