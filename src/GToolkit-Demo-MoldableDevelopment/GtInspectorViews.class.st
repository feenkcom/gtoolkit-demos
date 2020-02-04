Class {
	#name : #GtInspectorViews,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #tests }
GtInspectorViews >> columnedListViewExplanationWithLinks [
	<gtExample>
	| container inspectorCodeContainer inspectorResultContainer verticalContainer editor coder coderElement selectors variables resultElement inspectorResultHeader inspectorResultView |
	
	inspectorCodeContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 10).
	inspectorResultContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 20).
	verticalContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout vertical.
	container := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent];
		layout: BlLinearLayout horizontal.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#columnedList . #title: . #items: . #column:format: .#contacts . #fullName . #telephone }.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {'aContact' . 'contacts'}.
	
	coder := GtMethodCoder forMethod: (GtABAddressBook>>#gtViewContactsOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	
	inspectorCodeContainer addChild: coderElement.
	
	resultElement := (GtABCartoonAddressBookExample new cartoonAddressBook gtViewsFor: GtPhlowView empty) asElementDo: [ :e | e ].
	resultElement forceLayout.
	inspectorResultHeader := resultElement phlow firstChildWithView.
	inspectorResultView := inspectorResultHeader viewContentElement phlow firstChildWithView.
	
	inspectorResultContainer addChild: resultElement.
	
	inspectorResultContainer
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 5 @ 5;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #title:);
				relocate:
					(inspectorResultContainer
						globalPointToLocal: (inspectorResultView localPointToGlobal: 7 @ 17))).
	inspectorResultContainer
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 5 @ 5;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #fullName);
				relocate:
					(inspectorResultContainer
						globalPointToLocal: (inspectorResultView localPointToGlobal: 90 @ 55))).
	inspectorResultContainer
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 5 @ 5;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #telephone);
				relocate:
					(inspectorResultContainer
						globalPointToLocal: (inspectorResultView localPointToGlobal: 295 @ 55))).
	
	verticalContainer addChild: inspectorCodeContainer.
	verticalContainer addChild: inspectorResultContainer.
	
	editor := BrEditor new
		look: (BrGlamorousRegularEditorLook new fontSize: 16);
		text: self columnedListViewsExplanationWithLinksText;
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent.
			c linear weight: 0.5 ].
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #tests }
GtInspectorViews >> columnedListViewsExplanationWithLinksText [
	| text |
	
	text := 'In this case we have a ' asRopedText,
('columned list' asRopedText glamorousExplanationFor: #columnedList),
' view that consists of a ' asRopedText,
('title' asRopedText glamorousExplanationFor: #title:),
' and ' asRopedText,
('two columns' asRopedText glamorousExplanationFor: #column:format:),
'

The columned list has as many rows as the collection returned by the ' asRopedText,
('items: block' asRopedText glamorousExplanationFor: #items:),
'. In this case, this means it shows all the ' asRopedText,
('contacts list' asRopedText glamorousExplanationFor: #contacts),

'For each ' asRopedText, 
('contact' asRopedText glamorousExplanationFor: #aContact),
' we show the ' asRopedText,
('full name' asRopedText glamorousExplanationFor: #fullName),
' in the first column, and the ' asRopedText,
('telephone' asRopedText glamorousExplanationFor: #telephone),
' in the second column' asRopedText.
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #'api - instantiation' }
GtInspectorViews >> create [
	| show |
	show := GtSlideShow new.
	show
		slides:
			{(GtFilePictureSlide new
				fileReference:
					(GtResourceReference
						path: Path * 'feenkcom' / 'gtoolkit' / 'doc' / 'gtoolkit.png')).
			(GtTitleSlide new
				titleText: ('inspector views' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtElementSlide new
				element: [self columnedListViewExplanationWithLinks])}.
	
	^ show.
]
