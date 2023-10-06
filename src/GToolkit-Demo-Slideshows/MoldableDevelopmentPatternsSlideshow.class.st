"
Draft slides for Smalltalks 2023 in Quilmes AR.
"
Class {
	#name : #MoldableDevelopmentPatternsSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> conclusions: aSlide [
	<gtSlide>
	<text: '# Conclusions 

TODO'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asTitle: 'Conclusions')

]

{ #category : #figures }
MoldableDevelopmentPatternsSlideshow >> patternMapScenery [
	<gtExample>
	<noTest>
	| scenery item1 item2 item3 item4 item5 item6 item7 item8 item9 |
scenery := GtScenery new.
item1 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Moldable Object')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 16; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item1 position: (285@77).
item1 extent: (157.98685709635419@40.0).
item2 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Viewable Data Wrapper')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 22; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item2 position: (600.0@77.99999999999999).
item2 extent: (219.53648885091116@40.000000000000014).
item3 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Contextual Playground')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 22; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item3 position: (256.0@237.99999999999997).
item3 extent: (217.81504313151044@40.00000000000003).
item4 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Viewable Entity')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 16; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item4 position: (190.0@359.99999999999994).
item4 extent: (152.59155273437494@40.0).
item5 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Custom Action')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 14; instVarAt: 2 put: ((Array new: 4) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontItalicAttribute new); at: 3 put: (BlFontWeightAttribute new weight: 700); at: 4 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item5 position: (400.99999999999994@357.99999999999994).
item5 extent: (144.4384256998697@40.0).
item6 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Simple View')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 12; instVarAt: 2 put: ((Array new: 4) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontItalicAttribute new); at: 3 put: (BlFontWeightAttribute new weight: 700); at: 4 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item6 position: (119.99999999999997@475.9999999999999).
item6 extent: (119.12862141927079@40.0).
item7 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Collection Wrapper')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 19; instVarAt: 2 put: ((Array new: 4) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontItalicAttribute new); at: 3 put: (BlFontWeightAttribute new weight: 700); at: 4 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item7 position: (281.0@475.9999999999999).
item7 extent: (189.85839843749994@40.0).
item8 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Project Diary')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 14; instVarAt: 2 put: ((Array new: 4) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontItalicAttribute new); at: 3 put: (BlFontWeightAttribute new weight: 700); at: 4 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item8 position: (636@151).
item8 extent: (131.41372680664063@40.0).
item9 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Example Object')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 15; instVarAt: 2 put: ((Array new: 4) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontItalicAttribute new); at: 3 put: (BlFontWeightAttribute new weight: 700); at: 4 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item9 position: (624@237).
item9 extent: (156.98435465494777@40.0).
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item1 to: item2.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item2 to: item1.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item1 to: item3.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item3 to: item4.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item3 to: item5.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item4 to: item6.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item4 to: item7.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item1 to: item8.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item3 to: item9.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item8 to: item9.


^ scenery
]

{ #category : #accessing }
MoldableDevelopmentPatternsSlideshow >> slidePriorities [
	"This method defines the slide priorities implicitly by their order instead of by fixed numbers.
	See also: PrioritySlideshow>>#priorityFor:"
	<gtExample>
	^ #( 
		titleSlide:
		
		
		conclusions:
	
	)
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> titleSlide: aSlide [
	<gtSlide>
	<text: '# Moldable Development Patterns

TODO'>
	^ aSlide titleWithFooter
		setPriority;
		titleBottomPadding: 20;
		subtitleBottomPadding: 40;
		titleWithFormat: (self asTitle: 'Moldable Development Patterns');
		footerWithFormat: (self asBigText: 'oscar.nierstrasz@feenk.com')
]
