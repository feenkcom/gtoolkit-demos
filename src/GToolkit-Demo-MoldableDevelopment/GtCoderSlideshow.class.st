Class {
	#name : #GtCoderSlideshow,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #accessing }
GtCoderSlideshow >> advancedMethodsFilteringExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 10;
		newTextWithFormat: self advancedMethodsFilteringExplanationText;
		element: [ self advancedMethodsFilteringExplanationWithLinks ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtCoderSlideshow >> advancedMethodsFilteringExplanationText [
	| text |
	text := 'The second option for filtering is by clicking on the ' asRopedText,
('dropdown' asRopedText glamorousExplanationFor: #dropdown),
' button where you can search for by multiple criterias. Then you can type your search string in the adjacent ' asRopedText,
('field' asRopedText glamorousExplanationFor: #field),
'.
You can add multiple filters by clicking on the small ' asRopedText,
('+' asRopedText glamorousExplanationFor: #addFilterButton),
' button next to those fields. This will perform an OR between the filters.
This method gives you more flexibility to filter.' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtCoderSlideshow >> advancedMethodsFilteringExplanationWithLinks [
	<gtExample>
	| coderElement categoryTarget fieldTarget addTarget |
	coderElement := BlUseAsyncFeatures
		disableDuring: [ (GtClassCoderLiveSlide new class: GtABAddressBook) asElement ].
	
	coderElement
		allChildrenBreadthFirstDetect: [:aChild |
			aChild isKindOf: GtFilterTagElement]
		ifFound: [:aChild |
			categoryTarget := aChild childAt: 1.
			fieldTarget := aChild.
			addTarget := aChild parent childAt: 2].
	
	categoryTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #dropdown)
					relocate:
						(2 @ categoryTarget extent y / 2)).
	fieldTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #field)
					relocate:
						(150 @ fieldTarget extent y / 2)).
	addTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #addFilterButton)
					relocate:
						(2 @ addTarget extent y / 2)).
	
	^ BlElement new
		constraintsDo: [:c |
			c vertical matchParent.
			c horizontal matchParent];
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 5);
		addChild: coderElement.
]

{ #category : #accessing }
GtCoderSlideshow >> baselineMethodsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 11;
		newTextWithFormat: self baselineMethodsExplanationText;
		element: [ self baselineMethodsExplanationWithLinks ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtCoderSlideshow >> baselineMethodsExplanationText [
	| text |
	text := 'The coder also offers different customizations. For example, here you can see the ' asRopedText,
('baseline' asRopedText glamorousExplanationFor: #baseline),
' defining the dependencies of the Bloc project. Each dependency is represented by a ' asRopedText,
('string' asRopedText glamorousExplanationFor: #string),
' denoting its name. Coder recognizes this and allows us to expand ' asRopedText,
('expand' asRopedText glamorousExplanationFor: #expandButton),
' the string in place and browse the corresponding dependency.' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtCoderSlideshow >> baselineMethodsExplanationWithLinks [
	<gtExample>
	| classCoderElement aScripter baselineTarget expandBaselineTarget pragmaTarget expandedMethodElement |
	
	classCoderElement := (GtClassCoderLiveSlide new class: BaselineOfGToolkit; expandMethodAt: 1) asElement.
	
	expandedMethodElement := classCoderElement
		allChildrenBreadthFirstDetect: [:aChild |
			aChild isKindOf: BrInfiniteListElement]
		ifFound: [:aChild | aChild childAt: 1].
	pragmaTarget := expandedMethodElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = '<baseline>' asString]]
		ifFound: [:aChild | aChild].
	baselineTarget := expandedMethodElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = '''GToolkitClipboard''' asString]]
		ifFound: [:aChild | aChild].
	expandBaselineTarget := baselineTarget parent
		allChildrenBreadthFirstDetect: [:aChild | aChild isKindOf: BrTriangle ]
		ifFound: [:aChild | aChild].
	
	pragmaTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #baseline)
					relocate:
						(2 @ pragmaTarget extent y / 2)).
	baselineTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #string)
					relocate:
						(2 @ baselineTarget extent y / 2)).
	expandBaselineTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #expandButton)
					relocate:
						(2 @ expandBaselineTarget extent y / 2)).
	
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Add Coder Element'
		do: [ :aStep | 
			aStep set
				label: 'Coder';
				element: [ classCoderElement ].
			aStep wait forEmptySpaceTaskQueue ].
	aScripter
		substep: 'Click coder'
		do: [ :aStep | 
			aStep click
				label: 'Expand baseline in place';
				onBreadthFirstChildOfClass: GtBehaviorCoderElement;
				onBreadthFirstChildOfClass: BrTabGroup;
				onChildAt: 2;
				onBreadthFirstChildOfClass: GtMethodsCoderElement;
				onBreadthFirstChildOfClass: BrInfiniteListElement;
				onChildAt: 1;
				onChildAt: 2;
				onBreadthFirstChildOfClass: GtSourceCoderEditorElement;
				onChildAt: 8;
				onBreadthFirstChildOfClass: BrTriangle.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.	
	^ BlElement new
		constraintsDo: [:c |
			c vertical matchParent.
			c horizontal matchParent];
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 5);
		addChild: aScripter elementWithoutParent.
]

