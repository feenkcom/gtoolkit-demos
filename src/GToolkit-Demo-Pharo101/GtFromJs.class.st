Class {
	#name : #GtFromJs,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-Pharo101'
}

{ #category : #accessing }
GtFromJs >> create [
	| show |
	
	show := GtSlideShow new.
	show addSlide: (GtTitleSlide new
				titleText: ('Gt for Js developers' asRopedText fontSize: 70)).
	show addSlide: (GtElementAndElementSlide new
				newText: 'The VM and IDE are both in the same process. Imagine having an IDE that can edit the source code already loaded by V8. This is what GT is, the IDE and VM in one.';
				leftElement: [ self v8];
				rightElement: [ GtWorldElement new asElement ]).
	show addSlide: (GtLabelAndElementSlide new
			element: [((GtPharoMethodExample>>#exampleWithNumber:) gtViewNodesExplanationWithLinksFor: GtPhlowEmptyView new) asElementDo: [:e | e ]];
			newFadedText: ('The syntax is easy to learn, the method below contains all possible constructs. Hover over the syntactical parts on the left to understand how they map on the different parts of the method.' asRopedText fontSize: 70)).
	show addSlide: (GtElementAndElementSlide new
				newText: 'Creating a class is similar to Js. It''s just that instance variables are called slots, the assignment operator is := and you create an object by invoking a method called "new" on the class. Which makes more sense if you think about it.' ;
				leftElement: [ BlElement  new];
				rightElement: [ BlElement  new ]).
				
	^ show
]

{ #category : #accessing }
GtFromJs >> v8 [
	^ BlElement new
		constraintsDo: [:c |
			c horizontal matchParent.
			c vertical matchParent ];
		padding: (BlInsets top: 20 bottom: 20);
		layout: BlLinearLayout vertical;
	    addChild: 
	       (BlTextElement new
				margin: (BlInsets all: 10);
				constraintsDo: [ :c |
					c vertical fitContent.
					c horizontal fitContent.
					c linear horizontal alignCenter];
				text: ('In a convetional development environment, the Virtual Machine that runs the code has nothing to do with the code editor' asRopedText glamorousRegularFont));
		addChild: 
	       (BlTextElement new
				margin: (BlInsets all: 1);
				constraintsDo: [ :c |
					c vertical fitContent.
					c horizontal fitContent.
					c linear horizontal alignCenter];
				text: ('V8 / SpiderMonkey' asRopedText glamorousRegularFont; fontSize:40));
		addChild: 
	       (BlTextElement new
				margin: (BlInsets all: 1);
				constraintsDo: [ :c |
					c vertical fitContent.
					c horizontal fitContent.
					c linear horizontal alignCenter];
				text: ('VS Code / Websstorm / Sublime Text' asRopedText glamorousRegularFont; fontSize:40))
	
]
