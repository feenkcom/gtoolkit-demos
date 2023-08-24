Class {
	#name : #WebPageGroup,
	#superclass : #Object,
	#traits : 'TGtGroupWithItems + TWebPageGroup',
	#classTraits : 'TGtGroupWithItems classTrait + TWebPageGroup classTrait',
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #accessing }
WebPageGroup >> pages [
	^ self items
]
