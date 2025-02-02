Extension { #name : #MovingPagesExamples }

{ #category : #'*GToolkit-Demo-Snippets' }
MovingPagesExamples >> blockQuoteSnippetPage [
	"Not yet working ..."
	
	"<moveablePage>"
	<gtExample>
	^ (LePage named: 'A BlockQuote snippet page')
		addSnippet: (LeBlockQuoteSnippet new
				contentString: 'Literal text';
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
