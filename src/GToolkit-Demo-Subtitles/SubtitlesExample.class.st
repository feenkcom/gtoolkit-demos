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
SubtitlesExample >> auHasardItScaled [
	"Scale Italian subs to match English subs.
	Note that we can explicitly write out timings or copy them from other subs."

	<gtExample>
	<noTest>
	| itSubs enSubs |
	enSubs := self auHasardEn.
	itSubs := self auHasardIt.
	itSubs
		scaleAll: 1
		to: 2 minutes + 37.8 seconds
		and: itSubs entries size
		to: enSubs entries last start.
	self assert: itSubs entries first newStart equals: 2 minutes + 37.8 seconds.
	self assert: itSubs entries last newStart equals: enSubs entries last start.
	^ itSubs
]

{ #category : #accessing }
SubtitlesExample >> subsDir [
	^ FileLocator gtResource / 'feenkcom' / 'gtoolkit-demos' / 'data' / 'subtitles'
]