{ #category : #accessing }
GtCoderSlideshow >> basicMethodsFilteringExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 9;
		newTextWithFormat: self basicMethodsFilteringExplanationText;
		element: [ self basicMethodsFilteringExplanationWithLinks ];
		elementWeight: 0.6;
		onEveryAddToSceneGraphDo: 
			[:anElement |
				| coderElement button |
				coderElement := anElement childAt: 2.
				coderElement enqueueTask: (BlTaskAction new
					action: [
						button := coderElement
							allChildrenBreadthFirstDetect: [:aChild |
								(aChild isKindOf: BrToolbar) and: [aChild parent parent parent isKindOf: BrTabGroup]]
							ifFound: [:aChild | aChild childAt: 1].
						BlSpace simulateClickOn: button.
						BlSpace simulateClickOn: button])].
]

{ #category : #accessing }
GtCoderSlideshow >> basicMethodsFilteringExplanationText [
	| text |
	text := 'There are two ways through which you can filter the methods. The first one is by clicking on the ' asRopedText,
('filter button' asRopedText glamorousExplanationFor: #filterButton),
'. This opens a pop-up with three choices to search by: category, instance variable or class variable. Choosing one will filter the methods according to that choice.' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtCoderSlideshow >> basicMethodsFilteringExplanationWithLinks [
	| coderElement filterButton |
	coderElement := BlUseAsyncFeatures
		disableDuring: [ (GtClassCoderLiveSlide new class: GtABAddressBook) asElement ].
	
	filterButton := coderElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrToolbar) and: [aChild parent parent parent isKindOf: BrTabGroup]]
		ifFound: [:aChild | aChild childAt: 1].
	filterButton
		addChild:
			((self yellowTargetCircleWithExplanationModel: #filterButton)
					relocate:
						(2 @ filterButton extent y / 2)).
						
	^ BlElement new
		constraintsDo: [:c |
			c vertical matchParent.
			c horizontal matchParent];
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 5);
		addChild: coderElement.
]

{ #category : #accessing }
GtCoderSlideshow >> classCoderInterfaceExplanationText [
	| text |
	
	text := 'Focusing on the class coder, it has a header section where you can find the ' asRopedText,
('class name' asRopedText glamorousExplanationFor: #className),
', alongside a ' asRopedText,
('remove button' asRopedText glamorousExplanationFor: #removeButton),
' to delete the class and an ' asRopedText,
('expand button' asRopedText glamorousExplanationFor: #expandHeaderButton),
' that shows you details about the class, such as the superclass, instance variables, class variables and traits.

Under the header, there is a tab group where we can select to see the ' asRopedText,
('methods' asRopedText glamorousExplanationFor: #methodsTab),
' of this class, the class ' asRopedText,
('comment' asRopedText glamorousExplanationFor: #commentTab),
' and the ' asRopedText,
('references' asRopedText glamorousExplanationFor: #referencesTab),
' of this class. On top of that there are two buttons, one for ' asRopedText,
('adding methods' asRopedText glamorousExplanationFor: #addMethodButton),
' and one for ' asRopedText,
('filtering methods' asRopedText glamorousExplanationFor: #filterButton),
'.

Finally, there is the list of methods, where each one can be ' asRopedText,
('expanded' asRopedText glamorousExplanationFor: #expandMethod),
' so you can edit, ' asRopedText,
('save' asRopedText glamorousExplanationFor: #saveMethod),
' or ' asRopedText,
('delete' asRopedText glamorousExplanationFor: #deleteMethod),
' the code from that method.' asRopedText.

	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtCoderSlideshow >> classCoderInterfaceExplanationWithLinks [
	| classCoderElement classNameTarget removeClassTarget expandHeaderTarget methodsTabTarget referencesTabTarget commentTabTarget addMethodTarget filterMethodsTarget expandMethodTarget saveMethodTarget removeMethodTarget buttonsList |
	
	classCoderElement := BlUseAsyncFeatures
		disableDuring: [ 
			(GtClassCoderLiveSlide new 
				class: GtABAddressBook;
				expandMethodAt: 3) asElement ].
	
	classNameTarget := classCoderElement
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = 'GtABAddressBook' asString]]
		ifFound: [:aChild | aChild].
	removeClassTarget := classCoderElement
		allChildrenBreadthFirstDetect: [:aChild | 
			aChild isKindOf: GtPreviewChangeButton]
		ifFound: [:aChild | aChild].
	expandHeaderTarget := classCoderElement
		allChildrenBreadthFirstDetect: [:aChild | 
			aChild isKindOf: GtBehaviorDefinitionCoderElement]
		ifFound: [:aChild | aChild childAt: 1].
	methodsTabTarget := classCoderElement
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: BlTextElement) and: [aChild text asString = 'Methods' asString]]
		ifFound: [:aChild | aChild].
	referencesTabTarget := classCoderElement
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: BlTextElement) and: [aChild text asString = 'References' asString]]
		ifFound: [:aChild | aChild].
	commentTabTarget := classCoderElement
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: BlTextElement) and: [aChild text asString = 'Comment' asString]]
		ifFound: [:aChild | aChild].
	expandMethodTarget := classCoderElement
		allChildrenBreadthFirstDetect: [:aChild | 
			aChild isKindOf: BrInfiniteListElement]
		ifFound: [:aChild | (aChild childAt: 3) childAt: 1].
		
	buttonsList := classCoderElement
		allChildrenBreadthFirstSelect: [:aChild |
			(aChild isKindOf: BrButton) and: [aChild parent isKindOf: BrToolbar]].
	addMethodTarget := buttonsList at: 2.
	filterMethodsTarget := buttonsList at: 1.
	saveMethodTarget := buttonsList at: 3.
	removeMethodTarget := buttonsList at: 4.
	
	classNameTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #className)
					relocate:
						(2 @ classNameTarget extent y / 2)).
	removeClassTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #removeButton)
					relocate:
						(2 @ removeClassTarget extent y / 2)).
	expandHeaderTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #expandHeaderButton)
					relocate:
						(5 @ expandHeaderTarget extent y / 2)).
	methodsTabTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #methodsTab)
					relocate:
						(5 @ methodsTabTarget extent y / 2)).
	commentTabTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #commentTab)
					relocate:
						(5 @ commentTabTarget extent y / 2)).
	referencesTabTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #referencesTab)
					relocate:
						(5 @ referencesTabTarget extent y / 2)).
	expandMethodTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #expandMethod)
					relocate:
						(5 @ expandMethodTarget extent y / 2)).
	addMethodTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #addMethodButton)
					relocate:
						(5 @ addMethodTarget extent y / 2)).
	filterMethodsTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #filterButton)
					relocate:
						(5 @ filterMethodsTarget extent y / 2)).
	saveMethodTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #saveMethod)
					relocate:
						(5 @ saveMethodTarget extent y / 2)).
	removeMethodTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #deleteMethod)
					relocate:
						(5 @ removeMethodTarget extent y / 2)).

	^ BlElement new
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 5);
		addChild: classCoderElement.
]

