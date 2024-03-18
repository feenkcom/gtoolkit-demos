Extension { #name : #CompiledMethod }

{ #category : #'*GToolkit-Demo-Slideshows' }
CompiledMethod >> gtSlideWithTextFor: aView [
	<gtView>
	(self hasPragmaNamed: #gtSlide) ifFalse: [ ^ aView empty ].
	(self hasPragmaNamed: #text:) ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Slide with text';
		priority: 6;
		object: [ self slidePage asContentUIModel ];
		view: #gtLiveFor:;
		actionUpdateButton
]

{ #category : #'*GToolkit-Demo-Slideshows' }
CompiledMethod >> pragmaSnippets: pragma [
	"Split the content of the argument pragma into text and code snippets."

	| code pragmaContent |
	pragmaContent := self pragmas
			detect: [ :p | p selector = pragma ]
			ifFound: [ :p | p arguments first ]
			ifNone: [ '' ].
	^ ((String cr repeat: 2) split: pragmaContent)
		collect: [ :each | 
			(each beginsWith: '```')
				ifTrue: [ code := ('```' split: each) second trim.
					LePharoSnippet new
						code: code;
						yourself ]
				ifFalse: [ LeTextSnippet new
						string: each;
						yourself ] ]
]

{ #category : #'*GToolkit-Demo-Slideshows' }
CompiledMethod >> slidePage [
	"For a view containing the text and slide of a gtSlide method."

	| page |
	page := LePage named: self selector.
	LeDatabase new addPage: page.
	self slideSnippets do: [ :each | page addSnippet: each ].
	^ page
]

{ #category : #'*GToolkit-Demo-Slideshows' }
CompiledMethod >> slideSnippets [
	"Build a snippets collection for a slide method containing the text (if any) and the rendered slide."

	| snippets |
	snippets := OrderedCollection new.
	(self hasPragmaNamed: 'gtSlide') ifFalse: [ ^ snippets ].
	snippets addAll: (self pragmaSnippets: #text:).
	snippets
		add: (LeElementSnippet new
				code: self methodClass name , ' new slideFor: ' , self selector printString;
				elementHeight: 400;
				codeVisible: false;
				yourself).
	snippets addAll: (self pragmaSnippets: #demo:).
	^ snippets
]
