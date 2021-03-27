Class {
	#name : #GtModelTutorial,
	#superclass : #Object,
	#category : #'GToolkit-Demo-TodosAPI-Presentation'
}

{ #category : #accessing }
GtModelTutorial >> addImageViewToPhotoSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 19;
		newTextWithFormat: ('A photo has a title, an id and a url. That url is a link to the image itself. We will add a request for that and a view for it as well.' asRopedText
			glamorousRegularFont;
			fontSize: 20);
		element: [(GtEpiceaChangesLiveSlide new
			fileName: (self folderPath, '09-addImageViewToPhoto.ombu') asString) asElement].
]

{ #category : #accessing }
GtModelTutorial >> addViewToMyAlbumSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 7;
		newTextWithFormat: ('Now if we take a look at an album object we still see a dicitonary inside it. To better visualize the object we will add a custom view that will display the album details from the dicitonary.' asRopedText
			glamorousRegularFont;
			fontSize: 20);
		element: [(GtEpiceaChangesLiveSlide new
			fileName: (self folderPath, '02-addDetailsViewToAlbum.ombu') asString) asElement].
]

{ #category : #accessing }
GtModelTutorial >> addViewToMyPhotoSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 17;
		newTextWithFormat: ('And we add the usual details view for a photo as well.' asRopedText
			glamorousRegularFont;
			fontSize: 20);
		element: [(GtEpiceaChangesLiveSlide new
			fileName: (self folderPath, '08-addDetailsViewToPhoto.ombu') asString) asElement].
]

{ #category : #accessing }
GtModelTutorial >> addViewToMyTodoSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 14;
		newTextWithFormat: ('We also add a details view to a todo.' asRopedText
			glamorousRegularFont;
			fontSize: 20);
		element: [(GtEpiceaChangesLiveSlide new
			fileName: (self folderPath, '06-addDetailsViewToTodo.ombu') asString) asElement].
]

{ #category : #accessing }
GtModelTutorial >> addViewToMyUserSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 11;
		newTextWithFormat: ('And just like we did for the album, we will add a details view for the user so we can better visualize the information from the dictionary.' asRopedText
			glamorousRegularFont;
			fontSize: 20);
		element: [(GtEpiceaChangesLiveSlide new
			fileName: (self folderPath, '04-addDetailsViewToUser.ombu') asString) asElement].
]

