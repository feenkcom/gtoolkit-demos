Class {
	#name : #GtInspectorViews,
	#superclass : #GtLiveShow,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #accessing }
GtInspectorViews >> columnedListViewExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 6;
		newTextWithFormat: ('Columned List' asRopedText glamorousRegularFont; fontSize: 30);
		newTextWithFormat: self columnedListViewExplanationWithLinksText;
		element: [self columnedListViewExplanationWithLinks].
]

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
	
	coder := GtMethodCoder
		forMethod: GtABAddressBook >> #gtViewContactsOn:.
		
	selectors := GtSelectorExplanationLinkStyler new coder: coder.
	selectors
		addSelectors:
			{#columnedList . #title: . #items: . #allContacts . #fullName . #avatar.
			#telephone}.
	selectors addSelector: #column:icon: withIdentifier: #columns.
	selectors addSelector: #column:text: withIdentifier: #columns.
	variables := GtVariableExplanationLinkStyler new coder: coder.
	variables addVariables: {'aContact'}.
	
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
			(aChild isKindOf: BrHorizontalPane) ].
	listLabelsCollection := resultInspectorTree
		allChildrenBreadthFirstSelect: [ :aChild | 
			(aChild isKindOf: BlTextElement)
				and: [ aChild parent parent isKindOf: GtPhlowCellElement ] ].
	resultInspectorContainer addChild: resultElement.
	titleTab
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate: 10 @ titleTab extent y / 2).
	avatarLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #columns)
				relocate: 5 @ avatarLabel extent y / 2).
	nameLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #columns)
				relocate: 5 @ nameLabel extent y / 2).
	phoneLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #columns)
				relocate: 5 @ phoneLabel extent y / 2).
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
GtInspectorViews >> columnedTreeExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 9;
		newTextWithFormat: ('Columned Tree' asRopedText glamorousRegularFont; fontSize: 30);
		newTextWithFormat: self columnedTreeViewExplanationWithLinksText;
		element: [self columnedTreeViewExplanationWithLinks].
]

