Class {
	#name : #WebPageGroup,
	#superclass : #Object,
	#traits : 'TGtGroupWithItems + TWebPageGroup',
	#classTraits : 'TGtGroupWithItems classTrait + TWebPageGroup classTrait',
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #view }
WebPageGroup >> gtMapFor: aView [
	"I have to ask the website of one of the pages to generate the map. A group does not have a root page, so we use nil (only needed for coloring the root)."

	<gtView>
	self website ifNil: [ ^ aView empty ].
	^ aView mondrian
		title: 'Map';
		priority: 62;
		painting: [ :aMondrian | 
			self website
				mapFor: aMondrian
				from: nil
				with: self pages ]
]

{ #category : #requirement }
WebPageGroup >> pages [
	^ self
]

{ #category : #accessing }
WebPageGroup >> reachable [
	^ self webPageGroupClass
		withAll: (self website
				ifNil: [ {} ]
				ifNotNil: [ self website reachable items intersection: self pages items ])
]

{ #category : #accessing }
WebPageGroup >> unreachable [
	^ self webPageGroupClass
		withAll: (self pages items difference: self reachable items)
]

{ #category : #accessing }
WebPageGroup >> website [
	^ self pages ifEmpty: [ nil ] ifNotEmpty: [ self pages first website ]
]
