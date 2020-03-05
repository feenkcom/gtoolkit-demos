Class {
	#name : #GtInspectorViews,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #tests }
GtInspectorViews >> columnedListViewExplanationWithLinks [
	<gtExample>
	| resultInspectorContainer verticalContainer coder coderElement selectors variables resultElement resultInspectorTree titleTab avatarLabel nameLabel phoneLabel codeExplanationLabel resultExplanationLabel avatarElementsCollection listLabelsCollection |
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	codeExplanationLabel := self
		explanationLabelWithText: 'Contacts with details view method'.
	resultExplanationLabel := self
		explanationLabelWithText: 'Contacts with details view result'.
	selectors := GtSelectorExplanationLinkStyler new.
	selectors
		addSelectors:
			{#columnedList . #title: . #items: . #allContacts . #fullName . #avatar.
			#telephone}.
	selectors addSelector: #column:do: withIdentifier: #columns.
	selectors addSelector: #column:format: withIdentifier: #columns.
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {'aContact'}.
	coder := GtMethodCoder
		forMethod: GtABAddressBook >> #gtViewContactsOn:.
	coder
		explanationLink:
			(GtCompositeExplanationLinkStyler
				forLinks:
					{selectors.
					variables}).
	coderElement := (coder expanded: true) asElement
		margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	resultElement := BlUseAsyncFeatures
		disableDuring: [ (GtPhlowView empty composite
				views:
					{(GtABCartoonAddressBookExample new cartoonAddressBook
						gtViewContactsOn: GtPhlowView empty)};
				labelled: 'a GtABAddressBook (Cartoons)' asRopedText)
				asElementDo: [ :e | e ] ].
	resultElement forceLayout.
	resultInspectorTree := resultElement phlow firstChildWithView viewContentElement.
	
	titleTab := resultInspectorTree
		allChildrenBreadthFirstDetect: [ :aChild | 
			(aChild isKindOf: BrTab)
				and: [ aChild label asString = 'Contacts with details' ] ]
		ifFound: [ :aChild | aChild ].
	avatarLabel := resultInspectorTree
		allChildrenBreadthFirstDetect:
			[ :aChild | (aChild isKindOf: BrLabel) and: [ aChild text asString = 'Avatar' ] ]
		ifFound: [ :aChild | aChild ].
	nameLabel := resultInspectorTree
		allChildrenBreadthFirstDetect:
			[ :aChild | (aChild isKindOf: BrLabel) and: [ aChild text asString = 'Name' ] ]
		ifFound: [ :aChild | aChild ].
	phoneLabel := resultInspectorTree
		allChildrenBreadthFirstDetect:
			[ :aChild | (aChild isKindOf: BrLabel) and: [ aChild text asString = 'Phone' ] ]
		ifFound: [ :aChild | aChild ].
	avatarElementsCollection := resultInspectorTree
		allChildrenBreadthFirstSelect: [ :aChild | 
			(aChild isKindOf: BlScalableElement)
				and: [ aChild parent parent isKindOf: BrInfiniteListElement ] ].
	listLabelsCollection := resultInspectorTree
		allChildrenBreadthFirstSelect: [ :aChild | 
			(aChild isKindOf: BrLabel)
				and: [ aChild parent parent isKindOf: BrInfiniteListElement ] ].
	resultInspectorContainer addChild: resultElement.
	titleTab
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate: 10 @ titleTab extent y / 2).
	avatarLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #columns)
				relocate: -5 @ avatarLabel extent y / 2).
	nameLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #columns)
				relocate: -5 @ nameLabel extent y / 2).
	phoneLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #columns)
				relocate: -5 @ phoneLabel extent y / 2).
	avatarElementsCollection
		do: [ :eachAvatar | 
			eachAvatar parent
				addChild:
					((self yellowTargetCircleWithExplanationModel: #avatar)
						relocate: 0 @ eachAvatar extent y / 2) ].
					
	listLabelsCollection
		do: [ :eachLabel | 
			| modelName |
			modelName := (eachLabel text asString beginsWith: '+' asString)
				ifTrue: [ #telephone ]
				ifFalse: [ #fullName ].
			eachLabel
				addChild:
					((self yellowTargetCircleWithExplanationModel: modelName)
						relocate: -5 @ eachLabel extent y / 2) ].
					
	verticalContainer addChild: codeExplanationLabel.
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultExplanationLabel.
	verticalContainer addChild: resultInspectorContainer.
	^ verticalContainer
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
	| resultInspectorContainer verticalContainer coder coderElement selectors literals resultElement resultInspectorTree contactLabel cityLabel countryLabel titleTab codeExplanationLabel resultExplanationLabel |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Contacts Address view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Contacts Address view result'.
	
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
	
	resultElement := BlUseAsyncFeatures disableDuring: [
	(GtPhlowView empty composite
		views: {GtABAddressBookExample new contactsAddressBookWithCategories gtViewContactsAddressOn: GtPhlowView empty};
		labelled: 'a GtABAddressBook (My contacts)' asRopedText) asElementDo: [ :e | e ]].
	resultElement forceLayout.
	resultInspectorTree := resultElement phlow firstChildWithView viewContentElement.
	
	titleTab := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild | 
		(aChild isKindOf: BrTab) and: [aChild label asString = 'Contacts Address']]
	ifFound: [:aChild | aChild].
	contactLabel := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild | 
		(aChild isKindOf: BrLabel) and: [aChild text asString = 'Contact']]
	ifFound: [:aChild | aChild].
	cityLabel := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild | 
		(aChild isKindOf: BrLabel) and: [aChild text asString = 'City']]
	ifFound: [:aChild | aChild].
	countryLabel := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild | 
		(aChild isKindOf: BrLabel) and: [aChild text asString = 'Country']]
	ifFound: [:aChild | aChild].	
	
	resultInspectorContainer addChild: resultElement.
	
	titleTab
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate:
					(10 @ titleTab extent y / 2)).
	contactLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #column)
				relocate:
					(-5 @ contactLabel extent y / 2)).
	cityLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #column)
				relocate:
					(-5 @ cityLabel extent y / 2)).
	countryLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #column)
				relocate:
					(-5 @ countryLabel extent y / 2)).
	
	verticalContainer addChild: codeExplanationLabel.
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultExplanationLabel.
	verticalContainer addChild: resultInspectorContainer.
	
	^ verticalContainer.
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
			(GtTextAndElementSlide new
				newTextWithFormat: self listViewExplanationWithLinksText;
				element: [self listViewExplanationWithLinks]).
			(GtTextAndElementSlide new
				newTextWithFormat: self columnedListViewExplanationWithLinksText;
				element: [self columnedListViewExplanationWithLinks]).
			(GtTextAndElementSlide new
				newTextWithFormat: self mondrianViewExplanationWithLinksText;
				element: [self mondrianViewExplanationWithLinks]).
			(GtTextAndElementSlide new
				newTextWithFormat: self treeViewExplanationWithLinksText;
				element: [self treeViewExplanationWithLinks]).
			(GtTextAndElementSlide new
				newTextWithFormat: self columnedTreeViewExplanationWithLinksText;
				element: [self columnedTreeViewExplanationWithLinks]).
			(GtTextAndElementSlide new
				newTextWithFormat: self explicitViewExplanationWithLinksText;
				element: [self explicitViewExplanationWithLinks]).
			(GtTextAndElementSlide new
				newTextWithFormat: self textEditorViewExplanationWithLinksText;
				element: [self textEditorViewExplanationWithLinks]).
			(GtTextAndElementSlide new
				newTextWithFormat: self emptyViewExplanationWithLinksText;
				element: [self emptyViewExplanationWithLinks]).
			(GtElementSlide new
				element: [self queriesSnippetsSlide]).}.
	
	^ show.
]

