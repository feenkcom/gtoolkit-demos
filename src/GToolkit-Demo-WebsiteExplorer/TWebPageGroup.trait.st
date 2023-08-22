"
I provide spotter searchers for classes that hold a collection of web pages.
"
Trait {
	#name : #TWebPageGroup,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #searching }
TWebPageGroup >> gtSpotterForLinkNames: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Link names';
		priority: 10;
		items: [ self links ];
		itemsLimit: Float infinity;
		itemName: #path;
		sendCategory: [ :aCategory :aStep :thisSearch | self webPageGroupClass withAll: aCategory items contents ];
		filterBySubstring
]

{ #category : #searching }
TWebPageGroup >> gtSpotterForPageContents: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Page content';
		priority: 20;
		items: [ self pages ];
		itemsLimit: Float infinity;
		itemName: #contents;
		sendCategory: [ :aCategory :aStep :thisSearch | self webPageGroupClass withAll: aCategory items contents ];
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
		sendCategory: [ :aCategory :aStep :thisSearch | self webPageGroupClass withAll: aCategory items contents ];
		filterBySubstring
]

{ #category : #accessing }
TWebPageGroup >> pages [
	^ self explicitRequirement
]

{ #category : #constant }
TWebPageGroup >> webPageGroupClass [
	"Which class should be used to instantiate groups of web pages."

	^ PillarWebPageGroup
]
