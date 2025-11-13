"
Slideshow for ESUG 2023 talk on “Teaching Moldable Development”.
"
Class {
	#name : #TeachingMoldableDevelopmentSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

{ #category : #accessing }
TeachingMoldableDevelopmentSlideshow >> addItalicItem: label inScenery: scenery [
	"Utility for rewriting Sceneries."

	^ scenery
		addItem: (GtSceneryItem new
				stencil: (GtSceneryTextStencil new
						text: (label asRopedText
								fontSize: 20;
								bold;
								italic)))
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> challenges: aSlide [
	<gtSlide>
	<text: '# Challenges

Let me round up with a couple of the biggest challenges we have encountered in trying to explain moldable development.'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asTitle: 'Challenges');
		paragraphWithFormat: (self
				asBigText: '


')
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> contextualPlayground: aSlide [
	<gtSlide>
	<noTest>
	<text: '## Pattern: Contextual playground

When you program in a conventional IDE, the code is strictly disconnected from any live instance.

Experimenting and exploring the state of the running program is only possible by setting breakpoints and running the code in the debugger,  or by writing additional dedicated test code.

Another way is to start coding from an Inspector on a live, moldable object.

This should remind you of the Smalltalk practice of coding in the debugger, but the difference is that you can code in an inspector without having to get a debugger instance..

Here we see a live instance of our simple EsugWebsiteWrapper with a Playground opened at the bottom.

Why is this interesting?

Because the playground is bound to the context of the object, unlike code that we write in a normal code editor.

For instance, the variable `repoDir` is bound to that slot of the live instance.

We can experiment with code in the playground, and when we see something we like, we can copy the code to a method, or even directly apply an extract method refactoring.

*(Extract the sample code as a `pillarFiles` method.)*'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Contextual playground')
]

{ #category : #page }
TeachingMoldableDevelopmentSlideshow >> contextualPlaygroundPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Contextual playground')
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
TeachingMoldableDevelopmentSlideshow >> customAction: aSlide [
	"LEAVE THIS OUT FOR NOW
	
	<gtSlide>"

	<text: 'TODO ## Pattern: Custom action



'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Custom action')
]

{ #category : #page }
TeachingMoldableDevelopmentSlideshow >> customActionPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Custom action')
	addSnippet: (LeTextSnippet new
			string: '# PLACEHOLDER';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'to do for a later version ...';
			yourself);
	yourself
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> discord: aSlide [
	<gtSlide>
	<text: '## Discord

Discord can be a great platform for community building, however it must be well-curated.

It''s critical not only to make people feel welcome and encouraged to ask any kind of questions, but their questions need to be taken seriously, and answered reasonably quickly.

One interesting pattern in community building is to teach people when they share screenshots to capture an entire window showing the flows between snippets of code and views of interest.

A well-designed screenshot goes a long way to telling a story or explaining an issue.'>
	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asSubtitle: 'Building a community with Discord');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility resourceAtPath: self picturesDirectoryPath / 'discord.png') ]
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> esugWebsite [
	<gtExample>
	<noTest>
	^ EsugWebsite instance 
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> exploringESUGWebsite: aSlide [
	<gtSlide>
	<noTest>
	<text: '## Exploring the ESUG website

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
	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asSubtitle: 'Exploring the ESUG website');
		element: [ (GtPagerSettings usedPager
				createWrappedOn: (GtInspector forObject: self esugWebsite)) maximized ]
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> gtBookPatternsPage: aSlide [
	<gtSlide>
	<text: '## GT Book: Moldable Development patterns

These are some of the most basic moldable development patterns, which are described in further detail in the GT Book.'>
	^ aSlide element
		setPriority;
		element: [ (GtPagerSettings usedPager
				createWrappedOn: (LePagePhlowTool page: (self gtBook pageNamed: 'Moldable Development patterns')))
				maximized ]
]

{ #category : #accessing }
TeachingMoldableDevelopmentSlideshow >> liveDocumentation: aSlide [
	<gtSlide>
	<text: '## Live documentation

GT comes with a live knowledge base of notebook pages documenting the system itself as well as numerous case studies.

Here is a page describing how to interact with the GitHub REST API as a case study in Moldable Development.

The GT book not only offers users documentation to read and live tutorials to try out, but also serves as examples for users to start their own projects from their personal database of notes.'>
	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asSubtitle: 'Live documentation');
		element: [ (GtPagerSettings usedPager
				createWrappedOn: (LePagePhlowTool
						page: (self gtBook pageNamed: 'Working with a REST API: the GitHub case study')))
				maximized ]
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> moldableObject: aSlide [
	<gtSlide>
	<noTest>
	<text: '## Pattern: Moldable object

This is perhaps the hardest pattern to learn.

Where would you rather be when you are developing code?

Staring at the source code, or viewing the live object that you are working on?

Here we see at the top a typical Coder view of a class where we can browse and edit the methods.

But this is actually the least interesting view we can have because each method is seen divorced from the context in which it is used and interacts with other methods.

From the very first day that we start to program, we learn to write some code in a text editor, and we compile it and run it.

It always takes a few steps to see the end result.

But why not reverse this?

Below here we see a *moldable object*, that is, a live instance of the PillarWebsite object that we can interact with.

While it can be cumbersome to navigate from the code view to see its effect, it is usually easy to navigate from the live object to its code.

Suppose for, for example, that we don''t like the way the *Links* are displayed.

We can directly go to the code and change, for example, the width of the *Link* column.

*(Opt-click on the Links tab and change the `300` width to `200`.)*

From the moldable object we can experiment with new features, extract methods and examples or tests, and immediately see the effect.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Moldable object')
]

{ #category : #page }
TeachingMoldableDevelopmentSlideshow >> moldableObjectPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Moldable object')
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
				code: 'GtInspector newOn: EsugWebsite instance';
				codeVisible: false;
				elementHeight: 302;
				codeHeight: 50;
				yourself);
		yourself
]

{ #category : #figures }
TeachingMoldableDevelopmentSlideshow >> patternMapScenery [
	"NB: Generated by GtScenery>>#storeAsExampleMethod -- do not edit."

	<gtExample>
	<noTest>
	| scenery item1 item2 item3 item4 item5 item6 item7 item8 item9 |
	scenery := GtScenery new.
	item1 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Moldable Object')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 16;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item1 position: 285 @ 77.
	item1 extent: 157.98685709635419 @ 40.0.
	item2 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Viewable Data Wrapper')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 22;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item2 position: 600.0 @ 77.99999999999999.
	item2 extent: 219.53648885091116 @ 40.000000000000014.
	item3 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Contextual Playground')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 22;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item3 position: 256.0 @ 237.99999999999997.
	item3 extent: 217.81504313151044 @ 40.00000000000003.
	item4 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Viewable Entity')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 16;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item4 position: 190.0 @ 359.99999999999994.
	item4 extent: 152.59155273437494 @ 40.0.
	item5 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Custom Action')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 14;
												instVarAt: 2
													put: ((Array new: 4)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3 put: BlFontItalicAttribute new;
															at: 4
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item5 position: 400.99999999999994 @ 357.99999999999994.
	item5 extent: 144.4384256998697 @ 40.0.
	item6 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Simple View')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 12;
												instVarAt: 2
													put: ((Array new: 4)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3 put: BlFontItalicAttribute new;
															at: 4
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item6 position: 119.99999999999997 @ 475.9999999999999.
	item6 extent: 119.12862141927079 @ 40.0.
	item7 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Collection Wrapper')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 19;
												instVarAt: 2
													put: ((Array new: 4)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3 put: BlFontItalicAttribute new;
															at: 4
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item7 position: 281.0 @ 475.9999999999999.
	item7 extent: 189.85839843749994 @ 40.0.
	item8 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Project Diary')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 14;
												instVarAt: 2
													put: ((Array new: 4)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3 put: BlFontItalicAttribute new;
															at: 4
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item8 position: 636 @ 151.
	item8 extent: 131.41372680664063 @ 40.0.
	item9 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Example Object')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 15;
												instVarAt: 2
													put: ((Array new: 4)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3 put: BlFontItalicAttribute new;
															at: 4
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item9 position: 624 @ 237.
	item9 extent: 156.98435465494777 @ 40.0.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item1
		to: item2.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item2
		to: item1.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item1
		to: item3.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item3
		to: item4.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item3
		to: item5.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item4
		to: item6.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item4
		to: item7.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item1
		to: item8.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item3
		to: item9.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item8
		to: item9.
	scenery
		storeStringMethodName: 'TeachingMoldableDevelopmentSlideshow>>#patternMapScenery'.
	^ scenery
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> patterns: aSlide [
	<gtSlide>
	<text: '# Moldable Development Patterns

Since Moldable Development is a *way* to develop explainable systems, rather than focusing on technology, it makes sense to start from the *patterns* that we observe when building such systems.

Let''s have a look a few of these patterns.'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asTitle: 'Moldable Development Patterns');
		paragraphWithFormat: (self
				asBigText: '

express  best practices in the process of molding software to make it explainable.')
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> peopleFocusOnWhatTheySeeFirst: aSlide [
	<gtSlide>
	<text: '## People focus on what they see first

The Glamorous Toolkit contains many pieces of technology that fit together to support moldable development.

People like to put things into boxes, so they tend to focus on the first bit of technology that captures their imagination, and so risk to lose the big picture.

For example, visualization is an important component, but it is a mistake to equate moldable development with visualization.

*(Click around the visualization, and navigate to some pages.)*

The same can be said for the live notebooks, the language workbench, or the pervasive use of examples.'>
	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asSubtitle: 'People focus on what they see first');
		element: [ (GtPagerSettings usedPager createWrappedOn: GtTour new treemapWithBook)
				maximized ]
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> peopleHateChange: aSlide [
	<gtSlide>
	<noTest>
	<text: '## People hate change

People hate change, or perhaps rather it''s the case that it''s extremely hard for people to change habits once they have become ingrained.

I personally took a long time to get into the habit of starting to code from live objects rather than heading to a code editor first.

The code editor is a comfortable place to start from, even if it is not very useful for exploring implementation options or understanding existing code.

What helps here best is live mentoring on a real project.

When you see over and over again the benefits of coding from live objects, you begin to build up a Pavlovian instinct to stay away from the code editor as your starting point.

Demos and videos also help, but they are not as effective as the first-hand experience.'>
	^ aSlide elementAndElement
		setPriority;
		newTextWithFormat: (self asSubtitle: 'People hate change');
		leftElement: [ (GtPagerSettings usedPager createWrappedOn: (GtCoder forClass: PillarWebsite))
				maximized ];
		rightElement: [ (GtPagerSettings usedPager
				createWrappedOn: (GtInspector forObject: EsugWebsite instance)) maximized ]
]

{ #category : #accessing }
TeachingMoldableDevelopmentSlideshow >> slidePriorities [
	"This method defines the slide priorities implicitly by their order instead of by fixed numbers.
	See also: PrioritySlideshow>>#priorityFor:"

	<gtExample>
	<return: #Array>
	^ #(titleSlide: whatIsMD: exploringESUGWebsite: patterns: #moldableObject: #viewableDataWrapper: #contextualPlayground: #viewableEntity: gtBookPatternsPage: whatWorks: #liveDocumentation: #discord: #videos: challenges: peopleHateChange: peopleFocusOnWhatTheySeeFirst: #takeaways:)	"replaceTasksByActions:"
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> takeaways: aSlide [
	<gtSlide>
	<text: '# Conclusions 

In the end, what is important to convey is that Moldable Development is a *process* in which you ask questions about a software system, explore it, and build lots of small, custom tools to answer those questions and make the system explainable.

Moldable Development is a new way of programming that takes time to learn, but that in the end boils down to a set of learnable patterns.

Thanks for listening.'>
	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asSubtitle: 'Conclusion');
		newFadedText: '';
		newFadedText: 'Moldable Development boils down to a set of learnable patterns.';
		element: [ self patternMapScenery ]
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> titleSlide: aSlide [
	<gtSlide>
	<text: '# Teaching Moldable Development

Hi. My name is Oscar Nierstrasz.

Today I''d like to report on the challenges and and insights we have experienced in teaching moldable development to newcomers.

Moldable development is a *new* way of programming.

In many ways it looks like programming as we are used to it, but it actually entails fundamentally different ways of thinking about programming, and new *patterns* of programming.'>
	^ aSlide titleWithFooter
		setPriority;
		titleBottomPadding: 20;
		subtitleBottomPadding: 40;
		titleWithFormat: (self asTitle: 'Teaching Moldable Development');
		footerWithFormat: (self asBigText: 'oscar.nierstrasz@feenk.com')
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> videos: aSlide [
	<gtSlide>
	<text: '## Videos

Some people love to watch long, meandering videos at double speed, but I''m not one of them.

A short, compact video can be a very effective way to explain and demonstrate a complex topic, but it also requires considerable planning.

It can take more time to prepare a seven minute video than one that runs over an hour.'>
	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asSubtitle: 'Short videos on specific topics');
		element: [ (GtPagerSettings usedPager
				createWrappedOn: (LePagePhlowTool page: (self gtBook pageNamed: 'Getting started with GT in 7''')))
				maximized ]
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> viewableDataWrapper: aSlide [
	<gtSlide>
	<noTest>
	<text: '## Pattern: Viewable data wrapper

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
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Viewable data wrapper')
]

{ #category : #page }
TeachingMoldableDevelopmentSlideshow >> viewableDataWrapperPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Viewable data wrapper')
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
				code: 'EsugWebsite instance';
				yourself);
		yourself
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> viewableEntity: aSlide [
	<gtSlide>
	<noTest>
	<text: '## Pattern: Viewable Entity

How  do you know when to create a custom view?

This is another fundamental pattern.

The idea is that, whenever you find yourself navigating to get to some interesting objects, you should turn that navigation path into a custom view so you can get to that information directly.

Let''s look at a trivial example: as we explore the Esug website model, we navigate to the pages using a Playground snippet, and then we can navigate to individual pages.

Instead we''d like the list of pages view to be visible directly in the website object.

We can inspect that view to see that it is implemented as a `#gtItemsFor:` method in the class `SequenceableCollection`.

We could copy-paste the code and later adapt it, but as a first quick step we can simply define a *forwarding* view from the website to the collection.

We just open a Coder view and add the view that forwards to the existing view of the pages collection.

The new view is instantly available.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Viewable Entity')
]

{ #category : #page }
TeachingMoldableDevelopmentSlideshow >> viewableEntityPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Viewable Entity')
		addSnippet: (LeTextSnippet new
				string: '## We inspect the ESUG website and navigate to the pages ...';
				yourself);
		addSnippet: (LeElementSnippet new
				code: '(GtInspectorScripterExamples new
	scriptedInspectorOn: EsugWebsiteWrapperWithPages esug
	WithPlaygroundText: ''self pages'')
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
TeachingMoldableDevelopmentSlideshow >> whatIsMD: aSlide [
	<gtSlide>
	<text: '# What is Moldable Development?

Moldable Development is a way of programming in which you build custom tools for each problem.

In this way the system becomes *explainable*, and thus supports decision making for a range of stakeholders.

Let''s look at a simple example.'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asTitle: 'What is Moldable Development?');
		paragraphWithFormat: (self
				asBigText: '

Moldable development supports decision making by making domain concepts ')
				, (self asBigText: 'explainable.') italic
]

{ #category : #slides }
TeachingMoldableDevelopmentSlideshow >> whatWorks: aSlide [
	<gtSlide>
	<text: '# What works?

Teaching Moldable Development is challenging not only because there are the patterns to learn and a fair bit of technology to get acquainted with.

Here are a few things that ease the learning process.'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asTitle: 'What works?');
		paragraphWithFormat: (self
				asBigText: '

')
]
