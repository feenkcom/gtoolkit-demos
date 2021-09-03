"
browser := GLMTabulator new.
	browser
		column: #one;
		column: #two.
	browser
		transmit to: #one;
		andShow: [ :canvas | 
			 canvas list
				format: #fullName;
				icon: #icon ].
	browser
		transmit to: #two;
		from: #one port: #selection;
		andShow: [ :canvas | 
			canvas morph
				display: #previewMorph ].
	^ browser openOn: self


"
Class {
	#name : 'GtABPreviewMorph',
	#superclass : 'GLMFoundationBrick',
	#instVars : [
		'contact'
	],
	#category : 'GToolkit-Demo-AddressBook-Morphs'
}

{ #category : 'initialization' }
GtABPreviewMorph >> buildMorph [

	self addBrickBack: self createBasicInformationMorph.
	self addBrickBack: self createDelimiterMorph.
	self addBrickBack: self createPersonalInformationBrick
	
]

{ #category : 'accessing' }
GtABPreviewMorph >> contact [
	^ contact
]

{ #category : 'accessing' }
GtABPreviewMorph >> contact: anObject [
	contact := anObject.
	self buildMorph
]

{ #category : 'initialization' }
GtABPreviewMorph >> createBasicInformationMorph [
	^ GLMBandBrick new
		hSpaceFill;
		useHorizontalLinearLayout;
		addBrickBack: (self newImageMorph
			normalImage: self contact avatar;
			hShrinkWrap;
			vShrinkWrap;
			marginLeft: 10;
			marginTop: 10;
			maxHeight: 100;
			maxWidth: 100);
		addBrickBack:(self newInformationMorph
			hSpaceFill;
			marginLeft: 10;
			marginTop: 2;
			addBrickBack: (GLMLabelBrick new
				text: self contact fullName;
				fontSize: 25;
				marginLeft: 5;
				hSpaceFill;
				vShrinkWrap);
			addBrickBack: (GLMRubTextAreaBrick new
				text: (self contact description size > 200
					ifTrue: [ (self contact description first: 200), '...' ]
					ifFalse: [ self contact description ]);
				hSpaceFill;
				vShrinkWrap);
			yourself);
		yourself
]

{ #category : 'initialization' }
GtABPreviewMorph >> createDelimiterMorph [
	^ GLMBrick new
		color: Color veryVeryLightGray;
		hSpaceFill;
		height: 1
]

{ #category : 'initialization' }
GtABPreviewMorph >> createPersonalInformationBrick [
	| brick |
	brick := GLMBandBrick new
		margin: 20;
		vShrinkWrap;
		hSpaceFill.
	(self contact addresses ifNotEmpty: [ 
		brick
			addBrickBack: (self personal: 'Country' value: self contact addresses first country);
			addBrickBack: (self personal: 'City' value: self contact addresses first city) ]).
	self contact telephones do: [ :aTelephone |
		brick addBrickBack: (self personal: 'Telephone' value: aTelephone fullNumber). ].
	^ brick
]

{ #category : 'initialization' }
GtABPreviewMorph >> initialize [
	super initialize.
	self color: Color white.
	self brickRoot useVerticalLinearLayout
]

{ #category : 'instance creation' }
GtABPreviewMorph >> newImageMorph [
	^ GLMActionButtonBrick new
]

{ #category : 'instance creation' }
GtABPreviewMorph >> newInformationMorph [
	^ GLMBandBrick new
]

{ #category : 'initialization' }
GtABPreviewMorph >> personal: aString value: anotherString [
	^ GLMBrick new
		hSpaceFill;
		marginTop: 4;
		marginBottom: 4;
		vShrinkWrap;
		addBrickBack: (GLMLabelBrick new
			text: aString;
			hSpaceFill: 20;
			maxWidth: 100;
			vShrinkWrap);
		addBrickBack: (GLMLabelBrick new
			text: anotherString;
			hSpaceFill: 80;
			vShrinkWrap);
		yourself
]
