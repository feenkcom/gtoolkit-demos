Class {
	#name : #GtRestAPI,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-TodosAPI-Presentation'
}

{ #category : #accessing }
GtRestAPI >> clientSlideText [
	^ 'The first step is to create the client. This acts as the interface for the model. Through the client you can make different requests to the API.'.
]

{ #category : #accessing }
GtRestAPI >> commentsSlideText [
	^ 'Finally, a comment is left by a user to a post. It stores an id and a body of text, the id of the post it is associated with and the name and email of the user that left it.'.
]

{ #category : #accessing }
GtRestAPI >> coreSlideText [
	^ 'The information obtained from parsing the JSON file needs to be stored somewhere. So we create a structure of classes to help us with that. Each class will have its default variant and its null variant for instances where the request information is not found.'.
]

{ #category : #accessing }
GtRestAPI >> create [
	| slideshow |
	slideshow := GtSlideShow new.
	slideshow
		slides:
			{(GtTitleSlide new
				titleText: ('Rest API' asRopedText
						fontSize: 70;
						glamorousRegularFont)).
			(GtTextSlide new
				newTextWithFormat: ('Rest API is a set of constraints used for creating web services. It helps for a better communication between systems.' asRopedText glamorousRegularFont; fontSize: 16; foreground: Color black);
				newTextWithFormat: ('In the following slides, we will present a model that uses Rest API to access a web service that contains posts and todos by different users.' asRopedText glamorousRegularFont; fontSize: 16; foreground: Color black)).
			(GtLabelAndElementSlide new
				newFadedText: 'Using it, we can request a specific post or todo';
				element: [GtExampleSlide new
					method: (TDExamples >> #requestTodoWithIdEight);
					asElement ]).
			(GtLabelAndElementSlide new
				newFadedText: 'We can request a user and the posts and todos associated with it';
				element: [GtExampleSlide new
					method: (TDExamples >> #requestUserWithIdFour);
					asElement ]).
			(GtLabelAndElementSlide new
				newFadedText: 'Or we can just request all the todos or posts in the system.';
				element: [GtExampleSlide new
					method: (TDExamples >> #requestAllTodos);
					asElement ]).
			(GtTextSlide new
				newTextWithFormat: ('Now let''s see how to implement a model like this.' asRopedText glamorousRegularFont; fontSize: 16; foreground: Color black)).
			(GtTextAndElementSlide new
				newTextWithFormat: ('The Client' asRopedText bold; fontSize: 16; foreground: Color black);
				newText: self clientSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					addChild: (GtClassCoder forClass: TDClient) asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('The Requests' asRopedText bold; fontSize: 16; foreground: Color black);
				newText: self requestsSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					addChild: (GtClassCoder forClass: TDDownloadCommand) asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('Parsing' asRopedText bold; fontSize: 16; foreground: Color black);
				newText: self parsingSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					addChild: (GtClassCoder forClass: TDJsonMapping) asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('Data Structures' asRopedText bold; fontSize: 16; foreground: Color black);
				newText: self coreSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					addChild: (GtPackageTagCoder forPackageTag: ((GtClassCoder forClass: TDUser) packageTag)) asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('The User' asRopedText bold; fontSize: 16; foreground: Color black);
				newText: self userSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					addChild: (GtClassCoder forClass: TDUser) asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('Todos' asRopedText bold; fontSize: 16; foreground: Color black);
				newText: self todosSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					addChild: (GtClassCoder forClass: TDTodoPost) asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('Posts' asRopedText bold; fontSize: 16; foreground: Color black);
				newText: self postsSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					addChild: (GtClassCoder forClass: TDSimplePost) asElement ]).
			(GtTextAndElementSlide new
				newTextWithFormat: ('Comments' asRopedText bold; fontSize: 16; foreground: Color black);
				newText: self commentsSlideText;
				element: [ BlElement new
					background: Color white;
					look: BrShadowLook;
					addChild: (GtClassCoder forClass: TDComment) asElement ]).
			}.
	^ slideshow makeArrowsVisible.
]

{ #category : #accessing }
GtRestAPI >> parsingSlideText [
	^ 'While parsing the JSON file we choose what information to store for each type of data by mapping the information to methods named accordingly.'.
]

{ #category : #accessing }
GtRestAPI >> postsSlideText [
	^ 'The post is similar to the todo. The difference is the post has a body of text instead of the status. It also has a list of comments left by other users to the specific post.'.
]

{ #category : #accessing }
GtRestAPI >> requestsSlideText [
	^ 'After that, we work on the actual requests. Based on the information from the client, the specific urls are created and the information is received from the API in the form of a JSON file. This file will then be sent to a parser to read and save the data we need from it.'
]

{ #category : #accessing }
GtRestAPI >> todosSlideText [
	^ 'A todo can be posted by a user. As information, it holds the user it is asscoated with, an id, a title and a status, specifically if it was completed or not.'.
]

{ #category : #accessing }
GtRestAPI >> userSlideText [
	^ 'First we have a user, identified by an id. He also has a list of posts and a list of todos, associated with him. The two lists are are obtained through two separate requests to the API, after the user has been requested.'.
]
