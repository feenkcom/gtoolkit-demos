Class {
	#name : #GtOneRenderingTree,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #'api - instantiation' }
GtOneRenderingTree >> create [
	| show |
	show := GtSlideShow new.
	show slides: { 
		GtTitleSlide new
			titleText: ('one rendering tree' asRopedText fontSize: 70; glamorousRegularFont).

		GtTitleSlide new
			titleText: ('the text editor is made of plain elements' asRopedText fontSize: 30; glamorousRegularFont).
		GtEditorElementWithRotatedWords new.
		GtEditorElementWithTreeSlide new.	
"		GtEditorElementWithDebugCharacterSlide new."

		GtTitleSlide new
			titleText: ('visualizations can be combined with regular elements' asRopedText fontSize: 30; glamorousRegularFont).
		GtSearchFilterHierarchySlide new.
		
		GtTitleSlide new
			titleText: ('graph layouts are regular layouts' asRopedText fontSize: 30; glamorousRegularFont).
		GtBlocSpecialClassHierarchyWithGridSlide new.
		GtBlocSpecialClassHierarchyWithEdgesSlide new.
		GtBlocSpecialClassHierarchyWithEdgesAndLinesSlide new.

		GtTitleSlide new
			titleText: ('new kind of interfaces' asRopedText fontSize: 30; glamorousRegularFont).
		GtConnectorForExampleSlide new.
		self liveElementTree.
		GtArrowHeadWithEmbeddedWorldSlide new.
				
	}.
	^ show
]

{ #category : #'api - instantiation' }
GtOneRenderingTree >> liveElementTree [ 
	| m |
	m := GtMondrian new.
	m nodes 
		stencil: [BlElement new geometry: BlEllipse new; border: (BlBorder paint: Color blue width: 1)];
		with: (1 to: 5).
	m edges 
		fromCenterBottom;
		toCenterTop;
		connectFrom: [:x | x // 2].
	m layout tree.
	^ GtLiveElementTreeSlide new 
		targetElement: (BlUseAsyncFeatures disableDuring: [
			(m gtViewsFor: GtPhlowView empty) asElementDo: [:e | e ]]) forceLayout.
]
