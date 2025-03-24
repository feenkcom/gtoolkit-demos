Class {
	#name : #GtWorkingWithTheGitHubRestApiShow,
	#superclass : #Object,
	#traits : 'TGtSlideShow',
	#classTraits : 'TGtSlideShow classTrait',
	#category : #'GToolkit-Demo-GitHubAPI-Presentation'
}

{ #category : #examples }
GtWorkingWithTheGitHubRestApiShow >> apiExamples [
	<gtExample>
	<noTest>
	| firstExampleContainer secondExampleContainer thirdExampleContainer |
	firstExampleContainer := BlElement new
			layout: BlLinearLayout vertical;
			constraintsDo: [ :c | 
				c vertical matchParent.
				c horizontal matchParent ];
			margin: (BlInsets all: 5);
			addChild: (BrButton new
					margin: (BlInsets all: 5);
					aptitude: (BrGlamorousLinkSquaredButtonWithLabelAptitude new fontSize: 16)
							+ (BrGlamorousWithExplicitTooltipAptitude
									text: 'https://api.github.com/orgs/feenkcom');
					label: 'https://api.github.com/orgs/feenkcom';
					action: [ :aButton | WebBrowser openOn: 'https://api.github.com/orgs/feenkcom' ]);
			addChild: (BlElement new
					constraintsDo: [ :c | 
						c vertical matchParent.
						c horizontal matchParent ];
					margin: (BlInsets all: 5);
					aptitude: BrShadowAptitude;
					background: Color white;
					addChild: ((self responseForFeenkOrg gtJsonFor: GtPhlowView empty) asElementDo: [ :e | e ])).

	secondExampleContainer := BlElement new
			layout: BlLinearLayout vertical;
			constraintsDo: [ :c | 
				c vertical matchParent.
				c horizontal matchParent ];
			margin: (BlInsets all: 5);
			addChild: (BrButton new
					margin: (BlInsets all: 5);
					aptitude: (BrGlamorousLinkSquaredButtonWithLabelAptitude new fontSize: 16)
							+ (BrGlamorousWithExplicitTooltipAptitude
									text: 'https://api.github.com/orgs/feenkcom/repos');
					label: 'https://api.github.com/orgs/feenkcom/repos';
					action: [ :aButton | WebBrowser openOn: 'https://api.github.com/orgs/feenkcom/repos' ]);
			addChild: (BlElement new
					constraintsDo: [ :c | 
						c vertical matchParent.
						c horizontal matchParent ];
					margin: (BlInsets all: 5);
					aptitude: BrShadowAptitude;
					background: Color white;
					addChild: ((self responseForFeenkRepos gtJsonFor: GtPhlowView empty)
							asElementDo: [ :e | e ])).

	thirdExampleContainer := BlElement new
			layout: BlLinearLayout vertical;
			constraintsDo: [ :c | 
				c vertical matchParent.
				c horizontal matchParent ];
			margin: (BlInsets all: 5);
			addChild: (BrButton new
					margin: (BlInsets all: 5);
					aptitude: (BrGlamorousLinkSquaredButtonWithLabelAptitude new fontSize: 16)
							+ (BrGlamorousWithExplicitTooltipAptitude
									text: 'https://api.github.com/repos/feenkcom/gtoolkit');
					label: 'https://api.github.com/repos/feenkcom/gtoolkit';
					action: [ :aButton | WebBrowser openOn: 'https://api.github.com/repos/feenkcom/gtoolkit' ]);
			addChild: (BlElement new
					constraintsDo: [ :c | 
						c vertical matchParent.
						c horizontal matchParent ];
					margin: (BlInsets all: 5);
					aptitude: BrShadowAptitude;
					background: Color white;
					addChild: ((self responseForGToolkitRepo gtJsonFor: GtPhlowView empty)
							asElementDo: [ :e | e ])).


	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ];
		margin: (BlInsets all: 5);
		addChildren: {firstExampleContainer.
				secondExampleContainer.
				thirdExampleContainer}
]

{ #category : #slides }
GtWorkingWithTheGitHubRestApiShow >> apiExamplesSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 6;
		newFadedText: (self apiExplanationText);
		element: [ self apiExamples ]
]

{ #category : #accessing }
GtWorkingWithTheGitHubRestApiShow >> apiExplanationText [
	^ 'Below we see examples of the JSON responses for various requests to the GitHub API. This is a way to explore an API. Boring, right? Let''s make it interactive.' asRopedText
		glamorousRegularFont;
		fontSize: 16.
]

{ #category : #accessing }
GtWorkingWithTheGitHubRestApiShow >> createOrganizationFromRawData: dictionary [
	<gtExample>
	GhOrganization new rawData: dictionary
]

{ #category : #slides }
GtWorkingWithTheGitHubRestApiShow >> introductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 5;
		newTextWithFormat:
			('Glamorous Toolkit allows you to work with REST APIs out of the box. Here, we take a look at how we can play with the GitHub REST API.' asRopedText 
				glamorousRegularFont; 
				fontSize: 18).
]

{ #category : #accessing }
GtWorkingWithTheGitHubRestApiShow >> parseJson: json [
	<gtExample>
	| dictionary |
	dictionary := STON fromString: json.
]

{ #category : #slides }
GtWorkingWithTheGitHubRestApiShow >> playgroundWithFeenkcomFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		newFadedText: 'Working with an API is as simple as this: get the response, parse it, populate a dedicated object that offers custom views and navigation.';
		newFadedText: 'Happy browsing!';
		element: [ 
			GtPlaygroundLiveSlide new
				newSnippetFromMethod: self class>>#zincCallToFeenkcom;
				newSnippetFromMethod: self class>>#parseJson:;
				newSnippetFromMethod: self class>>#createOrganizationFromRawData:];
		priority: 7.
]

{ #category : #examples }
GtWorkingWithTheGitHubRestApiShow >> responseForFeenkOrg [
	<gtExample>
	<noTest>
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
GtWorkingWithTheGitHubRestApiShow >> responseForFeenkRepos [
	<gtExample>
	<noTest>
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
GtWorkingWithTheGitHubRestApiShow >> responseForGToolkitRepo [
	<gtExample>
	<noTest>
	| response |
	response := ZnClient new
		url: 'https://api.github.com/repos/feenkcom/gtoolkit';
		get;
		response.
	
	self assert: response isNotNil.
	self assert: response status equals: 200.
	
	^ response.
]

{ #category : #slides }
GtWorkingWithTheGitHubRestApiShow >> title: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Working with the GitHub REST API' asRopedText
			fontSize: 50;
			bold;
			glamorousRegularFont);
		subtitleWithFormat: ('use case' asRopedText
			fontSize: 40;
			thin;
			glamorousRegularFont)
]

{ #category : #snippets }
GtWorkingWithTheGitHubRestApiShow >> zincCallToFeenkcom [
	<gtExample>
	<noTest>
	| json |
	json := ZnClient new get: 'https://api.github.com/orgs/feenkcom'
]