{ #category : #accessing }
GtModelTutorial >> albumDetailsViewExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 8;
		newFadedText: ('Taking a closer look at one of the albums from the list we can now see the details.' asRopedText);
		element: [
			(GtPlaygroundLiveSlide new
				snippets: {'json := ZnClient new
	url: ''https://jsonplaceholder.typicode.com/albums'';
	get.
dictionaries := STONJSON fromString: json.
albums := dictionaries collect: [:eachDictionary |
	MyAlbum new rawData: eachDictionary ].
albums first.' }) asElement ];
		onEveryAddToSceneGraphDo: [ :anElement |
			self runSnippetWhenAddedToSceneGraphFor: anElement ].
]

{ #category : #accessing }
GtModelTutorial >> albumsListRequest [
	| json dictionaries |
	json := ZnClient new
		url: 'https://jsonplaceholder.typicode.com/albums';
		get.
	dictionaries := STONJSON fromString: json.
	^ dictionaries collect: [:eachDictionary |
		MyAlbum new rawData: eachDictionary ].
]

{ #category : #accessing }
GtModelTutorial >> createMyAlbumSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 5;
		newTextWithFormat: ('But a list of dictionaries isn''t exactly what we want. What interests us is a list of albums. For that, we create a MyAlbum class that gets a dictionary with information about that album and stores it. Click ' asRopedText,
('apply' asRopedText glamorousExplanationFor: #apply),
' to add these new changes.' asRopedText
			glamorousRegularFont;
			fontSize: 20);
		element: [
			| changesElement applyButtonTarget |
			changesElement := (GtEpiceaChangesLiveSlide new
				fileName: (self folderPath, '01-createMyAlbum.ombu') asString)
				asElement.
			applyButtonTarget := changesElement
				allChildrenBreadthFirstDetect: [:aChild |
					aChild isKindOf: BrButton]
				ifFound: [:aChild | aChild].
			applyButtonTarget
				addChild: ((
					BrButton new
						constraintsDo: [ :c | c ignoreByLayout ];
						size: 3 @ 3;
						elevation: (BlRelativeElevation elevation: 10);
						geometry: BlCircle new;
						aptitude: (GtExplainerTargetAptitude new explanationModel: #apply))
							relocate: 3 @ 10).
			changesElement ].
]

{ #category : #accessing }
GtModelTutorial >> createMyPhotoSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 16;
		newTextWithFormat: ('Returning to our albums. An album has a collection of photos. So like we did for a user''s todos, we add a method that requests the photos for the respective album, MyAlbum>>#photos and a list view to display them. The photos also need to be stored in an object so we create a MyPhoto class.' asRopedText
			glamorousRegularFont;
			fontSize: 20);
		element: [(GtEpiceaChangesLiveSlide new
			fileName: (self folderPath, '07-createMyPhoto.ombu') asString) asElement].
]

{ #category : #accessing }
GtModelTutorial >> createMyTodoSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 13;
		newTextWithFormat: ('A user can also have a list of todos. So we can go even further by requesting the todos that the specific user has and we can display them. We create a MyTodo class, a requesting method for the todos in the user class, MyUser>>#todos and a list view in the user class.' asRopedText
			glamorousRegularFont;
			fontSize: 20);
		element: [(GtEpiceaChangesLiveSlide new
			fileName: (self folderPath, '05-createMyTodo.ombu') asString) asElement].
]

{ #category : #accessing }
GtModelTutorial >> createMyUserSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 9;
		newTextWithFormat: ('An interesting next step is to be able to navigate from the album to the user associated with it. We create a MyUser class, with a similar structure to the album. We also add a MyAlbum>>#user method that requests the user for the current album and we update the details view for the album.' asRopedText
			glamorousRegularFont;
			fontSize: 20);
		element: [(GtEpiceaChangesLiveSlide new
			fileName: (self folderPath, '03-createMyUser.ombu') asString) asElement].
]

{ #category : #accessing }
GtModelTutorial >> finalExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 21;
		newFadedText: ('Feel free to explore the model as you want.' asRopedText);
		element: [
			(GtPlaygroundLiveSlide new
				snippets: {'json := ZnClient new
	url: ''https://jsonplaceholder.typicode.com/albums'';
	get.
dictionaries := STONJSON fromString: json.
dictionaries collect: [:eachDictionary |
	MyAlbum new rawData: eachDictionary ].'}) asElement];
		onEveryAddToSceneGraphDo: [ :anElement |
			self runSnippetWhenAddedToSceneGraphFor: anElement ].
]

{ #category : #accessing }
GtModelTutorial >> folderPath [
	^ './pharo-local/iceberg/feenkcom/gtoolkit-examples/doc/API-tutorial/' asString.
]

{ #category : #accessing }
GtModelTutorial >> imageViewExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 20;
		newFadedText: ('Now inspecting a photo from an album displays the actual image as well.' asRopedText);
		element: [
			(GtPlaygroundLiveSlide new
				snippets: {'json := ZnClient new
	url: ''https://jsonplaceholder.typicode.com/albums'';
	get.
dictionaries := STONJSON fromString: json.
albums := dictionaries collect: [:eachDictionary |
	MyAlbum new rawData: eachDictionary ].
albums first photos first.' }) asElement];
		onEveryAddToSceneGraphDo: [ :anElement |
			self runSnippetWhenAddedToSceneGraphFor: anElement ].
]

{ #category : #slides }
GtModelTutorial >> introductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 2;
		newTextWithFormat: ('The following model will work with a REST API by making different requests to the API and processing the resulted information.' asRopedText glamorousRegularFont; fontSize: 20).
]

{ #category : #accessing }
GtModelTutorial >> listOfAlbumsExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 6;
		newFadedText: 'Now we can give each dictionary in the list to an album object, resulting in a list of albums.' asRopedText;
		element: [(GtPlaygroundLiveSlide new
			snippets: {'json := ZnClient new
	url: ''https://jsonplaceholder.typicode.com/albums'';
	get.
dictionaries := STONJSON fromString: json.
dictionaries collect: [:eachDictionary |
	MyAlbum new rawData: eachDictionary ].'}) asElement];
		onEveryAddToSceneGraphDo: [ :anElement |
			self runSnippetWhenAddedToSceneGraphFor: anElement ].
]

{ #category : #slides }
GtModelTutorial >> makingTheFirstRequestExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 4;
		newTextWithFormat: (self requestExplanationWithLinksText );
		element: [self requestExplanationWithLinks];
		elementWeight: 0.7.
]

{ #category : #accessing }
GtModelTutorial >> photoDetailsViewExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 18;
		newFadedText: ('Below you can see an album, with its list of photos and one of the photos inspected.' asRopedText);
		element: [
			(GtPlaygroundLiveSlide new
				snippets: {'json := ZnClient new
	url: ''https://jsonplaceholder.typicode.com/albums'';
	get.
dictionaries := STONJSON fromString: json.
albums := dictionaries collect: [:eachDictionary |
	MyAlbum new rawData: eachDictionary ].
albums first photos first.' }) asElement ];
		onEveryAddToSceneGraphDo: [ :anElement |
			self runSnippetWhenAddedToSceneGraphFor: anElement ].
]

{ #category : #accessing }
GtModelTutorial >> requestExplanationWithLinks [
	| playgroundElement clientTarget urlTarget requestTarget parserTarget |
	playgroundElement := (GtPlaygroundLiveSlide new
		snippets: {'json := ZnClient new
	url: ''https://jsonplaceholder.typicode.com/albums'';
	get'. 
'dictionaries := STONJSON fromString: json.'}";
		inspectSnippetAt: 1;
		inspectSnippetAt: 2") asElement.
	playgroundElement forceLayout.

	clientTarget := playgroundElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = 'ZnClient' asString]]
		ifFound: [:aChild | aChild].
	urlTarget := playgroundElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = 'url:' asString]]
		ifFound: [:aChild | aChild].
	requestTarget := playgroundElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = 'get' asString]]
		ifFound: [:aChild | aChild].
	parserTarget := playgroundElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = 'STONJSON' asString]]
		ifFound: [:aChild | aChild].
	
	clientTarget
		addChild: ((
			BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: #client))
					relocate: 0 @ clientTarget extent y / 2).
	urlTarget
		addChild: ((
			BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: #url))
					relocate: 0 @ urlTarget extent y / 2).	
	requestTarget
		addChild: ((
			BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: #request))
					relocate: 0 @ requestTarget extent y / 2).
	parserTarget
		addChild: ((
			BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: #parse))
					relocate: 0 @ parserTarget extent y / 2).
	^ playgroundElement.
]

{ #category : #accessing }
GtModelTutorial >> requestExplanationWithLinksText [
	| text |
	text := 'To make a request we use the ' asRopedText,
('client' asRopedText glamorousExplanationFor: #client),
' from the Zinc library. We give it a ' asRopedText,
('url' asRopedText glamorousExplanationFor: #url),
' and make a ' asRopedText,
('GET' asRopedText glamorousExplanationFor: #request),
' request.
The result is a json string for which we can then use a ' asRopedText,
('parser' asRopedText glamorousExplanationFor: #parse),
' to obtain a list of dictionaries.' asRopedText.

	^ text asRopedText	
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtModelTutorial >> runSnippetWhenAddedToSceneGraphFor: anElement [
	| playgroundElement editor |
	playgroundElement := anElement childAt: 2.

	playgroundElement enqueueTask:
		(BlTaskAction new
			action: [
				editor := playgroundElement 
					allChildrenBreadthFirstDetect: [:aChild |
						aChild isKindOf: GtSourceCoderEditorElement]
					ifFound: [:aChild | aChild].
				editor ifNotNil: [ editor textualCoderViewModel doItAndGo ]]).
]

{ #category : #slides }
GtModelTutorial >> slideshowLinkSlideFor: aSlide [
	<gtSlide>
	^ aSlide slideshow
		priority: 3;
		textWithFormat: ('To see an already built expanded version of the model we are about to create, follow the slideshow below.'
			asRopedText
			glamorousRegularFont);
		slideshow: [ GtLiveShow createWithArrowsVisible: GtWorkingWithARestApi new ] withTitle: 'Working With a REST API'.
]

{ #category : #slides }
GtModelTutorial >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('How to create a model' asRopedText
			glamorousRegularFont;
			fontSize: 70);
		subtitleWithFormat: ('Tutorial' asRopedText
			glamorousRegularFont;
			bold;
			fontSize: 50).
]

{ #category : #accessing }
GtModelTutorial >> todosListExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 15;
		newFadedText: ('Inspecting a user now shows the list of todos and inspecting a todo shows its details.' asRopedText);
		element: [
			(GtPlaygroundLiveSlide new
				snippets: {'json := ZnClient new
	url: ''https://jsonplaceholder.typicode.com/albums'';
	get.
dictionaries := STONJSON fromString: json.
albums := dictionaries collect: [:eachDictionary |
	MyAlbum new rawData: eachDictionary ].
albums first user.' }) asElement ];
		onEveryAddToSceneGraphDo: [ :anElement |
			self runSnippetWhenAddedToSceneGraphFor: anElement ].
]

{ #category : #accessing }
GtModelTutorial >> userDetailsViewExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 12;
		newFadedText: ('Now we can look at the same users but in more pleasing way.' asRopedText);
		element: [
			(GtPlaygroundLiveSlide new
				snippets: {'json := ZnClient new
	url: ''https://jsonplaceholder.typicode.com/albums'';
	get.
dictionaries := STONJSON fromString: json.
albums := dictionaries collect: [:eachDictionary |
	MyAlbum new rawData: eachDictionary ].
albums first user.' }) asElement ];
		onEveryAddToSceneGraphDo: [ :anElement |
			self runSnippetWhenAddedToSceneGraphFor: anElement ].
]

{ #category : #accessing }
GtModelTutorial >> userExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 10;
		newFadedText: ('So now, clicking on the user inside the details view from an album, you can inspect that specific user.' asRopedText);
		element: [
			(GtPlaygroundLiveSlide new
				snippets: {'json := ZnClient new
	url: ''https://jsonplaceholder.typicode.com/albums'';
	get.
dictionaries := STONJSON fromString: json.
albums := dictionaries collect: [:eachDictionary |
	MyAlbum new rawData: eachDictionary ].
albums first user.' }) asElement];
		onEveryAddToSceneGraphDo: [ :anElement |
			self runSnippetWhenAddedToSceneGraphFor: anElement ].
]
