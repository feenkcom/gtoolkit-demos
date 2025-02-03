Extension { #name : #MovingPagesExamples }

{ #category : #'*GToolkit-Demo-Snippets' }
MovingPagesExamples >> blockQuoteSnippetPage [
	<moveablePage>
	<gtExample>
	^ (LePage named: 'A BlockQuote snippet page')
		addSnippet: (LeBlockQuoteSnippet new
				string: 'Literal text';
				yourself);
		yourself
]

{ #category : #'*GToolkit-Demo-Snippets' }
MovingPagesExamples >> helloWorldSnippetPage [
	<moveablePage>
	<gtExample>
	^ (LePage named: 'A HelloWorld snippet page')
		addSnippet: (HelloWorldSnippet new
				contentString: 'Hello world!';
				yourself);
		yourself
]
