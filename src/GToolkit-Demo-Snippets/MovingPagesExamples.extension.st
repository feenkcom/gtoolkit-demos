Extension { #name : #MovingPagesExamples }

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
