Trait {
	#name : #TPillarWebPageGroup,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #serarching }
TPillarWebPageGroup >> gtSpotterForPageContents: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Page content';
		priority: 20;
		items: [ self pages ];
		itemsLimit: Float infinity;
		itemName: #contents;
		sendCategory: [ :aCategory :aStep :thisSearch | PillarWebPageGroup withAll: aCategory items ];
		filterBySubstring
]

{ #category : #serarching }
TPillarWebPageGroup >> gtSpotterForPageNames: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Page names';
		priority: 10;
		items: [ self pages ];
		itemsLimit: Float infinity;
		itemName: #path;
		sendCategory: [ :aCategory :aStep :thisSearch | PillarWebPageGroup withAll: aCategory items ];
		filterBySubstring
]

{ #category : #accessing }
TPillarWebPageGroup >> pages [
	^ self explicitRequirement
]
