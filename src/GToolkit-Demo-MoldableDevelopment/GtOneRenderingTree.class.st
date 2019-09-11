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
		
		GtLiveElementTreeSlide new targetElement: ((GtMethodCoder forMethod: Object>>#printString) ensureBuilt; expanded: true; asElement) forceLayout.

		GtTitleSlide new
			titleText: ('graph layouts are regular layouts' asRopedText fontSize: 30; glamorousRegularFont).
		GtBlocSpecialClassHierarchyWithGridSlide new.
		GtBlocSpecialClassHierarchyWithEdgesSlide new.
		GtBlocSpecialClassHierarchyWithEdgesAndLinesSlide new.

		GtTitleSlide new
			titleText: ('new kind of interfaces' asRopedText fontSize: 30; glamorousRegularFont).
		GtConnectorForExampleSlide new.

		GtArrowHeadWithEmbeddedWorldSlide new.
				
	}.
	^ show
]
