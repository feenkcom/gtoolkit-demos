Extension { #name : #CompiledMethod }

{ #category : #'*GToolkit-Demo-Slideshows' }
CompiledMethod >> gtSlideWithTextFor: aView [
	<gtView>
	(self hasPragmaNamed: #gtSlide) ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Slide with text';
		priority: 6;
		object: [ self slidePage asContentUIModel ];
		view: #gtLiveFor:
]

{ #category : #'*GToolkit-Demo-Slideshows' }
CompiledMethod >> slidePage [
	"For a view containing the text and slide of a gtSlide method."

	| page |
	page := LePage named: self class name.
	LeDatabase new addPage: page.
	self slideSnippets do: [ :each | page addSnippet: each ].
	^ page
]

{ #category : #'*GToolkit-Demo-Slideshows' }
CompiledMethod >> slideSnippets [
	"Build a snippets collection for a slide method containing the text (if any) and the rendered slide."

	| snippets text |
	snippets := OrderedCollection new.
	(self hasPragmaNamed: 'gtSlide') ifFalse: [ ^ snippets ].
	text := self pragmas
			detect: [ :p | p selector = #text: ]
			ifFound: [ :pragma | pragma arguments first ]
			ifNone: [ '' ].
	((String cr repeat: 2) split: text)
		do: [ :each | 
			snippets
				add: (LeTextSnippet new
						string: each;
						yourself) ].
	snippets
		add: (LeElementSnippet new
				code: self methodClass name , ' new slideFor: ' , self selector printString;
				elementHeight: 400;
				codeVisible: false;
				yourself).
	^ snippets
]
