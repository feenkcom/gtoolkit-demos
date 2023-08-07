"
I am an abstract parent of classes  with a collection of web links, namely Pillar WebLinkGroupand PillarWebsite.
"
Class {
	#name : #APillarWebLinkGroup,
	#superclass : #Object,
	#instVars : [
		'announcer'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #announcements }
APillarWebLinkGroup >> announcer [
	^ announcer
]

{ #category : #announcements }
APillarWebLinkGroup >> announcer: anAnnouncement [
	announcer := anAnnouncement
]

{ #category : #view }
APillarWebLinkGroup >> gtLinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Links';
		priority: 30;
		items: [ self links ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Link'
			text: [ :item | item path ]
			width: 300;
		column: '# Pages'
			text: [ :item | item pages size ]
			width: 60;
		column: 'Status' text: [ :item | item status ];
		actionUpdateButton;
		updateWhen: PillarWebLinkStatusUpdated in: self announcer
]

{ #category : #initialization }
APillarWebLinkGroup >> initialize [
	super initialize.
	self announcer: Announcer new 
]

{ #category : #abstract }
APillarWebLinkGroup >> links [
	self subclassResponsibility
]
