Class {
	#name : #EsugWebsiteWrapperWithPagesView,
	#superclass : #EsugWebsiteWrapperWithPages,
	#category : #'GToolkit-Demo-WebsiteExplorer-Demo'
}

{ #category : #accessing }
EsugWebsiteWrapperWithPagesView >> gtPagesFor: aView [
	<gtView>
	^ aView forward
		title: 'Pages';
		priority: 10;
		object: [ self pages ];
		view: #gtItemsFor:
]