{ #category : #accessing }
GtCoderSlideshow >> classCreationExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 7;
		newTextWithFormat: self createClassExplanationText;
		element: [ self createClassExplanationWithLinks ];
		elementWeight: 0.6;
		onEveryAddToSceneGraphDo: 
			[:anElement |
				| coderElement button |
				coderElement := anElement childAt: 2.
				coderElement enqueueTask: (BlTaskAction new
					action: [
						button := coderElement
							allChildrenBreadthFirstDetect: [:aChild |
								(aChild isKindOf: BrToolbar) and: [aChild parent isKindOf: GtCoderToolbarElement]]
							ifFound: [:aChild | aChild childAt: 3].
						BlSpace simulateClickOn: button])].
]

{ #category : #accessing }
GtCoderSlideshow >> coderExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 13;
		newFadedText: ('Feel free to explore.' asRopedText);
		element: [GtCoder new createInPager maximized].
]

{ #category : #accessing }
GtCoderSlideshow >> coderExplanationText [
	| text |
	text := 'Coder is the place where you can manage your code. It offers you the means through which you can manipulate static code. You can create and manage packages, classes and methods all in place.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtCoderSlideshow >> coderInterfaceExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 6;
		newTextWithFormat: self coderInterfaceExplanationText;
		element: [ self coderInterfaceExplanationWithLinks ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtCoderSlideshow >> coderInterfaceExplanationText [
	| text |
	text := 'The coder interface is formed from multiple sections. It has a ' asRopedText,
('package hierarchy' asRopedText glamorousExplanationFor: #packageHierarchy),
' showing you all the packages, with the current one being selected, a ' asRopedText,
('class hierarchy' asRopedText glamorousExplanationFor: #classHierarchy),
' that displays the class inheritance tree and a ' asRopedText,
('class coder' asRopedText glamorousExplanationFor: #classCoder),
' where you can see and edit all the information about your class.

On top of that there is an ' asRopedText,
('add button' asRopedText glamorousExplanationFor: #addClassButton),
' for creating new classes and a ' asRopedText,
('spotter button' asRopedText glamorousExplanationFor: #spotterButton),
' to open a spotter in the context of the current class.' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtCoderSlideshow >> coderInterfaceExplanationWithLinks [
	<gtExample>
	| coderElement packageHierarchyTarget classHierarchyTarget classCoderTarget addClassButtonTarget spotterButtonTarget buttons |
	
	coderElement := BlUseAsyncFeatures
		disableDuring: [ (GtCoder forClass: GtABAddressBook) createInPager maximized ].
	
	packageHierarchyTarget := coderElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BlTextElement) and: [aChild text asString = 'Package Hierarchy' asString]] 
		ifFound: [:aChild | aChild].
	classHierarchyTarget := coderElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BlTextElement) and: [aChild text asString = 'Class Hierarchy' asString]] 
		ifFound: [:aChild | aChild].
	classCoderTarget := coderElement
		allChildrenBreadthFirstDetect: [:aChild |
			aChild isKindOf: GtBehaviorCoderElement]
		ifFound: [:aChild | aChild].
	buttons := coderElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrToolbar) and: [aChild parent isKindOf: GtCoderToolbarElement]] 
		ifFound: [:aChild | aChild].
	addClassButtonTarget := buttons childAt: 3.
	spotterButtonTarget := buttons childAt: 1.
	
	packageHierarchyTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #packageHierarchy)
					relocate:
						(2 @ 10)).
	classHierarchyTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #classHierarchy)
					relocate:
						(2 @ 10)).
	classCoderTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #classCoder)
					relocate:
						(5 @ 20)).
	addClassButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #addClassButton)
					relocate:
						(5 @ 10)).
	spotterButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #spotterButton)
					relocate:
						(5 @ 10)).	
							
	^ coderElement.
]

