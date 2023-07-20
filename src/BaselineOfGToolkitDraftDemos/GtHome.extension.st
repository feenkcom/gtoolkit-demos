Extension { #name : #GtHome }

{ #category : #'*BaselineOfGToolkitDraftDemos' }
GtHome >> gtDemosSection [
	<gtHomeSection>
	^ GtHomeStartPageSection new 
		title: 'GToolkit Draft Demos';
		description: 'GToolkit Draft Demos';
		databaseName: 'feenkcom/gtoolkit-demos/lepiter';
		startPageName: 'GToolkit Draft Demos';
		priority: 8
]
