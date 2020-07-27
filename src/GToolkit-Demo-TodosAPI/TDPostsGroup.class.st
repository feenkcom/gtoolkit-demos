Class {
	#name : #TDPostsGroup,
	#superclass : #TDModel,
	#instVars : [
		'posts'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDPostsGroup >> allCommentsForCurrentPosts [
	| comments |
	comments := TDClient new getAllComments.
 
 	^ comments select: [ :c |
 		self posts 
 			detect: [:p | p id = c postId ]
 			ifFound: [:el | true]
			 ifNone: [false] ].
]

{ #category : #accessing }
TDPostsGroup >> allUsersForCurrentPosts [
	| tempCollection |
	tempCollection := OrderedCollection new.
	
	self posts do: [ :each |
		tempCollection detect: [:el | el id = each userId] ifNone: [tempCollection add: each user] ].
	
	^ tempCollection.
]

{ #category : #accessing }
TDPostsGroup >> gtGraphFor: aView [
	<gtView>
	self posts ifEmpty: [ ^ aView empty ].
	^ aView mondrian
		title: 'Graph' translated;
		priority: 10;
		painting: [ :aGraph |
			| users comments |
			users := self allUsersForCurrentPosts.
			comments := self allCommentsForCurrentPosts.
			aGraph nodes
				shape: [ :x |
					BlElement new
						layout: BlLinearLayout vertical alignCenter;
						constraintsDo: [ :c |
							c horizontal fitContent.
							c vertical fitContent ];
						padding: (BlInsets all: 10);
						geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
						border: (BlBorder paint: Color black width: 1.5);
						background: (Color gray alpha: 0.2);
						addChild: (BlTextElement new
							constraintsDo: [ :c | c padding: (BlInsets all: 5)];
							text: (('User ', x id asString) asRopedText
								glamorousRegularFont;
								fontSize: 16))];
				with: users.
			
			aGraph nodes
				shape: [ :x |
					BlElement new
						layout: BlLinearLayout vertical alignCenter;
						constraintsDo: [ :c |
							c horizontal fitContent.
							c vertical fitContent ];
						padding: (BlInsets all: 10);
						geometry: BlCircle new;
						border: (BlBorder paint: Color black width: 1.5);
						background: Color paleGreen ];
						"addChild: (BlTextElement new
							constraintsDo: [ :c | c padding: (BlInsets all: 5)];
							text: ((x id asString) asRopedText
								glamorousRegularFont;
								fontSize: 16))];"
				with: self posts.
			
			aGraph nodes
				shape: [ :x |
					BlElement new 
						layout: BlLinearLayout vertical alignCenter;
						constraintsDo: [ :c |
							c horizontal fitContent.
							c vertical fitContent ];
						padding: (BlInsets all: 10);
						geometry: BlCircle new;
						border: (BlBorder paint: Color black width: 1.5);
						background: Color paleBlue ];
						"addChild: (BlTextElement new
							constraintsDo: [ :c | c padding: (BlInsets all: 5)];
							text: ((x id asString) asRopedText
								glamorousRegularFont;
								fontSize: 16))];"
				with: comments.
			
			aGraph edges
				"fromCenterBottom;
				toCenterTop;"
				fromNearestBounds;
				shape: [ :x |
					BlLineElement new
						border: (BlBorder paint: (Color gray alpha: 0.5) width: 1)];
				connect: users from: [ :u | u ] toAll: [ :u | self posts select: [:each | each userId = u id] ].
			
			aGraph edges
				"fromCenterBottom;
				toCenterTop;"
				shape: [ :x |
					BlLineElement new
						border: (BlBorder paint: (Color gray alpha: 0.5) width: 1)];
				connect: (self posts) from: [ :p | p ] toAll: [ :p | comments select: [:each | each postId = p id] ].
			
			aGraph layout force charge: -800].
]

{ #category : #accessing }
TDPostsGroup >> gtPostsListFor: aView [
	<gtView>
	self posts ifEmpty: [^ aView empty].
	^ aView explicit
		title: 'Posts' translated;
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
			self posts do: [ :each |			
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
					text: each title.
				topEditorElement
					when: BlClickEvent
					do: [:e | topEditorElement phlow spawnObject: each].
				labelLook := BrTextLabelLook new
					glamorousRegularFont;
					fontSize: 14;
					foreground: Color gray.
				userButton := BrButton new
					margin: (BlInsets top: 0 right: 5 bottom: 5 left: 12);
					label: 'User ', each userId asString;
					look: (BrGlamorousLinkSquaredButtonWithLabelLook new fontSize: 12);
					action: [ :aButton |
						aButton phlow spawnObject: (each user)].

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

{ #category : #accessing }
TDPostsGroup >> posts [
	^ posts ifNil: [OrderedCollection new].
]

{ #category : #accessing }
TDPostsGroup >> posts: aList [
	posts := aList.
]