{ #category : #accessing }
GtCoderSlideshow >> coderMashExample [
	<gtExample>
	^ (GtMashExampleLiveSlide new
		leftElement: 
			(BlElement new
				look: BrShadowLook;
				background: Color white;
				addChild: ((GtClassCoderLiveSlide new 
					class: GtBehaviorCoder;
					expandHeader: true) asElement));
		centerElement:
			(BlElement new
				look: BrShadowLook;
				background: Color white;
				addChild: ((GtClassCoderLiveSlide new
					class: GtCoderSlideshow;
					expandMethodAt: 3) asElement));
		rightElement:
			(BlElement new
				margin: (BlInsets all: 5);
				addChild: (((GtMethodCoder 
					forMethod: GtABAddressBookExample>>#myContactsAddressBook) asCoderUIModel
						expanded:true) asElement))) asElement.
]

{ #category : #accessing }
GtCoderSlideshow >> coderMashExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 5;
		newTextWithFormat: self coderExplanationText;
		element: [ self coderMashExample ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtCoderSlideshow >> createClassExplanationText [
	| text |
	text := 'To create a new class, you click on the ' asRopedText,
('+' asRopedText glamorousExplanationFor: #addClassButton),
' button in the top right of the pane. That will open a pop-up similar to the expanded class header. There you can edit the name of the class, the superclass, the package, traits, instance and class variable.' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtCoderSlideshow >> createClassExplanationWithLinks [
	| coderElement buttonTarget |
	coderElement := BlUseAsyncFeatures
		disableDuring: [ (GtCoder forClass: GtABAddressBook) createInPager maximized ].
		
	buttonTarget := coderElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrToolbar) and: [aChild parent isKindOf: GtCoderToolbarElement]]
		ifFound: [:aChild | aChild childAt: 3].
	buttonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #addClassButton)
				relocate:
					(2 @ 10)).
					
	^ BlElement new
		constraintsDo: [:c |
			c vertical matchParent.
			c horizontal matchParent];
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 5);
		addChild: coderElement.
]

{ #category : #accessing }
GtCoderSlideshow >> createMethodExplanationText [
	| text |
	text := 'Similar, if you want to create a new method you simply click on the other ' asRopedText,
('+' asRopedText glamorousExplanationFor: #addMethodButton),
' button, right and above the list of methods. This opens a new ' asRopedText,
('method frame' asRopedText glamorousExplanationFor: #method),
' where you can write the name and the code of your method. Finally you can ' asRopedText,
('save' asRopedText glamorousExplanationFor: #saveMethodButton),
' the code or ' asRopedText,
('delete' asRopedText glamorousExplanationFor: #deleteMethodButton),
' it, if you don''t like it' asRopedText.
		
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtCoderSlideshow >> createMethodExplanationWithLinks [
	<gtExample>
	| classCoderElement addMethodButton aScripter newFrameTarget saveButtonTarget removeButtonTarget |
	
	classCoderElement := BlUseAsyncFeatures
		disableDuring: [ (GtClassCoderLiveSlide new class: GtABAddressBook) asElement ].
		
	aScripter := BlDevScripter new
		element: classCoderElement.
	aScripter
		substep: 'Click coder'
		do: [ :aStep | 
			aStep click
				label: 'Click add method button';
				onChildNamed: GtBehaviorCoder addNewMethodButtonName.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.

	classCoderElement := aScripter elementWithoutParent.
	
	newFrameTarget := classCoderElement
		allChildrenBreadthFirstDetect: [:aChild |
			aChild isKindOf: GtExpandableCoderElement ]
		ifFound: [:aChild | aChild].

	newFrameTarget
		allChildrenBreadthFirstDetect: [:aChild |
			aChild isKindOf: BrToolbar]
		ifFound: [:aChild |
			saveButtonTarget := aChild childAt: 1.
			removeButtonTarget := aChild childAt: 2].

	addMethodButton := classCoderElement
		childNamed: GtBehaviorCoder addNewMethodButtonName.
	
	addMethodButton
		addChild:
			((self yellowTargetCircleWithExplanationModel: #addMethodButton)
					relocate:
						(2 @ addMethodButton extent y / 2)).
	newFrameTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #method)
					relocate:
						(2 @ newFrameTarget extent y / 2)).
	saveButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #saveMethodButton)
					relocate:
						(2 @ saveButtonTarget extent y / 2)).
	removeButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #deleteMethodButton)
					relocate:
						(2 @ removeButtonTarget extent y / 2)).
			
	^ BlElement new
		constraintsDo: [:c |
			c vertical matchParent.
			c horizontal matchParent];
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 5);
		addChild: classCoderElement.
]

{ #category : #accessing }
GtCoderSlideshow >> exampleMethodExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 12;
		newTextWithFormat: self exampleMethodsExplanationText;
		element: [ self exampleMethodsExplanationWithLinks ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtCoderSlideshow >> exampleMethodsExplanationText [
	| text |
	text := 'Also, if a method is annotated with the ' asRopedText,
('gtExample' asRopedText glamorousExplanationFor: #gtView),
' pragma, the coder offers you additional buttons similar to the ones in the playground. Through them you can ' asRopedText,
('evaluate' asRopedText glamorousExplanationFor: #evaluateButton),
', ' asRopedText,
('inspect' asRopedText glamorousExplanationFor: #inspectButton),
' or ' asRopedText,
('debug' asRopedText glamorousExplanationFor: #debugButton),
' your example method.' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtCoderSlideshow >> exampleMethodsExplanationWithLinks [
	<gtExample>
	| classCoderElement pragmaTarget inspectTarget evaluateTarget debugTarget aScripter expandedMethodElement buttonsList |
	
	classCoderElement := (GtInspector createOn:(GtBehaviorCoder forClass: GtABAddressBookExample)) maximized.
	
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Add Coder Element'
		do: [ :aStep | 
			aStep set
				label: 'Coder';
				element: [ classCoderElement ].
			aStep wait forEmptySpaceTaskQueue ].
	aScripter
		substep: 'Click coder'
		do: [ :aStep | 
			aStep click
				label: 'Expand first method';
				onBreadthFirstChildOfClass: BlOverlayElement;
				onBreadthFirstChildOfClass: GtPagerWrapperElement;
				onBreadthFirstChildOfClass: GtInspectorContentElement;
				onBreadthFirstChildOfClass: GtBehaviorCoderElement;
				onBreadthFirstChildOfClass: BrTabGroup;
				onChildAt: 2;
				onBreadthFirstChildOfClass: GtMethodsCoderElement;
				onBreadthFirstChildOfClass: BrInfiniteListElement;
				onChildAt: 1;
				onChildAt: 1.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.	
	classCoderElement := aScripter elementWithoutParent.

	expandedMethodElement := classCoderElement
		allChildrenBreadthFirstDetect: [:aChild |
			aChild isKindOf: BrInfiniteListElement]
		ifFound: [:aChild | aChild childAt: 1].
	pragmaTarget := expandedMethodElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = '<gtExample>' asString]]
		ifFound: [:aChild | aChild].
	buttonsList := expandedMethodElement
		allChildrenBreadthFirstSelect: [:aChild | aChild isKindOf: BrButton].

	evaluateTarget := expandedMethodElement childNamed: GtMethodCoderPlayExampleActionId.
	inspectTarget := expandedMethodElement childNamed: GtMethodCoderPlayAndInspectExampleActionId.
	debugTarget := expandedMethodElement childNamed: GtMethodCoderDebugExampleActionId.

	pragmaTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #gtView)
					relocate:
						(2 @ pragmaTarget extent y / 2)).
	evaluateTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #evaluateButton)
					relocate:
						(2 @ evaluateTarget extent y / 2)).
	inspectTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #inspectButton)
					relocate:
						(2 @ inspectTarget extent y / 2)).
	debugTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #debugButton)
					relocate:
						(2 @ debugTarget extent y / 2)).
	
	^ classCoderElement.
]

{ #category : #accessing }
GtCoderSlideshow >> methodCreationExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 8;
		newTextWithFormat: self createMethodExplanationText;
		element: [ self createMethodExplanationWithLinks ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtCoderSlideshow >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Coder' asRopedText
			fontSize: 70;
			glamorousRegularFont).
]

{ #category : #accessing }
GtCoderSlideshow >> yellowTargetCircleWithExplanationModel: aModel [
	^ BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 0 @ 0;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: aModel).
]
