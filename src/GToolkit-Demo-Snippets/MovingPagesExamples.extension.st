Extension { #name : #MovingPagesExamples }

{ #category : #'*GToolkit-Demo-Snippets' }
MovingPagesExamples >> blockQuoteSnippetPage [
	<moveablePage>
	<gtExample>
	<return: #LePage>
	^ (LePage named: 'A BlockQuote snippet page')
		addSnippet: (LeBlockQuoteSnippet new
				string: 'Literal text';
				yourself);
		yourself
]
