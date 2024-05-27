Class {
	#name : #GtLampSortAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'elements',
		'timestamp',
		'processId'
	],
	#classVars : [
		'LampSortAnnouncer'
	],
	#category : #'GToolkit-Demo-LampSort-Announcements'
}

{ #category : #accessing }
GtLampSortAnnouncement class >> announcer [
	^ LampSortAnnouncer ifNil: [ LampSortAnnouncer := Announcer new ]
]

{ #category : #accessing }
GtLampSortAnnouncement >> announcer [
	^ self class announcer
]

{ #category : #'gt - extensions' }
GtLampSortAnnouncement >> asVisualisationElement [
	| dataGroup scale container chart dataPoints |
	dataPoints := elements withIndexCollect: [ :each :index | index -> each ].
	dataGroup := GtPlotterDataGroup new values: dataPoints.
	dataGroup := dataGroup labelled: [ :each | each key ].
	dataGroup := dataGroup
			background: [ :each | 
				(self shouldHighlightIndex: each key)
					ifTrue: [ Color black ]
					ifFalse: [ Color veryLightGray ] ].
	scale := GtPlotterLinearScale new
			domainFrom: 0
			to: (dataPoints collect: #value) max.
	chart := GtPlotterVerticalBarChart new
			with: dataGroup;
			barHeightData: [ :each | each value ];
			barHeightScale: scale.
	container := BrVerticalPane new fitContent cellSpacing: 10.
	container
		addChild: (BrLabel new
				margin: (BlInsets left: 10);
				aptitude: BrGlamorousLabelAptitude new;
				text: self printString);
		addChild: (chart asElement size: 400 @ 200).
	container
		vFitContent;
		hFitContent.
	^ container
]

{ #category : #accessing }
GtLampSortAnnouncement >> elements [
	^ elements
]

{ #category : #accessing }
GtLampSortAnnouncement >> elements: aCollection [
	elements := aCollection copy
]

{ #category : #public }
GtLampSortAnnouncement >> emit [
	^ self announcer announce: self
]

{ #category : #'gt - extensions' }
GtLampSortAnnouncement >> gtViewElementsIn: composite [
	<gtView>
	^ composite forward
		title: 'Elements';
		priority: 60;
		object: [ self elements ];
		view: #gtItemsFor:
]

{ #category : #'gt - extensions' }
GtLampSortAnnouncement >> gtViewVisualisationIn: composite [
	<gtView>
	^ composite explicit
		title: 'Visualisation';
		priority: 30;
		stencil: [ self asVisualisationElement ]
]

{ #category : #initialization }
GtLampSortAnnouncement >> initialize [
	super initialize.
	timestamp := DateAndTime now.
	processId := Processor activeProcess name.
]

{ #category : #accessing }
GtLampSortAnnouncement >> name [
	^ self class name
]

{ #category : #printing }
GtLampSortAnnouncement >> printOneLineContentsOn: stream [
	^ self printOn: stream
]

{ #category : #accessing }
GtLampSortAnnouncement >> processId [
	^ processId
]

{ #category : #testing }
GtLampSortAnnouncement >> shouldHighlightIndex: index [
	^ false
]

{ #category : #accessing }
GtLampSortAnnouncement >> timestamp [
	^ timestamp
]
