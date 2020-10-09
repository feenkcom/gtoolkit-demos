Class {
	#name : #GtFromJs,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-Pharo101'
}

{ #category : #accessing }
GtFromJs >> create [
	| show |
	
	show := GtSlideShow new.
	show addSlide: (GtTitleLiveSlide new
				titleWithFormat: ('Gt for Js developers' asRopedText fontSize: 70)).
	show addSlide: (GtElementAndElementLiveSlide new
				newText: 'The VM and IDE are both in the same process. Imagine having an IDE that can edit the source code already loaded by V8. This is what GT is, the IDE and VM in one.';
				leftElement: [ self v8];
				rightElement: [ GtWorldElement new asElement ]).
	show addSlide: (GtLabelAndElementLiveSlide new
			element: [((GtPharoMethodExample>>#exampleWithNumber:) gtViewNodesExplanationWithLinksFor: GtPhlowEmptyView new) asElementDo: [:e | e ]];
			newFadedText: ('The syntax is easy to learn, the method below contains all possible constructs. Hover over the syntactical parts on the left to understand how they map on the different parts of the method.' asRopedText fontSize: 70)).
	show addSlide: (GtElementAndElementLiveSlide new
				newText: 'Creating a class is similar to Js.' ;
				newText: 'It''s just that instance variables are called slots, the assignment operator is := and you create an object by invoking a method called "new" on the class.' ;
				newText: 'Which makes more sense if you think about it.' ;
				leftElement: [ GtTextLiveSlide new newText: self jsClassText; asElement];
				rightElement: [ GtClassCoderLiveSlide new class: Animal; asElement ]).
				
	show addSlide: 		
				(GtPlaygroundLiveSlide new 
				snippets: {'
				
"Save the HTML code of a web page to a file"
''https://gtoolkit.com/'' asUrl saveContentsToFile: ''page.html''
				
				' . '

"Compute the number of days between to dates"
(''2020-06-10'' asDate - ''2000/6/1'' asDate) days


' }).


	show addSlide: (GtElementAndElementLiveSlide new
				newText: 'Running a simple http server is a bit more elegant in Pharo' ;
				newText: 'Which makes more sense if you think about it.' ;
				leftElement: [ GtTextLiveSlide new newText: self jsServerText; asElement];
				rightElement: [ self teapotSlide ]).



		show addSlide:( 
			GtSlideshowLiveSlide new
				textWithFormat: ('Want to learn more? Follow the interactive tour below.' asRopedText glamorousRegularFont);
				slideshow: [ GtLiveShow createWithArrowsVisible: GtPharo101 new ] withTitle: 'Pharo 101').
				
	^ show
]

{ #category : #accessing }
GtFromJs >> jsClassText [
	^ 'class Animal {
  constructor() {
    this._name = "animal";
    this._weight = 20;
  }

  set name(aName) {
    this._name = aName;
  }

  get name() {
    return this._name;
  }

  set weight(aWeight) {
    this._weight = aWeight;
  }

  get weight() {
    return this._weight;
  }

  speak() {
    console.log(`This ${this._name} makes a noise.`);
  }

  eat() {
    this._weight = this._weight + 1;
  }
}

let animal = new Animal();
animal.speak();'
]

{ #category : #accessing }
GtFromJs >> jsServerText [
	^ '
var http = require("http");
var url = require("url");
//create a server object:
http
  .createServer(function (req, res) {
    var pathname = url.parse(req.url, true).pathname;
    if (pathname == "/welcome") {
      res.write("Hello World!");
      res.end();
    } else {
      res.write("Not found " + pathname);
      res.end();
    }
  })
  .listen(8080);'

]

{ #category : #accessing }
GtFromJs >> teapotSlide [
	^(GtPlaygroundLiveSlide new 
				snippets: {'
				
Metacello new
	baseline: ''Teapot'';
	repository: ''github://zeroflag/teapot/source'';
	load.
				
				' . '

Teapot on
	GET: ''/welcome'' -> ''Hello World!'';
	start.


'	. '

(ZnEasy get: ''http://localhost:1701/welcome'') 
	entity string.


' }) asElement
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
