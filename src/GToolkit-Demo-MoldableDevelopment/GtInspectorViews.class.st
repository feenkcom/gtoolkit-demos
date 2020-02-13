Class {
	#name : #GtInspectorViews,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #tests }
GtInspectorViews >> columnedListViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer verticalContainer editor coder coderElement selectors variables resultElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#columnedList . #title: . #items: . #column:format: .#contacts . #fullName . #telephone }.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {'aContact' . 'contacts'}.
	
	coder := GtMethodCoder forMethod: (GtABAddressBook>>#gtViewContactsOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := (GtPhlowView empty composite
		views: {GtABCartoonAddressBookExample new cartoonAddressBook gtViewContactsOn: GtPhlowView empty};
		labelled: 'a GtABAddressBook (Cartoons)' asRopedText) asElementDo: [ :e | e ].
	resultElement forceLayout.
	resultInspectorHeader := resultElement phlow firstChildWithView.
	resultInspectorView := resultInspectorHeader viewContentElement phlow firstChildWithView.
	
	resultInspectorContainer addChild: resultElement.
	
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 7 @ 17))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #fullName)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 90 @ 55))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #telephone)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 295 @ 55))).
	
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self columnedListViewExplanationWithLinksText).
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #tests }
GtInspectorViews >> columnedListViewExplanationWithLinksText [
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

{ #category : #'as yet unclassified' }
GtInspectorViews >> columnedTreeViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer verticalContainer editor coder coderElement selectors variables resultElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {}.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {}.
	
	coder := GtMethodCoder new. "forMethod: ()."
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := (" gtViewsFor:" GtPhlowView empty) asElementDo: [ :e | e ].
	resultElement forceLayout.
	"resultInspectorHeader := resultElement phlow firstChildWithView.
	resultInspectorView := resultInspectorHeader viewContentElement phlow firstChildWithView."
	
	resultInspectorContainer addChild: resultElement.
	
	"resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 7 @ 17))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #fullName)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 90 @ 55))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #telephone)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 295 @ 55)))."
	
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self columnedTreeViewExplanationWithLinksText).
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> columnedTreeViewExplanationWithLinksText [
	| text |
	
	text := 'ColumnedTree View - Not Yet Implemented' asRopedText.
	
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
			{(GtTitleSlide new
				titleText: ('inspector views' asRopedText
						fontSize: 50;
						glamorousRegularFont)).
			(GtElementSlide new
				element: [self listViewExplanationWithLinks]).
			(GtElementSlide new
				element: [self columnedListViewExplanationWithLinks]).
			(GtElementSlide new
				element: [self mondrianViewExplanationWithLinks]).
			(GtElementSlide new
				element: [self treeViewExplanationWithLinks]).
			(GtElementSlide new
				element: [self columnedTreeViewExplanationWithLinks]).
			(GtElementSlide new
				element: [self explicitViewExplanationWithLinks]).
			(GtElementSlide new
				element: [self textEditorViewExplanationWithLinks]).}.
	
	^ show.
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> explicitViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer verticalContainer editor coder coderElement selectors variables resultElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#explicit. #stencil:. #fullName. #city. #country. #telephone. #column}.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {#BrColumnedList}.
	
	coder := GtMethodCoder new forMethod: (GtABContact>>#gtViewContactDetailsOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := (GtPhlowView empty composite
		views: {GtABAddressBookExample new janeDoeContact gtViewContactDetailsOn: GtPhlowView empty};
		labelled: 'a GtABContact (Jane Doe)' asRopedText) asElementDo: [ :e | e ].
	resultElement forceLayout.
	resultInspectorHeader := resultElement phlow firstChildWithView.
	resultInspectorView := resultInspectorHeader viewContentElement phlow firstChildWithView.
	
	resultInspectorContainer addChild: resultElement.
	
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 7 @ 17))).
	
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self explicitViewExplanationWithLinksText).
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> explicitViewExplanationWithLinksText [
	| text |
	
	text := 'The ' asRopedText,
('explicit' asRopedText glamorousExplanationFor: #explicit),
' view describes an object. In the ' asRopedText,
('stencil: ' asRopedText glamorousExplanationFor: #stencil:),
' block it gets a visualization of the object. 

In this example, we create a ' asRopedText,
('columned list' asRopedText glamorousExplanationFor: #BrColumnedList),
' showing the information about the contact, ' asRopedText,
('name' asRopedText glamorousExplanationFor: #fullName),
' , ' asRopedText,
('city' asRopedText glamorousExplanationFor: #city),
' , ' asRopedText,
('country' asRopedText glamorousExplanationFor: #country),
' and ' asRopedText,
('phone number' asRopedText glamorousExplanationFor: #telephone),
'. The information is displayed using multiple ' asRopedText,
('columns' asRopedText glamorousExplanationFor: #column).
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> listViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer verticalContainer editor coder coderElement selectors variables resultElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#list. #title:. #items:. #itemStencil:. #contacts. #fullName. #avatar }.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {'aContact' . 'contacts'}.
	
	coder := GtMethodCoder forMethod: (GtABAddressBook>>#gtViewContactsListOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := (GtPhlowView empty composite
		views: {GtABCartoonAddressBookExample new cartoonAddressBook gtViewContactsListOn: GtPhlowView empty};
		labelled: 'a GtABAddressBook (Cartoons)' asRopedText) asElementDo: [ :e | e ].
	resultElement forceLayout.
	
	resultInspectorHeader := resultElement phlow firstChildWithView.
	resultInspectorView := resultInspectorHeader viewContentElement phlow firstChildWithView.
	
	resultInspectorContainer addChild: resultElement.
	
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 7 @ 17))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #fullName)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 295 @ 55))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #avatar)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 90 @ 55))).
	
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self listViewExplanationWithLinksText).
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> listViewExplanationWithLinksText [
	| text |
	
	text := 'Lets take a look at a ' asRopedText,
('list' asRopedText glamorousExplanationFor: #list),
' view. It has a ' asRopedText,
('title' asRopedText glamorousExplanationFor: #title:),
' and a ' asRopedText,
('stencil' asRopedText glamorousExplanationFor: #itemStencil:),
' for the rows.

The number of rows it has it is exactly the number of elements in the collection returned by the ' asRopedText,
('items: block' asRopedText glamorousExplanationFor: #items:),
'. In this case, this means it shows all the ' asRopedText,
('contacts' asRopedText glamorousExplanationFor: #contacts),
' in the address book.

For each ' asRopedText, 
('contact' asRopedText glamorousExplanationFor: #aContact),
' we show the ' asRopedText,
('full name' asRopedText glamorousExplanationFor: #fullName),
' and an ' asRopedText,
('avatar' asRopedText glamorousExplanationFor: #avatar),
'.' asRopedText.
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #utility }
GtInspectorViews >> mainContainerElement [
	^ BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent];
		layout: BlLinearLayout horizontal.
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> mondrianViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer verticalContainer editor coder coderElement selectors resultElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#mondrian. #painting:. #nodes. #layout. #circle. #contacts. #avatar. #shape:}.
	
	coder := GtMethodCoder new forMethod: (GtABAddressBook>>#gtViewContactsIconsCircularOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors }).
	coderElement := (coder expanded: true) asElement.
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := (GtPhlowView empty composite
		views: {GtABCartoonAddressBookExample new cartoonAddressBook gtViewContactsIconsCircularOn: GtPhlowView empty};
		labelled: 'a GtABAddressBook (Cartoons)') asElementDo: [ :e | e ].
	resultElement forceLayout.
	resultInspectorHeader := resultElement phlow firstChildWithView.
	resultInspectorView := resultInspectorHeader viewContentElement phlow firstChildWithView.
	
	resultInspectorContainer addChild: resultElement.
	
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 7 @ 17))).
	
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self mondrianViewExplanationWithLinksText).
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> mondrianViewExplanationWithLinksText [
	| text |
	
	text := 'The ' asRopedText,
('mondrian' asRopedText glamorousExplanationFor: #mondrian),
' view allows us to see an object in different layouts using graph like representations.

In the ' asRopedText,
('painting: block' asRopedText glamorousExplanationFor: #painting:),
', we define nodes, edges and a layout for the view.

In this context, the ' asRopedText,
('nodes' asRopedText glamorousExplanationFor: #nodes),
' are the ' asRopedText,
('contacts' asRopedText glamorousExplanationFor: #contacts),
' and each of them has a ' asRopedText,
('shape' asRopedText glamorousExplanationFor: #shape:),
' represented by the their ' asRopedText,
('avatar' asRopedText glamorousExplanationFor: #avatar),
'

Then we set the ' asRopedText,
('layout' asRopedText glamorousExplanationFor: #layout),
' to be a ' asRopedText,
('circle' asRopedText glamorousExplanationFor: #circle).
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #removing }
GtInspectorViews >> removeAllViewsButTheOneOnPosition: aPosition from: aComposite [
	| numberOfViews |
	
	numberOfViews := aComposite views size.
	
	(aPosition + 1) to: numberOfViews do: [:b | 
		aComposite views remove: (aComposite views at: (aPosition + 1))].
	1 to: (aPosition - 1) do: [:a | 
		aComposite views remove: (aComposite views at: (aPosition - 1))].
]

{ #category : #utility }
GtInspectorViews >> resultInspectorContainerElement [
	^ BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 10).
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> textEditorElementWithText: aText [
	^ BrEditor new
		look: (BrGlamorousRegularEditorLook new fontSize: 16);
		text: aText;
		margin: (BlInsets all: 10);
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent.
			c linear weight: 0.5 ].
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> textEditorViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer verticalContainer editor coder coderElement selectors variables resultElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#textEditor. #title:. #look:. #contect. #text:}.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {#BrGlamorousCodeEditorLook}.
	
	coder := GtMethodCoder new forMethod: GtABContactNote>>#gtViewNoteContentOn:.
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := (GtPhlowView empty composite
		views: {GtABAddressBookExample new contactNote gtViewNoteContentOn: GtPhlowView empty};
		labelled: 'a GtABContactNote' asRopedText) asElementDo: [ :e | e ].
	resultElement forceLayout.
	resultInspectorHeader := resultElement phlow firstChildWithView.
	resultInspectorView := resultInspectorHeader viewContentElement phlow firstChildWithView.
	
	resultInspectorContainer addChild: resultElement.
	
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 7 @ 17))).
	
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self textEditorViewExplanationWithLinksText).
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> textEditorViewExplanationWithLinksText [
	| text |
	
	text := 'With the ' asRopedText,
('text editor' asRopedText glamorousExplanationFor: #textEditor),
' view we can print plain text on the screen.

The view gets a ' asRopedText,
('title' asRopedText glamorousExplanationFor: #title),
', a ' asRopedText,
('look' asRopedText glamorousExplanationFor: #look:),
', in this case the ' asRopedText,
('BrGlamorousCodeEditorLook' asRopedText glamorousExplanationFor: #BrGlamorousCodeEditorLook),
' and the ' asRopedText,
('text' asRopedText glamorousExplanationFor: #text:),
', in this case the ' asRopedText,
('content' asRopedText glamorousExplanationFor: #content),
' of the note.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> treeViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer verticalContainer editor coder coderElement selectors variables resultElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {}.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {}.
	
	coder := GtMethodCoder new forMethod: (GtABAddressBook>>#gtViewCategoriesTreeWithContactsOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := (GtPhlowView empty composite
		views: {GtABAddressBookExample new contactsAddressBookWithCategories gtViewCategoriesTreeWithContactsOn: GtPhlowView empty};
		labelled: 'a GtABAddressBook (My Contacts)' asRopedText) asElementDo: [ :e | e ].
	resultElement forceLayout.
	
	resultInspectorHeader := resultElement phlow firstChildWithView.
	resultInspectorView := resultInspectorHeader viewContentElement phlow firstChildWithView.
	
	resultInspectorContainer addChild: resultElement.
	
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 7 @ 17))).
	
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self treeViewExplanationWithLinksText).
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> treeViewExplanationWithLinksText [
	| text |
	
	text := 'TreeView - Not Yet Implemented' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #utility }
GtInspectorViews >> verticalContainerElement [
	^ BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent.
			c padding: (BlInsets all: 5)];
		layout: BlLinearLayout vertical.
]

{ #category : #utility }
GtInspectorViews >> yellowTargetCircleWithExplanationModel: aModel [
	^ BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 5 @ 5;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: aModel).
]