{ #category : #accessing }
GtInspectorViews >> columnedTreeViewExplanationWithLinks [
	<gtExample>
	| resultInspectorContainer verticalContainer coder coderElement selectors literals resultElement resultInspectorTree contactLabel cityLabel countryLabel titleTab codeExplanationLabel resultExplanationLabel |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Contacts Address view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Contacts Address view result'.
	
	coder := GtMethodCoder new forMethod: (GtABAddressBook>>#gtViewContactsAddressOn:).
	
	selectors := GtSelectorExplanationLinkStyler new coder: coder.
	selectors addSelectors: {#columnedTree. #title:. #items:. #children:}.
	selectors addSelector: #column:item: withIdentifier: #column.
	
	literals := GtLiteralExplanationLinkStyler new coder: coder.
	literals addLiteral: #City withIdentifier: #name.
	literals addLiteral: #Country withIdentifier: #name.
	literals addLiteral: #Contact withIdentifier: #name.
		
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
					(5 @ contactLabel extent y / 2)).
	cityLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #column)
				relocate:
					(5 @ cityLabel extent y / 2)).
	countryLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #column)
				relocate:
					(5 @ countryLabel extent y / 2)).
	
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

{ #category : #accessing }
GtInspectorViews >> emptyViewExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 12;
		newTextWithFormat: ('Empty' asRopedText glamorousRegularFont; fontSize: 30);
		newTextWithFormat: self emptyViewExplanationWithLinksText;
		element: [self emptyViewExplanationWithLinks].
]

{ #category : #accessing }
GtInspectorViews >> emptyViewExplanationWithLinks [
	<gtExample>
	| resultInspectorContainer verticalContainer coder coderElement selectors variables literals resultElement codeExplanationLabel resultExplanationLabel inspectorHeader inspectorView |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Empty view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Emtpy view result'.
	
	coder := GtMethodCoder new forMethod: (GtABAddressBook>>#gtViewCategoriesTreeWithContactsOn:).
	
	selectors := GtSelectorExplanationLinkStyler new coder: coder.
	selectors addSelectors: {#empty}.
	
	literals := GtLiteralExplanationLinkStyler new coder: coder.
	literals addLiteral: 'Contacts Tree' withIdentifier: #viewName.
	
	variables := GtVariableExplanationLinkStyler new coder: coder.
	variables addVariables: {#aView}.
	
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
GtInspectorViews >> explicitViewExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 10;
		newTextWithFormat: ('Explicit' asRopedText glamorousRegularFont; fontSize: 30);
		newTextWithFormat: self explicitViewExplanationWithLinksText;
		element: [self explicitViewExplanationWithLinks].
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
	
	coder := GtMethodCoder new forMethod: (GtABContact>>#gtViewContactDetailsOn:).
	
	selectors := GtSelectorExplanationLinkStyler new coder: coder.
	selectors addSelectors: {#explicit. #stencil:. #fullName. #address. #telephone. #avatar}.
	
	variables := GtVariableExplanationLinkStyler new coder: coder.
	variables addVariables: {#self}.
	
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
		(aChild children isEmpty) and: [aChild parent parent isKindOf: BlScrollableElement ]]
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
GtInspectorViews >> listViewExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 5;
		newTextWithFormat: ('List' asRopedText glamorousRegularFont; fontSize: 30);
		newTextWithFormat: self listViewExplanationWithLinksText;
		element: [self listViewExplanationWithLinks].
]

{ #category : #accessing }
GtInspectorViews >> listViewExplanationWithLinks [
	<gtExample>
	| resultInspectorContainer verticalContainer coder coderElement selectors variables resultElement resultInspectorTree titleTab codeExplanationLabel resultExplanationLabel nameLabelsCollection |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Contacts List view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Contacts List view result'.
	
	coder := GtMethodCoder forMethod: (GtABAddressBook>>#gtViewContactsListOn:).
	
	selectors := GtSelectorExplanationLinkStyler new coder: coder.
	selectors addSelectors: {#list. #title:. #items:. #itemText:. #allContacts. #fullName }.
	
	variables := GtVariableExplanationLinkStyler new coder: coder.
	variables addVariables: {'aContact'}.
	
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
						(-5 @ eachLabel extent y / 2)). ].
	
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
('format' asRopedText glamorousExplanationFor: #itemText:),
' for the rows, in the form of a text element.
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
GtInspectorViews >> mondrianViewExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 7;
		newTextWithFormat: ('Mondrian' asRopedText glamorousRegularFont; fontSize: 30);
		newTextWithFormat: self mondrianViewExplanationWithLinksText;
		element: [self mondrianViewExplanationWithLinks].
]

{ #category : #accessing }
GtInspectorViews >> mondrianViewExplanationWithLinks [
	<gtExample>
	| resultInspectorContainer verticalContainer coder coderElement selectors resultElement resultInspectorTree titleTab codeExplanationLabel resultExplanationLabel |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Circular view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Circular view result'.
	
	coder := GtMethodCoder new forMethod: (GtABAddressBook>>#gtViewContactsIconsCircularOn:).
	
	selectors := GtSelectorExplanationLinkStyler new coder: coder.
	selectors addSelectors: {#mondrian. #painting:. #nodes. #layout. #circle. #contacts. #avatar. #shape:. #title:}.
	selectors addSelector: #allContacts withIdentifier: #contacts.
	
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
', we define nodes, edges and a layout for the view. In this context, the ' asRopedText,
('nodes' asRopedText glamorousExplanationFor: #nodes),
' are the ' asRopedText,
('contacts' asRopedText glamorousExplanationFor: #contacts),
' and each of them has a ' asRopedText,
('shape' asRopedText glamorousExplanationFor: #shape:),
' represented by their ' asRopedText,
('avatar' asRopedText glamorousExplanationFor: #avatar),
'.
Then we set the ' asRopedText,
('layout' asRopedText glamorousExplanationFor: #layout),
' to be a ' asRopedText,
('circle' asRopedText glamorousExplanationFor: #circle),
'.' asRopedText.
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtInspectorViews >> queriesSnippetsExamples [
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

{ #category : #accessing }
GtInspectorViews >> slideshowLinkSlideFor: aSlide [
	<gtSlide>
	^ aSlide slideshow
		priority: 2;
		textWithFormat: 'Want to learn more about the Pharo syntax? Follow the show below' asRopedText glamorousRegularFont;
		slideshow: [ GtPharo101 new ] withTitle: 'Pharo101'.
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
GtInspectorViews >> textEditorViewExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 11;
		newTextWithFormat: ('Text Editor' asRopedText glamorousRegularFont; fontSize: 30);
		newTextWithFormat: self textEditorViewExplanationWithLinksText;
		element: [self textEditorViewExplanationWithLinks].
]

{ #category : #accessing }
GtInspectorViews >> textEditorViewExplanationWithLinks [
	<gtExample>
	| resultInspectorContainer verticalContainer coder coderElement selectors variables resultElement resultInspectorTree titleTab contentEditorSegment codeExplanationLabel resultExplanationLabel |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Content view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Content view result'.
	
	coder := GtMethodCoder new forMethod: GtABContactNote>>#gtViewNoteContentOn:.
	
	selectors := GtSelectorExplanationLinkStyler new coder: coder.
	selectors addSelectors: {#textEditor. #title:. #look:. #content. #text:}.
	
	variables := GtVariableExplanationLinkStyler new coder: coder.
	variables addVariables: {#BrGlamorousCodeEditorLook}.
	
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
GtInspectorViews >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Inspector views' asRopedText
			fontSize: 70;
			glamorousRegularFont).
]

{ #category : #accessing }
GtInspectorViews >> treeViewExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 8;
		newTextWithFormat: ('Tree' asRopedText glamorousRegularFont; fontSize: 30);
		newTextWithFormat: self treeViewExplanationWithLinksText;
		element: [self treeViewExplanationWithLinks].
]

{ #category : #accessing }
GtInspectorViews >> treeViewExplanationWithLinks [
	<gtExample>
	| resultInspectorContainer verticalContainer coder coderElement selectors variables resultElement resultInspectorTree titleTab treeLabel codeExplanationLabel resultExplanationLabel categoryLabelsCollection |
	
	resultInspectorContainer := self resultInspectorContainerElement.
	verticalContainer := self verticalContainerElement.
	
	codeExplanationLabel := self explanationLabelWithText: 'Contents Tree view method'.
	resultExplanationLabel := self explanationLabelWithText: 'Contents Tree view result'.
	
	coder := GtMethodCoder new forMethod: (GtABAddressBook>>#gtViewCategoriesTreeWithContactsOn:).
	
	selectors := GtSelectorExplanationLinkStyler new coder: coder.
	selectors addSelectors: {#tree. #title:. #items:. #children:. #categories. #subcategories. #contacts}.
	
	variables := GtVariableExplanationLinkStyler new coder: coder.
	variables addVariables: {#each}.
	
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
' we specify the first items in the tree, the parents where it starts from, in this case, the ' asRopedText,
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

{ #category : #accessing }
GtInspectorViews >> viewsQueryExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 13;
		element: [self queriesSnippetsExamples];
		newFadedText: 'You can learn more from the many examples already in the image. Use the queries below to find them.'.
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
