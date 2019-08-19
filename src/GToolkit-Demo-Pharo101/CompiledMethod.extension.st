Extension { #name : #CompiledMethod }

{ #category : #'*GToolkit-Demo-Pharo101' }
CompiledMethod >> buildNodeDictionary [
	| aStartPos aDictionary |
	
	aDictionary := Dictionary new.
	self parseTree doSemanticAnalysis allChildren do:
		[:aNode |
			(aNode isKindOf: RBSelfNode) ifTrue: [
				aStartPos := aNode start.
				(aDictionary at: 'Self Nodes' ifAbsentPut: OrderedCollection new)
					add: (aStartPos -> (aStartPos + aNode name byteSize - 1))].
			(aNode isKindOf: RBPragmaNode) ifTrue: [
				(aDictionary at: 'Pragmas' ifAbsentPut: OrderedCollection new)
					add: (aNode left -> aNode right)].
			(aNode isKindOf: RBLiteralValueNode) ifTrue: [
				(aDictionary at: 'Literal Values' ifAbsentPut: OrderedCollection new)
					add: (aNode start -> aNode stop)].
			((aNode isKindOf: RBMessageNode) and: [aNode isUnary]) ifTrue: [
				aStartPos := aNode keywordsPositions at: 1.
				(aDictionary at: 'Unary Messages' ifAbsentPut: OrderedCollection new)
					add: (aStartPos -> (aStartPos + aNode selector byteSize - 1))].
			((aNode isKindOf: RBMessageNode) and: [aNode isBinary]) ifTrue: [
				aStartPos := aNode keywordsPositions at: 1.
				(aDictionary at: 'Binary Messages' ifAbsentPut: OrderedCollection new)
					add: (aStartPos -> (aStartPos + aNode selector byteSize - 1))].
			((aNode isKindOf: RBMessageNode) and: [aNode isKeyword]) ifTrue: [
				| selectors positions currentSelector|
				selectors := aNode selectorParts.
				positions := aNode keywordsPositions.
				1 to: (selectors size) do: [:anIndex |
					currentSelector := selectors at: anIndex.
					aStartPos := positions at: anIndex.
					(aDictionary at: 'Keyword Messages' ifAbsentPut: OrderedCollection new)
						add: (aStartPos -> (aStartPos + currentSelector byteSize - 1))]].
			(aNode isKindOf: RBBlockNode) ifTrue: [
				(aDictionary at: 'Blocks' ifAbsentPut: OrderedCollection new)
					add: (aNode left -> aNode right)].
			(aNode isKindOf: RBAssignmentNode) ifTrue: [
				aStartPos := aNode assignment.
				(aDictionary at: 'Assignments' ifAbsentPut: OrderedCollection new)
					add: (aStartPos -> (aStartPos + 1))].
			(aNode isKindOf: RBSuperNode) ifTrue: [
				aStartPos := aNode start.
				(aDictionary at: 'Super Nodes' ifAbsentPut: OrderedCollection new)
					add: (aStartPos -> (aStartPos + aNode name byteSize - 1))].
			(aNode isKindOf: RBLiteralArrayNode) ifTrue: [(aDictionary at:
				'Literal Arrays' ifAbsentPut: OrderedCollection new)
					add: (aNode start -> aNode stop)].
			(aNode isKindOf: RBCascadeNode) ifTrue: [
				aStartPos := aNode semicolons at: 1.
				(aDictionary at: 'Cascade Operators' ifAbsentPut: OrderedCollection new)
					add: (aStartPos -> aStartPos)].
			(aNode isKindOf: RBReturnNode) ifTrue: [(aDictionary at: 'Return Node'
				ifAbsentPut: OrderedCollection new)
					add: (aNode return -> aNode return)].
			((aNode isKindOf: RBVariableNode) and: [ aNode isArg ]) ifTrue: [
				aStartPos := aNode start.
				(aDictionary at: 'Argument Variables' ifAbsentPut: OrderedCollection new)
					add: (aStartPos -> (aStartPos + aNode name byteSize - 1)) ].
			((aNode isKindOf: RBVariableNode) and: [ aNode isGlobal ]) ifTrue: [
				aStartPos := aNode start.
				(aDictionary at: 'Global Variables' ifAbsentPut: OrderedCollection new)
					add: (aStartPos -> (aStartPos + aNode name byteSize - 1)) ].
			(((aNode isKindOf: RBVariableNode) and: [ aNode isTemp ])
				and: [ aNode isArg not ]) ifTrue: [
					aStartPos := aNode start.
					(aDictionary at: 'Temporary Variables' ifAbsentPut: OrderedCollection new)
						add: (aStartPos -> (aStartPos + aNode name byteSize - 1)) ].
			(aNode isKindOf: RBMethodNode) ifTrue: [
				aStartPos := 1.
				(aDictionary at: 'Method Name' ifAbsentPut: OrderedCollection new)
					add: (aStartPos -> (aStartPos + aNode selector byteSize - 1))].
	].
	
	^ aDictionary.
]

{ #category : #'*GToolkit-Demo-Pharo101' }
CompiledMethod >> buildNodeListFrom: aDictionary [
	| aNodeList |
	
	aNodeList := BrColumnedList new.
	aNodeList items: (aDictionary associations).
	aNodeList margin: (BlInsets all: 30).
	aNodeList column
		title: 'Elements';
		stencil: [:each | BrColumnCellLabelStencil matchParent: each key].
		
	^ aNodeList.
]

{ #category : #'*GToolkit-Demo-Pharo101' }
CompiledMethod >> gtTreeCustomViewFor: aView [
	<gtView>
	^ aView tree
		title: 'TreeNodes';
		items: [ {self parseTree} ];
		children: #children.
]

{ #category : #'*GToolkit-Demo-Pharo101' }
CompiledMethod >> gtUnderlineViewFor: aView [
	<gtView>
	| aDictionary |
	
	aDictionary := self buildNodeDictionary.
	
	^ aView explicit
		title: 'Nodes Underline' translated;
		stencil: [
			| text editorElement aNodesList aSelectedInterval aSelectedIndex aPositionsCollection|
			text := self sourceCode asRopedText.
			editorElement := BrEditor new
				look: BrGlamorousCodeEditorLook new;
				styler: (BrRBTextStyler new classOrMetaClass: self methodClass);
				text: text.

			aNodesList := self buildNodeListFrom: aDictionary.
			aNodesList when: BrSelectionChanged do: [:selectedEvent | 
				aSelectedInterval := selectedEvent selectedInterval.
				(aSelectedInterval isNil) ifFalse: [
					text attributes: {
						BlTextUnderlineAttribute new beNotOverwritableByStyler; paint: Color white}.
					aSelectedIndex := aSelectedInterval at: 1.
					aPositionsCollection := ((aDictionary associations at: aSelectedIndex) value).
					aPositionsCollection do: [:anAssoc |
						(text from: (anAssoc key) to: (anAssoc value)) attributes: {
							BlTextUnderlineAttribute new beNotOverwritableByStyler; paint: Color blue} ].
					editorElement text: text]
				].

			BlElement new
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ];
				addChild: (BlElement new
					layout: BlLinearLayout horizontal;
					constraintsDo: [ :c |
						c horizontal matchParent.
						c vertical matchParent ];
					look: BrShadowLook; 
					background: Color white;
					margin: (BlInsets all: 20);
					addChild: (editorElement
						constraintsDo: [ :c |
							c horizontal matchParent.
							c vertical matchParent ]));
				addChild: (BlElement new
					layout: BlLinearLayout horizontal;
					constraintsDo: [ :c |
						c horizontal matchParent.
						c vertical matchParent ];
					look: BrShadowLook; 
					background: Color white;
					margin: (BlInsets all: 20);
					padding: (BlInsets all: 20);
					addChild: (aNodesList
						constraintsDo: [ :c |
						c horizontal matchParent.
						c vertical matchParent ])).
		].
]
