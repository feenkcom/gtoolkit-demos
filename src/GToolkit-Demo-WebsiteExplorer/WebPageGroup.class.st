Class {
	#name : #WebPageGroup,
	#superclass : #Object,
	#traits : 'TGtGroupWithItems + TWebPageGroup',
	#classTraits : 'TGtGroupWithItems classTrait + TWebPageGroup classTrait',
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #view }
WebPageGroup >> gtPagesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Pages';
		priority: 10;
		items: [ self items ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Page'
			text: [ :item | item path ]
			width: 400;
		column: 'Links'
			text: [ :item | 
				| size |
				size := item markdownLinks size.
				size = 0 ifTrue: [ '' ] ifFalse: [ size ] ]
			width: 80
]

{ #category : #accessing }
WebPageGroup >> pages [
	^ self items
]
