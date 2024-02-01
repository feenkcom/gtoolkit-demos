Class {
	#name : #SubtitlesExample,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Subtitles-Examples'
}

{ #category : #accessing }
SubtitlesExample >> auHasardEn [
	<gtExample>
	<noTest>
	|  ahb subs |
	ahb := self subsDir / 'Au hasard Balthazar (1966) en.srt'.
	subs := Subtitles for: ahb.
	^ subs
]

{ #category : #accessing }
SubtitlesExample >> auHasardIt [
	<gtExample>
	<noTest>
	|  ahb subs |
	ahb := self subsDir / 'Au hasard Balthazar (1966) it.srt'.
	subs := Subtitles for: ahb.
	^ subs
]

{ #category : #accessing }
SubtitlesExample >> subsDir [
	^ FileLocator gtResource / 'feenkcom' / 'gtoolkit-demos' / 'data' / 'subtitles'
]
