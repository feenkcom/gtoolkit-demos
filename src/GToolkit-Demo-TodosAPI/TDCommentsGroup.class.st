Class {
	#name : #TDCommentsGroup,
	#superclass : #TDModel,
	#instVars : [
		'comments'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDCommentsGroup >> comments [
	^ comments ifNil: [OrderedCollection new].
]

{ #category : #accessing }
TDCommentsGroup >> comments: aList [
	comments := aList.
]

{ #category : #accessing }
TDCommentsGroup >> gtCommentsListFor: aView [
	<gtView>
	self comments ifEmpty: [^ aView empty].
	^ aView explicit
		title: 'Comments' translated;
		priority: 5;
		stencil: [
			| mainContainer scrollableContainer topEditorElement tileContainer topTile bottomTile labelLook userButton |
			mainContainer := BlScrollableElement new
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ].
			scrollableContainer := BlElement new
				layout: BlLinearLayout vertical;
				padding: (BlInsets all: 5);
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical fitContent ].
			self comments do: [ :each |			
				tileContainer := BlElement new
					layout: BlLinearLayout vertical;
					constraintsDo: [:c |
						c linear horizontal alignCenter.
						c vertical fitContent ];
					background: Color white;
					look: BrShadowLook;
					padding: (BlInsets all: 5);
					margin: (BlInsets all: 5);
					width: 300.
				topTile := BlElement new
					layout: BlLinearLayout horizontal;
					constraintsDo: [:c |
						c horizontal matchParent.
						c vertical fitContent ].
				bottomTile := BlElement new
					layout: BlLinearLayout vertical;
					constraintsDo: [:c |
						c horizontal matchParent.
						c vertical fitContent ].
				topEditorElement := BrEditor new
					look: (BrGlamorousRegularEditorLook new fontSize: 18);
					constraintsDo: [:c |
						c linear horizontal alignCenter ];
					margin: (BlInsets top: 0 right: 5 bottom: 0 left: 5);
					vFitContent;
					hMatchParent;
					beReadOnlyWithoutSelection;
					text: each name.
				topEditorElement
					when: BlClickEvent
					do: [:e | topEditorElement phlow spawnObject: each].
				labelLook := BrTextLabelLook new
					glamorousRegularFont;
					fontSize: 14;
					foreground: Color gray.
				userButton := BrButton new
					margin: (BlInsets top: 0 right: 5 bottom: 5 left: 12);
					label: 'Post ', each postId asString;
					look: (BrGlamorousLinkSquaredButtonWithLabelLook new fontSize: 12);
					action: [ :aButton |
						aButton phlow spawnObject: (each post)].

				topTile
					addChild: topEditorElement.
				bottomTile addChild: userButton.
				tileContainer 
					addChild: topTile;
					addChild: bottomTile.
				scrollableContainer addChild: tileContainer ].
			mainContainer addChild: scrollableContainer.
			mainContainer ].
]
