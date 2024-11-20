Class {
	#name : #Gt4PythonEsugSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'GToolkit-Demo-Python'
}

{ #category : #accessing }
Gt4PythonEsugSlideshow >> agenda: aSlide [
	<gtSlide>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Agenda');
		paragraph: '1.' asRopedText bold , ' Working with ' asRopedText
				, 'Python' asRopedText italic
				, ' in GT
' asRopedText , '2.' asRopedText bold
				, ' Inspecting and playing
' asRopedText , '3.' asRopedText bold , ' Three case studies' asRopedText
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> caseStudyOne: aSlide [
	<gtSlide>
	<noTest>
	^ aSlide lepiterPage
		setPriority;
		pageNamed: 'PythonBridge custom views for pandas DataFrame and Series'
			from: 'Glamorous Toolkit Book'
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> caseStudyOneOne: aSlide [
	<gtSlide>
	<noTest>
	^ aSlide lepiterPage
		setPriority;
		pageNamed: 'Inspecting Python objects with custom inspectors'
			from: 'Glamorous Toolkit Book'
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> caseStudyThree: aSlide [
	<gtSlide>
	<noTest>
	^ aSlide lepiterPage
		setPriority;
		pageNamed: 'Exploring the execution of a Python LampSort algorithm'
			from: 'Glamorous Toolkit Book'
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> caseStudyTwo: aSlide [
	<gtSlide>
	<noTest>
	| aPage aDatabase |
	"this slide is only rendered when gt4llm is loaded"
	
	aDatabase := LeDatabasesRegistry default currentLoadedDefaultLogicalDatabase
			databaseNamed: 'gt4llm-lepiter'
			ifNone: nil.
	aDatabase ifNil: [ ^ aSlide empty ].
	aPage := aDatabase pageNamed: 'Visualizing tokenization'.
	^ aSlide lepiterPage
		setPriority;
		startPage: aPage
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> pythonDebuggerExample: aSlide [
	<gtSlide>
	<noTest>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Python Debugger')
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> pythonDebuggerPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Python Debugger')
		addSnippet: (LePharoSnippet new
				code: 'pbApplication := PBApplication new.
pbApplication settings serverDebugMode: true.
pbApplication start.
PBApplication uniqueInstance: pbApplication');
		addSnippet: (LePythonSnippet new
				code: 'def i_recurse(n):
	if n % 10 == 0:
		pbbreak()
	i_recurse(n+1)

i_recurse(1)');
		addSnippet: (LePharoSnippet new
				code: 'pbApplication := PBApplication new.
pbApplication settings serverDebugMode: true.
pbApplication start.
PBApplication uniqueInstance: pbApplication');
		yourself
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> pythonExamples: aSlide [
	<gtSlide>
	<noTest>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Python Examples I')
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> pythonExamplesSecond: aSlide [
	<gtSlide>
	<noTest>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Python Examples II')
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> pythonExamplesThird: aSlide [
	<gtSlide>
	<noTest>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Python Examples III')
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> pythonFirstExamplesPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Python Examples I')
		addSnippet: (LePythonSnippet new code: 'x = 2 ** 30');
		addSnippet: (LePythonSnippet new
				code: 'import datetime

datetime.datetime.fromtimestamp(x)');
		addSnippet: (LePythonSnippet new
				code: 'print("Where is this going?")');
		yourself
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> pythonSecondExamplesPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Python Examples II')
		addSnippet: (LePythonSnippet new
				code: 'import random

from collections import Counter

counter = Counter()

for i in range(100):
	counter[random.randint(0, 10)] += 1
	
counter');
		addSnippet: (LePythonSnippet new code: '');
		yourself
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> pythonThirdExamplesPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Python Examples III')
		addSnippet: (LePharoSnippet new code: 'filePath := FileLocator imageDirectory pathString');
		addSnippet: (LePythonSnippet new
				code: 'print(filePath)');
		yourself
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."

	<gtExample>
	^ #(#title:
		#agenda:
		#pythonExamples:
		#pythonExamplesSecond:
		#pythonExamplesThird:
		#pythonDebuggerExample:
		#caseStudyOne:
		#caseStudyOneOne:
		#caseStudyTwo:
		#caseStudyThree:
		#thankYou:
		)
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> thankYou: aSlide [
	<gtSlide>
	^ aSlide titleWithFooter
		setPriority;
		titleBottomPadding: 30;
		subtitleBottomPadding: 40;
		titleWithFormat: (self asTitle: 'Thank you!');
		subtitleWithFormat: (self asTitle: 'Questions?');
		footerWithFormat: (self asBigText: 'https://gtoolkit.com')
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> title: aSlide [
	<gtSlide>
	^ aSlide titleWithFooter
		setPriority;
		titleBottomPadding: 30;
		subtitleBottomPadding: 40;
		titleWithFormat: (self asTitle: 'gt4python');
		subtitleWithFormat: (self asSubtitle: 'Working with Python inside Glamorous Toolkit');
		footerWithFormat: (self asBigText: 'Veit Heller (veit.heller@feenk.com), svenvc (in spirit)')
]
