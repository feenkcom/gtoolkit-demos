Class {
	#name : #GtMoldableDevelopmentSlideshow,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> dailyAssessmentSlideFor: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 72;
		fileReference:(GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/processes-5.png').
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide2For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 54;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/50percent-1.png').
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide3For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide filePicture
		priority: 55;
		fileReference:(GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/50percent-2.png').
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide4For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide filePicture
		priority: 56;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/50percent-3.png').
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide5For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide filePicture
		priority: 60;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/craft-1.png').
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide6For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide filePicture
		priority: 62;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/craft-2.png').
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide7For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide filePicture
		priority: 63;
		fileReference:(GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/craft-3.png').
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide8For: aSlide [
	<gtSlide>
	^ aSlide filePicture
		priority: 70;
		fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/roles-1.png').
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide9For: aSlide [
	<gtSlide>
	"Rename this method to be more representative for your slide"
	^ aSlide filePicture
		priority: 71;
		fileReference:(GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/roles-2.png').
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> titleFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Moldable Development' asRopedText 
			fontSize: 50;
			glamorousRegularFont;
			bold)
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> wardletMapSlideFor: aSlide [
	<gtSlide>
	^ aSlide wardleyMap
		priority: 81;
		json: '{
	"nodes" : [
		{
			"id" : "1e046827-9a78-0d00-86f1-98310b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"x" : 0.4093923370874334,
			"y" : 0.11639613108685265,
			"width" : 12,
			"height" : 12,
			"label" : {
				"x" : 0.0,
				"y" : -1.0833333333333337,
				"text" : "developers"
			}
		},
		{
			"id" : "66046827-9a78-0d00-86f2-e7230b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"x" : 0.5221807413386634,
			"y" : 0.11534017609121104,
			"width" : 12,
			"height" : 12,
			"label" : {
				"x" : 0.75,
				"y" : -1.0,
				"text" : "business"
			}
		},
		{
			"id" : "89046827-9a78-0d00-86f3-bdf50b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"x" : 0.4693487100886635,
			"y" : 0.23230852080267633,
			"width" : 12,
			"height" : 12,
			"label" : {
				"x" : -3.1666666666666665,
				"y" : 0.5,
				"text" : "challenge"
			}
		},
		{
			"id" : "8c046827-9a78-0d00-86f4-4d3e0b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"x" : 0.4154730902777778,
			"y" : 0.3966699479418738,
			"width" : 12,
			"height" : 12,
			"label" : {
				"x" : -3.0833333333333335,
				"y" : -1.6666666666666667,
				"text" : "specific problem"
			}
		},
		{
			"id" : "8e046827-9a78-0d00-86f5-21770b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"x" : 0.6432237413194445,
			"y" : 0.3617191017814502,
			"width" : 12,
			"height" : 12,
			"label" : {
				"x" : 2.6666666666666665,
				"y" : -1.0,
				"text" : "assessment"
			}
		},
		{
			"id" : "8f046827-9a78-0d00-86f6-3ff00b72c6e0",
			"color" : {
				"green" : 0.5004887585532747,
				"blue" : 0.5004887585532747,
				"alpha" : 1.0,
				"red" : 0.5004887585532747
			},
			"x" : 0.32525246883328207,
			"y" : 0.5053611254497014,
			"width" : 12,
			"height" : 12,
			"label" : {
				"x" : 2.4166666666666665,
				"y" : 2.3333333333333335,
				"text" : " manual views"
			}
		},
		{
			"id" : "91046827-9a78-0d00-86f7-abb40b72c6e0",
			"color" : {
				"green" : 0.624633431085044,
				"blue" : 0.624633431085044,
				"alpha" : 1.0,
				"red" : 0.624633431085044
			},
			"x" : 0.21495225694444445,
			"y" : 0.6436846825102976,
			"width" : 12,
			"height" : 12,
			"label" : {
				"x" : -2.1666666666666665,
				"y" : 2.0833333333333335,
				"text" : "manual inspection"
			}
		},
		{
			"id" : "92046827-9a78-0d00-86f8-c3280b72c6e0",
			"color" : {
				"green" : 0.624633431085044,
				"blue" : 0.624633431085044,
				"alpha" : 1.0,
				"red" : 0.624633431085044
			},
			"x" : 0.5421115451388889,
			"y" : 0.8358941180088093,
			"width" : 12,
			"height" : 12,
			"label" : {
				"x" : 0.5,
				"y" : 2.0,
				"text" : "rigid tools"
			}
		},
		{
			"id" : "94046827-9a78-0d00-86f9-90e80b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"x" : 0.4484917534722222,
			"y" : 0.6471892023721216,
			"width" : 12,
			"height" : 12,
			"label" : {
				"x" : -2.25,
				"y" : 2.0833333333333335,
				"text" : "specific coding"
			}
		},
		{
			"id" : "96046827-9a78-0d00-86fa-9df00b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"x" : 0.6888617621527777,
			"y" : 0.83405731055529,
			"width" : 12,
			"height" : 12,
			"label" : {
				"x" : 0.5,
				"y" : 2.0,
				"text" : "moldable tools"
			}
		},
		{
			"id" : "98046827-9a78-0d00-86fb-186c0b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"x" : 0.808447265625,
			"y" : 0.5108094640569788,
			"width" : 12,
			"height" : 12,
			"label" : {
				"x" : 4.0,
				"y" : 2.0,
				"text" : "generated views"
			}
		}
	],
	"edges" : [
		{
			"from" : "1e046827-9a78-0d00-86f1-98310b72c6e0",
			"to" : "89046827-9a78-0d00-86f3-bdf50b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"width" : 2.0,
			"arrow" : false
		},
		{
			"from" : "66046827-9a78-0d00-86f2-e7230b72c6e0",
			"to" : "89046827-9a78-0d00-86f3-bdf50b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"width" : 2.0,
			"arrow" : false
		},
		{
			"from" : "89046827-9a78-0d00-86f3-bdf50b72c6e0",
			"to" : "8c046827-9a78-0d00-86f4-4d3e0b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"width" : 2.0,
			"arrow" : false
		},
		{
			"from" : "89046827-9a78-0d00-86f3-bdf50b72c6e0",
			"to" : "8e046827-9a78-0d00-86f5-21770b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"width" : 2.0,
			"arrow" : false
		},
		{
			"from" : "8c046827-9a78-0d00-86f4-4d3e0b72c6e0",
			"to" : "8f046827-9a78-0d00-86f6-3ff00b72c6e0",
			"color" : {
				"green" : 0.624633431085044,
				"blue" : 0.624633431085044,
				"alpha" : 1.0,
				"red" : 0.624633431085044
			},
			"width" : 1.0,
			"arrow" : false
		},
		{
			"from" : "8f046827-9a78-0d00-86f6-3ff00b72c6e0",
			"to" : "91046827-9a78-0d00-86f7-abb40b72c6e0",
			"color" : {
				"green" : 0.5004887585532747,
				"blue" : 0.5004887585532747,
				"alpha" : 1.0,
				"red" : 0.5004887585532747
			},
			"width" : 1.0,
			"arrow" : false
		},
		{
			"from" : "91046827-9a78-0d00-86f7-abb40b72c6e0",
			"to" : "92046827-9a78-0d00-86f8-c3280b72c6e0",
			"color" : {
				"green" : 0.624633431085044,
				"blue" : 0.624633431085044,
				"alpha" : 1.0,
				"red" : 0.624633431085044
			},
			"width" : 1.0,
			"arrow" : false
		},
		{
			"from" : "94046827-9a78-0d00-86f9-90e80b72c6e0",
			"to" : "98046827-9a78-0d00-86fb-186c0b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"width" : 2.0,
			"arrow" : false
		},
		{
			"from" : "94046827-9a78-0d00-86f9-90e80b72c6e0",
			"to" : "96046827-9a78-0d00-86fa-9df00b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"width" : 2.0,
			"arrow" : false
		},
		{
			"from" : "96046827-9a78-0d00-86fa-9df00b72c6e0",
			"to" : "98046827-9a78-0d00-86fb-186c0b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"width" : 2.0,
			"arrow" : false
		},
		{
			"from" : "98046827-9a78-0d00-86fb-186c0b72c6e0",
			"to" : "8e046827-9a78-0d00-86f5-21770b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"width" : 2.0,
			"arrow" : false
		},
		{
			"from" : "8f046827-9a78-0d00-86f6-3ff00b72c6e0",
			"to" : "8e046827-9a78-0d00-86f5-21770b72c6e0",
			"color" : {
				"green" : 0.624633431085044,
				"blue" : 0.624633431085044,
				"alpha" : 1.0,
				"red" : 0.624633431085044
			},
			"width" : 1.0,
			"arrow" : false
		},
		{
			"from" : "8c046827-9a78-0d00-86f4-4d3e0b72c6e0",
			"to" : "8e046827-9a78-0d00-86f5-21770b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"width" : 2.0,
			"arrow" : false
		},
		{
			"from" : "8c046827-9a78-0d00-86f4-4d3e0b72c6e0",
			"to" : "94046827-9a78-0d00-86f9-90e80b72c6e0",
			"color" : {
				"green" : 0.0,
				"blue" : 0.0,
				"alpha" : 1.0,
				"red" : 0.0
			},
			"width" : 2.0,
			"arrow" : false
		},
		{
			"from" : "8f046827-9a78-0d00-86f6-3ff00b72c6e0",
			"to" : "98046827-9a78-0d00-86fb-186c0b72c6e0",
			"color" : {
				"green" : 0.030303030303030304,
				"blue" : 0.030303030303030304,
				"alpha" : 1.0,
				"red" : 1.0
			},
			"width" : 2.48832,
			"arrow" : true
		},
		{
			"from" : "91046827-9a78-0d00-86f7-abb40b72c6e0",
			"to" : "94046827-9a78-0d00-86f9-90e80b72c6e0",
			"color" : {
				"green" : 0.030303030303030304,
				"blue" : 0.030303030303030304,
				"alpha" : 1.0,
				"red" : 1.0
			},
			"width" : 2.48832,
			"arrow" : true
		},
		{
			"from" : "92046827-9a78-0d00-86f8-c3280b72c6e0",
			"to" : "96046827-9a78-0d00-86fa-9df00b72c6e0",
			"color" : {
				"green" : 0.030303030303030304,
				"blue" : 0.030303030303030304,
				"alpha" : 1.0,
				"red" : 1.0
			},
			"width" : 2.48832,
			"arrow" : true
		}
	]
}'
]
