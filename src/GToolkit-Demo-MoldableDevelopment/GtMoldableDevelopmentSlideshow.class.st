Class {
	#name : #GtMoldableDevelopmentSlideshow,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> dailyAssessmentSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide textAndElement
		priority: 92;
		newText: 'Moldable development has several implications. One of them is to enable the enabling of steering agile architecture.';
		element: [ GtFilePictureLiveSlide new fileReference:(GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/processes-5.png') ].
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> fiftyPercent1For: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		elementWeight: 0.70;
		priority: 54;
		newText: 'When we think of software development, we typically think about the active part. Of constructing. Of building new worlds that never existed. It''s an empowering view.';
		element: [ 
			GtFilePictureLiveSlide new fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/50percent-1.png') ]
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide3For: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		elementWeight: 0.70;
		priority: 55;
		newText: 'Yet, when we look at what developers do, they actually spend most of their time figuring the system out. This currently happens implicitly.';
		newText: 'This is the single largest development expense we have. We have to make it explicit because that''s the only way to optimize it. So, let''s start that conversation.';
		element: [ 
			GtFilePictureLiveSlide new fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/50percent-2.png') ]
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide4For: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		elementWeight: 0.70;
		priority: 56;
		newText: 'Most of the figuring the system out time is spent reading. The reason people read code is to understand enough so that they figure out what to do next. That''s decision making.';
		newText: 'From this perspective, reading is but a means to gather information out of data (everything about your system is data; ok, objects if you are lucky). It also happens to be the most manual way to extract information out of data. And this is where we spend most of our time.';
		newText: 'The alternative is to treat this as a data problem.';
		element: [ 
			GtFilePictureLiveSlide new fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/50percent-3.png') ]
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide5For: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 60;
		elementWeight: 0.7;
		newText: 'When it comes to reasoning about data, we should always start with a hypothesis, apply an analysis, and interpret the results. If we are confident, we act. If not we repeat.';
		newText: 'Ok. That''s not new. It''s just the scientific method.';
		element: [ 
			GtFilePictureLiveSlide new fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/craft-1.png') ].
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide6For: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 62;
		elementWeight: 0.7;
		newText: 'However, because software is highly contextual, for a given problem we likely do not have an appropriate tool available. This is the main reason why developers read code: reading can handle any context; the only problem is that it''s too slow and innacurate.';
		newText: ' That is why it is essential to ask this simple question: "do we have an appropriate tool?".';
		element: [ 
			GtFilePictureLiveSlide new fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/craft-2.png') ].
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide7For: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 63;
		elementWeight: 0.7;
		newText: 'And if we don''t have an appropriate tool? We mold one. And we want to do this for every single development problem we have.';
		newText: 'That''s the essence of moldable development.';
		element: [ 
			GtFilePictureLiveSlide new fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/craft-3.png') ].
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide8For: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 70;
		elementWeight: 0.7;
		newText: 'Moldable Development relies on two distinct roles: the facilitator constructs custom tools; the stakeholder knows what to do with them. It''s really not that different from data science.';
		newText: 'The facilitator is a technologist. Who can be a stakeholder? Anyone with a stake in the system. That can be a product owner, a customer, a developer.';
		element: [GtFilePictureLiveSlide new fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/roles-1.png').]
]

{ #category : #slides }
GtMoldableDevelopmentSlideshow >> slide9For: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 71;
		elementWeight: 0.7;
		newText: 'Ah, the facilitator role is crosscutting and can be shared across different contexts.';
		element: [ GtFilePictureLiveSlide new fileReference: (GtResourcesUtility resourceAtPath: 'feenkcom/gtoolkit-demos/doc/moldable-development/roles-2.png') ]
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
	^ aSlide textAndElement
		priority: 81;
		newText: 'Why is Moldable Development important? Let''s look at it through a Wardley Map.';
		newText: 'A challenge always relates to a specific problem that requires a decision. As systems are highly contextual, assessing the problem requires custom views. Presently, people often create these views manually. This is a problem as systems are too large and change too quickly to be grasped manually.';
		newText: 'Instead, we inform the decision through custom views that are generated. They are custom in that we literally create them for every problem. We say that it''s the system''s responsibility to present itself in a way humans can reason about.';
		newText: 'Most of the development effort consists of people trying to figure the system out by reading their way through it. This is directly linked to the nature of tools. Typically, tools offer only generic out-of-the-box presentations. So, people read because that can be adapted.';
		newText: 'The alternative is to replace manual inspection through code that is specifically crafted for the problem. Through this, we generate custom views that become a commodity.';
				newText: 'To make this practical, we need moldable tools, but once those tools exist, new strategies for decision making are made possible.';
		element: [ 
		GtWardleyMapSlide new
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
				"text" : "decision"
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
}']
]
