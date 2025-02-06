Extension { #name : #GtPhlowTreeViewExamples }

{ #category : #'*GToolkit-Demo-Snippets' }
GtPhlowTreeViewExamples >> snippetClassHierarchy [
	<gtExample>
	^ self emptyTree
		items: [ {LeSnippet} ];
		children: #subclasses;
		expandAll;
		yourself
]
