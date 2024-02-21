Extension { #name : #GtHomeMultiCardGetStartedSection }

{ #category : #'*GToolkit-Tutorial-Prices' }
GtHomeMultiCardGetStartedSection >> eddTutorialCard [
	<gtSectionCard>
	<gtExample>
	<notest>
	^ GtHomeCard page
		priority: 15;
		title: 'EDD Tutorial';
		pageName: 'Example-Driven Development Tutorial';
		databaseName: 'feenkcom/gtoolkit-demos/lepiter';
		yourself
]

{ #category : #'*GToolkit-Tutorial-Prices' }
GtHomeMultiCardGetStartedSection >> patternsCard [
	<gtSectionCard>
	<gtExample>
	<notest>
	^ GtHomeCard page
		priority: 50;
		pageName: 'Moldable Development patterns';
		databaseName: self gtBookName;
		yourself
]
