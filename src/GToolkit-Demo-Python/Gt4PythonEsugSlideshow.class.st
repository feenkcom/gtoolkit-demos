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
' asRopedText , '3.' asRopedText bold , ' A case study' asRopedText
]

{ #category : #accessing }
Gt4PythonEsugSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."

	<gtExample>
	^ #(#title:
		#agenda:
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
		footerWithFormat: (self asBigText: 'veit.heller@feenk.com')
]
