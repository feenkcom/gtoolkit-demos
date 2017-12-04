demos
transcriptAnimation
	^ self of: { 
'animation := GtTranscriptExamples new blocAnimation.
animation start'.

'animation := GtTranscriptExamples new blocAnimation.
animation start.

space := BlSpace new.
space extent: 150@150.
space root addChild: animation target.
space show.'.

'transcript := GtTranscript new.

animation := GtTranscriptExamples new blocAnimation.
animation
	addEventHandlerOn: BlAnimationStepEvent
	do: [ :anEvent |
		transcript next
			cr;
			putAll: ''Animation progress: '';
			putAll: anEvent progress asString;
			putAll: '', position: '', animation target children first transformedBounds origin asString ].
animation start.

transcript'.

'transcript := GtTranscript new.

animation := GtTranscriptExamples new blocAnimation.
animation
	addEventHandlerOn: BlAnimationStepEvent
	do: [ :anEvent |
		| snapshot |
		snapshot := animation target asSpartaForm.
		transcript next
			cr;
			expanded: [
				BlElement new
					constraintsDo: [ :c | c textFlow pushLine ];
					size: snapshot extent;
					background: (BlBackground image: snapshot) ];
			putAll: ''Animation progress: '';
			putAll: anEvent progress asString;
			putAll: '', position: '', animation target children first transformedBounds origin asString ].
animation start.

transcript'
}