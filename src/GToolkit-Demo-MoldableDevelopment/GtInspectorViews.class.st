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
	selectors addSelectors: {#columnedList. #title:. #items:. #allContacts. #fullName. #avatar. #telephone}.
	selectors addSelector: #column:do: withIdentifier: #columns.
	selectors addSelector: #column:format: withIdentifier: #columns.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {'aContact'}.
	
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
			((self yellowTargetCircleWithExplanationModel: #avatar)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 5 @ 60))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #fullName)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 130 @ 60))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #telephone)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 335 @ 60))).
	
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
	
	text := 'Next we have a ' asRopedText,
('columned list' asRopedText glamorousExplanationFor: #columnedList),
' view that consists of a ' asRopedText,
('title' asRopedText glamorousExplanationFor: #title:),
' and ' asRopedText,
('the columns' asRopedText glamorousExplanationFor: #columns),
' in which the information is displayed.

The columned list has as many rows as the collection returned by the ' asRopedText,
('items: block' asRopedText glamorousExplanationFor: #items:),
'. In this case, this means it shows all the ' asRopedText,
('contacts' asRopedText glamorousExplanationFor: #allContacts),
' in the address book.

For each ' asRopedText, 
('contact' asRopedText glamorousExplanationFor: #aContact),
' we show the ' asRopedText,
('avatar' asRopedText glamorousExplanationFor: #avatar),
', the ' asRopedText,
('full name' asRopedText glamorousExplanationFor: #fullName),
' and the ' asRopedText,
('telephone' asRopedText glamorousExplanationFor: #telephone).
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #accessing }
GtInspectorViews >> columnedTreeViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer verticalContainer editor coder coderElement selectors literals resultElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#columnedTree. #title:. #items:. #children:}.
	selectors addSelector: #column:item: withIdentifier: #column.
	
	literals := GtLiteralExplanationLinkStyler new.
	literals addLiteral: #City withIdentifier: #name.
	literals addLiteral: #Country withIdentifier: #name.
	literals addLiteral: #Contact withIdentifier: #name.
		
	coder := GtMethodCoder new forMethod: (GtABAddressBook>>#gtViewContactsAddressOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. literals }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := (GtPhlowView empty composite
		views: {GtABAddressBookExample new contactsAddressBookWithCategories gtViewContactsAddressOn: GtPhlowView empty};
		labelled: 'a GtABAddressBook (My contacts)' asRopedText) asElementDo: [ :e | e ].
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
			((self yellowTargetCircleWithExplanationModel: #column)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 65 @ 55))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #column)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 255 @ 55))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #column)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 420 @ 55))).
	
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self columnedTreeViewExplanationWithLinksText).
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #accessing }
GtInspectorViews >> columnedTreeViewExplanationWithLinksText [
	| text |
	
	text := 'The ' asRopedText,
('columned tree' asRopedText glamorousExplanationFor: #columnedTree),
' view shows a tree, and for every item in the tree the information is displayed in multiple columns.

After we give it a ' asRopedText,
('title' asRopedText glamorousExplanationFor: #title:),
', in the ' asRopedText,
('items: block' asRopedText glamorousExplanationFor: #items:),
' we specify the roots of the tree. Then, to each ' asRopedText,
('column' asRopedText glamorousExplanationFor:#column),
' we give a ' asRopedText,
('name' asRopedText glamorousExplanationFor: #name),
' and the items it contains.

Lastly, in the ' asRopedText,
('children: block' asRopedText glamorousExplanationFor: #children:),
' we tell each parent the children it has.' asRopedText.
	
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
				titleText: ('Inspector views' asRopedText
						fontSize: 70;
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
				element: [self textEditorViewExplanationWithLinks]).
			(GtElementSlide new
				element: [self emptyViewExplanationWithLinks]).}.
	
	^ show.
]

{ #category : #accessing }
GtInspectorViews >> emptyViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer allViewsInspectorContainer leftVerticalContainer rightVerticalContainer editor coder coderElement selectors variables resultElement allViewsElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	allViewsInspectorContainer := self resultInspectorContainerElement.
	leftVerticalContainer := self verticalContainerElement.
	rightVerticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#empty}.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {#aView}.
	
	coder := GtMethodCoder new forMethod: (GtABAddressBook>>#gtViewCategoriesTreeWithContactsOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := (GtPhlowView empty composite
		views: {GtABAddressBookExample new myContactsAddressBook gtViewCategoriesTreeWithContactsOn: GtPhlowView empty};
		labelled: 'a GtABAddressBook (My contacts)' asRopedText) asElementDo: [ :e | e ].
	resultElement forceLayout.
	
	allViewsElement := (GtABAddressBookExample new myContactsAddressBook gtViewsFor: GtPhlowView empty) asElementDo: [ :e | e ].
	allViewsElement forceLayout.
	
	resultInspectorContainer addChild: resultElement.
	allViewsInspectorContainer addChild: allViewsElement.
	
	rightVerticalContainer addChild: coderElement.
	rightVerticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self emptyViewExplanationWithLinksText).
	editor vFitContent.
	
	leftVerticalContainer addChild: editor.
	leftVerticalContainer addChild: allViewsInspectorContainer.
	container addChild: leftVerticalContainer.
	container addChild: rightVerticalContainer.
	^ container
]

{ #category : #accessing }
GtInspectorViews >> emptyViewExplanationWithLinksText [
	| text |
	text := 'There are times, when because of certain conditions, we do not want to offer a view for an object. This is where the empty view is useful.

By simply sending ' asRopedText,
('empty' asRopedText glamorousExplanationFor: #empty),
'to the incoming ' asRopedText,
('view' asRopedText glamorousExplanationFor: #aView),
', we tell the inspector we do not want the view to be visible at all.

As you can see in the example below, if the address book does not have any categories, the Contacts Tree view is empty so the tab does not appear on the tabs list.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #accessing }
GtInspectorViews >> explicitViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer verticalContainer editor coder coderElement selectors variables resultElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#explicit. #stencil:. #fullName. #address. #telephone. #avatar}.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {#self}.
	
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
			((self yellowTargetCircleWithExplanationModel: #fullName)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 160 @ 80))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #telephone)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 160 @ 127))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #address)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 160 @ 148))).
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #avatar)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 25 @ 70))).
	
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self explicitViewExplanationWithLinksText).
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #accessing }
GtInspectorViews >> explicitViewExplanationWithLinksText [
	| text |
	
	text := 'The ' asRopedText,
('explicit' asRopedText glamorousExplanationFor: #explicit),
' view lets you visualize an object in any way you want. Using the ' asRopedText,
('stencil: ' asRopedText glamorousExplanationFor: #stencil:),
' block you can give that visualization any shape or form. 

In this example, we show a ' asRopedText,
('contact' asRopedText glamorousExplanationFor: #self),
' as a business card. We displays its ' asRopedText,
('name' asRopedText glamorousExplanationFor: #fullName),
', ' asRopedText,
('telephone' asRopedText glamorousExplanationFor: #telephone),
', ' asRopedText,
('address' asRopedText glamorousExplanationFor: #address),
' and ' asRopedText,
('avatar' asRopedText glamorousExplanationFor: #avatar),
', all within a nice simple layout.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #accessing }
GtInspectorViews >> listViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer verticalContainer editor coder coderElement selectors variables resultElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#list. #title:. #items:. #itemFormat:. #allContacts. #fullName }.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {'aContact'}.
	
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
						globalPointToLocal: (resultInspectorView localPointToGlobal: 35 @ 50))).
	
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self listViewExplanationWithLinksText).
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #accessing }
GtInspectorViews >> listViewExplanationWithLinksText [
	| text |
	
	text := 'Lets take a look at a ' asRopedText,
('list' asRopedText glamorousExplanationFor: #list),
' view. It has a ' asRopedText,
('title' asRopedText glamorousExplanationFor: #title:),
' and a ' asRopedText,
('format' asRopedText glamorousExplanationFor: #itemFormat:),
' for the rows.

The number of rows it has it is exactly the number of elements in the collection returned by the ' asRopedText,
('items: block' asRopedText glamorousExplanationFor: #items:),
'. In this case, this means it shows all the ' asRopedText,
('contacts' asRopedText glamorousExplanationFor: #allContacts),
' in the address book.

For each ' asRopedText, 
('contact' asRopedText glamorousExplanationFor: #aContact),
' we show the ' asRopedText,
('full name' asRopedText glamorousExplanationFor: #fullName),
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

{ #category : #accessing }
GtInspectorViews >> textEditorViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer verticalContainer editor coder coderElement selectors variables resultElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#textEditor. #title:. #look:. #content. #text:}.
	
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
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #content)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 5 @ 55))).
	
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self textEditorViewExplanationWithLinksText).
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #accessing }
GtInspectorViews >> textEditorViewExplanationWithLinksText [
	| text |
	
	text := 'With the ' asRopedText,
('text editor' asRopedText glamorousExplanationFor: #textEditor),
' view we can print plain text on the screen.

The view gets a ' asRopedText,
('title' asRopedText glamorousExplanationFor: #title:),
', a ' asRopedText,
('look' asRopedText glamorousExplanationFor: #look:),
', in this case the default' asRopedText,
('code editor look' asRopedText glamorousExplanationFor: #BrGlamorousCodeEditorLook),
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

{ #category : #accessing }
GtInspectorViews >> treeViewExplanationWithLinks [
	<gtExample>
	| container resultInspectorContainer verticalContainer editor coder coderElement selectors variables resultElement resultInspectorHeader resultInspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	container := self mainContainerElement.
	container explainer isExplanationHolder: true.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#tree. #title:. #items:. #children:. #categories. #subcategories. #contacts}.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {#each}.
	
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
						
	resultInspectorContainer
		addChild:
			((self yellowTargetCircleWithExplanationModel: #categories)
				relocate:
					(resultInspectorContainer
						globalPointToLocal: (resultInspectorView localPointToGlobal: 35 @ 50))).
							
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultInspectorContainer.
	
	editor := self textEditorElementWithText: (self treeViewExplanationWithLinksText).
	container addChild: editor.
	container addChild: verticalContainer.
	^ container
]

{ #category : #accessing }
GtInspectorViews >> treeViewExplanationWithLinksText [
	| text |
	
	text := 'The ' asRopedText,
('tree' asRopedText glamorousExplanationFor: #tree),
' view displays the information as a tree structure, having parents and children.

As always, the first thing we mention is the ' asRopedText,
('title' asRopedText glamorousExplanationFor: #title:),
'. Then, in the ' asRopedText,
('items: block' asRopedText glamorousExplanationFor: #items:),
' we specify the first items in the tree, the parents where it starts from, in this case, the' asRopedText,
('categories' asRopedText glamorousExplanationFor: #categories),
' in the address book.

After that, in the ' asRopedText,
('children: block' asRopedText glamorousExplanationFor: #children:),
' we tell ' asRopedText,
('each parent' asRopedText glamorousExplanationFor: #each),
' the children it has, in this case the ' asRopedText,
('subcategories' asRopedText glamorousExplanationFor: #subcategories),
' and the ' asRopedText,
('contacts' asRopedText glamorousExplanationFor: #contacts),
'from that category.' asRopedText.

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