{ #category : #accessing }
GtInspectorViews >> emptyViewExplanationWithLinks [
	<gtExample>
	| resultInspectorContainer verticalContainer coder coderElement selectors variables literals resultElement codeExplanationLabel resultExplanationLabel inspectorHeader inspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Empty view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Emtpy view result'.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#empty}.
	
	literals := GtLiteralExplanationLinkStyler new.
	literals addLiteral: 'Contacts Tree' withIdentifier: #viewName.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {#aView}.
	
	coder := GtMethodCoder new forMethod: (GtABAddressBook>>#gtViewCategoriesTreeWithContactsOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables. literals }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := (GtABAddressBookExample new myContactsAddressBook gtViewsFor: GtPhlowView empty) asElementDo: [ :e | e ].
	resultElement forceLayout.
	inspectorHeader := resultElement phlow firstChildWithView.
	
	resultInspectorContainer addChild: resultElement.
	inspectorView := inspectorHeader viewContentElement phlow firstChildWithView.
	
	inspectorHeader
		addChild:
			((self yellowTargetCircleWithExplanationModel: #inspector)
				relocate:
					(inspectorHeader position)).
	inspectorView
		addChild:
			((self yellowTargetCircleWithExplanationModel: #viewTabs)
				relocate:
					(inspectorView position)).
	
	verticalContainer addChild: codeExplanationLabel.
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultExplanationLabel.
	verticalContainer addChild: resultInspectorContainer.
	
	^ verticalContainer.
]

{ #category : #accessing }
GtInspectorViews >> emptyViewExplanationWithLinksText [
	| text |
	text := 'There are times, when because of certain conditions, we do not want to offer a view for an object. This is where the empty view is useful.

By simply sending ' asRopedText,
('empty' asRopedText glamorousExplanationFor: #empty),
'to the incoming ' asRopedText,
('view' asRopedText glamorousExplanationFor: #aView),
', we tell the ' asRopedText,
('inspector' asRopedText glamorousExplanationFor: #inspector),
' we do not want the view to be visible at all.

As you can see in the example below, if the address book does not have any categories, the ' asRopedText,
('Contacts Tree' asRopedText glamorousExplanationFor: #viewName),
' view is empty so the tab does not appear on the ' asRopedText,
('tabs list' asRopedText glamorousExplanationFor: #viewTabs),
'.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> explanationLabelWithText: aText [
	^ BrLabel new
		text: (aText asRopedText glamorousRegularFont; fontSize: 15; foreground: Color gray);
		margin: (BlInsets top: 20 right: 0 bottom: 0 left: 10);
		look: BrGlamorousLabelLook new.
]

{ #category : #accessing }
GtInspectorViews >> explicitViewExplanationWithLinks [
	<gtExample>
	| resultInspectorContainer verticalContainer coder coderElement selectors variables resultElement resultInspectorTree nameTextElement addressTextElement phoneTextElement avatarElement codeExplanationLabel resultExplanationLabel |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	resultInspectorContainer height: 250.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Details view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Details view result'.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#explicit. #stencil:. #fullName. #address. #telephone. #avatar}.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {#self}.
	
	coder := GtMethodCoder new forMethod: (GtABContact>>#gtViewContactDetailsOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := BlUseAsyncFeatures disableDuring: [
	(GtPhlowView empty composite
		views: {GtABAddressBookExample new janeDoeContact gtViewContactDetailsOn: GtPhlowView empty};
		labelled: 'a GtABContact (Jane Doe)' asRopedText) asElementDo: [ :e | e ]].
	resultElement forceLayout.
	resultInspectorTree := resultElement phlow firstChildWithView viewContentElement.
	
	nameTextElement := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild | 
		(aChild isKindOf: BlTextElement) and: [aChild text asString = 'Jane Doe']]
	ifFound: [:aChild | aChild].
	phoneTextElement := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild | 
		(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = '+41-074574363']]
	ifFound: [:aChild | aChild].
	addressTextElement := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild | 
		(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = 'Bern,']]
	ifFound: [:aChild | aChild].
	avatarElement := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild | 
		(aChild children isEmpty) and: [aChild parent parent phlow isView ]]
	ifFound: [:aChild | aChild].
		
	resultInspectorContainer addChild: resultElement.
	
	nameTextElement
		addChild:
			((self yellowTargetCircleWithExplanationModel: #fullName)
				relocate:
					(-5 @ nameTextElement extent y / 2)).
	phoneTextElement
		addChild:
			((self yellowTargetCircleWithExplanationModel: #telephone)
				relocate:
					(-5 @ phoneTextElement extent y / 2)).
	addressTextElement
		addChild:
			((self yellowTargetCircleWithExplanationModel: #address)
				relocate:
					(-5 @ addressTextElement extent y / 2)).
	avatarElement
		addChild:
			((self yellowTargetCircleWithExplanationModel: #avatar)
				relocate:
					(avatarElement position)).
	
	verticalContainer addChild: codeExplanationLabel.
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultExplanationLabel.
	verticalContainer addChild: resultInspectorContainer.
	
	^ verticalContainer.
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
	| resultInspectorContainer verticalContainer coder coderElement selectors variables resultElement resultInspectorTree titleTab codeExplanationLabel resultExplanationLabel nameLabelsCollection |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Contacts List view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Contacts List view result'.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#list. #title:. #items:. #itemFormat:. #allContacts. #fullName }.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {'aContact'}.
	
	coder := GtMethodCoder forMethod: (GtABAddressBook>>#gtViewContactsListOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := BlUseAsyncFeatures disableDuring: [
	(GtPhlowView empty composite
		views: {GtABCartoonAddressBookExample new cartoonAddressBook gtViewContactsListOn: GtPhlowView empty};
		labelled: 'a GtABAddressBook (Cartoons)' asRopedText) asElementDo: [ :e | e ]].
	resultElement forceLayout.
	resultInspectorTree := resultElement phlow firstChildWithView viewContentElement.
	
	titleTab := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild | 
		(aChild isKindOf: BrTab) and: [aChild label asString = 'Contacts List']]
	ifFound: [:aChild | aChild].
	nameLabelsCollection := resultInspectorTree
	allChildrenBreadthFirstSelect: [:aChild | 
		(aChild isKindOf: BrLabel) and: [aChild parent parent isKindOf: BrInfiniteListElement]].
	
	resultInspectorContainer addChild: resultElement.
	
	titleTab
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate:
					(10 @ titleTab extent y / 2)).
	nameLabelsCollection do: [ :eachLabel |
		eachLabel
			addChild:
				((self yellowTargetCircleWithExplanationModel: #fullName)
					relocate:
						(0 @ eachLabel extent y / 2)). ].
	
	verticalContainer addChild: codeExplanationLabel.
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultExplanationLabel.
	verticalContainer addChild: resultInspectorContainer.
	
	^ verticalContainer.
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

{ #category : #accessing }
GtInspectorViews >> mondrianViewExplanationWithLinks [
	<gtExample>
	| resultInspectorContainer verticalContainer coder coderElement selectors resultElement resultInspectorTree titleTab codeExplanationLabel resultExplanationLabel |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Circular view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Circular view result'.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#mondrian. #painting:. #nodes. #layout. #circle. #contacts. #avatar. #shape:. #title:}.
	
	coder := GtMethodCoder new forMethod: (GtABAddressBook>>#gtViewContactsIconsCircularOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors }).
	coderElement := (coder expanded: true) asElement.
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := (GtPhlowView empty composite
		views: {GtABCartoonAddressBookExample new cartoonAddressBook gtViewContactsIconsCircularOn: GtPhlowView empty};
		labelled: 'a GtABAddressBook (Cartoons)') asElementDo: [ :e | e ].
	resultElement forceLayout.
	resultInspectorTree := resultElement phlow firstChildWithView viewContentElement.
	
	titleTab := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild | 
		(aChild isKindOf: BrTab) and: [aChild label asString = 'Circular']]
	ifFound: [:aChild | aChild].
		
	resultInspectorContainer addChild: resultElement.
	
	titleTab
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate:
					(10 @ titleTab extent y / 2)).
	
	verticalContainer addChild: codeExplanationLabel.
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultExplanationLabel.
	verticalContainer addChild: resultInspectorContainer.
	
	^ verticalContainer.
]

{ #category : #accessing }
GtInspectorViews >> mondrianViewExplanationWithLinksText [
	| text |
	
	text := 'The ' asRopedText,
('mondrian' asRopedText glamorousExplanationFor: #mondrian),
' view allows us to see an object in different layouts using graph like representations.

After the ' asRopedText,
('title' asRopedText glamorousExplanationFor: #title:),
', in the ' asRopedText,
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

{ #category : #'as yet unclassified' }
GtInspectorViews >> queriesSnippetsSlide [
	<gtExample>
	| container |
	
	container := GtPlaygroundSlide new
						snippets:
							{
								'"Show all the methods that use the gtView pragma"
#gtView gtPragmas'.
								'"Select only the methods that implement a list view"
#gtView gtPragmas & #list gtReferences'.
								'"Select only the methods that implement a columned list view"
#gtView gtPragmas & #columnedList gtReferences'.
								'"Now the mondrian view"
#gtView gtPragmas & #mondrian gtReferences'.
								'"The tree view"
#gtView gtPragmas & #tree gtReferences'.
								'"The columned tree view"
#gtView gtPragmas & #columnedTree gtReferences'.
								'"explicit view"
#gtView gtPragmas & #explicit gtReferences'.
								'"text editor view"
#gtView gtPragmas & #textEditor gtReferences'.
								'"empty view"
#gtView gtPragmas & #empty gtReferences'};
						asElement.
	
	^ container.
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
	^ (BrEditor new
		look: (BrGlamorousRegularEditorLook new fontSize: 16; lineSpacing: 2);
		text: aText;
		vFitContent; 
		hMatchParent) asScalableElement 
			maxScale: 1;
			margin: (BlInsets all: 50);
			constraintsDo: [ :c | c linear weight: 0.3]
]

{ #category : #accessing }
GtInspectorViews >> textEditorViewExplanationWithLinks [
	<gtExample>
	| resultInspectorContainer verticalContainer coder coderElement selectors variables resultElement resultInspectorTree titleTab contentEditorSegment codeExplanationLabel resultExplanationLabel |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Content view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Content view result'.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#textEditor. #title:. #look:. #content. #text:}.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {#BrGlamorousCodeEditorLook}.
	
	coder := GtMethodCoder new forMethod: GtABContactNote>>#gtViewNoteContentOn:.
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := BlUseAsyncFeatures disableDuring: [
	(GtPhlowView empty composite
		views: {GtABAddressBookExample new contactNote gtViewNoteContentOn: GtPhlowView empty};
		labelled: 'a GtABContactNote' asRopedText) asElementDo: [ :e | e ]].
	resultElement forceLayout.
	resultInspectorTree := resultElement phlow firstChildWithView viewContentElement.
	
	titleTab := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild |
		(aChild isKindOf: BrTab) and: [aChild label asString = 'Content']]
	ifFound: [:aChild | aChild].
	contentEditorSegment := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild |
		(aChild isKindOf: BrTextEditorSegmentElement)]
	ifFound: [:aChild | aChild].
	
	resultInspectorContainer addChild: resultElement.
	
	titleTab
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate:
					(10 @ titleTab extent y / 2)).
	contentEditorSegment
		addChild:
			((self yellowTargetCircleWithExplanationModel: #content)
				relocate:
					(-5 @ contentEditorSegment extent y /2)).
	
	verticalContainer addChild: codeExplanationLabel.
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultExplanationLabel.
	verticalContainer addChild: resultInspectorContainer.
	
	^ verticalContainer.
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
	| resultInspectorContainer verticalContainer coder coderElement selectors variables resultElement resultInspectorTree titleTab treeLabel codeExplanationLabel resultExplanationLabel categoryLabelsCollection |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Contents Tree view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Contents Tree view result'.
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: {#tree. #title:. #items:. #children:. #categories. #subcategories. #contacts}.
	
	variables := GtVariableExplanationLinkStyler new.
	variables addVariables: {#each}.
	
	coder := GtMethodCoder new forMethod: (GtABAddressBook>>#gtViewCategoriesTreeWithContactsOn:).
	coder explanationLink: (GtCompositeExplanationLinkStyler forLinks: { selectors. variables }).
	coderElement := (coder expanded: true) asElement margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	resultElement := BlUseAsyncFeatures disableDuring: [
		(GtPhlowView empty composite
			views: {GtABAddressBookExample new contactsAddressBookWithCategories gtViewCategoriesTreeWithContactsOn: GtPhlowView empty};
			labelled: 'a GtABAddressBook (My Contacts)' asRopedText) asElementDo: [ :e | e ]].
	resultElement forceLayout.
	
	resultInspectorTree := resultElement phlow firstChildWithView viewContentElement.
	
	titleTab := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild | 
		(aChild isKindOf: BrTab) and: [aChild label asString = 'Contacts Tree']]
	ifFound: [:aChild | aChild].
	treeLabel := resultInspectorTree
	allChildrenBreadthFirstDetect: [:aChild | 
		(aChild isKindOf: BrLabel) and: [aChild text asString = 'Family']]
	ifFound: [:aChild | aChild].
	categoryLabelsCollection := resultInspectorTree
	allChildrenBreadthFirstSelect: [:aChild | 
		(aChild isKindOf: BrLabel) and: [aChild parent parent parent isKindOf: BrInfiniteTreeElement ]].
	
	resultInspectorContainer addChild: resultElement.
	
	titleTab
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate:
					(10 @ titleTab extent y / 2)).
						
	"treeLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #categories)
				relocate:
					(-5 @ treeLabel extent y / 2))."
	categoryLabelsCollection do: [ :eachLabel |
		eachLabel
			addChild:
				((self yellowTargetCircleWithExplanationModel: #categories)
					relocate:
						(-5 @ eachLabel extent y / 2)) ].
	
	verticalContainer addChild: codeExplanationLabel.						
	verticalContainer addChild: coderElement.
	verticalContainer addChild: resultExplanationLabel.
	verticalContainer addChild: resultInspectorContainer.
	
	^ verticalContainer.
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
