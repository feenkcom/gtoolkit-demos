Class {
	#name : #GtWorkingWithTheGitHubRestApi,
	#superclass : #Object,
	#category : #'GToolkit-Demo-GitHubAPI-Presentation'
}

{ #category : #examples }
GtWorkingWithTheGitHubRestApi >> apiExamples [
	<gtExample>
	| firstExampleContainer secondExampleContainer thirdExampleContainer |

	firstExampleContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		addChild: (BrButton new
			margin: (BlInsets all: 5);
			aptitude: (BrGlamorousLinkSquaredButtonWithLabelAptitude new fontSize: 16) + (BrGlamorousWithLabelTooltipAptitude new text: 'https://api.github.com/orgs/feenkcom');
			label: 'https://api.github.com/orgs/feenkcom';
			action: [ :aButton | WebBrowser openOn: 'https://api.github.com/orgs/feenkcom']);
		addChild: (BlElement new
			constraintsDo: [ :c |
				c vertical matchParent.
				c horizontal matchParent];
			margin: (BlInsets all: 5);
			aptitude: BrShadowAptitude;
			background: Color white;
			addChild: ((self responseForFeenkOrg gtJsonFor: GtPhlowView empty) asElementDo: [ :e | e ])).
	
	secondExampleContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		addChild: (BrButton new
			margin: (BlInsets all: 5);
			aptitude: (BrGlamorousLinkSquaredButtonWithLabelAptitude new fontSize: 16) + (BrGlamorousWithLabelTooltipAptitude new text: 'https://api.github.com/orgs/feenkcom/repos');
			label: 'https://api.github.com/orgs/feenkcom/repos';
			action: [ :aButton | WebBrowser openOn: 'https://api.github.com/orgs/feenkcom/repos']);
		addChild: (BlElement new
			constraintsDo: [ :c |
				c vertical matchParent.
				c horizontal matchParent];
			margin: (BlInsets all: 5);
			aptitude: BrShadowAptitude;
			background: Color white;
			addChild: ((self responseForFeenkRepos gtJsonFor: GtPhlowView empty) asElementDo: [ :e | e ])).

	thirdExampleContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		addChild: (BrButton new
			margin: (BlInsets all: 5);
			aptitude: (BrGlamorousLinkSquaredButtonWithLabelAptitude new fontSize: 16) + (BrGlamorousWithLabelTooltipAptitude new text: 'https://api.github.com/repos/feenkcom/gtoolkit');
			label: 'https://api.github.com/repos/feenkcom/gtoolkit';
			action: [ :aButton | WebBrowser openOn: 'https://api.github.com/repos/feenkcom/gtoolkit']);
		addChild: (BlElement new
			constraintsDo: [ :c |
				c vertical matchParent.
				c horizontal matchParent];
			margin: (BlInsets all: 5);
			aptitude: BrShadowAptitude;
			background: Color white;
			addChild: ((self responseForGToolkitRepo gtJsonFor: GtPhlowView empty) asElementDo: [ :e | e ])).

	
	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		addChildren: { firstExampleContainer. secondExampleContainer. thirdExampleContainer }.
]

{ #category : #slides }
GtWorkingWithTheGitHubRestApi >> apiExamplesSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 6;
		newFadedText: (self apiExplanationText);
		element: [ self apiExamples ]
]

{ #category : #accessing }
GtWorkingWithTheGitHubRestApi >> apiExplanationText [
	^ 'Below we see examples of the JSON responses for various requests to the GitHub API.' asRopedText
		glamorousRegularFont;
		fontSize: 16.
]

{ #category : #accessing }
GtWorkingWithTheGitHubRestApi >> introductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 5;
		newTextWithFormat:
			('Glamorous Toolkit allows you to work with REST APIs out of the box. Here, we take a look at how we can play with the GitHub REST API.' asRopedText 
				glamorousRegularFont; 
				fontSize: 18).
]

{ #category : #examples }
GtWorkingWithTheGitHubRestApi >> responseForFeenkOrg [
	<gtExample>
	| response |
	response := ZnClient new
		url: 'https://api.github.com/orgs/feenkcom';
		get;
		response.
	
	self assert: response isNotNil.
	self assert: response status equals: 200.
	
	^ response.
]

{ #category : #examples }
GtWorkingWithTheGitHubRestApi >> responseForFeenkRepos [
	<gtExample>
	| response |
	response := ZnClient new
		url: 'https://api.github.com/orgs/feenkcom/repos';
		get;
		response.
	
	self assert: response isNotNil.
	self assert: response status equals: 200.
	
	^ response.
]

{ #category : #examples }
GtWorkingWithTheGitHubRestApi >> responseForGToolkitRepo [
	<gtExample>
	| response |
	response := ZnClient new
		url: 'https://api.github.com/repos/feenkcom/gtoolkit';
		get;
		response.
	
	self assert: response isNotNil.
	self assert: response status equals: 200.
	
	^ response.
]

{ #category : #accessing }
GtWorkingWithTheGitHubRestApi >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Working with the GitHub REST API' asRopedText
			fontSize: 60;
			glamorousRegularFont).
]
