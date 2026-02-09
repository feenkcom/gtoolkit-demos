"
This slideshow is intended as a walkthrough of the stepsof the GT book page “Tutorial: molding CSV data into an explainable system”.
"
Class {
	#name : #VRTutorialSlideshow,
	#superclass : #InMemoryDatabaseSlideshow,
	#category : #'GToolkit-Demo-VisualizationReview-Slideshows'
}

{ #category : #slides }
VRTutorialSlideshow >> actionsQueriesVisualizations: aSlide [ 
	<gtSlide>
	<text:
'## Molding CSV data — actions, queries and visualizations'>
	^ (aSlide title)
		setPriority;
		titleBottomPadding: 30;
		titleWithFormat: (self asSectionTitle: 'Molding CSV data —');
		subtitleWithFormat: (self asSectionTitle: 'actions, queries and visualizations')
]

{ #category : #slides }
VRTutorialSlideshow >> continuingExploration: aSlide [ 
	<gtSlide>
	<text:
'## Molding CSV data — continuing the exploration'>
	^ (aSlide title)
		setPriority;
		titleBottomPadding: 30;
		titleWithFormat: (self asSectionTitle: 'Molding CSV data —');
		subtitleWithFormat: (self asSectionTitle: 'continuing the exploration')
]

{ #category : #acccessing }
VRTutorialSlideshow >> databaseName [
	^ 'feenkcom/gtoolkit-demos/vrTutorialLepiter'
]

{ #category : #slides }
VRTutorialSlideshow >> exploringTheCSV: aSlide [ 
	<gtSlide>
	<text:
'Exploring the CSV — posing some initial questions

One dataset describes all the papers, and the other one provides more details about the design studies. We have many questions, but they are not easy to answer from the raw data.'>
<demo:
'- Scroll through the data.
- Open the CSV in Excel.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Exploring the CSV')
]

{ #category : #slides }
VRTutorialSlideshow >> extractingExamples: aSlide [ 
	<gtSlide>
	<text:
'Extracting examples from snippets

We can turn the code snippets into *examples*, factory methods for objects of interest, andw we can add assertions so they serve as test as well.
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Extracting examples from snippets')
]

{ #category : #slides }
VRTutorialSlideshow >> modelingOtherEntities: aSlide [ 
	<gtSlide>
	<text:
'## Molding CSV data — modeling other entities'>
	^ (aSlide title)
		setPriority;
		titleBottomPadding: 30;
		titleWithFormat: (self asSectionTitle: 'Molding CSV data —');
		subtitleWithFormat: (self asSectionTitle: 'modeling other entities')
]

{ #category : #slides }
VRTutorialSlideshow >> modelingPapers: aSlide [ 
	<gtSlide>
	<text:
'XXX

'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'PLACEHOLDER')
]

{ #category : #slides }
VRTutorialSlideshow >> moldingDomainObjects: aSlide [ 
	<gtSlide>
	<text:
'CONTINUE HERE ===> ## Molding CSV data — modeling domain objects'>
	^ (aSlide title)
		setPriority;
		titleBottomPadding: 30;
		titleWithFormat: (self asSectionTitle: 'Molding CSV data — ');
		subtitleWithFormat: (self asSectionTitle: 'modeling domain objects')
]

{ #category : #slides }
VRTutorialSlideshow >> preparingTheData: aSlide [ 
	<gtSlide>
	<text:
'## Molding CSV data — preparing the data

In this part we introduce the CSV dataset of a research project, explore the data to develop some initial questions, and transform the CSV data into JSON to prepare for modeling the domain entities hidden in the data.'>
	^ (aSlide title)
		setPriority;
		titleBottomPadding: 30;
		titleWithFormat: (self asSectionTitle: 'Molding CSV data —');
		subtitleWithFormat: (self asSectionTitle: 'preparing the data')
]

{ #category : #accessing }
VRTutorialSlideshow >> slidePriorities [
	<gtExample>
	<return: #Array>
	^ #(
		#title:
		
		#preparingTheData:
			#startingPoint:
			#exploringTheCSV:
			#transformingRawData:
			#extractingExamples:
			
		#moldingDomainObjects:
			#modelingPapers:
		
		#modelingOtherEntities:
		
		#actionsQueriesVisualizations:
		
		#continuingExploration:
		)
]

{ #category : #slides }
VRTutorialSlideshow >> startingPoint: aSlide [ 
	<gtSlide>
	<text:
'Starting point: CSV data from a software visualization publication review study

Here we seen an inspector on the folder containing the two datasets. The inspector as been molded to show not just the default *Raw* view, but several more useful views for folders.'>
<demo:
'- Compare the Tree and Raw views
- Dive into the datasets'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Starting point')
]

{ #category : #slides }
VRTutorialSlideshow >> title: aSlide [ 
	<gtSlide>
	<text:
'# Tutorial: molding CSV data into an explainable system

This tutorial is intended as a first step-by-step, hands-on introduction to moldable development, using a CSV dataset from a research study as a case study. We will walk through the tutorial to show you all the steps.'>
	^ (aSlide title)
		setPriority;
		titleBottomPadding: 30;
		titleWithFormat: (self asTitle: 'Molding CSV data');
		subtitleWithFormat: (self asBigText: 'into an explainable system')
]

{ #category : #slides }
VRTutorialSlideshow >> transformingRawData: aSlide [ 
	<gtSlide>
	<text:
'Transforming the raw data — converting the CSV to JSON

Luckily we already have a tool to convert CSV files to JSON dictionaries.
'>
<demo:
'- Evaluate and inspect each statement in turn, then the whole snippet.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Transforming the raw data')
]
