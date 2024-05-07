Extension { #name : #MemoryLogger }

{ #category : #'*GToolkit-Demo-LampSort' }
MemoryLogger >> gtViewLampSortHistoryFor: composite [
	<gtView>
	interestingAnnouncements ifNil: [ ^ composite empty ].
	(interestingAnnouncements handlesAnnouncement: GtLampSortAnnouncement new)
		ifFalse: [ ^ composite empty].
	^ composite list
		title: 'LampSort history';
		priority: 90;
		items: recordings;
		itemStencil: [ 
			BlScalableElement new
				size: 400 @ 250;
				margin: (BlInsets all: 10) ];
		itemDataBinder: [ :eachElement :eachAnnoucement :eachIndex | 
			eachElement addChild:
				  (eachAnnoucement asVisualisationElement
					   when: BlClickEvent
					   do: [ :e | 
						   e consumed: true.
						   e target phlow spawnObject: eachAnnoucement ]) ]
]
