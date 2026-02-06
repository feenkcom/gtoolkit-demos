Class {
	#name : #VRTutorialSlideshow,
	#superclass : #PrioritySlideshow,
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

{ #category : #page }
VRTutorialSlideshow >> exploringTheCSV [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Exploring the CSV')
		addSnippet: (LeTextSnippet new
				string: 'Placeholder';
				yourself);

		yourself
]

{ #category : #slides }
VRTutorialSlideshow >> exploringTheCSV: aSlide [ 
	<gtSlide>
	<text:
'Exploring the CSV — posing some initial questions

'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Exploring the CSV')
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
'## Molding CSV data — modeling domain objects'>
	^ (aSlide title)
		setPriority;
		titleBottomPadding: 30;
		titleWithFormat: (self asSectionTitle: 'Molding CSV data — ');
		subtitleWithFormat: (self asSectionTitle: 'modeling domain objects')
]

{ #category : #page }
VRTutorialSlideshow >> placeholder [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'PLACEHOLDER')
		addSnippet: (LeTextSnippet new
				string: 'Placeholder';
				yourself);

		yourself
]

{ #category : #slides }
VRTutorialSlideshow >> preparingTheData: aSlide [ 
	<gtSlide>
	<text:
'## Molding CSV data — preparing the data'>
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
			
		#moldingDomainObjects:
			#modelingPapers:
		
		#modelingOtherEntities:
		
		#actionsQueriesVisualizations:
		
		#continuingExploration:
		)
]

{ #category : #page }
VRTutorialSlideshow >> startingPoint [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Starting point')
	addSnippet: (LeTextSnippet new
			string: '# Starting point: CSV data from a software visualization publication review study';
			yourself);
	addSnippet: (LeExampleSnippet new
			exampleBehaviorName: #VRTutorialExamples;
			exampleSelector: #datasetFolder;
			noCode: true;
			previewShowSelector: #gtTreeFor:;
			previewHeight: 170);
	yourself
]

{ #category : #slides }
VRTutorialSlideshow >> startingPoint: aSlide [ 
	<gtSlide>
	<text:
'Starting point: CSV data from a software visualization publication review study

'>
<demo:
''>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Starting point')
]

{ #category : #slides }
VRTutorialSlideshow >> title: aSlide [ 
	<gtSlide>
	<text:
'# Tutorial: molding CSV data into an explainable system

This is a walk-through of the tutorial.'>
	^ (aSlide title)
		setPriority;
		titleBottomPadding: 30;
		titleWithFormat: (self asTitle: 'Molding CSV data');
		subtitleWithFormat: (self asBigText: 'into an explainable system')
]

{ #category : #page }
VRTutorialSlideshow >> transformingRawData [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Transforming the raw data')
		addSnippet: (LeTextSnippet new
				string: 'Placeholder';
				yourself);

		yourself
]

{ #category : #slides }
VRTutorialSlideshow >> transformingRawData: aSlide [ 
	<gtSlide>
	<text:
'Transforming the raw data — converting the CSV to JSON

'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Transforming the raw data')
]
