"
I am GtLampSort, a simple divide and conquer sorting algorithm, a non-recursive QuickSort.

My implementation is such that subclasses can instrument each of my elementary operations.
"
Class {
	#name : #GtLampSort,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #'GToolkit-Demo-LampSort-Core'
}

{ #category : #steps }
GtLampSort >> addIntervals: newIntervals to: intervals [
	<gtTrace>
	intervals addAll: newIntervals 
]

{ #category : #accessing }
GtLampSort >> elements [
	^ elements
]

{ #category : #accessing }
GtLampSort >> elements: aCollection [
	elements := aCollection
]

{ #category : #examples }
GtLampSort >> gtExampleSortRandom [
	<gtExample>
	<return: #GtLampSort>
	| numbers sorted |
	numbers := (1 to: 10) collect: [ :_ | 100 atRandom ].
	sorted := self sort: numbers copy.
	self assert: sorted equals: numbers sorted
]

{ #category : #examples }
GtLampSort >> gtExampleSortSpecific [
	<gtExample>
	<return: #GtLampSort>
	| numbers sorted |
	numbers := #(7 12 3 20 5 8 2).
	sorted := self sort: numbers copy.
	self assert: sorted equals: #(2 3 5 7 8 12 20)
]

{ #category : #steps }
GtLampSort >> partition: interval [
	<gtTrace>
	| pivot index |
	pivot := self selectFirstElementAsPivot: interval.
	self swap: interval first with: interval last.
	index := interval first.
	interval first to: interval last - 1 do: [ :each | 
		(elements at: each) < pivot
			ifTrue: [ 
				self swap: each with: index.
				index := index + 1 ] ].
	self swap: interval last with: index.
	^ self splitInterval: interval around: index
]

{ #category : #copying }
GtLampSort >> postCopy [
	super postCopy.
	elements := elements copy
]

{ #category : #steps }
GtLampSort >> selectFirstElementAsPivot: interval [
	<gtTrace>
	^ elements at: interval first
]

{ #category : #steps }
GtLampSort >> selectIntervalFrom: intervals [
	<gtTrace>
	| interval |
	interval := intervals anyOne.
	intervals remove: interval.
	^ interval
]

{ #category : #steps }
GtLampSort >> sort [
	<gtTrace>
	| intervals selectedInterval partitions |
	intervals := Set with: (1 to: elements size).
	[ intervals isEmpty ]
		whileFalse: [ 
			selectedInterval := self selectIntervalFrom: intervals.
			selectedInterval size > 1
				ifTrue: [
					partitions := self partition: selectedInterval.
					self addIntervals: partitions to: intervals ] ]
]

{ #category : #api }
GtLampSort >> sort: collection [
	^ self
		elements: collection;
		sort;
		elements
]

{ #category : #steps }
GtLampSort >> splitInterval: interval around: index [
	<gtTrace>
	| left right |
	left := interval first to: index - 1.
	right := index + 1 to: interval last.
	^ { left . right}
]

{ #category : #steps }
GtLampSort >> swap: oneIndex with: anotherIndex [
	<gtTrace>
	elements swap: oneIndex with: anotherIndex
]
