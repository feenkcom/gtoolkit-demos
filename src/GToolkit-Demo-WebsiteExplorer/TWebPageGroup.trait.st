Trait {
	#name : #TWebPageGroup,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #searching }
TWebPageGroup >> gtSpotterForPageContents: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Page content';
		priority: 20;
		items: [ self pages ];
		itemsLimit: Float infinity;
		itemName: #contents;
		sendCategory: [ :aCategory :aStep :thisSearch | PillarWebPageGroup withAll: aCategory items contents ];
		filterBySubstring
]

{ #category : #searching }
TWebPageGroup >> gtSpotterForPageNames: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Page names';
		priority: 10;
		items: [ self pages ];
		itemsLimit: Float infinity;
		itemName: #path;
		sendCategory: [ :aCategory :aStep :thisSearch | PillarWebPageGroup withAll: aCategory items contents ];
		filterBySubstring
]

{ #category : #accessing }
TWebPageGroup >> pages [
	^ self explicitRequirement
]
