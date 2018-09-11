Extension { #name : #GTPlayground }

{ #category : #'*GToolkit-Demos' }
GTPlayground >> gtDemoAction [
	<pageAction>

	^ GLMAction new
		action: [ :aPresentation :aPage |
			aPage switchNext.
			aPresentation update ];
		title: 'Next step';
		icon: (Smalltalk ui icons iconNamed: #forward);
		condition: [ :aPresentation :aPage |
			(aPage isKindOf: GtDemoPlayPage)
				and: [ aPage hasNext ] ];
		yourself
]
