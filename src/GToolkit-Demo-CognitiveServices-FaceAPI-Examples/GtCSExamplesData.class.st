"
I provide example data for creating pictures and faces. I can be used when a subscription key for the Azures Face API is not available.
"
Class {
	#name : #GtCSExamplesData,
	#superclass : #Object,
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI-Examples'
}

{ #category : #'wikipedia - json object' }
GtCSExamplesData class >> jsonEinsteinHabichtSolovine1280px [
	^ STONJSON fromString: self jsonTextFacesEinsteinHabichtSolovine1280px
]

{ #category : #'wikipedia - json object landmarks' }
GtCSExamplesData class >> jsonFaceLandmarksEinstein [
	^ STONJSON fromString: '{
			"noseRootRight" : {
				"x" : 912.4,
				"y" : 347.8
			},
			"eyeLeftTop" : {
				"x" : 887.4,
				"y" : 345.3
			},
			"eyebrowLeftInner" : {
				"x" : 897.1,
				"y" : 340.6
			},
			"upperLipTop" : {
				"x" : 911.1,
				"y" : 392.4
			},
			"noseRightAlarOutTip" : {
				"x" : 921.5,
				"y" : 374.2
			},
			"noseRootLeft" : {
				"x" : 900.6,
				"y" : 349.4
			},
			"noseTip" : {
				"x" : 907.2,
				"y" : 373.9
			},
			"pupilLeft" : {
				"x" : 888.1,
				"y" : 348.5
			},
			"mouthRight" : {
				"x" : 931.5,
				"y" : 393.9
			},
			"pupilRight" : {
				"x" : 929.6,
				"y" : 344.3
			},
			"eyeRightInner" : {
				"x" : 922.0,
				"y" : 346.2
			},
			"noseRightAlarTop" : {
				"x" : 916.2,
				"y" : 365.0
			},
			"eyeRightBottom" : {
				"x" : 929.7,
				"y" : 349.3
			},
			"eyeLeftOuter" : {
				"x" : 881.7,
				"y" : 350.7
			},
			"eyebrowRightOuter" : {
				"x" : 944.3,
				"y" : 336.7
			},
			"eyeLeftInner" : {
				"x" : 895.1,
				"y" : 348.9
			},
			"underLipBottom" : {
				"x" : 912.5,
				"y" : 402.6
			},
			"eyebrowRightInner" : {
				"x" : 913.1,
				"y" : 337.5
			},
			"eyeLeftBottom" : {
				"x" : 888.7,
				"y" : 352.8
			},
			"eyeRightTop" : {
				"x" : 928.7,
				"y" : 341.4
			},
			"noseLeftAlarOutTip" : {
				"x" : 895.8,
				"y" : 377.1
			},
			"upperLipBottom" : {
				"x" : 911.4,
				"y" : 396.0
			},
			"mouthLeft" : {
				"x" : 894.9,
				"y" : 396.1
			},
			"eyeRightOuter" : {
				"x" : 936.3,
				"y" : 344.9
			},
			"underLipTop" : {
				"x" : 911.4,
				"y" : 397.1
			},
			"eyebrowLeftOuter" : {
				"x" : 870.7,
				"y" : 346.5
			},
			"noseLeftAlarTop" : {
				"x" : 900.3,
				"y" : 366.8
			}
		}'
	


]

{ #category : #'wikipedia - json object landmarks' }
GtCSExamplesData class >> jsonFaceLandmarksHabicht [
	^ STONJSON fromString: '{
			"noseRootRight" : {
				"x" : 335.1,
				"y" : 340.8
			},
			"eyeLeftTop" : {
				"x" : 305.9,
				"y" : 335.8
			},
			"eyebrowLeftInner" : {
				"x" : 319.7,
				"y" : 329.1
			},
			"upperLipTop" : {
				"x" : 331.3,
				"y" : 379.8
			},
			"noseRightAlarOutTip" : {
				"x" : 344.1,
				"y" : 363.9
			},
			"noseRootLeft" : {
				"x" : 324.2,
				"y" : 341.0
			},
			"noseTip" : {
				"x" : 334.0,
				"y" : 361.6
			},
			"pupilLeft" : {
				"x" : 307.2,
				"y" : 338.3
			},
			"mouthRight" : {
				"x" : 345.9,
				"y" : 387.6
			},
			"pupilRight" : {
				"x" : 347.0,
				"y" : 339.4
			},
			"eyeRightInner" : {
				"x" : 340.4,
				"y" : 340.2
			},
			"noseRightAlarTop" : {
				"x" : 340.3,
				"y" : 356.1
			},
			"eyeRightBottom" : {
				"x" : 347.0,
				"y" : 342.9
			},
			"eyeLeftOuter" : {
				"x" : 299.1,
				"y" : 340.5
			},
			"eyebrowRightOuter" : {
				"x" : 360.7,
				"y" : 332.7
			},
			"eyeLeftInner" : {
				"x" : 313.7,
				"y" : 339.8
			},
			"underLipBottom" : {
				"x" : 330.5,
				"y" : 393.8
			},
			"eyebrowRightInner" : {
				"x" : 337.0,
				"y" : 330.0
			},
			"eyeLeftBottom" : {
				"x" : 306.0,
				"y" : 341.8
			},
			"eyeRightTop" : {
				"x" : 347.1,
				"y" : 336.9
			},
			"noseLeftAlarOutTip" : {
				"x" : 316.5,
				"y" : 364.5
			},
			"upperLipBottom" : {
				"x" : 330.8,
				"y" : 384.7
			},
			"mouthLeft" : {
				"x" : 309.0,
				"y" : 387.6
			},
			"eyeRightOuter" : {
				"x" : 353.7,
				"y" : 341.2
			},
			"underLipTop" : {
				"x" : 330.8,
				"y" : 388.9
			},
			"eyebrowLeftOuter" : {
				"x" : 288.0,
				"y" : 332.3
			},
			"noseLeftAlarTop" : {
				"x" : 321.6,
				"y" : 356.7
			}
		}'
]

{ #category : #'wikipedia - json object landmarks' }
GtCSExamplesData class >> jsonFaceLandmarksSolovine [
	^ STONJSON fromString: '{
			"noseRootRight" : {
				"x" : 673.8,
				"y" : 199.8
			},
			"eyeLeftTop" : {
				"x" : 642.4,
				"y" : 197.3
			},
			"eyebrowLeftInner" : {
				"x" : 657.8,
				"y" : 192.6
			},
			"upperLipTop" : {
				"x" : 671.3,
				"y" : 236.3
			},
			"noseRightAlarOutTip" : {
				"x" : 683.5,
				"y" : 219.5
			},
			"noseRootLeft" : {
				"x" : 661.8,
				"y" : 201.0
			},
			"noseTip" : {
				"x" : 671.2,
				"y" : 220.5
			},
			"pupilLeft" : {
				"x" : 642.6,
				"y" : 199.2
			},
			"mouthRight" : {
				"x" : 687.4,
				"y" : 237.3
			},
			"pupilRight" : {
				"x" : 684.9,
				"y" : 195.2
			},
			"eyeRightInner" : {
				"x" : 680.0,
				"y" : 197.3
			},
			"noseRightAlarTop" : {
				"x" : 679.2,
				"y" : 213.1
			},
			"eyeRightBottom" : {
				"x" : 686.2,
				"y" : 197.5
			},
			"eyeLeftOuter" : {
				"x" : 635.7,
				"y" : 200.9
			},
			"eyebrowRightOuter" : {
				"x" : 701.2,
				"y" : 187.0
			},
			"eyeLeftInner" : {
				"x" : 650.5,
				"y" : 199.5
			},
			"underLipBottom" : {
				"x" : 672.8,
				"y" : 247.1
			},
			"eyebrowRightInner" : {
				"x" : 673.4,
				"y" : 191.3
			},
			"eyeLeftBottom" : {
				"x" : 643.2,
				"y" : 202.4
			},
			"eyeRightTop" : {
				"x" : 685.1,
				"y" : 193.5
			},
			"noseLeftAlarOutTip" : {
				"x" : 657.7,
				"y" : 223.0
			},
			"upperLipBottom" : {
				"x" : 671.9,
				"y" : 239.8
			},
			"mouthLeft" : {
				"x" : 652.0,
				"y" : 240.4
			},
			"eyeRightOuter" : {
				"x" : 691.8,
				"y" : 195.1
			},
			"underLipTop" : {
				"x" : 671.7,
				"y" : 241.6
			},
			"eyebrowLeftOuter" : {
				"x" : 624.2,
				"y" : 196.4
			},
			"noseLeftAlarTop" : {
				"x" : 660.4,
				"y" : 216.0
			}
		}'
	


]

{ #category : #'wikipedia - json text' }
GtCSExamplesData class >> jsonTextFacesEinsteinHabichtSolovine1280px [
	^ '[
	{
		"faceId" : "585f743c-d91a-419c-a128-ba182c92c0af",
		"faceRectangle" : {
			"width" : 100,
			"height" : 100,
			"top" : 320,
			"left" : 860
		},
		"faceLandmarks" : {
			"noseRootRight" : {
				"x" : 912.4,
				"y" : 347.8
			},
			"eyeLeftTop" : {
				"x" : 887.4,
				"y" : 345.3
			},
			"eyebrowLeftInner" : {
				"x" : 897.1,
				"y" : 340.6
			},
			"upperLipTop" : {
				"x" : 911.1,
				"y" : 392.4
			},
			"noseRightAlarOutTip" : {
				"x" : 921.5,
				"y" : 374.2
			},
			"noseRootLeft" : {
				"x" : 900.6,
				"y" : 349.4
			},
			"noseTip" : {
				"x" : 907.2,
				"y" : 373.9
			},
			"pupilLeft" : {
				"x" : 888.1,
				"y" : 348.5
			},
			"mouthRight" : {
				"x" : 931.5,
				"y" : 393.9
			},
			"pupilRight" : {
				"x" : 929.6,
				"y" : 344.3
			},
			"eyeRightInner" : {
				"x" : 922.0,
				"y" : 346.2
			},
			"noseRightAlarTop" : {
				"x" : 916.2,
				"y" : 365.0
			},
			"eyeRightBottom" : {
				"x" : 929.7,
				"y" : 349.3
			},
			"eyeLeftOuter" : {
				"x" : 881.7,
				"y" : 350.7
			},
			"eyebrowRightOuter" : {
				"x" : 944.3,
				"y" : 336.7
			},
			"eyeLeftInner" : {
				"x" : 895.1,
				"y" : 348.9
			},
			"underLipBottom" : {
				"x" : 912.5,
				"y" : 402.6
			},
			"eyebrowRightInner" : {
				"x" : 913.1,
				"y" : 337.5
			},
			"eyeLeftBottom" : {
				"x" : 888.7,
				"y" : 352.8
			},
			"eyeRightTop" : {
				"x" : 928.7,
				"y" : 341.4
			},
			"noseLeftAlarOutTip" : {
				"x" : 895.8,
				"y" : 377.1
			},
			"upperLipBottom" : {
				"x" : 911.4,
				"y" : 396.0
			},
			"mouthLeft" : {
				"x" : 894.9,
				"y" : 396.1
			},
			"eyeRightOuter" : {
				"x" : 936.3,
				"y" : 344.9
			},
			"underLipTop" : {
				"x" : 911.4,
				"y" : 397.1
			},
			"eyebrowLeftOuter" : {
				"x" : 870.7,
				"y" : 346.5
			},
			"noseLeftAlarTop" : {
				"x" : 900.3,
				"y" : 366.8
			}
		},
		"faceAttributes" : {
			"facialHair" : {
				"beard" : 0.2,
				"moustache" : 0.8,
				"sideburns" : 0.1
			},
			"age" : 40.1,
			"smile" : 0.0,
			"gender" : "male",
			"accessories" : [ ],
			"headPose" : {
				"yaw" : -9.2,
				"pitch" : 0.0,
				"roll" : -5.3
			},
			"occlusion" : {
				"foreheadOccluded" : false,
				"eyeOccluded" : false,
				"mouthOccluded" : false
			},
			"blur" : {
				"blurLevel" : "medium",
				"value" : 0.28
			},
			"emotion" : {
				"neutral" : 1.0,
				"surprise" : 0.0,
				"contempt" : 0.0,
				"happiness" : 0.0,
				"anger" : 0.0,
				"sadness" : 0.0,
				"disgust" : 0.0,
				"fear" : 0.0
			},
			"noise" : {
				"noiseLevel" : "medium",
				"value" : 0.58
			},
			"glasses" : "NoGlasses",
			"exposure" : {
				"value" : 0.63,
				"exposureLevel" : "goodExposure"
			},
			"hair" : {
				"invisible" : false,
				"bald" : 0.0,
				"hairColor" : [
					{
						"color" : "brown",
						"confidence" : 0.98
					},
					{
						"color" : "black",
						"confidence" : 0.96
					},
					{
						"color" : "gray",
						"confidence" : 0.3
					},
					{
						"color" : "other",
						"confidence" : 0.26
					},
					{
						"color" : "red",
						"confidence" : 0.13
					},
					{
						"color" : "blond",
						"confidence" : 0.04
					}
				]
			},
			"makeup" : {
				"eyeMakeup" : false,
				"lipMakeup" : false
			}
		}
	},
	{
		"faceId" : "4867b8c7-1b19-494c-9e38-9d87ad8301ac",
		"faceRectangle" : {
			"width" : 99,
			"height" : 99,
			"top" : 313,
			"left" : 279
		},
		"faceLandmarks" : {
			"noseRootRight" : {
				"x" : 335.1,
				"y" : 340.8
			},
			"eyeLeftTop" : {
				"x" : 305.9,
				"y" : 335.8
			},
			"eyebrowLeftInner" : {
				"x" : 319.7,
				"y" : 329.1
			},
			"upperLipTop" : {
				"x" : 331.3,
				"y" : 379.8
			},
			"noseRightAlarOutTip" : {
				"x" : 344.1,
				"y" : 363.9
			},
			"noseRootLeft" : {
				"x" : 324.2,
				"y" : 341.0
			},
			"noseTip" : {
				"x" : 334.0,
				"y" : 361.6
			},
			"pupilLeft" : {
				"x" : 307.2,
				"y" : 338.3
			},
			"mouthRight" : {
				"x" : 345.9,
				"y" : 387.6
			},
			"pupilRight" : {
				"x" : 347.0,
				"y" : 339.4
			},
			"eyeRightInner" : {
				"x" : 340.4,
				"y" : 340.2
			},
			"noseRightAlarTop" : {
				"x" : 340.3,
				"y" : 356.1
			},
			"eyeRightBottom" : {
				"x" : 347.0,
				"y" : 342.9
			},
			"eyeLeftOuter" : {
				"x" : 299.1,
				"y" : 340.5
			},
			"eyebrowRightOuter" : {
				"x" : 360.7,
				"y" : 332.7
			},
			"eyeLeftInner" : {
				"x" : 313.7,
				"y" : 339.8
			},
			"underLipBottom" : {
				"x" : 330.5,
				"y" : 393.8
			},
			"eyebrowRightInner" : {
				"x" : 337.0,
				"y" : 330.0
			},
			"eyeLeftBottom" : {
				"x" : 306.0,
				"y" : 341.8
			},
			"eyeRightTop" : {
				"x" : 347.1,
				"y" : 336.9
			},
			"noseLeftAlarOutTip" : {
				"x" : 316.5,
				"y" : 364.5
			},
			"upperLipBottom" : {
				"x" : 330.8,
				"y" : 384.7
			},
			"mouthLeft" : {
				"x" : 309.0,
				"y" : 387.6
			},
			"eyeRightOuter" : {
				"x" : 353.7,
				"y" : 341.2
			},
			"underLipTop" : {
				"x" : 330.8,
				"y" : 388.9
			},
			"eyebrowLeftOuter" : {
				"x" : 288.0,
				"y" : 332.3
			},
			"noseLeftAlarTop" : {
				"x" : 321.6,
				"y" : 356.7
			}
		},
		"faceAttributes" : {
			"facialHair" : {
				"beard" : 0.2,
				"moustache" : 0.8,
				"sideburns" : 0.2
			},
			"age" : 48.9,
			"smile" : 0.0,
			"gender" : "male",
			"accessories" : [ ],
			"headPose" : {
				"yaw" : 15.4,
				"pitch" : 0.0,
				"roll" : -2.1
			},
			"occlusion" : {
				"foreheadOccluded" : false,
				"eyeOccluded" : false,
				"mouthOccluded" : false
			},
			"blur" : {
				"blurLevel" : "low",
				"value" : 0.06
			},
			"emotion" : {
				"neutral" : 0.996,
				"surprise" : 0.0,
				"contempt" : 0.001,
				"happiness" : 0.0,
				"anger" : 0.001,
				"sadness" : 0.002,
				"disgust" : 0.0,
				"fear" : 0.0
			},
			"noise" : {
				"noiseLevel" : "high",
				"value" : 0.72
			},
			"glasses" : "NoGlasses",
			"exposure" : {
				"value" : 0.6,
				"exposureLevel" : "goodExposure"
			},
			"hair" : {
				"invisible" : false,
				"bald" : 0.01,
				"hairColor" : [
					{
						"color" : "black",
						"confidence" : 0.87
					},
					{
						"color" : "brown",
						"confidence" : 0.81
					},
					{
						"color" : "gray",
						"confidence" : 0.56
					},
					{
						"color" : "other",
						"confidence" : 0.46
					},
					{
						"color" : "red",
						"confidence" : 0.21
					},
					{
						"color" : "blond",
						"confidence" : 0.11
					}
				]
			},
			"makeup" : {
				"eyeMakeup" : false,
				"lipMakeup" : false
			}
		}
	},
	{
		"faceId" : "9f6975e3-8110-44cd-aff9-06c502af3ff2",
		"faceRectangle" : {
			"width" : 92,
			"height" : 92,
			"top" : 172,
			"left" : 622
		},
		"faceLandmarks" : {
			"noseRootRight" : {
				"x" : 673.8,
				"y" : 199.8
			},
			"eyeLeftTop" : {
				"x" : 642.4,
				"y" : 197.3
			},
			"eyebrowLeftInner" : {
				"x" : 657.8,
				"y" : 192.6
			},
			"upperLipTop" : {
				"x" : 671.3,
				"y" : 236.3
			},
			"noseRightAlarOutTip" : {
				"x" : 683.5,
				"y" : 219.5
			},
			"noseRootLeft" : {
				"x" : 661.8,
				"y" : 201.0
			},
			"noseTip" : {
				"x" : 671.2,
				"y" : 220.5
			},
			"pupilLeft" : {
				"x" : 642.6,
				"y" : 199.2
			},
			"mouthRight" : {
				"x" : 687.4,
				"y" : 237.3
			},
			"pupilRight" : {
				"x" : 684.9,
				"y" : 195.2
			},
			"eyeRightInner" : {
				"x" : 680.0,
				"y" : 197.3
			},
			"noseRightAlarTop" : {
				"x" : 679.2,
				"y" : 213.1
			},
			"eyeRightBottom" : {
				"x" : 686.2,
				"y" : 197.5
			},
			"eyeLeftOuter" : {
				"x" : 635.7,
				"y" : 200.9
			},
			"eyebrowRightOuter" : {
				"x" : 701.2,
				"y" : 187.0
			},
			"eyeLeftInner" : {
				"x" : 650.5,
				"y" : 199.5
			},
			"underLipBottom" : {
				"x" : 672.8,
				"y" : 247.1
			},
			"eyebrowRightInner" : {
				"x" : 673.4,
				"y" : 191.3
			},
			"eyeLeftBottom" : {
				"x" : 643.2,
				"y" : 202.4
			},
			"eyeRightTop" : {
				"x" : 685.1,
				"y" : 193.5
			},
			"noseLeftAlarOutTip" : {
				"x" : 657.7,
				"y" : 223.0
			},
			"upperLipBottom" : {
				"x" : 671.9,
				"y" : 239.8
			},
			"mouthLeft" : {
				"x" : 652.0,
				"y" : 240.4
			},
			"eyeRightOuter" : {
				"x" : 691.8,
				"y" : 195.1
			},
			"underLipTop" : {
				"x" : 671.7,
				"y" : 241.6
			},
			"eyebrowLeftOuter" : {
				"x" : 624.2,
				"y" : 196.4
			},
			"noseLeftAlarTop" : {
				"x" : 660.4,
				"y" : 216.0
			}
		},
		"faceAttributes" : {
			"facialHair" : {
				"beard" : 0.6,
				"moustache" : 0.6,
				"sideburns" : 0.1
			},
			"age" : 41.1,
			"smile" : 0.001,
			"gender" : "male",
			"accessories" : [ ],
			"headPose" : {
				"yaw" : 5.8,
				"pitch" : 0.0,
				"roll" : -7.8
			},
			"occlusion" : {
				"foreheadOccluded" : false,
				"eyeOccluded" : false,
				"mouthOccluded" : false
			},
			"blur" : {
				"blurLevel" : "medium",
				"value" : 0.44
			},
			"emotion" : {
				"neutral" : 0.996,
				"surprise" : 0.0,
				"contempt" : 0.002,
				"happiness" : 0.001,
				"anger" : 0.0,
				"sadness" : 0.0,
				"disgust" : 0.0,
				"fear" : 0.0
			},
			"noise" : {
				"noiseLevel" : "high",
				"value" : 1.0
			},
			"glasses" : "NoGlasses",
			"exposure" : {
				"value" : 0.61,
				"exposureLevel" : "goodExposure"
			},
			"hair" : {
				"invisible" : false,
				"bald" : 0.01,
				"hairColor" : [
					{
						"color" : "brown",
						"confidence" : 0.98
					},
					{
						"color" : "black",
						"confidence" : 0.92
					},
					{
						"color" : "gray",
						"confidence" : 0.46
					},
					{
						"color" : "other",
						"confidence" : 0.25
					},
					{
						"color" : "red",
						"confidence" : 0.14
					},
					{
						"color" : "blond",
						"confidence" : 0.03
					}
				]
			},
			"makeup" : {
				"eyeMakeup" : false,
				"lipMakeup" : false
			}
		}
	}
]'
]

{ #category : #'unsplash - json object' }
GtCSExamplesData class >> unsplashJsonPictures3500Cropped [
	^ STONJSON fromString: self unsplashJsonTextPictures3500Cropped 
]

{ #category : #'unsplash - json object' }
GtCSExamplesData class >> unsplashJsonPicturesCropped [
	^ STONJSON fromString: GtCSExamplesData unsplashJsonTextPicturesCropped
]

{ #category : #'unsplash - json text' }
GtCSExamplesData class >> unsplashJsonTextPictures3500Cropped [
	^ '[
	[
		{
			"faceRectangle" : {
				"width" : 190,
				"height" : 190,
				"top" : 1795,
				"left" : 2305
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2408.0,
					"y" : 1851.0
				},
				"eyeLeftTop" : {
					"x" : 2353.3,
					"y" : 1846.1
				},
				"eyebrowLeftInner" : {
					"x" : 2380.5,
					"y" : 1833.7
				},
				"upperLipTop" : {
					"x" : 2397.8,
					"y" : 1924.9
				},
				"noseRightAlarOutTip" : {
					"x" : 2425.6,
					"y" : 1892.7
				},
				"noseRootLeft" : {
					"x" : 2380.9,
					"y" : 1852.1
				},
				"noseTip" : {
					"x" : 2393.5,
					"y" : 1889.3
				},
				"pupilLeft" : {
					"x" : 2357.0,
					"y" : 1849.1
				},
				"mouthRight" : {
					"x" : 2441.2,
					"y" : 1935.0
				},
				"pupilRight" : {
					"x" : 2444.4,
					"y" : 1848.5
				},
				"eyeRightInner" : {
					"x" : 2425.4,
					"y" : 1850.5
				},
				"noseRightAlarTop" : {
					"x" : 2413.3,
					"y" : 1875.9
				},
				"eyeRightBottom" : {
					"x" : 2439.8,
					"y" : 1854.9
				},
				"eyeLeftOuter" : {
					"x" : 2340.9,
					"y" : 1851.7
				},
				"eyebrowRightOuter" : {
					"x" : 2471.5,
					"y" : 1832.4
				},
				"eyeLeftInner" : {
					"x" : 2370.0,
					"y" : 1851.2
				},
				"underLipBottom" : {
					"x" : 2396.5,
					"y" : 1948.1
				},
				"eyebrowRightInner" : {
					"x" : 2406.7,
					"y" : 1830.9
				},
				"eyeLeftBottom" : {
					"x" : 2353.7,
					"y" : 1856.0
				},
				"eyeRightTop" : {
					"x" : 2439.3,
					"y" : 1844.5
				},
				"noseLeftAlarOutTip" : {
					"x" : 2365.4,
					"y" : 1892.4
				},
				"upperLipBottom" : {
					"x" : 2397.0,
					"y" : 1934.1
				},
				"mouthLeft" : {
					"x" : 2365.2,
					"y" : 1937.1
				},
				"eyeRightOuter" : {
					"x" : 2454.0,
					"y" : 1850.4
				},
				"underLipTop" : {
					"x" : 2396.9,
					"y" : 1935.2
				},
				"eyebrowLeftOuter" : {
					"x" : 2313.6,
					"y" : 1837.2
				},
				"noseLeftAlarTop" : {
					"x" : 2374.5,
					"y" : 1878.9
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.3,
					"moustache" : 0.2,
					"sideburns" : 0.2
				},
				"age" : 29.3,
				"smile" : 0.582,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : -5.5,
					"pitch" : 0.0,
					"roll" : -1.5
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.41
				},
				"emotion" : {
					"neutral" : 0.403,
					"surprise" : 0.0,
					"contempt" : 0.015,
					"happiness" : 0.582,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 0.75
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.35,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 0.99
						},
						{
							"color" : "brown",
							"confidence" : 0.95
						},
						{
							"color" : "other",
							"confidence" : 0.36
						},
						{
							"color" : "gray",
							"confidence" : 0.14
						},
						{
							"color" : "red",
							"confidence" : 0.08
						},
						{
							"color" : "blond",
							"confidence" : 0.05
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 183,
				"height" : 183,
				"top" : 2013,
				"left" : 1103
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1205.7,
					"y" : 2064.4
				},
				"eyeLeftTop" : {
					"x" : 1154.0,
					"y" : 2060.5
				},
				"eyebrowLeftInner" : {
					"x" : 1176.4,
					"y" : 2045.3
				},
				"upperLipTop" : {
					"x" : 1196.8,
					"y" : 2133.1
				},
				"noseRightAlarOutTip" : {
					"x" : 1225.5,
					"y" : 2108.5
				},
				"noseRootLeft" : {
					"x" : 1178.3,
					"y" : 2066.4
				},
				"noseTip" : {
					"x" : 1196.4,
					"y" : 2110.9
				},
				"pupilLeft" : {
					"x" : 1152.4,
					"y" : 2065.4
				},
				"mouthRight" : {
					"x" : 1233.7,
					"y" : 2144.4
				},
				"pupilRight" : {
					"x" : 1229.0,
					"y" : 2058.0
				},
				"eyeRightInner" : {
					"x" : 1218.1,
					"y" : 2060.5
				},
				"noseRightAlarTop" : {
					"x" : 1216.2,
					"y" : 2093.4
				},
				"eyeRightBottom" : {
					"x" : 1231.2,
					"y" : 2063.7
				},
				"eyeLeftOuter" : {
					"x" : 1141.6,
					"y" : 2067.4
				},
				"eyebrowRightOuter" : {
					"x" : 1256.3,
					"y" : 2042.7
				},
				"eyeLeftInner" : {
					"x" : 1166.3,
					"y" : 2066.0
				},
				"underLipBottom" : {
					"x" : 1199.2,
					"y" : 2169.0
				},
				"eyebrowRightInner" : {
					"x" : 1206.7,
					"y" : 2043.8
				},
				"eyeLeftBottom" : {
					"x" : 1154.6,
					"y" : 2070.7
				},
				"eyeRightTop" : {
					"x" : 1231.1,
					"y" : 2054.5
				},
				"noseLeftAlarOutTip" : {
					"x" : 1166.6,
					"y" : 2111.9
				},
				"upperLipBottom" : {
					"x" : 1197.4,
					"y" : 2142.8
				},
				"mouthLeft" : {
					"x" : 1159.0,
					"y" : 2150.4
				},
				"eyeRightOuter" : {
					"x" : 1243.9,
					"y" : 2060.5
				},
				"underLipTop" : {
					"x" : 1197.0,
					"y" : 2155.2
				},
				"eyebrowLeftOuter" : {
					"x" : 1122.7,
					"y" : 2056.4
				},
				"noseLeftAlarTop" : {
					"x" : 1174.3,
					"y" : 2095.9
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.5,
					"moustache" : 0.5,
					"sideburns" : 0.6
				},
				"age" : 35.1,
				"smile" : 0.997,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -4.1,
					"pitch" : 0.0,
					"roll" : -4.2
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.53
				},
				"emotion" : {
					"neutral" : 0.003,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.997,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 0.89
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.07,
					"exposureLevel" : "underExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.59
						},
						{
							"color" : "other",
							"confidence" : 0.35
						},
						{
							"color" : "gray",
							"confidence" : 0.23
						},
						{
							"color" : "red",
							"confidence" : 0.1
						},
						{
							"color" : "blond",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 179,
				"height" : 179,
				"top" : 1979,
				"left" : 1809
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1917.8,
					"y" : 2031.9
				},
				"eyeLeftTop" : {
					"x" : 1863.3,
					"y" : 2026.0
				},
				"eyebrowLeftInner" : {
					"x" : 1886.5,
					"y" : 2007.8
				},
				"upperLipTop" : {
					"x" : 1900.8,
					"y" : 2098.2
				},
				"noseRightAlarOutTip" : {
					"x" : 1929.7,
					"y" : 2073.2
				},
				"noseRootLeft" : {
					"x" : 1891.7,
					"y" : 2031.0
				},
				"noseTip" : {
					"x" : 1905.0,
					"y" : 2070.8
				},
				"pupilLeft" : {
					"x" : 1861.3,
					"y" : 2030.6
				},
				"mouthRight" : {
					"x" : 1928.4,
					"y" : 2109.1
				},
				"pupilRight" : {
					"x" : 1944.3,
					"y" : 2031.1
				},
				"eyeRightInner" : {
					"x" : 1930.3,
					"y" : 2029.5
				},
				"noseRightAlarTop" : {
					"x" : 1922.1,
					"y" : 2059.7
				},
				"eyeRightBottom" : {
					"x" : 1945.1,
					"y" : 2035.6
				},
				"eyeLeftOuter" : {
					"x" : 1850.1,
					"y" : 2028.9
				},
				"eyebrowRightOuter" : {
					"x" : 1975.4,
					"y" : 2007.1
				},
				"eyeLeftInner" : {
					"x" : 1875.9,
					"y" : 2031.1
				},
				"underLipBottom" : {
					"x" : 1896.4,
					"y" : 2131.0
				},
				"eyebrowRightInner" : {
					"x" : 1921.4,
					"y" : 2008.9
				},
				"eyeLeftBottom" : {
					"x" : 1862.0,
					"y" : 2036.1
				},
				"eyeRightTop" : {
					"x" : 1944.8,
					"y" : 2026.9
				},
				"noseLeftAlarOutTip" : {
					"x" : 1874.1,
					"y" : 2075.1
				},
				"upperLipBottom" : {
					"x" : 1900.1,
					"y" : 2107.0
				},
				"mouthLeft" : {
					"x" : 1850.9,
					"y" : 2110.4
				},
				"eyeRightOuter" : {
					"x" : 1958.6,
					"y" : 2030.0
				},
				"underLipTop" : {
					"x" : 1896.3,
					"y" : 2118.5
				},
				"eyebrowLeftOuter" : {
					"x" : 1828.1,
					"y" : 2005.6
				},
				"noseLeftAlarTop" : {
					"x" : 1883.4,
					"y" : 2057.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.1,
					"moustache" : 0.0,
					"sideburns" : 0.3
				},
				"age" : 31.6,
				"smile" : 0.955,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : 6.1,
					"pitch" : 0.0,
					"roll" : 2.6
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.47
				},
				"emotion" : {
					"neutral" : 0.004,
					"surprise" : 0.017,
					"contempt" : 0.0,
					"happiness" : 0.955,
					"anger" : 0.013,
					"sadness" : 0.0,
					"disgust" : 0.01,
					"fear" : 0.001
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.46
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.23,
					"exposureLevel" : "underExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.97
						},
						{
							"color" : "blond",
							"confidence" : 0.72
						},
						{
							"color" : "gray",
							"confidence" : 0.55
						},
						{
							"color" : "black",
							"confidence" : 0.37
						},
						{
							"color" : "other",
							"confidence" : 0.2
						},
						{
							"color" : "red",
							"confidence" : 0.06
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 157,
				"height" : 157,
				"top" : 2003,
				"left" : 212
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 302.0,
					"y" : 2044.0
				},
				"eyeLeftTop" : {
					"x" : 275.7,
					"y" : 2029.3
				},
				"eyebrowLeftInner" : {
					"x" : 289.1,
					"y" : 2016.1
				},
				"upperLipTop" : {
					"x" : 279.4,
					"y" : 2116.8
				},
				"noseRightAlarOutTip" : {
					"x" : 303.0,
					"y" : 2090.5
				},
				"noseRootLeft" : {
					"x" : 287.1,
					"y" : 2039.0
				},
				"noseTip" : {
					"x" : 283.1,
					"y" : 2076.9
				},
				"pupilLeft" : {
					"x" : 276.0,
					"y" : 2033.3
				},
				"mouthRight" : {
					"x" : 304.0,
					"y" : 2136.7
				},
				"pupilRight" : {
					"x" : 322.8,
					"y" : 2046.3
				},
				"eyeRightInner" : {
					"x" : 314.1,
					"y" : 2045.9
				},
				"noseRightAlarTop" : {
					"x" : 299.2,
					"y" : 2072.9
				},
				"eyeRightBottom" : {
					"x" : 322.1,
					"y" : 2051.2
				},
				"eyeLeftOuter" : {
					"x" : 266.8,
					"y" : 2031.6
				},
				"eyebrowRightOuter" : {
					"x" : 349.7,
					"y" : 2034.0
				},
				"eyeLeftInner" : {
					"x" : 281.8,
					"y" : 2036.8
				},
				"underLipBottom" : {
					"x" : 276.4,
					"y" : 2148.0
				},
				"eyebrowRightInner" : {
					"x" : 306.7,
					"y" : 2020.1
				},
				"eyeLeftBottom" : {
					"x" : 273.4,
					"y" : 2037.7
				},
				"eyeRightTop" : {
					"x" : 323.1,
					"y" : 2043.5
				},
				"noseLeftAlarOutTip" : {
					"x" : 266.1,
					"y" : 2080.3
				},
				"upperLipBottom" : {
					"x" : 278.6,
					"y" : 2123.1
				},
				"mouthLeft" : {
					"x" : 266.1,
					"y" : 2123.0
				},
				"eyeRightOuter" : {
					"x" : 331.0,
					"y" : 2050.2
				},
				"underLipTop" : {
					"x" : 277.3,
					"y" : 2140.2
				},
				"eyebrowLeftOuter" : {
					"x" : 263.0,
					"y" : 2004.8
				},
				"noseLeftAlarTop" : {
					"x" : 276.6,
					"y" : 2067.5
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.2,
					"sideburns" : 0.0
				},
				"age" : 29.4,
				"smile" : 0.003,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -31.0,
					"pitch" : 0.0,
					"roll" : 13.5
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.64
				},
				"emotion" : {
					"neutral" : 0.993,
					"surprise" : 0.001,
					"contempt" : 0.0,
					"happiness" : 0.003,
					"anger" : 0.0,
					"sadness" : 0.003,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.53
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.63,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.07,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.85
						},
						{
							"color" : "other",
							"confidence" : 0.3
						},
						{
							"color" : "red",
							"confidence" : 0.1
						},
						{
							"color" : "gray",
							"confidence" : 0.09
						},
						{
							"color" : "blond",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 149,
				"height" : 149,
				"top" : 1277,
				"left" : 1294
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1375.2,
					"y" : 1317.8
				},
				"eyeLeftTop" : {
					"x" : 1332.0,
					"y" : 1319.5
				},
				"eyebrowLeftInner" : {
					"x" : 1347.3,
					"y" : 1302.9
				},
				"upperLipTop" : {
					"x" : 1370.6,
					"y" : 1374.6
				},
				"noseRightAlarOutTip" : {
					"x" : 1393.7,
					"y" : 1349.5
				},
				"noseRootLeft" : {
					"x" : 1353.9,
					"y" : 1319.3
				},
				"noseTip" : {
					"x" : 1369.8,
					"y" : 1348.2
				},
				"pupilLeft" : {
					"x" : 1333.6,
					"y" : 1322.4
				},
				"mouthRight" : {
					"x" : 1401.8,
					"y" : 1384.8
				},
				"pupilRight" : {
					"x" : 1400.1,
					"y" : 1317.3
				},
				"eyeRightInner" : {
					"x" : 1388.5,
					"y" : 1318.0
				},
				"noseRightAlarTop" : {
					"x" : 1383.8,
					"y" : 1338.1
				},
				"eyeRightBottom" : {
					"x" : 1399.2,
					"y" : 1321.2
				},
				"eyeLeftOuter" : {
					"x" : 1322.9,
					"y" : 1326.0
				},
				"eyebrowRightOuter" : {
					"x" : 1426.6,
					"y" : 1304.1
				},
				"eyeLeftInner" : {
					"x" : 1344.9,
					"y" : 1321.8
				},
				"underLipBottom" : {
					"x" : 1371.8,
					"y" : 1403.4
				},
				"eyebrowRightInner" : {
					"x" : 1382.8,
					"y" : 1298.2
				},
				"eyeLeftBottom" : {
					"x" : 1334.2,
					"y" : 1326.6
				},
				"eyeRightTop" : {
					"x" : 1399.2,
					"y" : 1313.3
				},
				"noseLeftAlarOutTip" : {
					"x" : 1345.4,
					"y" : 1353.8
				},
				"upperLipBottom" : {
					"x" : 1370.9,
					"y" : 1381.3
				},
				"mouthLeft" : {
					"x" : 1339.1,
					"y" : 1390.3
				},
				"eyeRightOuter" : {
					"x" : 1409.9,
					"y" : 1317.8
				},
				"underLipTop" : {
					"x" : 1371.0,
					"y" : 1395.4
				},
				"eyebrowLeftOuter" : {
					"x" : 1302.8,
					"y" : 1312.1
				},
				"noseLeftAlarTop" : {
					"x" : 1351.6,
					"y" : 1340.9
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.7,
					"moustache" : 0.6,
					"sideburns" : 0.3
				},
				"age" : 28.8,
				"smile" : 0.999,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 0.2,
					"pitch" : 0.0,
					"roll" : -4.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.49
				},
				"emotion" : {
					"neutral" : 0.001,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.999,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.62,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.53
						},
						{
							"color" : "gray",
							"confidence" : 0.35
						},
						{
							"color" : "blond",
							"confidence" : 0.23
						},
						{
							"color" : "other",
							"confidence" : 0.2
						},
						{
							"color" : "red",
							"confidence" : 0.11
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 141,
				"height" : 141,
				"top" : 1964,
				"left" : 3222
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 3309.7,
					"y" : 2003.7
				},
				"eyeLeftTop" : {
					"x" : 3262.8,
					"y" : 1994.1
				},
				"eyebrowLeftInner" : {
					"x" : 3286.0,
					"y" : 1980.4
				},
				"upperLipTop" : {
					"x" : 3292.9,
					"y" : 2058.4
				},
				"noseRightAlarOutTip" : {
					"x" : 3319.7,
					"y" : 2042.1
				},
				"noseRootLeft" : {
					"x" : 3291.4,
					"y" : 2002.5
				},
				"noseTip" : {
					"x" : 3302.7,
					"y" : 2034.7
				},
				"pupilLeft" : {
					"x" : 3260.7,
					"y" : 1997.7
				},
				"mouthRight" : {
					"x" : 3311.1,
					"y" : 2072.4
				},
				"pupilRight" : {
					"x" : 3325.6,
					"y" : 2007.6
				},
				"eyeRightInner" : {
					"x" : 3316.0,
					"y" : 2006.8
				},
				"noseRightAlarTop" : {
					"x" : 3313.5,
					"y" : 2028.2
				},
				"eyeRightBottom" : {
					"x" : 3326.6,
					"y" : 2011.6
				},
				"eyeLeftOuter" : {
					"x" : 3250.9,
					"y" : 1996.4
				},
				"eyebrowRightOuter" : {
					"x" : 3352.7,
					"y" : 1993.5
				},
				"eyeLeftInner" : {
					"x" : 3273.9,
					"y" : 1999.9
				},
				"underLipBottom" : {
					"x" : 3291.3,
					"y" : 2075.5
				},
				"eyebrowRightInner" : {
					"x" : 3318.9,
					"y" : 1987.6
				},
				"eyeLeftBottom" : {
					"x" : 3261.5,
					"y" : 2002.0
				},
				"eyeRightTop" : {
					"x" : 3327.6,
					"y" : 2004.3
				},
				"noseLeftAlarOutTip" : {
					"x" : 3277.3,
					"y" : 2036.4
				},
				"upperLipBottom" : {
					"x" : 3292.6,
					"y" : 2064.9
				},
				"mouthLeft" : {
					"x" : 3261.9,
					"y" : 2065.9
				},
				"eyeRightOuter" : {
					"x" : 3337.0,
					"y" : 2009.3
				},
				"underLipTop" : {
					"x" : 3291.8,
					"y" : 2068.6
				},
				"eyebrowLeftOuter" : {
					"x" : 3237.2,
					"y" : 1977.7
				},
				"noseLeftAlarTop" : {
					"x" : 3285.6,
					"y" : 2025.8
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.1,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 18.9,
				"smile" : 0.032,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 16.2,
					"pitch" : 0.0,
					"roll" : 5.8
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.26
				},
				"emotion" : {
					"neutral" : 0.968,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.032,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.82,
					"exposureLevel" : "overExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.0,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.98
						},
						{
							"color" : "other",
							"confidence" : 0.25
						},
						{
							"color" : "red",
							"confidence" : 0.11
						},
						{
							"color" : "blond",
							"confidence" : 0.03
						},
						{
							"color" : "gray",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 140,
				"height" : 140,
				"top" : 2014,
				"left" : 480
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 556.2,
					"y" : 2056.6
				},
				"eyeLeftTop" : {
					"x" : 520.1,
					"y" : 2052.6
				},
				"eyebrowLeftInner" : {
					"x" : 533.1,
					"y" : 2042.7
				},
				"upperLipTop" : {
					"x" : 546.6,
					"y" : 2107.4
				},
				"noseRightAlarOutTip" : {
					"x" : 569.4,
					"y" : 2086.5
				},
				"noseRootLeft" : {
					"x" : 537.7,
					"y" : 2058.0
				},
				"noseTip" : {
					"x" : 546.2,
					"y" : 2083.8
				},
				"pupilLeft" : {
					"x" : 524.1,
					"y" : 2056.1
				},
				"mouthRight" : {
					"x" : 578.3,
					"y" : 2116.8
				},
				"pupilRight" : {
					"x" : 584.2,
					"y" : 2052.4
				},
				"eyeRightInner" : {
					"x" : 570.6,
					"y" : 2055.7
				},
				"noseRightAlarTop" : {
					"x" : 561.7,
					"y" : 2074.5
				},
				"eyeRightBottom" : {
					"x" : 581.0,
					"y" : 2058.1
				},
				"eyeLeftOuter" : {
					"x" : 510.8,
					"y" : 2058.0
				},
				"eyebrowRightOuter" : {
					"x" : 599.1,
					"y" : 2041.3
				},
				"eyeLeftInner" : {
					"x" : 529.6,
					"y" : 2056.9
				},
				"underLipBottom" : {
					"x" : 547.1,
					"y" : 2134.5
				},
				"eyebrowRightInner" : {
					"x" : 561.6,
					"y" : 2040.2
				},
				"eyeLeftBottom" : {
					"x" : 520.8,
					"y" : 2061.1
				},
				"eyeRightTop" : {
					"x" : 579.4,
					"y" : 2049.6
				},
				"noseLeftAlarOutTip" : {
					"x" : 524.6,
					"y" : 2086.8
				},
				"upperLipBottom" : {
					"x" : 546.2,
					"y" : 2112.2
				},
				"mouthLeft" : {
					"x" : 517.8,
					"y" : 2120.4
				},
				"eyeRightOuter" : {
					"x" : 589.7,
					"y" : 2053.1
				},
				"underLipTop" : {
					"x" : 545.8,
					"y" : 2125.9
				},
				"eyebrowLeftOuter" : {
					"x" : 498.3,
					"y" : 2045.1
				},
				"noseLeftAlarTop" : {
					"x" : 533.2,
					"y" : 2075.5
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 25.0,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -3.5,
					"pitch" : 0.0,
					"roll" : 0.1
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.64
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.11
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.49,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.09,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.94
						},
						{
							"color" : "black",
							"confidence" : 0.82
						},
						{
							"color" : "other",
							"confidence" : 0.77
						},
						{
							"color" : "red",
							"confidence" : 0.38
						},
						{
							"color" : "blond",
							"confidence" : 0.13
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 136,
				"height" : 136,
				"top" : 1422,
				"left" : 480
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 559.1,
					"y" : 1463.8
				},
				"eyeLeftTop" : {
					"x" : 520.1,
					"y" : 1453.7
				},
				"eyebrowLeftInner" : {
					"x" : 537.2,
					"y" : 1449.0
				},
				"upperLipTop" : {
					"x" : 546.0,
					"y" : 1511.9
				},
				"noseRightAlarOutTip" : {
					"x" : 567.9,
					"y" : 1496.7
				},
				"noseRootLeft" : {
					"x" : 541.8,
					"y" : 1462.2
				},
				"noseTip" : {
					"x" : 549.3,
					"y" : 1495.8
				},
				"pupilLeft" : {
					"x" : 519.7,
					"y" : 1456.9
				},
				"mouthRight" : {
					"x" : 573.9,
					"y" : 1522.0
				},
				"pupilRight" : {
					"x" : 581.7,
					"y" : 1462.1
				},
				"eyeRightInner" : {
					"x" : 571.5,
					"y" : 1462.3
				},
				"noseRightAlarTop" : {
					"x" : 561.9,
					"y" : 1484.7
				},
				"eyeRightBottom" : {
					"x" : 581.7,
					"y" : 1466.7
				},
				"eyeLeftOuter" : {
					"x" : 509.1,
					"y" : 1456.5
				},
				"eyebrowRightOuter" : {
					"x" : 606.1,
					"y" : 1452.0
				},
				"eyeLeftInner" : {
					"x" : 529.4,
					"y" : 1458.6
				},
				"underLipBottom" : {
					"x" : 543.8,
					"y" : 1539.9
				},
				"eyebrowRightInner" : {
					"x" : 565.3,
					"y" : 1451.4
				},
				"eyeLeftBottom" : {
					"x" : 518.2,
					"y" : 1460.6
				},
				"eyeRightTop" : {
					"x" : 582.4,
					"y" : 1459.3
				},
				"noseLeftAlarOutTip" : {
					"x" : 527.2,
					"y" : 1493.2
				},
				"upperLipBottom" : {
					"x" : 545.6,
					"y" : 1517.4
				},
				"mouthLeft" : {
					"x" : 516.2,
					"y" : 1517.9
				},
				"eyeRightOuter" : {
					"x" : 592.4,
					"y" : 1464.0
				},
				"underLipTop" : {
					"x" : 544.5,
					"y" : 1532.4
				},
				"eyebrowLeftOuter" : {
					"x" : 501.0,
					"y" : 1441.5
				},
				"noseLeftAlarTop" : {
					"x" : 535.7,
					"y" : 1482.2
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 25.5,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 2.4,
					"pitch" : 0.0,
					"roll" : 5.3
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.71
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.43
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.44,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.74
						},
						{
							"color" : "blond",
							"confidence" : 0.47
						},
						{
							"color" : "other",
							"confidence" : 0.27
						},
						{
							"color" : "red",
							"confidence" : 0.05
						},
						{
							"color" : "gray",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 120,
				"height" : 120,
				"top" : 2099,
				"left" : 2977
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 3036.5,
					"y" : 2135.3
				},
				"eyeLeftTop" : {
					"x" : 3001.5,
					"y" : 2132.9
				},
				"eyebrowLeftInner" : {
					"x" : 3016.0,
					"y" : 2124.0
				},
				"upperLipTop" : {
					"x" : 3044.7,
					"y" : 2181.0
				},
				"noseRightAlarOutTip" : {
					"x" : 3056.4,
					"y" : 2160.9
				},
				"noseRootLeft" : {
					"x" : 3023.9,
					"y" : 2137.0
				},
				"noseTip" : {
					"x" : 3042.7,
					"y" : 2158.7
				},
				"pupilLeft" : {
					"x" : 3003.1,
					"y" : 2136.2
				},
				"mouthRight" : {
					"x" : 3066.9,
					"y" : 2186.1
				},
				"pupilRight" : {
					"x" : 3055.4,
					"y" : 2130.7
				},
				"eyeRightInner" : {
					"x" : 3046.8,
					"y" : 2132.5
				},
				"noseRightAlarTop" : {
					"x" : 3047.9,
					"y" : 2151.1
				},
				"eyeRightBottom" : {
					"x" : 3056.6,
					"y" : 2135.3
				},
				"eyeLeftOuter" : {
					"x" : 2992.3,
					"y" : 2139.3
				},
				"eyebrowRightOuter" : {
					"x" : 3073.6,
					"y" : 2119.4
				},
				"eyeLeftInner" : {
					"x" : 3011.5,
					"y" : 2137.3
				},
				"underLipBottom" : {
					"x" : 3048.0,
					"y" : 2198.9
				},
				"eyebrowRightInner" : {
					"x" : 3039.3,
					"y" : 2120.5
				},
				"eyeLeftBottom" : {
					"x" : 3002.7,
					"y" : 2141.1
				},
				"eyeRightTop" : {
					"x" : 3055.8,
					"y" : 2127.4
				},
				"noseLeftAlarOutTip" : {
					"x" : 3022.8,
					"y" : 2166.4
				},
				"upperLipBottom" : {
					"x" : 3045.5,
					"y" : 2185.8
				},
				"mouthLeft" : {
					"x" : 3020.0,
					"y" : 2190.8
				},
				"eyeRightOuter" : {
					"x" : 3064.0,
					"y" : 2130.6
				},
				"underLipTop" : {
					"x" : 3047.0,
					"y" : 2192.2
				},
				"eyebrowLeftOuter" : {
					"x" : 2977.4,
					"y" : 2130.3
				},
				"noseLeftAlarTop" : {
					"x" : 3026.4,
					"y" : 2155.9
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 29.6,
				"smile" : 0.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 10.8,
					"pitch" : 0.0,
					"roll" : -12.7
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : true
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.23
				},
				"emotion" : {
					"neutral" : 0.995,
					"surprise" : 0.002,
					"contempt" : 0.0,
					"happiness" : 0.0,
					"anger" : 0.0,
					"sadness" : 0.002,
					"disgust" : 0.0,
					"fear" : 0.001
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.13
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.55,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.03,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.54
						},
						{
							"color" : "blond",
							"confidence" : 0.47
						},
						{
							"color" : "other",
							"confidence" : 0.45
						},
						{
							"color" : "red",
							"confidence" : 0.25
						},
						{
							"color" : "gray",
							"confidence" : 0.05
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 107,
				"height" : 107,
				"top" : 1507,
				"left" : 1057
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1112.5,
					"y" : 1537.7
				},
				"eyeLeftTop" : {
					"x" : 1083.1,
					"y" : 1538.3
				},
				"eyebrowLeftInner" : {
					"x" : 1091.8,
					"y" : 1525.8
				},
				"upperLipTop" : {
					"x" : 1111.9,
					"y" : 1581.2
				},
				"noseRightAlarOutTip" : {
					"x" : 1126.1,
					"y" : 1562.9
				},
				"noseRootLeft" : {
					"x" : 1098.4,
					"y" : 1539.9
				},
				"noseTip" : {
					"x" : 1105.9,
					"y" : 1567.3
				},
				"pupilLeft" : {
					"x" : 1084.2,
					"y" : 1540.0
				},
				"mouthRight" : {
					"x" : 1138.8,
					"y" : 1580.2
				},
				"pupilRight" : {
					"x" : 1133.0,
					"y" : 1532.8
				},
				"eyeRightInner" : {
					"x" : 1123.0,
					"y" : 1535.4
				},
				"noseRightAlarTop" : {
					"x" : 1118.2,
					"y" : 1556.1
				},
				"eyeRightBottom" : {
					"x" : 1133.9,
					"y" : 1535.2
				},
				"eyeLeftOuter" : {
					"x" : 1074.6,
					"y" : 1540.8
				},
				"eyebrowRightOuter" : {
					"x" : 1152.5,
					"y" : 1516.9
				},
				"eyeLeftInner" : {
					"x" : 1093.4,
					"y" : 1539.8
				},
				"underLipBottom" : {
					"x" : 1116.2,
					"y" : 1604.3
				},
				"eyebrowRightInner" : {
					"x" : 1112.2,
					"y" : 1523.0
				},
				"eyeLeftBottom" : {
					"x" : 1083.8,
					"y" : 1543.2
				},
				"eyeRightTop" : {
					"x" : 1132.7,
					"y" : 1530.8
				},
				"noseLeftAlarOutTip" : {
					"x" : 1093.8,
					"y" : 1568.3
				},
				"upperLipBottom" : {
					"x" : 1112.5,
					"y" : 1585.2
				},
				"mouthLeft" : {
					"x" : 1094.5,
					"y" : 1588.0
				},
				"eyeRightOuter" : {
					"x" : 1144.2,
					"y" : 1530.6
				},
				"underLipTop" : {
					"x" : 1114.6,
					"y" : 1596.7
				},
				"eyebrowLeftOuter" : {
					"x" : 1061.8,
					"y" : 1529.8
				},
				"noseLeftAlarTop" : {
					"x" : 1096.4,
					"y" : 1559.5
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 29.4,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [
					{
						"confidence" : 0.99,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : -18.6,
					"pitch" : 0.0,
					"roll" : -7.9
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.62
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.69
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.33,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 657,
				"height" : 657,
				"top" : 1258,
				"left" : 2732
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 3123.3,
					"y" : 1438.4
				},
				"eyeLeftTop" : {
					"x" : 2904.2,
					"y" : 1413.0
				},
				"eyebrowLeftInner" : {
					"x" : 3038.3,
					"y" : 1363.5
				},
				"upperLipTop" : {
					"x" : 3062.3,
					"y" : 1682.1
				},
				"noseRightAlarOutTip" : {
					"x" : 3164.1,
					"y" : 1590.1
				},
				"noseRootLeft" : {
					"x" : 3032.2,
					"y" : 1430.1
				},
				"noseTip" : {
					"x" : 3085.5,
					"y" : 1570.4
				},
				"pupilLeft" : {
					"x" : 2902.8,
					"y" : 1427.1
				},
				"mouthRight" : {
					"x" : 3162.5,
					"y" : 1773.0
				},
				"pupilRight" : {
					"x" : 3213.8,
					"y" : 1460.5
				},
				"eyeRightInner" : {
					"x" : 3173.6,
					"y" : 1452.1
				},
				"noseRightAlarTop" : {
					"x" : 3145.0,
					"y" : 1534.1
				},
				"eyeRightBottom" : {
					"x" : 3218.5,
					"y" : 1470.5
				},
				"eyeLeftOuter" : {
					"x" : 2858.1,
					"y" : 1421.0
				},
				"eyebrowRightOuter" : {
					"x" : 3315.2,
					"y" : 1429.0
				},
				"eyeLeftInner" : {
					"x" : 2955.0,
					"y" : 1424.5
				},
				"underLipBottom" : {
					"x" : 3056.5,
					"y" : 1815.7
				},
				"eyebrowRightInner" : {
					"x" : 3135.1,
					"y" : 1375.4
				},
				"eyeLeftBottom" : {
					"x" : 2903.3,
					"y" : 1431.5
				},
				"eyeRightTop" : {
					"x" : 3224.2,
					"y" : 1449.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 2966.8,
					"y" : 1578.6
				},
				"upperLipBottom" : {
					"x" : 3059.4,
					"y" : 1705.0
				},
				"mouthLeft" : {
					"x" : 2935.1,
					"y" : 1735.5
				},
				"eyeRightOuter" : {
					"x" : 3264.5,
					"y" : 1467.3
				},
				"underLipTop" : {
					"x" : 3059.0,
					"y" : 1785.3
				},
				"eyebrowLeftOuter" : {
					"x" : 2796.1,
					"y" : 1379.6
				},
				"noseLeftAlarTop" : {
					"x" : 2999.7,
					"y" : 1530.1
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.2,
					"moustache" : 0.2,
					"sideburns" : 0.3
				},
				"age" : 25.9,
				"smile" : 0.045,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 7.3,
					"pitch" : 0.0,
					"roll" : 3.5
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 1.0
				},
				"emotion" : {
					"neutral" : 0.44,
					"surprise" : 0.111,
					"contempt" : 0.004,
					"happiness" : 0.045,
					"anger" : 0.272,
					"sadness" : 0.043,
					"disgust" : 0.051,
					"fear" : 0.034
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 1.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.59,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.05,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.95
						},
						{
							"color" : "blond",
							"confidence" : 0.66
						},
						{
							"color" : "other",
							"confidence" : 0.47
						},
						{
							"color" : "black",
							"confidence" : 0.43
						},
						{
							"color" : "gray",
							"confidence" : 0.37
						},
						{
							"color" : "red",
							"confidence" : 0.07
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 324,
				"height" : 324,
				"top" : 1023,
				"left" : 678
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 840.8,
					"y" : 1117.3
				},
				"eyeLeftTop" : {
					"x" : 764.6,
					"y" : 1115.5
				},
				"eyebrowLeftInner" : {
					"x" : 798.1,
					"y" : 1097.8
				},
				"upperLipTop" : {
					"x" : 840.6,
					"y" : 1253.8
				},
				"noseRightAlarOutTip" : {
					"x" : 878.4,
					"y" : 1195.6
				},
				"noseRootLeft" : {
					"x" : 805.5,
					"y" : 1121.3
				},
				"noseTip" : {
					"x" : 821.1,
					"y" : 1193.8
				},
				"pupilLeft" : {
					"x" : 765.8,
					"y" : 1121.7
				},
				"mouthRight" : {
					"x" : 920.6,
					"y" : 1251.5
				},
				"pupilRight" : {
					"x" : 901.1,
					"y" : 1099.1
				},
				"eyeRightInner" : {
					"x" : 879.3,
					"y" : 1108.3
				},
				"noseRightAlarTop" : {
					"x" : 858.3,
					"y" : 1168.5
				},
				"eyeRightBottom" : {
					"x" : 904.5,
					"y" : 1113.2
				},
				"eyeLeftOuter" : {
					"x" : 748.1,
					"y" : 1133.4
				},
				"eyebrowRightOuter" : {
					"x" : 965.5,
					"y" : 1084.2
				},
				"eyeLeftInner" : {
					"x" : 788.7,
					"y" : 1124.1
				},
				"underLipBottom" : {
					"x" : 850.0,
					"y" : 1291.8
				},
				"eyebrowRightInner" : {
					"x" : 843.9,
					"y" : 1088.6
				},
				"eyeLeftBottom" : {
					"x" : 769.8,
					"y" : 1136.7
				},
				"eyeRightTop" : {
					"x" : 900.1,
					"y" : 1091.0
				},
				"noseLeftAlarOutTip" : {
					"x" : 792.0,
					"y" : 1202.4
				},
				"upperLipBottom" : {
					"x" : 843.6,
					"y" : 1270.3
				},
				"mouthLeft" : {
					"x" : 795.5,
					"y" : 1274.0
				},
				"eyeRightOuter" : {
					"x" : 925.9,
					"y" : 1101.7
				},
				"underLipTop" : {
					"x" : 845.0,
					"y" : 1272.1
				},
				"eyebrowLeftOuter" : {
					"x" : 717.2,
					"y" : 1118.6
				},
				"noseLeftAlarTop" : {
					"x" : 796.2,
					"y" : 1176.5
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 32.2,
				"smile" : 0.046,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -19.8,
					"pitch" : 0.0,
					"roll" : -6.9
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.47
				},
				"emotion" : {
					"neutral" : 0.903,
					"surprise" : 0.0,
					"contempt" : 0.037,
					"happiness" : 0.046,
					"anger" : 0.012,
					"sadness" : 0.002,
					"disgust" : 0.001,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.25
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.59,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.04,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.5
						},
						{
							"color" : "other",
							"confidence" : 0.45
						},
						{
							"color" : "blond",
							"confidence" : 0.42
						},
						{
							"color" : "gray",
							"confidence" : 0.12
						},
						{
							"color" : "red",
							"confidence" : 0.06
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 301,
				"height" : 301,
				"top" : 1113,
				"left" : 1943
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2115.5,
					"y" : 1207.9
				},
				"eyeLeftTop" : {
					"x" : 2034.3,
					"y" : 1193.8
				},
				"eyebrowLeftInner" : {
					"x" : 2058.8,
					"y" : 1169.9
				},
				"upperLipTop" : {
					"x" : 2080.8,
					"y" : 1311.5
				},
				"noseRightAlarOutTip" : {
					"x" : 2138.9,
					"y" : 1274.9
				},
				"noseRootLeft" : {
					"x" : 2075.7,
					"y" : 1203.6
				},
				"noseTip" : {
					"x" : 2077.7,
					"y" : 1263.4
				},
				"pupilLeft" : {
					"x" : 2033.8,
					"y" : 1199.9
				},
				"mouthRight" : {
					"x" : 2159.1,
					"y" : 1336.3
				},
				"pupilRight" : {
					"x" : 2175.7,
					"y" : 1207.3
				},
				"eyeRightInner" : {
					"x" : 2150.2,
					"y" : 1208.0
				},
				"noseRightAlarTop" : {
					"x" : 2124.8,
					"y" : 1247.7
				},
				"eyeRightBottom" : {
					"x" : 2173.5,
					"y" : 1213.4
				},
				"eyeLeftOuter" : {
					"x" : 2012.5,
					"y" : 1203.2
				},
				"eyebrowRightOuter" : {
					"x" : 2228.9,
					"y" : 1188.8
				},
				"eyeLeftInner" : {
					"x" : 2054.0,
					"y" : 1204.5
				},
				"underLipBottom" : {
					"x" : 2078.9,
					"y" : 1361.0
				},
				"eyebrowRightInner" : {
					"x" : 2122.3,
					"y" : 1170.5
				},
				"eyeLeftBottom" : {
					"x" : 2034.2,
					"y" : 1206.4
				},
				"eyeRightTop" : {
					"x" : 2174.8,
					"y" : 1200.2
				},
				"noseLeftAlarOutTip" : {
					"x" : 2029.5,
					"y" : 1262.5
				},
				"upperLipBottom" : {
					"x" : 2080.2,
					"y" : 1323.4
				},
				"mouthLeft" : {
					"x" : 2019.0,
					"y" : 1328.2
				},
				"eyeRightOuter" : {
					"x" : 2198.5,
					"y" : 1211.2
				},
				"underLipTop" : {
					"x" : 2078.8,
					"y" : 1344.7
				},
				"eyebrowLeftOuter" : {
					"x" : 1986.0,
					"y" : 1165.9
				},
				"noseLeftAlarTop" : {
					"x" : 2055.4,
					"y" : 1239.6
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.7,
					"moustache" : 0.5,
					"sideburns" : 0.7
				},
				"age" : 29.8,
				"smile" : 1.0,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : -17.4,
					"pitch" : 0.0,
					"roll" : 6.1
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.36
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.39,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 227,
				"height" : 227,
				"top" : 806,
				"left" : 2342
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2461.4,
					"y" : 865.4
				},
				"eyeLeftTop" : {
					"x" : 2402.9,
					"y" : 865.0
				},
				"eyebrowLeftInner" : {
					"x" : 2425.0,
					"y" : 849.6
				},
				"upperLipTop" : {
					"x" : 2453.2,
					"y" : 963.0
				},
				"noseRightAlarOutTip" : {
					"x" : 2481.8,
					"y" : 926.6
				},
				"noseRootLeft" : {
					"x" : 2436.9,
					"y" : 867.6
				},
				"noseTip" : {
					"x" : 2447.4,
					"y" : 925.8
				},
				"pupilLeft" : {
					"x" : 2405.1,
					"y" : 869.8
				},
				"mouthRight" : {
					"x" : 2498.1,
					"y" : 974.4
				},
				"pupilRight" : {
					"x" : 2504.4,
					"y" : 859.3
				},
				"eyeRightInner" : {
					"x" : 2487.2,
					"y" : 861.0
				},
				"noseRightAlarTop" : {
					"x" : 2469.7,
					"y" : 907.2
				},
				"eyeRightBottom" : {
					"x" : 2504.2,
					"y" : 863.9
				},
				"eyeLeftOuter" : {
					"x" : 2388.8,
					"y" : 872.2
				},
				"eyebrowRightOuter" : {
					"x" : 2544.0,
					"y" : 836.8
				},
				"eyeLeftInner" : {
					"x" : 2420.8,
					"y" : 866.3
				},
				"underLipBottom" : {
					"x" : 2453.3,
					"y" : 997.1
				},
				"eyebrowRightInner" : {
					"x" : 2464.8,
					"y" : 847.0
				},
				"eyeLeftBottom" : {
					"x" : 2405.5,
					"y" : 874.6
				},
				"eyeRightTop" : {
					"x" : 2502.2,
					"y" : 853.6
				},
				"noseLeftAlarOutTip" : {
					"x" : 2425.3,
					"y" : 932.1
				},
				"upperLipBottom" : {
					"x" : 2453.3,
					"y" : 973.4
				},
				"mouthLeft" : {
					"x" : 2423.2,
					"y" : 979.1
				},
				"eyeRightOuter" : {
					"x" : 2518.5,
					"y" : 857.9
				},
				"underLipTop" : {
					"x" : 2452.6,
					"y" : 982.2
				},
				"eyebrowLeftOuter" : {
					"x" : 2366.9,
					"y" : 855.1
				},
				"noseLeftAlarTop" : {
					"x" : 2431.0,
					"y" : 910.7
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.2,
					"moustache" : 0.0,
					"sideburns" : 0.1
				},
				"age" : 26.2,
				"smile" : 0.0,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -12.3,
					"pitch" : 0.0,
					"roll" : -3.2
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.98
				},
				"emotion" : {
					"neutral" : 0.973,
					"surprise" : 0.004,
					"contempt" : 0.001,
					"happiness" : 0.0,
					"anger" : 0.004,
					"sadness" : 0.016,
					"disgust" : 0.001,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.29
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.76,
					"exposureLevel" : "overExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.22,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.98
						},
						{
							"color" : "black",
							"confidence" : 0.96
						},
						{
							"color" : "red",
							"confidence" : 0.25
						},
						{
							"color" : "other",
							"confidence" : 0.21
						},
						{
							"color" : "blond",
							"confidence" : 0.15
						},
						{
							"color" : "gray",
							"confidence" : 0.06
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 194,
				"height" : 194,
				"top" : 949,
				"left" : 1723
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1832.9,
					"y" : 1003.3
				},
				"eyeLeftTop" : {
					"x" : 1787.0,
					"y" : 992.8
				},
				"eyebrowLeftInner" : {
					"x" : 1805.6,
					"y" : 977.4
				},
				"upperLipTop" : {
					"x" : 1815.4,
					"y" : 1083.3
				},
				"noseRightAlarOutTip" : {
					"x" : 1842.8,
					"y" : 1050.1
				},
				"noseRootLeft" : {
					"x" : 1807.7,
					"y" : 1001.9
				},
				"noseTip" : {
					"x" : 1812.5,
					"y" : 1043.1
				},
				"pupilLeft" : {
					"x" : 1786.5,
					"y" : 998.9
				},
				"mouthRight" : {
					"x" : 1857.2,
					"y" : 1098.6
				},
				"pupilRight" : {
					"x" : 1859.2,
					"y" : 1003.0
				},
				"eyeRightInner" : {
					"x" : 1846.4,
					"y" : 1003.2
				},
				"noseRightAlarTop" : {
					"x" : 1832.1,
					"y" : 1035.1
				},
				"eyeRightBottom" : {
					"x" : 1860.1,
					"y" : 1007.8
				},
				"eyeLeftOuter" : {
					"x" : 1773.1,
					"y" : 999.5
				},
				"eyebrowRightOuter" : {
					"x" : 1895.0,
					"y" : 987.7
				},
				"eyeLeftInner" : {
					"x" : 1799.3,
					"y" : 1000.3
				},
				"underLipBottom" : {
					"x" : 1815.0,
					"y" : 1117.7
				},
				"eyebrowRightInner" : {
					"x" : 1832.7,
					"y" : 977.7
				},
				"eyeLeftBottom" : {
					"x" : 1785.7,
					"y" : 1003.8
				},
				"eyeRightTop" : {
					"x" : 1861.0,
					"y" : 998.4
				},
				"noseLeftAlarOutTip" : {
					"x" : 1789.4,
					"y" : 1045.9
				},
				"upperLipBottom" : {
					"x" : 1815.3,
					"y" : 1092.9
				},
				"mouthLeft" : {
					"x" : 1783.2,
					"y" : 1098.5
				},
				"eyeRightOuter" : {
					"x" : 1873.3,
					"y" : 1005.2
				},
				"underLipTop" : {
					"x" : 1815.4,
					"y" : 1105.3
				},
				"eyebrowLeftOuter" : {
					"x" : 1757.8,
					"y" : 978.3
				},
				"noseLeftAlarTop" : {
					"x" : 1799.9,
					"y" : 1032.6
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 14.2,
				"smile" : 0.994,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -14.5,
					"pitch" : 0.0,
					"roll" : 3.5
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.33
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.005,
					"contempt" : 0.0,
					"happiness" : 0.994,
					"anger" : 0.001,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.38
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.56,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.03,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.85
						},
						{
							"color" : "other",
							"confidence" : 0.66
						},
						{
							"color" : "red",
							"confidence" : 0.16
						},
						{
							"color" : "blond",
							"confidence" : 0.04
						},
						{
							"color" : "gray",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 181,
				"height" : 181,
				"top" : 662,
				"left" : 795
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 895.5,
					"y" : 712.1
				},
				"eyeLeftTop" : {
					"x" : 847.2,
					"y" : 704.4
				},
				"eyebrowLeftInner" : {
					"x" : 865.2,
					"y" : 693.2
				},
				"upperLipTop" : {
					"x" : 886.9,
					"y" : 787.8
				},
				"noseRightAlarOutTip" : {
					"x" : 907.1,
					"y" : 761.2
				},
				"noseRootLeft" : {
					"x" : 870.5,
					"y" : 713.4
				},
				"noseTip" : {
					"x" : 886.2,
					"y" : 761.2
				},
				"pupilLeft" : {
					"x" : 846.7,
					"y" : 709.2
				},
				"mouthRight" : {
					"x" : 917.9,
					"y" : 797.6
				},
				"pupilRight" : {
					"x" : 921.6,
					"y" : 707.1
				},
				"eyeRightInner" : {
					"x" : 909.1,
					"y" : 709.9
				},
				"noseRightAlarTop" : {
					"x" : 902.2,
					"y" : 750.7
				},
				"eyeRightBottom" : {
					"x" : 922.9,
					"y" : 714.1
				},
				"eyeLeftOuter" : {
					"x" : 835.4,
					"y" : 710.5
				},
				"eyebrowRightOuter" : {
					"x" : 951.6,
					"y" : 688.9
				},
				"eyeLeftInner" : {
					"x" : 859.8,
					"y" : 711.2
				},
				"underLipBottom" : {
					"x" : 887.1,
					"y" : 814.3
				},
				"eyebrowRightInner" : {
					"x" : 901.7,
					"y" : 692.7
				},
				"eyeLeftBottom" : {
					"x" : 847.2,
					"y" : 716.7
				},
				"eyeRightTop" : {
					"x" : 921.3,
					"y" : 703.0
				},
				"noseLeftAlarOutTip" : {
					"x" : 861.5,
					"y" : 762.1
				},
				"upperLipBottom" : {
					"x" : 886.5,
					"y" : 796.5
				},
				"mouthLeft" : {
					"x" : 855.2,
					"y" : 799.6
				},
				"eyeRightOuter" : {
					"x" : 934.7,
					"y" : 707.1
				},
				"underLipTop" : {
					"x" : 887.4,
					"y" : 801.7
				},
				"eyebrowLeftOuter" : {
					"x" : 813.0,
					"y" : 694.9
				},
				"noseLeftAlarTop" : {
					"x" : 867.1,
					"y" : 750.4
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 15.2,
				"smile" : 0.024,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -2.9,
					"pitch" : 0.0,
					"roll" : -1.8
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.83
				},
				"emotion" : {
					"neutral" : 0.956,
					"surprise" : 0.003,
					"contempt" : 0.0,
					"happiness" : 0.024,
					"anger" : 0.0,
					"sadness" : 0.016,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.62,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.94
						},
						{
							"color" : "black",
							"confidence" : 0.71
						},
						{
							"color" : "blond",
							"confidence" : 0.69
						},
						{
							"color" : "other",
							"confidence" : 0.48
						},
						{
							"color" : "red",
							"confidence" : 0.29
						},
						{
							"color" : "gray",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 164,
				"height" : 164,
				"top" : 729,
				"left" : 1414
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1511.5,
					"y" : 780.9
				},
				"eyeLeftTop" : {
					"x" : 1464.8,
					"y" : 761.6
				},
				"eyebrowLeftInner" : {
					"x" : 1485.4,
					"y" : 757.2
				},
				"upperLipTop" : {
					"x" : 1488.3,
					"y" : 844.0
				},
				"noseRightAlarOutTip" : {
					"x" : 1515.4,
					"y" : 822.1
				},
				"noseRootLeft" : {
					"x" : 1489.8,
					"y" : 776.7
				},
				"noseTip" : {
					"x" : 1493.5,
					"y" : 815.1
				},
				"pupilLeft" : {
					"x" : 1465.1,
					"y" : 767.2
				},
				"mouthRight" : {
					"x" : 1521.0,
					"y" : 854.1
				},
				"pupilRight" : {
					"x" : 1540.6,
					"y" : 782.2
				},
				"eyeRightInner" : {
					"x" : 1528.1,
					"y" : 781.8
				},
				"noseRightAlarTop" : {
					"x" : 1509.5,
					"y" : 809.7
				},
				"eyeRightBottom" : {
					"x" : 1540.4,
					"y" : 788.4
				},
				"eyeLeftOuter" : {
					"x" : 1450.6,
					"y" : 765.0
				},
				"eyebrowRightOuter" : {
					"x" : 1578.2,
					"y" : 774.2
				},
				"eyeLeftInner" : {
					"x" : 1476.5,
					"y" : 771.8
				},
				"underLipBottom" : {
					"x" : 1482.5,
					"y" : 865.0
				},
				"eyebrowRightInner" : {
					"x" : 1525.9,
					"y" : 765.3
				},
				"eyeLeftBottom" : {
					"x" : 1461.2,
					"y" : 772.0
				},
				"eyeRightTop" : {
					"x" : 1542.2,
					"y" : 777.8
				},
				"noseLeftAlarOutTip" : {
					"x" : 1472.4,
					"y" : 815.4
				},
				"upperLipBottom" : {
					"x" : 1487.2,
					"y" : 847.5
				},
				"mouthLeft" : {
					"x" : 1457.7,
					"y" : 843.0
				},
				"eyeRightOuter" : {
					"x" : 1553.7,
					"y" : 785.1
				},
				"underLipTop" : {
					"x" : 1484.9,
					"y" : 856.8
				},
				"eyebrowLeftOuter" : {
					"x" : 1432.0,
					"y" : 749.4
				},
				"noseLeftAlarTop" : {
					"x" : 1479.9,
					"y" : 805.1
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.8,
					"moustache" : 0.6,
					"sideburns" : 0.4
				},
				"age" : 18.4,
				"smile" : 0.753,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 0.3,
					"pitch" : 0.0,
					"roll" : 11.2
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.68
				},
				"emotion" : {
					"neutral" : 0.15,
					"surprise" : 0.005,
					"contempt" : 0.0,
					"happiness" : 0.753,
					"anger" : 0.088,
					"sadness" : 0.001,
					"disgust" : 0.002,
					"fear" : 0.001
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.16
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.72,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.83
						},
						{
							"color" : "other",
							"confidence" : 0.27
						},
						{
							"color" : "red",
							"confidence" : 0.18
						},
						{
							"color" : "blond",
							"confidence" : 0.13
						},
						{
							"color" : "gray",
							"confidence" : 0.07
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 145,
				"height" : 145,
				"top" : 710,
				"left" : 2850
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2924.8,
					"y" : 752.7
				},
				"eyeLeftTop" : {
					"x" : 2882.0,
					"y" : 749.5
				},
				"eyebrowLeftInner" : {
					"x" : 2893.8,
					"y" : 741.1
				},
				"upperLipTop" : {
					"x" : 2927.3,
					"y" : 810.6
				},
				"noseRightAlarOutTip" : {
					"x" : 2943.1,
					"y" : 785.6
				},
				"noseRootLeft" : {
					"x" : 2903.8,
					"y" : 755.6
				},
				"noseTip" : {
					"x" : 2922.3,
					"y" : 795.7
				},
				"pupilLeft" : {
					"x" : 2884.6,
					"y" : 752.7
				},
				"mouthRight" : {
					"x" : 2960.5,
					"y" : 809.1
				},
				"pupilRight" : {
					"x" : 2947.7,
					"y" : 744.8
				},
				"eyeRightInner" : {
					"x" : 2936.4,
					"y" : 748.2
				},
				"noseRightAlarTop" : {
					"x" : 2934.1,
					"y" : 779.9
				},
				"eyeRightBottom" : {
					"x" : 2948.7,
					"y" : 749.2
				},
				"eyeLeftOuter" : {
					"x" : 2872.4,
					"y" : 754.4
				},
				"eyebrowRightOuter" : {
					"x" : 2969.7,
					"y" : 728.4
				},
				"eyeLeftInner" : {
					"x" : 2894.2,
					"y" : 753.4
				},
				"underLipBottom" : {
					"x" : 2932.0,
					"y" : 838.0
				},
				"eyebrowRightInner" : {
					"x" : 2926.6,
					"y" : 737.5
				},
				"eyeLeftBottom" : {
					"x" : 2883.2,
					"y" : 757.6
				},
				"eyeRightTop" : {
					"x" : 2945.2,
					"y" : 741.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 2901.4,
					"y" : 792.3
				},
				"upperLipBottom" : {
					"x" : 2928.4,
					"y" : 816.0
				},
				"mouthLeft" : {
					"x" : 2901.1,
					"y" : 819.1
				},
				"eyeRightOuter" : {
					"x" : 2957.3,
					"y" : 743.2
				},
				"underLipTop" : {
					"x" : 2930.4,
					"y" : 827.3
				},
				"eyebrowLeftOuter" : {
					"x" : 2851.3,
					"y" : 744.8
				},
				"noseLeftAlarTop" : {
					"x" : 2906.2,
					"y" : 784.2
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 17.0,
				"smile" : 0.019,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -4.4,
					"pitch" : 0.0,
					"roll" : -10.5
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 1.0
				},
				"emotion" : {
					"neutral" : 0.981,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.019,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.65
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.62,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.0,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.92
						},
						{
							"color" : "other",
							"confidence" : 0.56
						},
						{
							"color" : "red",
							"confidence" : 0.24
						},
						{
							"color" : "blond",
							"confidence" : 0.06
						},
						{
							"color" : "gray",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 181,
				"height" : 181,
				"top" : 1473,
				"left" : 3213
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 3316.0,
					"y" : 1532.4
				},
				"eyeLeftTop" : {
					"x" : 3259.6,
					"y" : 1525.2
				},
				"eyebrowLeftInner" : {
					"x" : 3279.3,
					"y" : 1506.2
				},
				"upperLipTop" : {
					"x" : 3304.5,
					"y" : 1599.9
				},
				"noseRightAlarOutTip" : {
					"x" : 3334.8,
					"y" : 1572.7
				},
				"noseRootLeft" : {
					"x" : 3287.9,
					"y" : 1533.0
				},
				"noseTip" : {
					"x" : 3299.7,
					"y" : 1573.0
				},
				"pupilLeft" : {
					"x" : 3264.1,
					"y" : 1528.2
				},
				"mouthRight" : {
					"x" : 3354.4,
					"y" : 1601.7
				},
				"pupilRight" : {
					"x" : 3345.0,
					"y" : 1525.5
				},
				"eyeRightInner" : {
					"x" : 3333.1,
					"y" : 1528.9
				},
				"noseRightAlarTop" : {
					"x" : 3321.7,
					"y" : 1556.3
				},
				"eyeRightBottom" : {
					"x" : 3346.0,
					"y" : 1530.1
				},
				"eyeLeftOuter" : {
					"x" : 3248.9,
					"y" : 1531.1
				},
				"eyebrowRightOuter" : {
					"x" : 3378.7,
					"y" : 1500.9
				},
				"eyeLeftInner" : {
					"x" : 3274.7,
					"y" : 1529.9
				},
				"underLipBottom" : {
					"x" : 3307.9,
					"y" : 1636.5
				},
				"eyebrowRightInner" : {
					"x" : 3321.9,
					"y" : 1504.7
				},
				"eyeLeftBottom" : {
					"x" : 3261.3,
					"y" : 1532.4
				},
				"eyeRightTop" : {
					"x" : 3346.5,
					"y" : 1521.6
				},
				"noseLeftAlarOutTip" : {
					"x" : 3271.6,
					"y" : 1571.3
				},
				"upperLipBottom" : {
					"x" : 3304.7,
					"y" : 1607.4
				},
				"mouthLeft" : {
					"x" : 3256.6,
					"y" : 1600.3
				},
				"eyeRightOuter" : {
					"x" : 3358.8,
					"y" : 1527.5
				},
				"underLipTop" : {
					"x" : 3307.2,
					"y" : 1623.8
				},
				"eyebrowLeftOuter" : {
					"x" : 3231.9,
					"y" : 1504.1
				},
				"noseLeftAlarTop" : {
					"x" : 3281.4,
					"y" : 1555.6
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 49.6,
				"smile" : 1.0,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : -8.6,
					"pitch" : 0.0,
					"roll" : -1.3
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.65
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.58
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.54,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 172,
				"height" : 172,
				"top" : 1391,
				"left" : 442
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 535.1,
					"y" : 1440.7
				},
				"eyeLeftTop" : {
					"x" : 488.9,
					"y" : 1436.8
				},
				"eyebrowLeftInner" : {
					"x" : 504.0,
					"y" : 1427.7
				},
				"upperLipTop" : {
					"x" : 527.8,
					"y" : 1503.8
				},
				"noseRightAlarOutTip" : {
					"x" : 550.7,
					"y" : 1479.5
				},
				"noseRootLeft" : {
					"x" : 511.2,
					"y" : 1442.7
				},
				"noseTip" : {
					"x" : 521.5,
					"y" : 1480.7
				},
				"pupilLeft" : {
					"x" : 486.6,
					"y" : 1440.5
				},
				"mouthRight" : {
					"x" : 563.6,
					"y" : 1516.1
				},
				"pupilRight" : {
					"x" : 564.7,
					"y" : 1433.5
				},
				"eyeRightInner" : {
					"x" : 552.1,
					"y" : 1436.9
				},
				"noseRightAlarTop" : {
					"x" : 541.4,
					"y" : 1467.0
				},
				"eyeRightBottom" : {
					"x" : 565.5,
					"y" : 1438.8
				},
				"eyeLeftOuter" : {
					"x" : 474.4,
					"y" : 1443.0
				},
				"eyebrowRightOuter" : {
					"x" : 598.4,
					"y" : 1420.5
				},
				"eyeLeftInner" : {
					"x" : 500.3,
					"y" : 1442.3
				},
				"underLipBottom" : {
					"x" : 529.6,
					"y" : 1539.1
				},
				"eyebrowRightInner" : {
					"x" : 535.7,
					"y" : 1425.6
				},
				"eyeLeftBottom" : {
					"x" : 488.4,
					"y" : 1445.5
				},
				"eyeRightTop" : {
					"x" : 563.9,
					"y" : 1430.4
				},
				"noseLeftAlarOutTip" : {
					"x" : 502.3,
					"y" : 1482.7
				},
				"upperLipBottom" : {
					"x" : 528.2,
					"y" : 1510.9
				},
				"mouthLeft" : {
					"x" : 501.8,
					"y" : 1520.1
				},
				"eyeRightOuter" : {
					"x" : 576.9,
					"y" : 1434.3
				},
				"underLipTop" : {
					"x" : 529.5,
					"y" : 1530.5
				},
				"eyebrowLeftOuter" : {
					"x" : 459.9,
					"y" : 1425.9
				},
				"noseLeftAlarTop" : {
					"x" : 509.3,
					"y" : 1469.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 26.4,
				"smile" : 0.756,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -11.9,
					"pitch" : 0.0,
					"roll" : -3.3
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.49
				},
				"emotion" : {
					"neutral" : 0.048,
					"surprise" : 0.001,
					"contempt" : 0.005,
					"happiness" : 0.756,
					"anger" : 0.003,
					"sadness" : 0.0,
					"disgust" : 0.186,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.41
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.58,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "blond",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.44
						},
						{
							"color" : "brown",
							"confidence" : 0.24
						},
						{
							"color" : "black",
							"confidence" : 0.22
						},
						{
							"color" : "red",
							"confidence" : 0.19
						},
						{
							"color" : "gray",
							"confidence" : 0.08
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 170,
				"height" : 170,
				"top" : 1368,
				"left" : 1351
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1447.7,
					"y" : 1417.6
				},
				"eyeLeftTop" : {
					"x" : 1402.8,
					"y" : 1413.5
				},
				"eyebrowLeftInner" : {
					"x" : 1418.0,
					"y" : 1400.1
				},
				"upperLipTop" : {
					"x" : 1432.0,
					"y" : 1482.2
				},
				"noseRightAlarOutTip" : {
					"x" : 1459.9,
					"y" : 1456.5
				},
				"noseRootLeft" : {
					"x" : 1421.1,
					"y" : 1416.2
				},
				"noseTip" : {
					"x" : 1428.4,
					"y" : 1451.8
				},
				"pupilLeft" : {
					"x" : 1402.6,
					"y" : 1416.4
				},
				"mouthRight" : {
					"x" : 1470.6,
					"y" : 1494.3
				},
				"pupilRight" : {
					"x" : 1475.5,
					"y" : 1413.5
				},
				"eyeRightInner" : {
					"x" : 1461.3,
					"y" : 1415.4
				},
				"noseRightAlarTop" : {
					"x" : 1449.5,
					"y" : 1441.8
				},
				"eyeRightBottom" : {
					"x" : 1474.5,
					"y" : 1418.1
				},
				"eyeLeftOuter" : {
					"x" : 1389.9,
					"y" : 1418.0
				},
				"eyebrowRightOuter" : {
					"x" : 1511.9,
					"y" : 1404.0
				},
				"eyeLeftInner" : {
					"x" : 1414.9,
					"y" : 1417.2
				},
				"underLipBottom" : {
					"x" : 1432.1,
					"y" : 1524.3
				},
				"eyebrowRightInner" : {
					"x" : 1450.8,
					"y" : 1397.9
				},
				"eyeLeftBottom" : {
					"x" : 1402.6,
					"y" : 1420.6
				},
				"eyeRightTop" : {
					"x" : 1475.0,
					"y" : 1410.6
				},
				"noseLeftAlarOutTip" : {
					"x" : 1404.4,
					"y" : 1456.7
				},
				"upperLipBottom" : {
					"x" : 1432.4,
					"y" : 1491.3
				},
				"mouthLeft" : {
					"x" : 1405.1,
					"y" : 1498.3
				},
				"eyeRightOuter" : {
					"x" : 1486.7,
					"y" : 1414.4
				},
				"underLipTop" : {
					"x" : 1432.0,
					"y" : 1510.7
				},
				"eyebrowLeftOuter" : {
					"x" : 1377.0,
					"y" : 1401.1
				},
				"noseLeftAlarTop" : {
					"x" : 1414.2,
					"y" : 1441.2
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.3,
					"moustache" : 0.1,
					"sideburns" : 0.3
				},
				"age" : 27.3,
				"smile" : 0.999,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -14.0,
					"pitch" : 0.0,
					"roll" : 1.6
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.42
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.001,
					"happiness" : 0.999,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.42
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.63,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.99
						},
						{
							"color" : "gray",
							"confidence" : 0.18
						},
						{
							"color" : "other",
							"confidence" : 0.08
						},
						{
							"color" : "red",
							"confidence" : 0.07
						},
						{
							"color" : "blond",
							"confidence" : 0.06
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 165,
				"height" : 165,
				"top" : 1532,
				"left" : 2279
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2369.8,
					"y" : 1581.8
				},
				"eyeLeftTop" : {
					"x" : 2319.2,
					"y" : 1577.5
				},
				"eyebrowLeftInner" : {
					"x" : 2347.3,
					"y" : 1565.4
				},
				"upperLipTop" : {
					"x" : 2362.2,
					"y" : 1640.7
				},
				"noseRightAlarOutTip" : {
					"x" : 2386.2,
					"y" : 1614.1
				},
				"noseRootLeft" : {
					"x" : 2346.8,
					"y" : 1583.2
				},
				"noseTip" : {
					"x" : 2364.0,
					"y" : 1616.7
				},
				"pupilLeft" : {
					"x" : 2323.6,
					"y" : 1582.1
				},
				"mouthRight" : {
					"x" : 2391.8,
					"y" : 1650.0
				},
				"pupilRight" : {
					"x" : 2399.5,
					"y" : 1573.6
				},
				"eyeRightInner" : {
					"x" : 2385.7,
					"y" : 1578.0
				},
				"noseRightAlarTop" : {
					"x" : 2375.7,
					"y" : 1601.9
				},
				"eyeRightBottom" : {
					"x" : 2399.2,
					"y" : 1580.3
				},
				"eyeLeftOuter" : {
					"x" : 2306.1,
					"y" : 1585.8
				},
				"eyebrowRightOuter" : {
					"x" : 2429.3,
					"y" : 1555.4
				},
				"eyeLeftInner" : {
					"x" : 2332.9,
					"y" : 1583.1
				},
				"underLipBottom" : {
					"x" : 2365.5,
					"y" : 1671.9
				},
				"eyebrowRightInner" : {
					"x" : 2376.5,
					"y" : 1561.4
				},
				"eyeLeftBottom" : {
					"x" : 2319.9,
					"y" : 1588.0
				},
				"eyeRightTop" : {
					"x" : 2397.4,
					"y" : 1568.8
				},
				"noseLeftAlarOutTip" : {
					"x" : 2337.9,
					"y" : 1621.6
				},
				"upperLipBottom" : {
					"x" : 2362.9,
					"y" : 1646.1
				},
				"mouthLeft" : {
					"x" : 2326.6,
					"y" : 1657.1
				},
				"eyeRightOuter" : {
					"x" : 2411.9,
					"y" : 1573.5
				},
				"underLipTop" : {
					"x" : 2363.4,
					"y" : 1663.2
				},
				"eyebrowLeftOuter" : {
					"x" : 2290.0,
					"y" : 1571.0
				},
				"noseLeftAlarTop" : {
					"x" : 2343.6,
					"y" : 1607.8
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 16.4,
				"smile" : 0.693,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 0.99,
						"type" : "glasses"
					},
					{
						"confidence" : 0.99,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : 4.1,
					"pitch" : 0.0,
					"roll" : -3.9
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.63
				},
				"emotion" : {
					"neutral" : 0.006,
					"surprise" : 0.298,
					"contempt" : 0.0,
					"happiness" : 0.693,
					"anger" : 0.001,
					"sadness" : 0.0,
					"disgust" : 0.003,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.32
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.42,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 159,
				"height" : 159,
				"top" : 1466,
				"left" : 915
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1006.6,
					"y" : 1515.5
				},
				"eyeLeftTop" : {
					"x" : 962.8,
					"y" : 1504.8
				},
				"eyebrowLeftInner" : {
					"x" : 983.0,
					"y" : 1495.7
				},
				"upperLipTop" : {
					"x" : 990.0,
					"y" : 1568.6
				},
				"noseRightAlarOutTip" : {
					"x" : 1015.4,
					"y" : 1549.4
				},
				"noseRootLeft" : {
					"x" : 986.5,
					"y" : 1513.1
				},
				"noseTip" : {
					"x" : 989.9,
					"y" : 1544.8
				},
				"pupilLeft" : {
					"x" : 963.5,
					"y" : 1508.3
				},
				"mouthRight" : {
					"x" : 1022.7,
					"y" : 1587.2
				},
				"pupilRight" : {
					"x" : 1034.6,
					"y" : 1514.2
				},
				"eyeRightInner" : {
					"x" : 1023.5,
					"y" : 1515.9
				},
				"noseRightAlarTop" : {
					"x" : 1010.5,
					"y" : 1538.6
				},
				"eyeRightBottom" : {
					"x" : 1032.9,
					"y" : 1517.1
				},
				"eyeLeftOuter" : {
					"x" : 952.2,
					"y" : 1508.6
				},
				"eyebrowRightOuter" : {
					"x" : 1065.4,
					"y" : 1503.9
				},
				"eyeLeftInner" : {
					"x" : 972.0,
					"y" : 1511.2
				},
				"underLipBottom" : {
					"x" : 986.6,
					"y" : 1606.6
				},
				"eyebrowRightInner" : {
					"x" : 1008.0,
					"y" : 1498.5
				},
				"eyeLeftBottom" : {
					"x" : 962.2,
					"y" : 1511.5
				},
				"eyeRightTop" : {
					"x" : 1032.5,
					"y" : 1510.4
				},
				"noseLeftAlarOutTip" : {
					"x" : 967.3,
					"y" : 1545.2
				},
				"upperLipBottom" : {
					"x" : 989.9,
					"y" : 1575.9
				},
				"mouthLeft" : {
					"x" : 957.8,
					"y" : 1579.7
				},
				"eyeRightOuter" : {
					"x" : 1042.1,
					"y" : 1514.2
				},
				"underLipTop" : {
					"x" : 986.9,
					"y" : 1596.6
				},
				"eyebrowLeftOuter" : {
					"x" : 934.4,
					"y" : 1491.2
				},
				"noseLeftAlarTop" : {
					"x" : 977.0,
					"y" : 1532.7
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 31.2,
				"smile" : 0.999,
				"gender" : "female",
				"accessories" : [
					{
						"confidence" : 0.99,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : -7.3,
					"pitch" : 0.0,
					"roll" : 5.9
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.32
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.999,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.001,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.36
				},
				"glasses" : "ReadingGlasses",
				"exposure" : {
					"value" : 0.62,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.82
						},
						{
							"color" : "other",
							"confidence" : 0.29
						},
						{
							"color" : "red",
							"confidence" : 0.11
						},
						{
							"color" : "gray",
							"confidence" : 0.1
						},
						{
							"color" : "blond",
							"confidence" : 0.07
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 155,
				"height" : 155,
				"top" : 1485,
				"left" : 1997
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2080.8,
					"y" : 1523.3
				},
				"eyeLeftTop" : {
					"x" : 2038.5,
					"y" : 1521.3
				},
				"eyebrowLeftInner" : {
					"x" : 2055.7,
					"y" : 1503.3
				},
				"upperLipTop" : {
					"x" : 2078.4,
					"y" : 1592.0
				},
				"noseRightAlarOutTip" : {
					"x" : 2098.4,
					"y" : 1570.5
				},
				"noseRootLeft" : {
					"x" : 2062.2,
					"y" : 1525.3
				},
				"noseTip" : {
					"x" : 2076.9,
					"y" : 1572.5
				},
				"pupilLeft" : {
					"x" : 2042.1,
					"y" : 1524.5
				},
				"mouthRight" : {
					"x" : 2100.8,
					"y" : 1598.8
				},
				"pupilRight" : {
					"x" : 2103.1,
					"y" : 1520.6
				},
				"eyeRightInner" : {
					"x" : 2091.4,
					"y" : 1523.3
				},
				"noseRightAlarTop" : {
					"x" : 2088.4,
					"y" : 1555.4
				},
				"eyeRightBottom" : {
					"x" : 2102.6,
					"y" : 1525.3
				},
				"eyeLeftOuter" : {
					"x" : 2029.8,
					"y" : 1525.9
				},
				"eyebrowRightOuter" : {
					"x" : 2126.0,
					"y" : 1498.5
				},
				"eyeLeftInner" : {
					"x" : 2048.9,
					"y" : 1525.9
				},
				"underLipBottom" : {
					"x" : 2079.4,
					"y" : 1620.4
				},
				"eyebrowRightInner" : {
					"x" : 2082.4,
					"y" : 1506.8
				},
				"eyeLeftBottom" : {
					"x" : 2040.3,
					"y" : 1528.5
				},
				"eyeRightTop" : {
					"x" : 2101.3,
					"y" : 1517.5
				},
				"noseLeftAlarOutTip" : {
					"x" : 2054.3,
					"y" : 1573.1
				},
				"upperLipBottom" : {
					"x" : 2079.1,
					"y" : 1599.5
				},
				"mouthLeft" : {
					"x" : 2047.7,
					"y" : 1602.9
				},
				"eyeRightOuter" : {
					"x" : 2112.0,
					"y" : 1520.8
				},
				"underLipTop" : {
					"x" : 2078.6,
					"y" : 1609.4
				},
				"eyebrowLeftOuter" : {
					"x" : 2013.0,
					"y" : 1508.1
				},
				"noseLeftAlarTop" : {
					"x" : 2060.6,
					"y" : 1557.1
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 29.2,
				"smile" : 0.875,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -3.2,
					"pitch" : 0.0,
					"roll" : -4.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.05
				},
				"emotion" : {
					"neutral" : 0.009,
					"surprise" : 0.107,
					"contempt" : 0.0,
					"happiness" : 0.875,
					"anger" : 0.005,
					"sadness" : 0.001,
					"disgust" : 0.003,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.67,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "blond",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.72
						},
						{
							"color" : "red",
							"confidence" : 0.25
						},
						{
							"color" : "gray",
							"confidence" : 0.1
						},
						{
							"color" : "brown",
							"confidence" : 0.09
						},
						{
							"color" : "black",
							"confidence" : 0.05
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		}
	],
	[ ],
	[
		{
			"faceRectangle" : {
				"width" : 99,
				"height" : 99,
				"top" : 661,
				"left" : 1471
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1526.1,
					"y" : 688.9
				},
				"eyeLeftTop" : {
					"x" : 1504.8,
					"y" : 679.3
				},
				"eyebrowLeftInner" : {
					"x" : 1514.1,
					"y" : 674.9
				},
				"upperLipTop" : {
					"x" : 1518.2,
					"y" : 732.4
				},
				"noseRightAlarOutTip" : {
					"x" : 1532.2,
					"y" : 717.0
				},
				"noseRootLeft" : {
					"x" : 1513.7,
					"y" : 686.7
				},
				"noseTip" : {
					"x" : 1516.1,
					"y" : 711.8
				},
				"pupilLeft" : {
					"x" : 1504.8,
					"y" : 682.4
				},
				"mouthRight" : {
					"x" : 1536.5,
					"y" : 740.5
				},
				"pupilRight" : {
					"x" : 1541.3,
					"y" : 690.9
				},
				"eyeRightInner" : {
					"x" : 1534.4,
					"y" : 689.9
				},
				"noseRightAlarTop" : {
					"x" : 1528.2,
					"y" : 707.1
				},
				"eyeRightBottom" : {
					"x" : 1540.9,
					"y" : 694.3
				},
				"eyeLeftOuter" : {
					"x" : 1498.1,
					"y" : 682.2
				},
				"eyebrowRightOuter" : {
					"x" : 1561.1,
					"y" : 689.2
				},
				"eyeLeftInner" : {
					"x" : 1508.9,
					"y" : 684.4
				},
				"underLipBottom" : {
					"x" : 1518.1,
					"y" : 747.9
				},
				"eyebrowRightInner" : {
					"x" : 1528.5,
					"y" : 678.7
				},
				"eyeLeftBottom" : {
					"x" : 1503.1,
					"y" : 685.7
				},
				"eyeRightTop" : {
					"x" : 1542.2,
					"y" : 688.0
				},
				"noseLeftAlarOutTip" : {
					"x" : 1503.8,
					"y" : 711.0
				},
				"upperLipBottom" : {
					"x" : 1517.2,
					"y" : 738.4
				},
				"mouthLeft" : {
					"x" : 1502.4,
					"y" : 735.1
				},
				"eyeRightOuter" : {
					"x" : 1547.9,
					"y" : 693.5
				},
				"underLipTop" : {
					"x" : 1518.1,
					"y" : 741.3
				},
				"eyebrowLeftOuter" : {
					"x" : 1486.1,
					"y" : 669.7
				},
				"noseLeftAlarTop" : {
					"x" : 1508.5,
					"y" : 703.8
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.1,
					"sideburns" : 0.2
				},
				"age" : 36.6,
				"smile" : 1.0,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 0.99,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : -14.5,
					"pitch" : 0.0,
					"roll" : 7.9
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.26
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.33
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.54,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.83
						},
						{
							"color" : "brown",
							"confidence" : 0.78
						},
						{
							"color" : "gray",
							"confidence" : 0.35
						},
						{
							"color" : "red",
							"confidence" : 0.05
						},
						{
							"color" : "blond",
							"confidence" : 0.01
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 95,
				"height" : 95,
				"top" : 672,
				"left" : 2486
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2540.2,
					"y" : 700.1
				},
				"eyeLeftTop" : {
					"x" : 2516.5,
					"y" : 689.8
				},
				"eyebrowLeftInner" : {
					"x" : 2526.0,
					"y" : 688.3
				},
				"upperLipTop" : {
					"x" : 2532.0,
					"y" : 742.0
				},
				"noseRightAlarOutTip" : {
					"x" : 2544.7,
					"y" : 726.3
				},
				"noseRootLeft" : {
					"x" : 2528.0,
					"y" : 698.8
				},
				"noseTip" : {
					"x" : 2528.4,
					"y" : 726.5
				},
				"pupilLeft" : {
					"x" : 2514.0,
					"y" : 693.0
				},
				"mouthRight" : {
					"x" : 2553.8,
					"y" : 744.3
				},
				"pupilRight" : {
					"x" : 2552.0,
					"y" : 698.9
				},
				"eyeRightInner" : {
					"x" : 2549.8,
					"y" : 699.2
				},
				"noseRightAlarTop" : {
					"x" : 2541.5,
					"y" : 717.9
				},
				"eyeRightBottom" : {
					"x" : 2555.9,
					"y" : 703.6
				},
				"eyeLeftOuter" : {
					"x" : 2510.8,
					"y" : 692.5
				},
				"eyebrowRightOuter" : {
					"x" : 2575.2,
					"y" : 695.1
				},
				"eyeLeftInner" : {
					"x" : 2521.7,
					"y" : 695.7
				},
				"underLipBottom" : {
					"x" : 2533.1,
					"y" : 757.0
				},
				"eyebrowRightInner" : {
					"x" : 2542.0,
					"y" : 690.0
				},
				"eyeLeftBottom" : {
					"x" : 2515.3,
					"y" : 697.4
				},
				"eyeRightTop" : {
					"x" : 2555.9,
					"y" : 696.5
				},
				"noseLeftAlarOutTip" : {
					"x" : 2519.4,
					"y" : 724.2
				},
				"upperLipBottom" : {
					"x" : 2532.3,
					"y" : 746.3
				},
				"mouthLeft" : {
					"x" : 2519.2,
					"y" : 741.5
				},
				"eyeRightOuter" : {
					"x" : 2562.5,
					"y" : 700.0
				},
				"underLipTop" : {
					"x" : 2533.6,
					"y" : 749.5
				},
				"eyebrowLeftOuter" : {
					"x" : 2502.6,
					"y" : 680.8
				},
				"noseLeftAlarTop" : {
					"x" : 2524.4,
					"y" : 715.8
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.6,
					"moustache" : 0.4,
					"sideburns" : 0.4
				},
				"age" : 30.2,
				"smile" : 0.928,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -24.4,
					"pitch" : 0.0,
					"roll" : 5.1
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.24
				},
				"emotion" : {
					"neutral" : 0.057,
					"surprise" : 0.0,
					"contempt" : 0.013,
					"happiness" : 0.928,
					"anger" : 0.001,
					"sadness" : 0.001,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.57
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.68,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.64
						},
						{
							"color" : "brown",
							"confidence" : 0.25
						},
						{
							"color" : "blond",
							"confidence" : 0.17
						},
						{
							"color" : "gray",
							"confidence" : 0.12
						},
						{
							"color" : "red",
							"confidence" : 0.11
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 85,
				"height" : 85,
				"top" : 744,
				"left" : 1902
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1951.0,
					"y" : 766.2
				},
				"eyeLeftTop" : {
					"x" : 1935.0,
					"y" : 758.8
				},
				"eyebrowLeftInner" : {
					"x" : 1940.6,
					"y" : 753.7
				},
				"upperLipTop" : {
					"x" : 1939.1,
					"y" : 803.6
				},
				"noseRightAlarOutTip" : {
					"x" : 1953.3,
					"y" : 792.4
				},
				"noseRootLeft" : {
					"x" : 1941.6,
					"y" : 764.7
				},
				"noseTip" : {
					"x" : 1938.2,
					"y" : 789.5
				},
				"pupilLeft" : {
					"x" : 1935.0,
					"y" : 762.3
				},
				"mouthRight" : {
					"x" : 1957.4,
					"y" : 810.2
				},
				"pupilRight" : {
					"x" : 1962.7,
					"y" : 766.1
				},
				"eyeRightInner" : {
					"x" : 1957.9,
					"y" : 766.3
				},
				"noseRightAlarTop" : {
					"x" : 1950.6,
					"y" : 783.4
				},
				"eyeRightBottom" : {
					"x" : 1963.9,
					"y" : 770.0
				},
				"eyeLeftOuter" : {
					"x" : 1929.7,
					"y" : 762.2
				},
				"eyebrowRightOuter" : {
					"x" : 1982.8,
					"y" : 762.3
				},
				"eyeLeftInner" : {
					"x" : 1939.2,
					"y" : 763.5
				},
				"underLipBottom" : {
					"x" : 1936.9,
					"y" : 819.8
				},
				"eyebrowRightInner" : {
					"x" : 1951.4,
					"y" : 756.2
				},
				"eyeLeftBottom" : {
					"x" : 1934.0,
					"y" : 765.3
				},
				"eyeRightTop" : {
					"x" : 1965.1,
					"y" : 764.4
				},
				"noseLeftAlarOutTip" : {
					"x" : 1929.5,
					"y" : 788.4
				},
				"upperLipBottom" : {
					"x" : 1939.3,
					"y" : 807.6
				},
				"mouthLeft" : {
					"x" : 1929.5,
					"y" : 809.1
				},
				"eyeRightOuter" : {
					"x" : 1970.0,
					"y" : 768.5
				},
				"underLipTop" : {
					"x" : 1937.6,
					"y" : 814.7
				},
				"eyebrowLeftOuter" : {
					"x" : 1923.2,
					"y" : 748.8
				},
				"noseLeftAlarTop" : {
					"x" : 1934.6,
					"y" : 780.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 21.8,
				"smile" : 0.787,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -30.1,
					"pitch" : 0.0,
					"roll" : 10.9
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.212,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.787,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.49
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.73,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.0,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.97
						},
						{
							"color" : "other",
							"confidence" : 0.42
						},
						{
							"color" : "gray",
							"confidence" : 0.14
						},
						{
							"color" : "red",
							"confidence" : 0.03
						},
						{
							"color" : "blond",
							"confidence" : 0.01
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 84,
				"height" : 84,
				"top" : 779,
				"left" : 2188
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2236.9,
					"y" : 803.2
				},
				"eyeLeftTop" : {
					"x" : 2219.9,
					"y" : 794.2
				},
				"eyebrowLeftInner" : {
					"x" : 2226.3,
					"y" : 789.8
				},
				"upperLipTop" : {
					"x" : 2224.9,
					"y" : 837.0
				},
				"noseRightAlarOutTip" : {
					"x" : 2238.3,
					"y" : 827.3
				},
				"noseRootLeft" : {
					"x" : 2228.2,
					"y" : 800.5
				},
				"noseTip" : {
					"x" : 2223.2,
					"y" : 822.6
				},
				"pupilLeft" : {
					"x" : 2219.2,
					"y" : 796.7
				},
				"mouthRight" : {
					"x" : 2245.5,
					"y" : 847.2
				},
				"pupilRight" : {
					"x" : 2248.2,
					"y" : 804.6
				},
				"eyeRightInner" : {
					"x" : 2244.5,
					"y" : 804.4
				},
				"noseRightAlarTop" : {
					"x" : 2235.1,
					"y" : 819.6
				},
				"eyeRightBottom" : {
					"x" : 2250.2,
					"y" : 808.2
				},
				"eyeLeftOuter" : {
					"x" : 2214.4,
					"y" : 795.9
				},
				"eyebrowRightOuter" : {
					"x" : 2269.3,
					"y" : 800.7
				},
				"eyeLeftInner" : {
					"x" : 2224.7,
					"y" : 799.3
				},
				"underLipBottom" : {
					"x" : 2224.8,
					"y" : 856.3
				},
				"eyebrowRightInner" : {
					"x" : 2237.7,
					"y" : 792.8
				},
				"eyeLeftBottom" : {
					"x" : 2218.7,
					"y" : 799.6
				},
				"eyeRightTop" : {
					"x" : 2250.9,
					"y" : 802.8
				},
				"noseLeftAlarOutTip" : {
					"x" : 2216.2,
					"y" : 821.4
				},
				"upperLipBottom" : {
					"x" : 2224.6,
					"y" : 840.5
				},
				"mouthLeft" : {
					"x" : 2214.8,
					"y" : 840.2
				},
				"eyeRightOuter" : {
					"x" : 2256.8,
					"y" : 807.4
				},
				"underLipTop" : {
					"x" : 2225.1,
					"y" : 851.4
				},
				"eyebrowLeftOuter" : {
					"x" : 2210.3,
					"y" : 781.2
				},
				"noseLeftAlarTop" : {
					"x" : 2221.5,
					"y" : 815.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 28.4,
				"smile" : 0.994,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -30.1,
					"pitch" : 0.0,
					"roll" : 13.0
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.004,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.994,
					"anger" : 0.0,
					"sadness" : 0.001,
					"disgust" : 0.001,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.33
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.72,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.66,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 175,
				"height" : 175,
				"top" : 779,
				"left" : 1636
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1738.7,
					"y" : 833.7
				},
				"eyeLeftTop" : {
					"x" : 1692.6,
					"y" : 821.2
				},
				"eyebrowLeftInner" : {
					"x" : 1709.6,
					"y" : 811.1
				},
				"upperLipTop" : {
					"x" : 1721.3,
					"y" : 900.0
				},
				"noseRightAlarOutTip" : {
					"x" : 1750.6,
					"y" : 876.1
				},
				"noseRootLeft" : {
					"x" : 1716.5,
					"y" : 831.7
				},
				"noseTip" : {
					"x" : 1720.1,
					"y" : 871.9
				},
				"pupilLeft" : {
					"x" : 1686.8,
					"y" : 823.5
				},
				"mouthRight" : {
					"x" : 1765.6,
					"y" : 911.5
				},
				"pupilRight" : {
					"x" : 1763.2,
					"y" : 833.7
				},
				"eyeRightInner" : {
					"x" : 1755.5,
					"y" : 834.6
				},
				"noseRightAlarTop" : {
					"x" : 1741.4,
					"y" : 860.1
				},
				"eyeRightBottom" : {
					"x" : 1766.8,
					"y" : 839.3
				},
				"eyeLeftOuter" : {
					"x" : 1678.7,
					"y" : 825.4
				},
				"eyebrowRightOuter" : {
					"x" : 1803.6,
					"y" : 827.0
				},
				"eyeLeftInner" : {
					"x" : 1703.0,
					"y" : 827.2
				},
				"underLipBottom" : {
					"x" : 1721.2,
					"y" : 930.6
				},
				"eyebrowRightInner" : {
					"x" : 1753.1,
					"y" : 815.1
				},
				"eyeLeftBottom" : {
					"x" : 1691.4,
					"y" : 828.6
				},
				"eyeRightTop" : {
					"x" : 1768.3,
					"y" : 830.8
				},
				"noseLeftAlarOutTip" : {
					"x" : 1696.1,
					"y" : 868.4
				},
				"upperLipBottom" : {
					"x" : 1721.1,
					"y" : 905.7
				},
				"mouthLeft" : {
					"x" : 1684.9,
					"y" : 901.5
				},
				"eyeRightOuter" : {
					"x" : 1777.9,
					"y" : 838.3
				},
				"underLipTop" : {
					"x" : 1721.2,
					"y" : 922.0
				},
				"eyebrowLeftOuter" : {
					"x" : 1665.0,
					"y" : 806.7
				},
				"noseLeftAlarTop" : {
					"x" : 1705.4,
					"y" : 857.0
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.8,
					"moustache" : 0.4,
					"sideburns" : 0.4
				},
				"age" : 33.0,
				"smile" : 1.0,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -8.9,
					"pitch" : 0.0,
					"roll" : 6.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.12
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 0.85
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.6,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.98
						},
						{
							"color" : "other",
							"confidence" : 0.27
						},
						{
							"color" : "red",
							"confidence" : 0.1
						},
						{
							"color" : "blond",
							"confidence" : 0.03
						},
						{
							"color" : "gray",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 334,
				"height" : 334,
				"top" : 1135,
				"left" : 919
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1116.8,
					"y" : 1238.4
				},
				"eyeLeftTop" : {
					"x" : 1022.3,
					"y" : 1209.5
				},
				"eyebrowLeftInner" : {
					"x" : 1077.9,
					"y" : 1201.4
				},
				"upperLipTop" : {
					"x" : 1078.1,
					"y" : 1360.0
				},
				"noseRightAlarOutTip" : {
					"x" : 1133.9,
					"y" : 1315.6
				},
				"noseRootLeft" : {
					"x" : 1073.4,
					"y" : 1233.5
				},
				"noseTip" : {
					"x" : 1085.2,
					"y" : 1300.5
				},
				"pupilLeft" : {
					"x" : 1025.1,
					"y" : 1220.7
				},
				"mouthRight" : {
					"x" : 1146.3,
					"y" : 1393.1
				},
				"pupilRight" : {
					"x" : 1167.9,
					"y" : 1239.2
				},
				"eyeRightInner" : {
					"x" : 1143.8,
					"y" : 1236.9
				},
				"noseRightAlarTop" : {
					"x" : 1120.0,
					"y" : 1287.0
				},
				"eyeRightBottom" : {
					"x" : 1166.4,
					"y" : 1246.9
				},
				"eyeLeftOuter" : {
					"x" : 997.2,
					"y" : 1219.6
				},
				"eyebrowRightOuter" : {
					"x" : 1232.6,
					"y" : 1228.5
				},
				"eyeLeftInner" : {
					"x" : 1048.3,
					"y" : 1224.8
				},
				"underLipBottom" : {
					"x" : 1071.7,
					"y" : 1423.0
				},
				"eyebrowRightInner" : {
					"x" : 1132.1,
					"y" : 1205.0
				},
				"eyeLeftBottom" : {
					"x" : 1021.3,
					"y" : 1228.2
				},
				"eyeRightTop" : {
					"x" : 1166.3,
					"y" : 1230.4
				},
				"noseLeftAlarOutTip" : {
					"x" : 1032.4,
					"y" : 1304.0
				},
				"upperLipBottom" : {
					"x" : 1076.7,
					"y" : 1374.7
				},
				"mouthLeft" : {
					"x" : 1004.9,
					"y" : 1372.2
				},
				"eyeRightOuter" : {
					"x" : 1189.1,
					"y" : 1247.1
				},
				"underLipTop" : {
					"x" : 1072.7,
					"y" : 1402.8
				},
				"eyebrowLeftOuter" : {
					"x" : 970.7,
					"y" : 1185.5
				},
				"noseLeftAlarTop" : {
					"x" : 1055.0,
					"y" : 1279.0
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 56.0,
				"smile" : 0.999,
				"gender" : "female",
				"accessories" : [
					{
						"confidence" : 0.98,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : 2.6,
					"pitch" : 0.0,
					"roll" : 8.1
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.45
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.999,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.1
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.61,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.97,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 273,
				"height" : 273,
				"top" : 771,
				"left" : 1368
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1534.8,
					"y" : 850.8
				},
				"eyeLeftTop" : {
					"x" : 1470.4,
					"y" : 820.8
				},
				"eyebrowLeftInner" : {
					"x" : 1506.0,
					"y" : 809.3
				},
				"upperLipTop" : {
					"x" : 1488.6,
					"y" : 958.6
				},
				"noseRightAlarOutTip" : {
					"x" : 1541.8,
					"y" : 924.8
				},
				"noseRootLeft" : {
					"x" : 1497.2,
					"y" : 837.4
				},
				"noseTip" : {
					"x" : 1486.8,
					"y" : 909.5
				},
				"pupilLeft" : {
					"x" : 1466.3,
					"y" : 827.8
				},
				"mouthRight" : {
					"x" : 1544.1,
					"y" : 993.4
				},
				"pupilRight" : {
					"x" : 1574.5,
					"y" : 863.3
				},
				"eyeRightInner" : {
					"x" : 1558.3,
					"y" : 856.6
				},
				"noseRightAlarTop" : {
					"x" : 1529.8,
					"y" : 897.3
				},
				"eyeRightBottom" : {
					"x" : 1577.4,
					"y" : 867.5
				},
				"eyeLeftOuter" : {
					"x" : 1453.3,
					"y" : 818.2
				},
				"eyebrowRightOuter" : {
					"x" : 1640.4,
					"y" : 848.0
				},
				"eyeLeftInner" : {
					"x" : 1485.6,
					"y" : 830.5
				},
				"underLipBottom" : {
					"x" : 1476.7,
					"y" : 1009.4
				},
				"eyebrowRightInner" : {
					"x" : 1541.5,
					"y" : 815.6
				},
				"eyeLeftBottom" : {
					"x" : 1467.9,
					"y" : 829.6
				},
				"eyeRightTop" : {
					"x" : 1579.6,
					"y" : 857.7
				},
				"noseLeftAlarOutTip" : {
					"x" : 1455.6,
					"y" : 897.9
				},
				"upperLipBottom" : {
					"x" : 1485.2,
					"y" : 972.4
				},
				"mouthLeft" : {
					"x" : 1446.5,
					"y" : 959.1
				},
				"eyeRightOuter" : {
					"x" : 1594.2,
					"y" : 868.0
				},
				"underLipTop" : {
					"x" : 1481.8,
					"y" : 987.9
				},
				"eyebrowLeftOuter" : {
					"x" : 1441.9,
					"y" : 777.0
				},
				"noseLeftAlarTop" : {
					"x" : 1475.3,
					"y" : 877.4
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.4,
					"moustache" : 0.6,
					"sideburns" : 0.3
				},
				"age" : 52.9,
				"smile" : 0.105,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : -25.2,
					"pitch" : 0.0,
					"roll" : 17.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.65
				},
				"emotion" : {
					"neutral" : 0.868,
					"surprise" : 0.003,
					"contempt" : 0.003,
					"happiness" : 0.105,
					"anger" : 0.002,
					"sadness" : 0.014,
					"disgust" : 0.004,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "ReadingGlasses",
				"exposure" : {
					"value" : 0.53,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.67,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 614,
				"height" : 614,
				"top" : 979,
				"left" : 1900
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2264.3,
					"y" : 1162.5
				},
				"eyeLeftTop" : {
					"x" : 2085.7,
					"y" : 1123.8
				},
				"eyebrowLeftInner" : {
					"x" : 2163.6,
					"y" : 1086.2
				},
				"upperLipTop" : {
					"x" : 2205.9,
					"y" : 1418.6
				},
				"noseRightAlarOutTip" : {
					"x" : 2300.6,
					"y" : 1315.5
				},
				"noseRootLeft" : {
					"x" : 2177.7,
					"y" : 1158.6
				},
				"noseTip" : {
					"x" : 2222.4,
					"y" : 1306.4
				},
				"pupilLeft" : {
					"x" : 2087.7,
					"y" : 1134.8
				},
				"mouthRight" : {
					"x" : 2302.3,
					"y" : 1443.7
				},
				"pupilRight" : {
					"x" : 2351.3,
					"y" : 1152.5
				},
				"eyeRightInner" : {
					"x" : 2304.8,
					"y" : 1160.6
				},
				"noseRightAlarTop" : {
					"x" : 2276.4,
					"y" : 1264.6
				},
				"eyeRightBottom" : {
					"x" : 2350.3,
					"y" : 1173.1
				},
				"eyeLeftOuter" : {
					"x" : 2045.5,
					"y" : 1140.5
				},
				"eyebrowRightOuter" : {
					"x" : 2453.7,
					"y" : 1103.4
				},
				"eyeLeftInner" : {
					"x" : 2124.0,
					"y" : 1145.0
				},
				"underLipBottom" : {
					"x" : 2199.1,
					"y" : 1493.9
				},
				"eyebrowRightInner" : {
					"x" : 2287.4,
					"y" : 1085.8
				},
				"eyeLeftBottom" : {
					"x" : 2084.0,
					"y" : 1154.1
				},
				"eyeRightTop" : {
					"x" : 2348.7,
					"y" : 1140.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 2119.0,
					"y" : 1306.7
				},
				"upperLipBottom" : {
					"x" : 2203.5,
					"y" : 1449.3
				},
				"mouthLeft" : {
					"x" : 2067.8,
					"y" : 1425.9
				},
				"eyeRightOuter" : {
					"x" : 2391.7,
					"y" : 1162.3
				},
				"underLipTop" : {
					"x" : 2202.5,
					"y" : 1452.4
				},
				"eyebrowLeftOuter" : {
					"x" : 1963.3,
					"y" : 1080.3
				},
				"noseLeftAlarTop" : {
					"x" : 2155.3,
					"y" : 1253.6
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 16.6,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 7.9,
					"pitch" : 0.0,
					"roll" : 3.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 1.0
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.71,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.94
						},
						{
							"color" : "other",
							"confidence" : 0.84
						},
						{
							"color" : "red",
							"confidence" : 0.06
						},
						{
							"color" : "blond",
							"confidence" : 0.03
						},
						{
							"color" : "gray",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 526,
				"height" : 526,
				"top" : 1004,
				"left" : 2291
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2577.7,
					"y" : 1151.1
				},
				"eyeLeftTop" : {
					"x" : 2449.7,
					"y" : 1133.0
				},
				"eyebrowLeftInner" : {
					"x" : 2490.3,
					"y" : 1097.2
				},
				"upperLipTop" : {
					"x" : 2556.3,
					"y" : 1358.1
				},
				"noseRightAlarOutTip" : {
					"x" : 2619.8,
					"y" : 1285.2
				},
				"noseRootLeft" : {
					"x" : 2512.6,
					"y" : 1154.3
				},
				"noseTip" : {
					"x" : 2529.0,
					"y" : 1285.7
				},
				"pupilLeft" : {
					"x" : 2441.0,
					"y" : 1145.3
				},
				"mouthRight" : {
					"x" : 2676.6,
					"y" : 1396.5
				},
				"pupilRight" : {
					"x" : 2659.0,
					"y" : 1142.4
				},
				"eyeRightInner" : {
					"x" : 2631.5,
					"y" : 1144.6
				},
				"noseRightAlarTop" : {
					"x" : 2587.5,
					"y" : 1248.3
				},
				"eyeRightBottom" : {
					"x" : 2669.3,
					"y" : 1152.9
				},
				"eyeLeftOuter" : {
					"x" : 2418.5,
					"y" : 1148.3
				},
				"eyebrowRightOuter" : {
					"x" : 2753.7,
					"y" : 1090.2
				},
				"eyeLeftInner" : {
					"x" : 2481.3,
					"y" : 1148.4
				},
				"underLipBottom" : {
					"x" : 2560.1,
					"y" : 1468.0
				},
				"eyebrowRightInner" : {
					"x" : 2586.7,
					"y" : 1088.7
				},
				"eyeLeftBottom" : {
					"x" : 2449.6,
					"y" : 1158.2
				},
				"eyeRightTop" : {
					"x" : 2667.3,
					"y" : 1127.2
				},
				"noseLeftAlarOutTip" : {
					"x" : 2468.2,
					"y" : 1291.6
				},
				"upperLipBottom" : {
					"x" : 2557.2,
					"y" : 1378.5
				},
				"mouthLeft" : {
					"x" : 2466.0,
					"y" : 1393.0
				},
				"eyeRightOuter" : {
					"x" : 2699.7,
					"y" : 1141.9
				},
				"underLipTop" : {
					"x" : 2557.9,
					"y" : 1429.5
				},
				"eyebrowLeftOuter" : {
					"x" : 2367.4,
					"y" : 1088.9
				},
				"noseLeftAlarTop" : {
					"x" : 2489.4,
					"y" : 1249.7
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 44.6,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -17.4,
					"pitch" : 0.0,
					"roll" : -1.0
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 1.0
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.05
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.72,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 0.99
						},
						{
							"color" : "other",
							"confidence" : 0.93
						},
						{
							"color" : "brown",
							"confidence" : 0.75
						},
						{
							"color" : "red",
							"confidence" : 0.13
						},
						{
							"color" : "blond",
							"confidence" : 0.04
						},
						{
							"color" : "gray",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 85,
				"height" : 85,
				"top" : 1073,
				"left" : 1580
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1630.9,
					"y" : 1099.5
				},
				"eyeLeftTop" : {
					"x" : 1605.8,
					"y" : 1093.5
				},
				"eyebrowLeftInner" : {
					"x" : 1616.4,
					"y" : 1088.7
				},
				"upperLipTop" : {
					"x" : 1621.0,
					"y" : 1133.1
				},
				"noseRightAlarOutTip" : {
					"x" : 1636.7,
					"y" : 1119.7
				},
				"noseRootLeft" : {
					"x" : 1619.3,
					"y" : 1098.6
				},
				"noseTip" : {
					"x" : 1624.7,
					"y" : 1120.9
				},
				"pupilLeft" : {
					"x" : 1605.0,
					"y" : 1095.0
				},
				"mouthRight" : {
					"x" : 1636.7,
					"y" : 1136.0
				},
				"pupilRight" : {
					"x" : 1643.1,
					"y" : 1096.8
				},
				"eyeRightInner" : {
					"x" : 1636.3,
					"y" : 1098.4
				},
				"noseRightAlarTop" : {
					"x" : 1632.6,
					"y" : 1111.9
				},
				"eyeRightBottom" : {
					"x" : 1643.2,
					"y" : 1100.3
				},
				"eyeLeftOuter" : {
					"x" : 1599.9,
					"y" : 1095.5
				},
				"eyebrowRightOuter" : {
					"x" : 1660.2,
					"y" : 1089.3
				},
				"eyeLeftInner" : {
					"x" : 1611.3,
					"y" : 1097.1
				},
				"underLipBottom" : {
					"x" : 1619.6,
					"y" : 1144.9
				},
				"eyebrowRightInner" : {
					"x" : 1635.2,
					"y" : 1090.2
				},
				"eyeLeftBottom" : {
					"x" : 1605.2,
					"y" : 1098.2
				},
				"eyeRightTop" : {
					"x" : 1642.7,
					"y" : 1095.4
				},
				"noseLeftAlarOutTip" : {
					"x" : 1610.4,
					"y" : 1117.9
				},
				"upperLipBottom" : {
					"x" : 1621.3,
					"y" : 1135.7
				},
				"mouthLeft" : {
					"x" : 1601.6,
					"y" : 1133.2
				},
				"eyeRightOuter" : {
					"x" : 1649.6,
					"y" : 1098.3
				},
				"underLipTop" : {
					"x" : 1620.4,
					"y" : 1140.0
				},
				"eyebrowLeftOuter" : {
					"x" : 1591.5,
					"y" : 1086.1
				},
				"noseLeftAlarTop" : {
					"x" : 1615.2,
					"y" : 1111.5
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 23.6,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 6.2,
					"pitch" : 0.0,
					"roll" : 4.7
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.73
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.11
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.66,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.73
						},
						{
							"color" : "other",
							"confidence" : 0.69
						},
						{
							"color" : "red",
							"confidence" : 0.38
						},
						{
							"color" : "blond",
							"confidence" : 0.04
						},
						{
							"color" : "gray",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 80,
				"height" : 80,
				"top" : 1074,
				"left" : 1642
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1685.6,
					"y" : 1098.6
				},
				"eyeLeftTop" : {
					"x" : 1663.5,
					"y" : 1095.1
				},
				"eyebrowLeftInner" : {
					"x" : 1670.7,
					"y" : 1091.3
				},
				"upperLipTop" : {
					"x" : 1679.2,
					"y" : 1129.0
				},
				"noseRightAlarOutTip" : {
					"x" : 1691.3,
					"y" : 1117.3
				},
				"noseRootLeft" : {
					"x" : 1674.6,
					"y" : 1098.7
				},
				"noseTip" : {
					"x" : 1676.3,
					"y" : 1117.8
				},
				"pupilLeft" : {
					"x" : 1664.5,
					"y" : 1097.1
				},
				"mouthRight" : {
					"x" : 1700.9,
					"y" : 1131.6
				},
				"pupilRight" : {
					"x" : 1701.2,
					"y" : 1095.9
				},
				"eyeRightInner" : {
					"x" : 1694.3,
					"y" : 1097.4
				},
				"noseRightAlarTop" : {
					"x" : 1686.7,
					"y" : 1113.1
				},
				"eyeRightBottom" : {
					"x" : 1701.2,
					"y" : 1098.4
				},
				"eyeLeftOuter" : {
					"x" : 1658.4,
					"y" : 1097.9
				},
				"eyebrowRightOuter" : {
					"x" : 1716.3,
					"y" : 1088.8
				},
				"eyeLeftInner" : {
					"x" : 1669.3,
					"y" : 1098.2
				},
				"underLipBottom" : {
					"x" : 1681.4,
					"y" : 1143.0
				},
				"eyebrowRightInner" : {
					"x" : 1689.7,
					"y" : 1090.1
				},
				"eyeLeftBottom" : {
					"x" : 1663.7,
					"y" : 1099.7
				},
				"eyeRightTop" : {
					"x" : 1700.3,
					"y" : 1094.3
				},
				"noseLeftAlarOutTip" : {
					"x" : 1667.2,
					"y" : 1117.7
				},
				"upperLipBottom" : {
					"x" : 1679.6,
					"y" : 1131.7
				},
				"mouthLeft" : {
					"x" : 1666.3,
					"y" : 1132.5
				},
				"eyeRightOuter" : {
					"x" : 1707.2,
					"y" : 1096.3
				},
				"underLipTop" : {
					"x" : 1680.8,
					"y" : 1137.8
				},
				"eyebrowLeftOuter" : {
					"x" : 1651.0,
					"y" : 1090.3
				},
				"noseLeftAlarTop" : {
					"x" : 1670.5,
					"y" : 1113.2
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 34.0,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -20.0,
					"pitch" : 0.0,
					"roll" : 0.3
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.78
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.1
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.66,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.0,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 0.99
						},
						{
							"color" : "brown",
							"confidence" : 0.97
						},
						{
							"color" : "other",
							"confidence" : 0.85
						},
						{
							"color" : "red",
							"confidence" : 0.19
						},
						{
							"color" : "gray",
							"confidence" : 0.02
						},
						{
							"color" : "blond",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 236,
				"height" : 236,
				"top" : 565,
				"left" : 1884
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2009.5,
					"y" : 640.0
				},
				"eyeLeftTop" : {
					"x" : 1935.7,
					"y" : 636.7
				},
				"eyebrowLeftInner" : {
					"x" : 1961.1,
					"y" : 620.8
				},
				"upperLipTop" : {
					"x" : 1999.1,
					"y" : 729.4
				},
				"noseRightAlarOutTip" : {
					"x" : 2029.9,
					"y" : 691.7
				},
				"noseRootLeft" : {
					"x" : 1970.5,
					"y" : 641.5
				},
				"noseTip" : {
					"x" : 1984.2,
					"y" : 692.3
				},
				"pupilLeft" : {
					"x" : 1937.0,
					"y" : 639.1
				},
				"mouthRight" : {
					"x" : 2070.0,
					"y" : 731.4
				},
				"pupilRight" : {
					"x" : 2059.9,
					"y" : 634.6
				},
				"eyeRightInner" : {
					"x" : 2038.4,
					"y" : 637.5
				},
				"noseRightAlarTop" : {
					"x" : 2015.4,
					"y" : 674.3
				},
				"eyeRightBottom" : {
					"x" : 2060.8,
					"y" : 641.2
				},
				"eyeLeftOuter" : {
					"x" : 1919.0,
					"y" : 642.3
				},
				"eyebrowRightOuter" : {
					"x" : 2103.6,
					"y" : 614.8
				},
				"eyeLeftInner" : {
					"x" : 1956.6,
					"y" : 639.4
				},
				"underLipBottom" : {
					"x" : 2005.0,
					"y" : 750.0
				},
				"eyebrowRightInner" : {
					"x" : 2020.7,
					"y" : 614.1
				},
				"eyeLeftBottom" : {
					"x" : 1937.8,
					"y" : 644.8
				},
				"eyeRightTop" : {
					"x" : 2060.0,
					"y" : 631.2
				},
				"noseLeftAlarOutTip" : {
					"x" : 1960.7,
					"y" : 693.3
				},
				"upperLipBottom" : {
					"x" : 2000.7,
					"y" : 737.8
				},
				"mouthLeft" : {
					"x" : 1958.4,
					"y" : 731.0
				},
				"eyeRightOuter" : {
					"x" : 2077.7,
					"y" : 634.9
				},
				"underLipTop" : {
					"x" : 2003.8,
					"y" : 735.9
				},
				"eyebrowLeftOuter" : {
					"x" : 1891.6,
					"y" : 619.4
				},
				"noseLeftAlarTop" : {
					"x" : 1968.5,
					"y" : 675.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 34.2,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [
					{
						"confidence" : 0.99,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : -16.5,
					"pitch" : 0.0,
					"roll" : -3.1
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.45
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.26
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.53,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 788,
				"height" : 788,
				"top" : 708,
				"left" : 1331
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1794.9,
					"y" : 936.5
				},
				"eyeLeftTop" : {
					"x" : 1568.9,
					"y" : 895.0
				},
				"eyebrowLeftInner" : {
					"x" : 1675.4,
					"y" : 833.4
				},
				"upperLipTop" : {
					"x" : 1735.7,
					"y" : 1259.3
				},
				"noseRightAlarOutTip" : {
					"x" : 1856.7,
					"y" : 1126.6
				},
				"noseRootLeft" : {
					"x" : 1680.8,
					"y" : 927.9
				},
				"noseTip" : {
					"x" : 1740.1,
					"y" : 1111.9
				},
				"pupilLeft" : {
					"x" : 1562.0,
					"y" : 916.5
				},
				"mouthRight" : {
					"x" : 1847.4,
					"y" : 1310.0
				},
				"pupilRight" : {
					"x" : 1910.4,
					"y" : 924.1
				},
				"eyeRightInner" : {
					"x" : 1843.4,
					"y" : 935.5
				},
				"noseRightAlarTop" : {
					"x" : 1818.0,
					"y" : 1059.3
				},
				"eyeRightBottom" : {
					"x" : 1908.3,
					"y" : 956.2
				},
				"eyeLeftOuter" : {
					"x" : 1504.5,
					"y" : 922.2
				},
				"eyebrowRightOuter" : {
					"x" : 2072.1,
					"y" : 874.5
				},
				"eyeLeftInner" : {
					"x" : 1624.3,
					"y" : 928.1
				},
				"underLipBottom" : {
					"x" : 1714.5,
					"y" : 1371.7
				},
				"eyebrowRightInner" : {
					"x" : 1809.3,
					"y" : 841.4
				},
				"eyeLeftBottom" : {
					"x" : 1560.5,
					"y" : 950.3
				},
				"eyeRightTop" : {
					"x" : 1908.1,
					"y" : 903.9
				},
				"noseLeftAlarOutTip" : {
					"x" : 1610.4,
					"y" : 1121.8
				},
				"upperLipBottom" : {
					"x" : 1732.9,
					"y" : 1296.9
				},
				"mouthLeft" : {
					"x" : 1566.0,
					"y" : 1289.4
				},
				"eyeRightOuter" : {
					"x" : 1969.3,
					"y" : 935.8
				},
				"underLipTop" : {
					"x" : 1720.2,
					"y" : 1314.1
				},
				"eyebrowLeftOuter" : {
					"x" : 1409.8,
					"y" : 852.5
				},
				"noseLeftAlarTop" : {
					"x" : 1655.6,
					"y" : 1058.2
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 21.5,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 4.7,
					"pitch" : 0.0,
					"roll" : 2.2
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.19
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.18
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.64,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.63,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 195,
				"height" : 195,
				"top" : 1110,
				"left" : 687
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 794.4,
					"y" : 1160.6
				},
				"eyeLeftTop" : {
					"x" : 737.5,
					"y" : 1159.1
				},
				"eyebrowLeftInner" : {
					"x" : 760.8,
					"y" : 1135.9
				},
				"upperLipTop" : {
					"x" : 797.6,
					"y" : 1245.6
				},
				"noseRightAlarOutTip" : {
					"x" : 819.8,
					"y" : 1209.2
				},
				"noseRootLeft" : {
					"x" : 770.7,
					"y" : 1163.9
				},
				"noseTip" : {
					"x" : 800.3,
					"y" : 1208.8
				},
				"pupilLeft" : {
					"x" : 737.4,
					"y" : 1165.7
				},
				"mouthRight" : {
					"x" : 819.4,
					"y" : 1252.5
				},
				"pupilRight" : {
					"x" : 816.8,
					"y" : 1156.2
				},
				"eyeRightInner" : {
					"x" : 806.9,
					"y" : 1159.2
				},
				"noseRightAlarTop" : {
					"x" : 807.0,
					"y" : 1192.5
				},
				"eyeRightBottom" : {
					"x" : 820.5,
					"y" : 1162.9
				},
				"eyeLeftOuter" : {
					"x" : 724.8,
					"y" : 1165.9
				},
				"eyebrowRightOuter" : {
					"x" : 843.6,
					"y" : 1127.5
				},
				"eyeLeftInner" : {
					"x" : 754.1,
					"y" : 1163.9
				},
				"underLipBottom" : {
					"x" : 799.2,
					"y" : 1283.1
				},
				"eyebrowRightInner" : {
					"x" : 801.0,
					"y" : 1135.4
				},
				"eyeLeftBottom" : {
					"x" : 738.8,
					"y" : 1171.8
				},
				"eyeRightTop" : {
					"x" : 818.7,
					"y" : 1150.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 763.6,
					"y" : 1217.2
				},
				"upperLipBottom" : {
					"x" : 798.2,
					"y" : 1254.4
				},
				"mouthLeft" : {
					"x" : 751.4,
					"y" : 1262.9
				},
				"eyeRightOuter" : {
					"x" : 832.1,
					"y" : 1155.3
				},
				"underLipTop" : {
					"x" : 798.3,
					"y" : 1268.6
				},
				"eyebrowLeftOuter" : {
					"x" : 698.8,
					"y" : 1148.0
				},
				"noseLeftAlarTop" : {
					"x" : 770.2,
					"y" : 1200.6
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 38.1,
				"smile" : 0.001,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 18.8,
					"pitch" : 0.0,
					"roll" : -8.3
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.985,
					"surprise" : 0.008,
					"contempt" : 0.001,
					"happiness" : 0.001,
					"anger" : 0.0,
					"sadness" : 0.005,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.57
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.53,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.98
						},
						{
							"color" : "other",
							"confidence" : 0.54
						},
						{
							"color" : "red",
							"confidence" : 0.05
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						},
						{
							"color" : "blond",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 170,
				"height" : 170,
				"top" : 1176,
				"left" : 514
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 608.1,
					"y" : 1217.0
				},
				"eyeLeftTop" : {
					"x" : 572.9,
					"y" : 1203.7
				},
				"eyebrowLeftInner" : {
					"x" : 592.7,
					"y" : 1189.3
				},
				"upperLipTop" : {
					"x" : 598.0,
					"y" : 1298.1
				},
				"noseRightAlarOutTip" : {
					"x" : 616.3,
					"y" : 1266.0
				},
				"noseRootLeft" : {
					"x" : 593.8,
					"y" : 1215.8
				},
				"noseTip" : {
					"x" : 602.1,
					"y" : 1261.4
				},
				"pupilLeft" : {
					"x" : 573.1,
					"y" : 1210.0
				},
				"mouthRight" : {
					"x" : 617.4,
					"y" : 1313.3
				},
				"pupilRight" : {
					"x" : 624.3,
					"y" : 1217.4
				},
				"eyeRightInner" : {
					"x" : 617.4,
					"y" : 1218.9
				},
				"noseRightAlarTop" : {
					"x" : 613.0,
					"y" : 1252.4
				},
				"eyeRightBottom" : {
					"x" : 625.0,
					"y" : 1222.8
				},
				"eyeLeftOuter" : {
					"x" : 564.8,
					"y" : 1209.3
				},
				"eyebrowRightOuter" : {
					"x" : 646.5,
					"y" : 1197.1
				},
				"eyeLeftInner" : {
					"x" : 581.8,
					"y" : 1213.5
				},
				"underLipBottom" : {
					"x" : 599.0,
					"y" : 1328.8
				},
				"eyebrowRightInner" : {
					"x" : 614.8,
					"y" : 1198.2
				},
				"eyeLeftBottom" : {
					"x" : 572.4,
					"y" : 1216.3
				},
				"eyeRightTop" : {
					"x" : 624.6,
					"y" : 1212.3
				},
				"noseLeftAlarOutTip" : {
					"x" : 584.0,
					"y" : 1265.3
				},
				"upperLipBottom" : {
					"x" : 598.0,
					"y" : 1306.1
				},
				"mouthLeft" : {
					"x" : 575.9,
					"y" : 1312.5
				},
				"eyeRightOuter" : {
					"x" : 634.0,
					"y" : 1217.7
				},
				"underLipTop" : {
					"x" : 598.6,
					"y" : 1312.6
				},
				"eyebrowLeftOuter" : {
					"x" : 551.7,
					"y" : 1184.8
				},
				"noseLeftAlarTop" : {
					"x" : 588.6,
					"y" : 1247.9
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 23.5,
				"smile" : 0.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 11.1,
					"pitch" : 0.0,
					"roll" : 2.9
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.26
				},
				"emotion" : {
					"neutral" : 0.977,
					"surprise" : 0.014,
					"contempt" : 0.001,
					"happiness" : 0.0,
					"anger" : 0.0,
					"sadness" : 0.007,
					"disgust" : 0.0,
					"fear" : 0.001
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 0.73
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.33,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.74
						},
						{
							"color" : "brown",
							"confidence" : 0.59
						},
						{
							"color" : "red",
							"confidence" : 0.08
						},
						{
							"color" : "gray",
							"confidence" : 0.05
						},
						{
							"color" : "blond",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 123,
				"height" : 123,
				"top" : 1061,
				"left" : 2070
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2144.5,
					"y" : 1100.9
				},
				"eyeLeftTop" : {
					"x" : 2110.5,
					"y" : 1083.7
				},
				"eyebrowLeftInner" : {
					"x" : 2127.4,
					"y" : 1077.7
				},
				"upperLipTop" : {
					"x" : 2133.6,
					"y" : 1143.9
				},
				"noseRightAlarOutTip" : {
					"x" : 2150.6,
					"y" : 1129.9
				},
				"noseRootLeft" : {
					"x" : 2129.9,
					"y" : 1097.5
				},
				"noseTip" : {
					"x" : 2140.8,
					"y" : 1123.1
				},
				"pupilLeft" : {
					"x" : 2110.7,
					"y" : 1087.3
				},
				"mouthRight" : {
					"x" : 2147.6,
					"y" : 1159.7
				},
				"pupilRight" : {
					"x" : 2157.3,
					"y" : 1102.3
				},
				"eyeRightInner" : {
					"x" : 2150.4,
					"y" : 1103.7
				},
				"noseRightAlarTop" : {
					"x" : 2145.4,
					"y" : 1119.6
				},
				"eyeRightBottom" : {
					"x" : 2157.3,
					"y" : 1108.6
				},
				"eyeLeftOuter" : {
					"x" : 2100.5,
					"y" : 1086.4
				},
				"eyebrowRightOuter" : {
					"x" : 2176.8,
					"y" : 1093.0
				},
				"eyeLeftInner" : {
					"x" : 2119.1,
					"y" : 1093.1
				},
				"underLipBottom" : {
					"x" : 2130.7,
					"y" : 1159.6
				},
				"eyebrowRightInner" : {
					"x" : 2151.7,
					"y" : 1086.9
				},
				"eyeLeftBottom" : {
					"x" : 2108.1,
					"y" : 1093.0
				},
				"eyeRightTop" : {
					"x" : 2158.7,
					"y" : 1100.0
				},
				"noseLeftAlarOutTip" : {
					"x" : 2118.0,
					"y" : 1124.6
				},
				"upperLipBottom" : {
					"x" : 2132.5,
					"y" : 1150.4
				},
				"mouthLeft" : {
					"x" : 2099.6,
					"y" : 1146.8
				},
				"eyeRightOuter" : {
					"x" : 2164.5,
					"y" : 1107.4
				},
				"underLipTop" : {
					"x" : 2132.0,
					"y" : 1152.0
				},
				"eyebrowLeftOuter" : {
					"x" : 2090.6,
					"y" : 1072.9
				},
				"noseLeftAlarTop" : {
					"x" : 2125.0,
					"y" : 1116.6
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 35.3,
				"smile" : 0.909,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 19.7,
					"pitch" : 0.0,
					"roll" : 9.3
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.18
				},
				"emotion" : {
					"neutral" : 0.09,
					"surprise" : 0.0,
					"contempt" : 0.001,
					"happiness" : 0.909,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.24
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.68,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.08,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.96
						},
						{
							"color" : "other",
							"confidence" : 0.21
						},
						{
							"color" : "blond",
							"confidence" : 0.1
						},
						{
							"color" : "gray",
							"confidence" : 0.05
						},
						{
							"color" : "red",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 115,
				"height" : 115,
				"top" : 977,
				"left" : 2674
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2742.0,
					"y" : 1007.7
				},
				"eyeLeftTop" : {
					"x" : 2707.8,
					"y" : 1003.4
				},
				"eyebrowLeftInner" : {
					"x" : 2724.4,
					"y" : 992.6
				},
				"upperLipTop" : {
					"x" : 2736.0,
					"y" : 1056.0
				},
				"noseRightAlarOutTip" : {
					"x" : 2751.3,
					"y" : 1033.7
				},
				"noseRootLeft" : {
					"x" : 2726.3,
					"y" : 1007.2
				},
				"noseTip" : {
					"x" : 2739.7,
					"y" : 1034.3
				},
				"pupilLeft" : {
					"x" : 2707.2,
					"y" : 1006.8
				},
				"mouthRight" : {
					"x" : 2749.5,
					"y" : 1065.2
				},
				"pupilRight" : {
					"x" : 2750.4,
					"y" : 1006.3
				},
				"eyeRightInner" : {
					"x" : 2745.9,
					"y" : 1007.8
				},
				"noseRightAlarTop" : {
					"x" : 2747.2,
					"y" : 1025.5
				},
				"eyeRightBottom" : {
					"x" : 2753.1,
					"y" : 1009.9
				},
				"eyeLeftOuter" : {
					"x" : 2701.5,
					"y" : 1006.5
				},
				"eyebrowRightOuter" : {
					"x" : 2770.0,
					"y" : 991.9
				},
				"eyeLeftInner" : {
					"x" : 2715.2,
					"y" : 1007.8
				},
				"underLipBottom" : {
					"x" : 2735.0,
					"y" : 1076.9
				},
				"eyebrowRightInner" : {
					"x" : 2743.5,
					"y" : 995.4
				},
				"eyeLeftBottom" : {
					"x" : 2707.3,
					"y" : 1010.8
				},
				"eyeRightTop" : {
					"x" : 2752.5,
					"y" : 1003.5
				},
				"noseLeftAlarOutTip" : {
					"x" : 2719.4,
					"y" : 1038.0
				},
				"upperLipBottom" : {
					"x" : 2736.4,
					"y" : 1061.4
				},
				"mouthLeft" : {
					"x" : 2709.6,
					"y" : 1066.2
				},
				"eyeRightOuter" : {
					"x" : 2759.6,
					"y" : 1006.5
				},
				"underLipTop" : {
					"x" : 2735.9,
					"y" : 1069.8
				},
				"eyebrowLeftOuter" : {
					"x" : 2685.9,
					"y" : 993.2
				},
				"noseLeftAlarTop" : {
					"x" : 2724.4,
					"y" : 1026.9
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.1,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 45.9,
				"smile" : 0.012,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 21.5,
					"pitch" : 0.0,
					"roll" : -2.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.34
				},
				"emotion" : {
					"neutral" : 0.97,
					"surprise" : 0.001,
					"contempt" : 0.001,
					"happiness" : 0.012,
					"anger" : 0.003,
					"sadness" : 0.012,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 1.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.44,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.0,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.92
						},
						{
							"color" : "other",
							"confidence" : 0.39
						},
						{
							"color" : "red",
							"confidence" : 0.12
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						},
						{
							"color" : "blond",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 114,
				"height" : 114,
				"top" : 1099,
				"left" : 3023
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 3083.8,
					"y" : 1129.6
				},
				"eyeLeftTop" : {
					"x" : 3053.8,
					"y" : 1127.1
				},
				"eyebrowLeftInner" : {
					"x" : 3066.7,
					"y" : 1112.9
				},
				"upperLipTop" : {
					"x" : 3084.7,
					"y" : 1177.5
				},
				"noseRightAlarOutTip" : {
					"x" : 3096.0,
					"y" : 1156.4
				},
				"noseRootLeft" : {
					"x" : 3070.5,
					"y" : 1130.8
				},
				"noseTip" : {
					"x" : 3083.1,
					"y" : 1154.0
				},
				"pupilLeft" : {
					"x" : 3056.8,
					"y" : 1129.9
				},
				"mouthRight" : {
					"x" : 3098.5,
					"y" : 1186.2
				},
				"pupilRight" : {
					"x" : 3099.3,
					"y" : 1126.6
				},
				"eyeRightInner" : {
					"x" : 3091.4,
					"y" : 1128.2
				},
				"noseRightAlarTop" : {
					"x" : 3090.0,
					"y" : 1145.3
				},
				"eyeRightBottom" : {
					"x" : 3100.0,
					"y" : 1129.8
				},
				"eyeLeftOuter" : {
					"x" : 3047.1,
					"y" : 1131.8
				},
				"eyebrowRightOuter" : {
					"x" : 3115.3,
					"y" : 1109.3
				},
				"eyeLeftInner" : {
					"x" : 3062.0,
					"y" : 1130.4
				},
				"underLipBottom" : {
					"x" : 3084.7,
					"y" : 1197.8
				},
				"eyebrowRightInner" : {
					"x" : 3087.2,
					"y" : 1112.2
				},
				"eyeLeftBottom" : {
					"x" : 3054.5,
					"y" : 1133.6
				},
				"eyeRightTop" : {
					"x" : 3099.4,
					"y" : 1123.4
				},
				"noseLeftAlarOutTip" : {
					"x" : 3067.5,
					"y" : 1161.9
				},
				"upperLipBottom" : {
					"x" : 3085.0,
					"y" : 1185.3
				},
				"mouthLeft" : {
					"x" : 3062.8,
					"y" : 1190.2
				},
				"eyeRightOuter" : {
					"x" : 3107.0,
					"y" : 1125.9
				},
				"underLipTop" : {
					"x" : 3084.1,
					"y" : 1188.9
				},
				"eyebrowLeftOuter" : {
					"x" : 3033.6,
					"y" : 1118.4
				},
				"noseLeftAlarTop" : {
					"x" : 3070.4,
					"y" : 1150.7
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 28.6,
				"smile" : 0.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 7.5,
					"pitch" : 0.0,
					"roll" : -6.1
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.32
				},
				"emotion" : {
					"neutral" : 0.986,
					"surprise" : 0.001,
					"contempt" : 0.001,
					"happiness" : 0.0,
					"anger" : 0.0,
					"sadness" : 0.012,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 1.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.48,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.74
						},
						{
							"color" : "brown",
							"confidence" : 0.41
						},
						{
							"color" : "red",
							"confidence" : 0.1
						},
						{
							"color" : "blond",
							"confidence" : 0.04
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 108,
				"height" : 108,
				"top" : 1419,
				"left" : 3039
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 3094.9,
					"y" : 1447.9
				},
				"eyeLeftTop" : {
					"x" : 3065.5,
					"y" : 1447.1
				},
				"eyebrowLeftInner" : {
					"x" : 3076.8,
					"y" : 1436.1
				},
				"upperLipTop" : {
					"x" : 3098.3,
					"y" : 1495.2
				},
				"noseRightAlarOutTip" : {
					"x" : 3108.0,
					"y" : 1475.9
				},
				"noseRootLeft" : {
					"x" : 3082.1,
					"y" : 1451.0
				},
				"noseTip" : {
					"x" : 3097.1,
					"y" : 1476.1
				},
				"pupilLeft" : {
					"x" : 3068.0,
					"y" : 1450.3
				},
				"mouthRight" : {
					"x" : 3117.1,
					"y" : 1497.4
				},
				"pupilRight" : {
					"x" : 3107.1,
					"y" : 1442.3
				},
				"eyeRightInner" : {
					"x" : 3102.0,
					"y" : 1445.1
				},
				"noseRightAlarTop" : {
					"x" : 3103.1,
					"y" : 1465.9
				},
				"eyeRightBottom" : {
					"x" : 3109.1,
					"y" : 1447.9
				},
				"eyeLeftOuter" : {
					"x" : 3060.0,
					"y" : 1452.9
				},
				"eyebrowRightOuter" : {
					"x" : 3122.3,
					"y" : 1427.7
				},
				"eyeLeftInner" : {
					"x" : 3073.2,
					"y" : 1451.0
				},
				"underLipBottom" : {
					"x" : 3098.5,
					"y" : 1510.0
				},
				"eyebrowRightInner" : {
					"x" : 3095.9,
					"y" : 1432.8
				},
				"eyeLeftBottom" : {
					"x" : 3067.1,
					"y" : 1455.2
				},
				"eyeRightTop" : {
					"x" : 3107.7,
					"y" : 1439.3
				},
				"noseLeftAlarOutTip" : {
					"x" : 3080.9,
					"y" : 1481.9
				},
				"upperLipBottom" : {
					"x" : 3098.4,
					"y" : 1499.2
				},
				"mouthLeft" : {
					"x" : 3078.2,
					"y" : 1504.1
				},
				"eyeRightOuter" : {
					"x" : 3114.9,
					"y" : 1442.7
				},
				"underLipTop" : {
					"x" : 3098.5,
					"y" : 1504.2
				},
				"eyebrowLeftOuter" : {
					"x" : 3041.3,
					"y" : 1443.7
				},
				"noseLeftAlarTop" : {
					"x" : 3083.9,
					"y" : 1470.0
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.1,
					"moustache" : 0.0,
					"sideburns" : 0.2
				},
				"age" : 16.7,
				"smile" : 0.0,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 0.98,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : 8.3,
					"pitch" : 0.0,
					"roll" : -11.5
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.25
				},
				"emotion" : {
					"neutral" : 0.985,
					"surprise" : 0.001,
					"contempt" : 0.002,
					"happiness" : 0.0,
					"anger" : 0.004,
					"sadness" : 0.007,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.53
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.44,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 56,
				"height" : 56,
				"top" : 855,
				"left" : 2769
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2798.8,
					"y" : 868.7
				},
				"eyeLeftTop" : {
					"x" : 2788.0,
					"y" : 868.1
				},
				"eyebrowLeftInner" : {
					"x" : 2792.5,
					"y" : 862.3
				},
				"upperLipTop" : {
					"x" : 2795.9,
					"y" : 894.2
				},
				"noseRightAlarOutTip" : {
					"x" : 2802.7,
					"y" : 883.9
				},
				"noseRootLeft" : {
					"x" : 2793.8,
					"y" : 868.5
				},
				"noseTip" : {
					"x" : 2795.1,
					"y" : 883.1
				},
				"pupilLeft" : {
					"x" : 2788.4,
					"y" : 869.0
				},
				"mouthRight" : {
					"x" : 2806.4,
					"y" : 899.0
				},
				"pupilRight" : {
					"x" : 2807.0,
					"y" : 867.9
				},
				"eyeRightInner" : {
					"x" : 2803.3,
					"y" : 868.3
				},
				"noseRightAlarTop" : {
					"x" : 2800.0,
					"y" : 878.6
				},
				"eyeRightBottom" : {
					"x" : 2806.6,
					"y" : 868.9
				},
				"eyeLeftOuter" : {
					"x" : 2785.6,
					"y" : 869.0
				},
				"eyebrowRightOuter" : {
					"x" : 2812.8,
					"y" : 860.7
				},
				"eyeLeftInner" : {
					"x" : 2790.8,
					"y" : 868.7
				},
				"underLipBottom" : {
					"x" : 2797.0,
					"y" : 906.5
				},
				"eyebrowRightInner" : {
					"x" : 2800.6,
					"y" : 860.8
				},
				"eyeLeftBottom" : {
					"x" : 2788.0,
					"y" : 870.0
				},
				"eyeRightTop" : {
					"x" : 2806.2,
					"y" : 867.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 2789.8,
					"y" : 884.9
				},
				"upperLipBottom" : {
					"x" : 2796.2,
					"y" : 897.5
				},
				"mouthLeft" : {
					"x" : 2789.2,
					"y" : 899.4
				},
				"eyeRightOuter" : {
					"x" : 2809.5,
					"y" : 867.7
				},
				"underLipTop" : {
					"x" : 2797.0,
					"y" : 902.5
				},
				"eyebrowLeftOuter" : {
					"x" : 2780.9,
					"y" : 863.4
				},
				"noseLeftAlarTop" : {
					"x" : 2791.5,
					"y" : 878.6
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 1.0,
					"moustache" : 1.0,
					"sideburns" : 0.7
				},
				"age" : 53.7,
				"smile" : 0.001,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -11.9,
					"pitch" : 0.0,
					"roll" : -0.9
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.29
				},
				"emotion" : {
					"neutral" : 0.99,
					"surprise" : 0.001,
					"contempt" : 0.0,
					"happiness" : 0.001,
					"anger" : 0.008,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.44
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.38,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.21,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 0.96
						},
						{
							"color" : "blond",
							"confidence" : 0.58
						},
						{
							"color" : "brown",
							"confidence" : 0.45
						},
						{
							"color" : "gray",
							"confidence" : 0.39
						},
						{
							"color" : "other",
							"confidence" : 0.32
						},
						{
							"color" : "red",
							"confidence" : 0.12
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 36,
				"height" : 36,
				"top" : 886,
				"left" : 1719
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1738.1,
					"y" : 894.8
				},
				"eyeLeftTop" : {
					"x" : 1729.4,
					"y" : 893.1
				},
				"eyebrowLeftInner" : {
					"x" : 1732.8,
					"y" : 891.5
				},
				"upperLipTop" : {
					"x" : 1736.5,
					"y" : 912.5
				},
				"noseRightAlarOutTip" : {
					"x" : 1741.2,
					"y" : 905.7
				},
				"noseRootLeft" : {
					"x" : 1734.7,
					"y" : 894.9
				},
				"noseTip" : {
					"x" : 1736.5,
					"y" : 905.9
				},
				"pupilLeft" : {
					"x" : 1729.7,
					"y" : 893.9
				},
				"mouthRight" : {
					"x" : 1741.2,
					"y" : 912.5
				},
				"pupilRight" : {
					"x" : 1743.6,
					"y" : 893.9
				},
				"eyeRightInner" : {
					"x" : 1741.5,
					"y" : 894.3
				},
				"noseRightAlarTop" : {
					"x" : 1740.2,
					"y" : 902.3
				},
				"eyeRightBottom" : {
					"x" : 1743.8,
					"y" : 895.2
				},
				"eyeLeftOuter" : {
					"x" : 1727.4,
					"y" : 894.0
				},
				"eyebrowRightOuter" : {
					"x" : 1749.8,
					"y" : 889.8
				},
				"eyeLeftInner" : {
					"x" : 1731.5,
					"y" : 894.4
				},
				"underLipBottom" : {
					"x" : 1736.3,
					"y" : 914.8
				},
				"eyebrowRightInner" : {
					"x" : 1739.5,
					"y" : 891.4
				},
				"eyeLeftBottom" : {
					"x" : 1729.3,
					"y" : 894.9
				},
				"eyeRightTop" : {
					"x" : 1743.7,
					"y" : 893.2
				},
				"noseLeftAlarOutTip" : {
					"x" : 1732.0,
					"y" : 905.0
				},
				"upperLipBottom" : {
					"x" : 1736.6,
					"y" : 913.9
				},
				"mouthLeft" : {
					"x" : 1730.5,
					"y" : 912.4
				},
				"eyeRightOuter" : {
					"x" : 1746.0,
					"y" : 894.0
				},
				"underLipTop" : {
					"x" : 1736.2,
					"y" : 912.8
				},
				"eyebrowLeftOuter" : {
					"x" : 1723.9,
					"y" : 890.2
				},
				"noseLeftAlarTop" : {
					"x" : 1733.7,
					"y" : 901.8
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 33.8,
				"smile" : 0.078,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -4.1,
					"pitch" : 0.0,
					"roll" : 0.6
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.78
				},
				"emotion" : {
					"neutral" : 0.864,
					"surprise" : 0.006,
					"contempt" : 0.001,
					"happiness" : 0.078,
					"anger" : 0.007,
					"sadness" : 0.04,
					"disgust" : 0.0,
					"fear" : 0.005
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.27
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.44,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.9
						},
						{
							"color" : "other",
							"confidence" : 0.54
						},
						{
							"color" : "blond",
							"confidence" : 0.46
						},
						{
							"color" : "gray",
							"confidence" : 0.03
						},
						{
							"color" : "red",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 138,
				"height" : 138,
				"top" : 272,
				"left" : 1810
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1886.2,
					"y" : 314.6
				},
				"eyeLeftTop" : {
					"x" : 1845.0,
					"y" : 307.1
				},
				"eyebrowLeftInner" : {
					"x" : 1870.3,
					"y" : 302.6
				},
				"upperLipTop" : {
					"x" : 1881.8,
					"y" : 371.5
				},
				"noseRightAlarOutTip" : {
					"x" : 1902.1,
					"y" : 346.0
				},
				"noseRootLeft" : {
					"x" : 1868.7,
					"y" : 315.0
				},
				"noseTip" : {
					"x" : 1881.0,
					"y" : 351.0
				},
				"pupilLeft" : {
					"x" : 1845.9,
					"y" : 311.1
				},
				"mouthRight" : {
					"x" : 1912.4,
					"y" : 369.9
				},
				"pupilRight" : {
					"x" : 1907.0,
					"y" : 308.4
				},
				"eyeRightInner" : {
					"x" : 1897.0,
					"y" : 311.3
				},
				"noseRightAlarTop" : {
					"x" : 1891.2,
					"y" : 338.0
				},
				"eyeRightBottom" : {
					"x" : 1908.1,
					"y" : 313.4
				},
				"eyeLeftOuter" : {
					"x" : 1836.6,
					"y" : 312.0
				},
				"eyebrowRightOuter" : {
					"x" : 1935.7,
					"y" : 300.8
				},
				"eyeLeftInner" : {
					"x" : 1855.0,
					"y" : 312.2
				},
				"underLipBottom" : {
					"x" : 1884.7,
					"y" : 380.2
				},
				"eyebrowRightInner" : {
					"x" : 1885.4,
					"y" : 302.0
				},
				"eyeLeftBottom" : {
					"x" : 1845.2,
					"y" : 315.2
				},
				"eyeRightTop" : {
					"x" : 1906.7,
					"y" : 304.9
				},
				"noseLeftAlarOutTip" : {
					"x" : 1859.0,
					"y" : 349.0
				},
				"upperLipBottom" : {
					"x" : 1882.4,
					"y" : 375.7
				},
				"mouthLeft" : {
					"x" : 1852.5,
					"y" : 374.1
				},
				"eyeRightOuter" : {
					"x" : 1917.7,
					"y" : 309.1
				},
				"underLipTop" : {
					"x" : 1884.0,
					"y" : 373.4
				},
				"eyebrowLeftOuter" : {
					"x" : 1818.0,
					"y" : 306.9
				},
				"noseLeftAlarTop" : {
					"x" : 1866.3,
					"y" : 339.2
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.3,
					"moustache" : 0.4,
					"sideburns" : 0.0
				},
				"age" : 79.6,
				"smile" : 0.905,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : 2.0,
					"pitch" : 0.0,
					"roll" : -4.1
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.86
				},
				"emotion" : {
					"neutral" : 0.094,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.905,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "ReadingGlasses",
				"exposure" : {
					"value" : 0.85,
					"exposureLevel" : "overExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "other",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.98
						},
						{
							"color" : "gray",
							"confidence" : 0.13
						},
						{
							"color" : "red",
							"confidence" : 0.13
						},
						{
							"color" : "brown",
							"confidence" : 0.12
						},
						{
							"color" : "blond",
							"confidence" : 0.09
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 790,
				"height" : 790,
				"top" : 1947,
				"left" : 2000
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2459.9,
					"y" : 2171.5
				},
				"eyeLeftTop" : {
					"x" : 2220.0,
					"y" : 2166.5
				},
				"eyebrowLeftInner" : {
					"x" : 2331.0,
					"y" : 2115.2
				},
				"upperLipTop" : {
					"x" : 2413.8,
					"y" : 2489.8
				},
				"noseRightAlarOutTip" : {
					"x" : 2545.5,
					"y" : 2344.4
				},
				"noseRootLeft" : {
					"x" : 2343.5,
					"y" : 2178.7
				},
				"noseTip" : {
					"x" : 2432.3,
					"y" : 2356.8
				},
				"pupilLeft" : {
					"x" : 2204.4,
					"y" : 2180.9
				},
				"mouthRight" : {
					"x" : 2571.1,
					"y" : 2522.1
				},
				"pupilRight" : {
					"x" : 2543.5,
					"y" : 2154.5
				},
				"eyeRightInner" : {
					"x" : 2499.4,
					"y" : 2159.2
				},
				"noseRightAlarTop" : {
					"x" : 2488.0,
					"y" : 2284.4
				},
				"eyeRightBottom" : {
					"x" : 2551.2,
					"y" : 2171.7
				},
				"eyeLeftOuter" : {
					"x" : 2163.0,
					"y" : 2183.5
				},
				"eyebrowRightOuter" : {
					"x" : 2670.9,
					"y" : 2063.2
				},
				"eyeLeftInner" : {
					"x" : 2280.1,
					"y" : 2177.3
				},
				"underLipBottom" : {
					"x" : 2425.6,
					"y" : 2650.1
				},
				"eyebrowRightInner" : {
					"x" : 2471.2,
					"y" : 2098.8
				},
				"eyeLeftBottom" : {
					"x" : 2220.7,
					"y" : 2196.7
				},
				"eyeRightTop" : {
					"x" : 2552.3,
					"y" : 2137.6
				},
				"noseLeftAlarOutTip" : {
					"x" : 2276.6,
					"y" : 2359.0
				},
				"upperLipBottom" : {
					"x" : 2415.3,
					"y" : 2530.9
				},
				"mouthLeft" : {
					"x" : 2229.3,
					"y" : 2535.8
				},
				"eyeRightOuter" : {
					"x" : 2606.3,
					"y" : 2153.7
				},
				"underLipTop" : {
					"x" : 2416.7,
					"y" : 2589.1
				},
				"eyebrowLeftOuter" : {
					"x" : 2090.1,
					"y" : 2122.8
				},
				"noseLeftAlarTop" : {
					"x" : 2316.1,
					"y" : 2301.5
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.3,
					"moustache" : 0.3,
					"sideburns" : 0.2
				},
				"age" : 30.5,
				"smile" : 1.0,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : 8.2,
					"pitch" : 0.0,
					"roll" : -4.1
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 1.0
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 1.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.65,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 98,
				"height" : 98,
				"top" : 1046,
				"left" : 1224
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1282.4,
					"y" : 1075.8
				},
				"eyeLeftTop" : {
					"x" : 1253.7,
					"y" : 1068.7
				},
				"eyebrowLeftInner" : {
					"x" : 1266.6,
					"y" : 1066.3
				},
				"upperLipTop" : {
					"x" : 1272.8,
					"y" : 1115.4
				},
				"noseRightAlarOutTip" : {
					"x" : 1286.1,
					"y" : 1102.3
				},
				"noseRootLeft" : {
					"x" : 1269.1,
					"y" : 1074.9
				},
				"noseTip" : {
					"x" : 1273.5,
					"y" : 1101.4
				},
				"pupilLeft" : {
					"x" : 1252.7,
					"y" : 1071.0
				},
				"mouthRight" : {
					"x" : 1293.7,
					"y" : 1118.3
				},
				"pupilRight" : {
					"x" : 1295.3,
					"y" : 1075.1
				},
				"eyeRightInner" : {
					"x" : 1288.5,
					"y" : 1075.5
				},
				"noseRightAlarTop" : {
					"x" : 1283.2,
					"y" : 1094.1
				},
				"eyeRightBottom" : {
					"x" : 1295.8,
					"y" : 1077.5
				},
				"eyeLeftOuter" : {
					"x" : 1245.6,
					"y" : 1070.8
				},
				"eyebrowRightOuter" : {
					"x" : 1314.2,
					"y" : 1069.2
				},
				"eyeLeftInner" : {
					"x" : 1261.0,
					"y" : 1072.7
				},
				"underLipBottom" : {
					"x" : 1271.4,
					"y" : 1126.2
				},
				"eyebrowRightInner" : {
					"x" : 1286.2,
					"y" : 1066.9
				},
				"eyeLeftBottom" : {
					"x" : 1253.2,
					"y" : 1073.3
				},
				"eyeRightTop" : {
					"x" : 1295.8,
					"y" : 1073.2
				},
				"noseLeftAlarOutTip" : {
					"x" : 1260.1,
					"y" : 1098.4
				},
				"upperLipBottom" : {
					"x" : 1272.7,
					"y" : 1118.9
				},
				"mouthLeft" : {
					"x" : 1248.4,
					"y" : 1115.1
				},
				"eyeRightOuter" : {
					"x" : 1303.3,
					"y" : 1076.7
				},
				"underLipTop" : {
					"x" : 1271.9,
					"y" : 1120.1
				},
				"eyebrowLeftOuter" : {
					"x" : 1232.6,
					"y" : 1064.7
				},
				"noseLeftAlarTop" : {
					"x" : 1265.3,
					"y" : 1093.0
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 24.9,
				"smile" : 0.559,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 1.1,
					"pitch" : 0.0,
					"roll" : 4.1
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.85
				},
				"emotion" : {
					"neutral" : 0.439,
					"surprise" : 0.0,
					"contempt" : 0.002,
					"happiness" : 0.559,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.28,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.8
						},
						{
							"color" : "other",
							"confidence" : 0.7
						},
						{
							"color" : "red",
							"confidence" : 0.27
						},
						{
							"color" : "blond",
							"confidence" : 0.04
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 92,
				"height" : 92,
				"top" : 1004,
				"left" : 2304
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2360.2,
					"y" : 1031.2
				},
				"eyeLeftTop" : {
					"x" : 2332.4,
					"y" : 1025.6
				},
				"eyebrowLeftInner" : {
					"x" : 2346.8,
					"y" : 1016.3
				},
				"upperLipTop" : {
					"x" : 2347.3,
					"y" : 1069.0
				},
				"noseRightAlarOutTip" : {
					"x" : 2362.8,
					"y" : 1054.8
				},
				"noseRootLeft" : {
					"x" : 2347.4,
					"y" : 1029.2
				},
				"noseTip" : {
					"x" : 2350.3,
					"y" : 1052.0
				},
				"pupilLeft" : {
					"x" : 2333.2,
					"y" : 1026.2
				},
				"mouthRight" : {
					"x" : 2361.6,
					"y" : 1074.2
				},
				"pupilRight" : {
					"x" : 2374.7,
					"y" : 1032.0
				},
				"eyeRightInner" : {
					"x" : 2368.4,
					"y" : 1031.6
				},
				"noseRightAlarTop" : {
					"x" : 2360.3,
					"y" : 1045.8
				},
				"eyeRightBottom" : {
					"x" : 2374.6,
					"y" : 1033.8
				},
				"eyeLeftOuter" : {
					"x" : 2326.5,
					"y" : 1025.2
				},
				"eyebrowRightOuter" : {
					"x" : 2392.5,
					"y" : 1025.5
				},
				"eyeLeftInner" : {
					"x" : 2337.9,
					"y" : 1027.3
				},
				"underLipBottom" : {
					"x" : 2345.4,
					"y" : 1077.4
				},
				"eyebrowRightInner" : {
					"x" : 2364.6,
					"y" : 1019.3
				},
				"eyeLeftBottom" : {
					"x" : 2331.6,
					"y" : 1027.9
				},
				"eyeRightTop" : {
					"x" : 2374.7,
					"y" : 1031.3
				},
				"noseLeftAlarOutTip" : {
					"x" : 2336.2,
					"y" : 1050.3
				},
				"upperLipBottom" : {
					"x" : 2346.6,
					"y" : 1072.9
				},
				"mouthLeft" : {
					"x" : 2328.3,
					"y" : 1070.2
				},
				"eyeRightOuter" : {
					"x" : 2380.9,
					"y" : 1033.0
				},
				"underLipTop" : {
					"x" : 2346.1,
					"y" : 1073.8
				},
				"eyebrowLeftOuter" : {
					"x" : 2317.5,
					"y" : 1014.2
				},
				"noseLeftAlarTop" : {
					"x" : 2342.2,
					"y" : 1043.0
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.2,
					"moustache" : 0.5,
					"sideburns" : 0.6
				},
				"age" : 24.2,
				"smile" : 0.006,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 2.1,
					"pitch" : 0.0,
					"roll" : 9.2
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : true
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.66
				},
				"emotion" : {
					"neutral" : 0.989,
					"surprise" : 0.0,
					"contempt" : 0.001,
					"happiness" : 0.006,
					"anger" : 0.0,
					"sadness" : 0.003,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.26
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.54,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.08,
					"hairColor" : [
						{
							"color" : "other",
							"confidence" : 0.98
						},
						{
							"color" : "black",
							"confidence" : 0.95
						},
						{
							"color" : "red",
							"confidence" : 0.65
						},
						{
							"color" : "blond",
							"confidence" : 0.17
						},
						{
							"color" : "gray",
							"confidence" : 0.08
						},
						{
							"color" : "brown",
							"confidence" : 0.04
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 306,
				"height" : 306,
				"top" : 1438,
				"left" : 2154
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2325.6,
					"y" : 1523.2
				},
				"eyeLeftTop" : {
					"x" : 2255.5,
					"y" : 1501.6
				},
				"eyebrowLeftInner" : {
					"x" : 2279.2,
					"y" : 1489.6
				},
				"upperLipTop" : {
					"x" : 2302.0,
					"y" : 1650.1
				},
				"noseRightAlarOutTip" : {
					"x" : 2343.3,
					"y" : 1599.2
				},
				"noseRootLeft" : {
					"x" : 2285.6,
					"y" : 1519.8
				},
				"noseTip" : {
					"x" : 2305.0,
					"y" : 1597.8
				},
				"pupilLeft" : {
					"x" : 2252.2,
					"y" : 1508.0
				},
				"mouthRight" : {
					"x" : 2362.9,
					"y" : 1674.5
				},
				"pupilRight" : {
					"x" : 2360.9,
					"y" : 1517.7
				},
				"eyeRightInner" : {
					"x" : 2342.5,
					"y" : 1522.0
				},
				"noseRightAlarTop" : {
					"x" : 2326.6,
					"y" : 1574.5
				},
				"eyeRightBottom" : {
					"x" : 2362.3,
					"y" : 1527.9
				},
				"eyeLeftOuter" : {
					"x" : 2234.5,
					"y" : 1506.1
				},
				"eyebrowRightOuter" : {
					"x" : 2413.6,
					"y" : 1481.3
				},
				"eyeLeftInner" : {
					"x" : 2272.0,
					"y" : 1513.3
				},
				"underLipBottom" : {
					"x" : 2305.0,
					"y" : 1721.3
				},
				"eyebrowRightInner" : {
					"x" : 2332.8,
					"y" : 1498.3
				},
				"eyeLeftBottom" : {
					"x" : 2252.5,
					"y" : 1515.2
				},
				"eyeRightTop" : {
					"x" : 2360.9,
					"y" : 1510.7
				},
				"noseLeftAlarOutTip" : {
					"x" : 2265.6,
					"y" : 1594.3
				},
				"upperLipBottom" : {
					"x" : 2302.6,
					"y" : 1668.1
				},
				"mouthLeft" : {
					"x" : 2256.4,
					"y" : 1671.5
				},
				"eyeRightOuter" : {
					"x" : 2381.2,
					"y" : 1519.3
				},
				"underLipTop" : {
					"x" : 2304.8,
					"y" : 1695.6
				},
				"eyebrowLeftOuter" : {
					"x" : 2211.2,
					"y" : 1464.8
				},
				"noseLeftAlarTop" : {
					"x" : 2280.9,
					"y" : 1573.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 29.5,
				"smile" : 0.111,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -5.5,
					"pitch" : 0.0,
					"roll" : 2.3
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 1.0
				},
				"emotion" : {
					"neutral" : 0.49,
					"surprise" : 0.275,
					"contempt" : 0.001,
					"happiness" : 0.111,
					"anger" : 0.0,
					"sadness" : 0.102,
					"disgust" : 0.001,
					"fear" : 0.02
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.7
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.56,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "red",
							"confidence" : 0.97
						},
						{
							"color" : "black",
							"confidence" : 0.72
						},
						{
							"color" : "other",
							"confidence" : 0.7
						},
						{
							"color" : "brown",
							"confidence" : 0.36
						},
						{
							"color" : "blond",
							"confidence" : 0.09
						},
						{
							"color" : "gray",
							"confidence" : 0.09
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 275,
				"height" : 275,
				"top" : 1674,
				"left" : 890
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1069.2,
					"y" : 1764.3
				},
				"eyeLeftTop" : {
					"x" : 1011.1,
					"y" : 1715.1
				},
				"eyebrowLeftInner" : {
					"x" : 1040.1,
					"y" : 1722.5
				},
				"upperLipTop" : {
					"x" : 1014.8,
					"y" : 1872.6
				},
				"noseRightAlarOutTip" : {
					"x" : 1070.2,
					"y" : 1841.0
				},
				"noseRootLeft" : {
					"x" : 1036.3,
					"y" : 1748.9
				},
				"noseTip" : {
					"x" : 1033.4,
					"y" : 1819.8
				},
				"pupilLeft" : {
					"x" : 1003.1,
					"y" : 1720.5
				},
				"mouthRight" : {
					"x" : 1045.7,
					"y" : 1902.0
				},
				"pupilRight" : {
					"x" : 1087.6,
					"y" : 1761.4
				},
				"eyeRightInner" : {
					"x" : 1079.3,
					"y" : 1764.9
				},
				"noseRightAlarTop" : {
					"x" : 1062.8,
					"y" : 1810.0
				},
				"eyeRightBottom" : {
					"x" : 1092.1,
					"y" : 1775.0
				},
				"eyeLeftOuter" : {
					"x" : 991.9,
					"y" : 1720.2
				},
				"eyebrowRightOuter" : {
					"x" : 1141.3,
					"y" : 1776.3
				},
				"eyeLeftInner" : {
					"x" : 1022.9,
					"y" : 1735.0
				},
				"underLipBottom" : {
					"x" : 1000.9,
					"y" : 1914.2
				},
				"eyebrowRightInner" : {
					"x" : 1074.1,
					"y" : 1744.4
				},
				"eyeLeftBottom" : {
					"x" : 1003.9,
					"y" : 1732.2
				},
				"eyeRightTop" : {
					"x" : 1095.4,
					"y" : 1758.7
				},
				"noseLeftAlarOutTip" : {
					"x" : 992.5,
					"y" : 1808.9
				},
				"upperLipBottom" : {
					"x" : 1011.0,
					"y" : 1886.4
				},
				"mouthLeft" : {
					"x" : 965.7,
					"y" : 1868.2
				},
				"eyeRightOuter" : {
					"x" : 1105.5,
					"y" : 1774.8
				},
				"underLipTop" : {
					"x" : 1006.6,
					"y" : 1896.0
				},
				"eyebrowLeftOuter" : {
					"x" : 972.5,
					"y" : 1692.8
				},
				"noseLeftAlarTop" : {
					"x" : 1013.1,
					"y" : 1789.7
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.2,
					"moustache" : 0.3,
					"sideburns" : 0.1
				},
				"age" : 67.6,
				"smile" : 0.0,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -2.4,
					"pitch" : 0.0,
					"roll" : 20.8
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 1.0
				},
				"emotion" : {
					"neutral" : 0.94,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.0,
					"anger" : 0.005,
					"sadness" : 0.054,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 1.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.38,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 0.99
						},
						{
							"color" : "red",
							"confidence" : 0.5
						},
						{
							"color" : "other",
							"confidence" : 0.48
						},
						{
							"color" : "brown",
							"confidence" : 0.3
						},
						{
							"color" : "blond",
							"confidence" : 0.14
						},
						{
							"color" : "gray",
							"confidence" : 0.11
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 149,
				"height" : 149,
				"top" : 1295,
				"left" : 1285
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1364.2,
					"y" : 1333.4
				},
				"eyeLeftTop" : {
					"x" : 1320.6,
					"y" : 1335.9
				},
				"eyebrowLeftInner" : {
					"x" : 1342.2,
					"y" : 1320.1
				},
				"upperLipTop" : {
					"x" : 1370.8,
					"y" : 1400.1
				},
				"noseRightAlarOutTip" : {
					"x" : 1383.3,
					"y" : 1369.9
				},
				"noseRootLeft" : {
					"x" : 1345.6,
					"y" : 1336.5
				},
				"noseTip" : {
					"x" : 1369.8,
					"y" : 1371.2
				},
				"pupilLeft" : {
					"x" : 1319.9,
					"y" : 1340.8
				},
				"mouthRight" : {
					"x" : 1392.1,
					"y" : 1402.2
				},
				"pupilRight" : {
					"x" : 1375.3,
					"y" : 1327.4
				},
				"eyeRightInner" : {
					"x" : 1372.0,
					"y" : 1331.1
				},
				"noseRightAlarTop" : {
					"x" : 1372.5,
					"y" : 1360.2
				},
				"eyeRightBottom" : {
					"x" : 1382.9,
					"y" : 1332.4
				},
				"eyeLeftOuter" : {
					"x" : 1311.8,
					"y" : 1342.1
				},
				"eyebrowRightOuter" : {
					"x" : 1401.4,
					"y" : 1303.9
				},
				"eyeLeftInner" : {
					"x" : 1332.4,
					"y" : 1340.1
				},
				"underLipBottom" : {
					"x" : 1379.2,
					"y" : 1430.1
				},
				"eyebrowRightInner" : {
					"x" : 1365.5,
					"y" : 1314.1
				},
				"eyeLeftBottom" : {
					"x" : 1322.3,
					"y" : 1345.2
				},
				"eyeRightTop" : {
					"x" : 1379.7,
					"y" : 1322.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 1348.6,
					"y" : 1383.3
				},
				"upperLipBottom" : {
					"x" : 1372.6,
					"y" : 1405.2
				},
				"mouthLeft" : {
					"x" : 1343.1,
					"y" : 1413.8
				},
				"eyeRightOuter" : {
					"x" : 1388.9,
					"y" : 1324.3
				},
				"underLipTop" : {
					"x" : 1376.0,
					"y" : 1420.1
				},
				"eyebrowLeftOuter" : {
					"x" : 1291.9,
					"y" : 1332.2
				},
				"noseLeftAlarTop" : {
					"x" : 1349.6,
					"y" : 1366.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 29.1,
				"smile" : 0.573,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 19.6,
					"pitch" : 0.0,
					"roll" : -14.8
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.09
				},
				"emotion" : {
					"neutral" : 0.186,
					"surprise" : 0.029,
					"contempt" : 0.006,
					"happiness" : 0.573,
					"anger" : 0.105,
					"sadness" : 0.037,
					"disgust" : 0.053,
					"fear" : 0.011
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.23
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.42,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.04,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.96
						},
						{
							"color" : "other",
							"confidence" : 0.79
						},
						{
							"color" : "black",
							"confidence" : 0.74
						},
						{
							"color" : "blond",
							"confidence" : 0.53
						},
						{
							"color" : "red",
							"confidence" : 0.19
						},
						{
							"color" : "gray",
							"confidence" : 0.01
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 246,
				"height" : 246,
				"top" : 1231,
				"left" : 1496
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1645.1,
					"y" : 1308.8
				},
				"eyeLeftTop" : {
					"x" : 1584.8,
					"y" : 1276.3
				},
				"eyebrowLeftInner" : {
					"x" : 1617.1,
					"y" : 1270.1
				},
				"upperLipTop" : {
					"x" : 1606.7,
					"y" : 1403.2
				},
				"noseRightAlarOutTip" : {
					"x" : 1651.6,
					"y" : 1373.2
				},
				"noseRootLeft" : {
					"x" : 1615.5,
					"y" : 1300.6
				},
				"noseTip" : {
					"x" : 1609.5,
					"y" : 1366.5
				},
				"pupilLeft" : {
					"x" : 1583.1,
					"y" : 1282.1
				},
				"mouthRight" : {
					"x" : 1655.0,
					"y" : 1424.2
				},
				"pupilRight" : {
					"x" : 1683.8,
					"y" : 1313.1
				},
				"eyeRightInner" : {
					"x" : 1665.7,
					"y" : 1309.6
				},
				"noseRightAlarTop" : {
					"x" : 1644.2,
					"y" : 1349.8
				},
				"eyeRightBottom" : {
					"x" : 1683.7,
					"y" : 1319.6
				},
				"eyeLeftOuter" : {
					"x" : 1564.7,
					"y" : 1277.5
				},
				"eyebrowRightOuter" : {
					"x" : 1736.8,
					"y" : 1295.6
				},
				"eyeLeftInner" : {
					"x" : 1597.6,
					"y" : 1290.0
				},
				"underLipBottom" : {
					"x" : 1593.0,
					"y" : 1444.2
				},
				"eyebrowRightInner" : {
					"x" : 1657.4,
					"y" : 1284.9
				},
				"eyeLeftBottom" : {
					"x" : 1578.7,
					"y" : 1287.6
				},
				"eyeRightTop" : {
					"x" : 1687.3,
					"y" : 1308.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 1577.0,
					"y" : 1354.7
				},
				"upperLipBottom" : {
					"x" : 1603.1,
					"y" : 1412.9
				},
				"mouthLeft" : {
					"x" : 1561.8,
					"y" : 1397.8
				},
				"eyeRightOuter" : {
					"x" : 1700.7,
					"y" : 1318.7
				},
				"underLipTop" : {
					"x" : 1599.6,
					"y" : 1426.7
				},
				"eyebrowLeftOuter" : {
					"x" : 1544.3,
					"y" : 1243.6
				},
				"noseLeftAlarTop" : {
					"x" : 1595.6,
					"y" : 1338.4
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 29.1,
				"smile" : 1.0,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -4.3,
					"pitch" : 0.0,
					"roll" : 15.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 1.0
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.73,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.83
						},
						{
							"color" : "blond",
							"confidence" : 0.23
						},
						{
							"color" : "other",
							"confidence" : 0.18
						},
						{
							"color" : "red",
							"confidence" : 0.06
						},
						{
							"color" : "gray",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		}
	]
]'
]

{ #category : #'unsplash - json text' }
GtCSExamplesData class >> unsplashJsonTextPicturesCropped [
	^ '[
	[
		{
			"faceRectangle" : {
				"width" : 158,
				"height" : 158,
				"top" : 1608,
				"left" : 1462
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1558.6,
					"y" : 1653.6
				},
				"eyeLeftTop" : {
					"x" : 1511.9,
					"y" : 1647.2
				},
				"eyebrowLeftInner" : {
					"x" : 1531.9,
					"y" : 1634.9
				},
				"upperLipTop" : {
					"x" : 1544.8,
					"y" : 1719.9
				},
				"noseRightAlarOutTip" : {
					"x" : 1572.9,
					"y" : 1693.9
				},
				"noseRootLeft" : {
					"x" : 1537.3,
					"y" : 1652.6
				},
				"noseTip" : {
					"x" : 1551.6,
					"y" : 1690.2
				},
				"pupilLeft" : {
					"x" : 1511.2,
					"y" : 1651.6
				},
				"mouthRight" : {
					"x" : 1563.2,
					"y" : 1726.7
				},
				"pupilRight" : {
					"x" : 1580.6,
					"y" : 1653.9
				},
				"eyeRightInner" : {
					"x" : 1566.4,
					"y" : 1653.9
				},
				"noseRightAlarTop" : {
					"x" : 1565.4,
					"y" : 1679.2
				},
				"eyeRightBottom" : {
					"x" : 1579.0,
					"y" : 1658.4
				},
				"eyeLeftOuter" : {
					"x" : 1498.8,
					"y" : 1651.0
				},
				"eyebrowRightOuter" : {
					"x" : 1603.1,
					"y" : 1638.8
				},
				"eyeLeftInner" : {
					"x" : 1522.9,
					"y" : 1652.6
				},
				"underLipBottom" : {
					"x" : 1538.9,
					"y" : 1741.5
				},
				"eyebrowRightInner" : {
					"x" : 1565.5,
					"y" : 1636.2
				},
				"eyeLeftBottom" : {
					"x" : 1510.9,
					"y" : 1656.3
				},
				"eyeRightTop" : {
					"x" : 1579.3,
					"y" : 1649.9
				},
				"noseLeftAlarOutTip" : {
					"x" : 1520.3,
					"y" : 1692.5
				},
				"upperLipBottom" : {
					"x" : 1543.5,
					"y" : 1727.3
				},
				"mouthLeft" : {
					"x" : 1497.9,
					"y" : 1722.7
				},
				"eyeRightOuter" : {
					"x" : 1589.7,
					"y" : 1654.1
				},
				"underLipTop" : {
					"x" : 1540.1,
					"y" : 1731.6
				},
				"eyebrowLeftOuter" : {
					"x" : 1478.3,
					"y" : 1635.8
				},
				"noseLeftAlarTop" : {
					"x" : 1528.3,
					"y" : 1679.0
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.1,
					"moustache" : 0.0,
					"sideburns" : 0.1
				},
				"age" : 29.2,
				"smile" : 0.98,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : 17.6,
					"pitch" : 0.0,
					"roll" : 3.1
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.53
				},
				"emotion" : {
					"neutral" : 0.012,
					"surprise" : 0.003,
					"contempt" : 0.0,
					"happiness" : 0.98,
					"anger" : 0.001,
					"sadness" : 0.0,
					"disgust" : 0.002,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.35
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.26,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.98
						},
						{
							"color" : "blond",
							"confidence" : 0.72
						},
						{
							"color" : "gray",
							"confidence" : 0.51
						},
						{
							"color" : "black",
							"confidence" : 0.42
						},
						{
							"color" : "other",
							"confidence" : 0.16
						},
						{
							"color" : "red",
							"confidence" : 0.05
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 151,
				"height" : 151,
				"top" : 1464,
				"left" : 1876
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1958.5,
					"y" : 1509.7
				},
				"eyeLeftTop" : {
					"x" : 1910.0,
					"y" : 1505.5
				},
				"eyebrowLeftInner" : {
					"x" : 1934.8,
					"y" : 1493.8
				},
				"upperLipTop" : {
					"x" : 1954.3,
					"y" : 1567.0
				},
				"noseRightAlarOutTip" : {
					"x" : 1973.6,
					"y" : 1542.6
				},
				"noseRootLeft" : {
					"x" : 1940.2,
					"y" : 1510.5
				},
				"noseTip" : {
					"x" : 1949.7,
					"y" : 1539.6
				},
				"pupilLeft" : {
					"x" : 1911.8,
					"y" : 1510.2
				},
				"mouthRight" : {
					"x" : 1987.4,
					"y" : 1574.0
				},
				"pupilRight" : {
					"x" : 1985.4,
					"y" : 1507.3
				},
				"eyeRightInner" : {
					"x" : 1972.4,
					"y" : 1508.5
				},
				"noseRightAlarTop" : {
					"x" : 1963.6,
					"y" : 1529.9
				},
				"eyeRightBottom" : {
					"x" : 1985.3,
					"y" : 1511.8
				},
				"eyeLeftOuter" : {
					"x" : 1899.4,
					"y" : 1511.3
				},
				"eyebrowRightOuter" : {
					"x" : 2009.9,
					"y" : 1490.7
				},
				"eyeLeftInner" : {
					"x" : 1922.7,
					"y" : 1510.3
				},
				"underLipBottom" : {
					"x" : 1959.3,
					"y" : 1584.9
				},
				"eyebrowRightInner" : {
					"x" : 1959.5,
					"y" : 1492.3
				},
				"eyeLeftBottom" : {
					"x" : 1910.9,
					"y" : 1514.5
				},
				"eyeRightTop" : {
					"x" : 1984.1,
					"y" : 1502.7
				},
				"noseLeftAlarOutTip" : {
					"x" : 1928.3,
					"y" : 1544.1
				},
				"upperLipBottom" : {
					"x" : 1954.8,
					"y" : 1573.5
				},
				"mouthLeft" : {
					"x" : 1925.2,
					"y" : 1577.2
				},
				"eyeRightOuter" : {
					"x" : 1996.3,
					"y" : 1507.8
				},
				"underLipTop" : {
					"x" : 1958.2,
					"y" : 1576.3
				},
				"eyebrowLeftOuter" : {
					"x" : 1882.9,
					"y" : 1498.6
				},
				"noseLeftAlarTop" : {
					"x" : 1934.5,
					"y" : 1531.8
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.4,
					"moustache" : 0.2,
					"sideburns" : 0.3
				},
				"age" : 29.5,
				"smile" : 0.598,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : 0.3,
					"pitch" : 0.0,
					"roll" : -5.0
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.53
				},
				"emotion" : {
					"neutral" : 0.391,
					"surprise" : 0.0,
					"contempt" : 0.011,
					"happiness" : 0.598,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.45
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.34,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 0.98
						},
						{
							"color" : "brown",
							"confidence" : 0.97
						},
						{
							"color" : "other",
							"confidence" : 0.31
						},
						{
							"color" : "gray",
							"confidence" : 0.16
						},
						{
							"color" : "red",
							"confidence" : 0.11
						},
						{
							"color" : "blond",
							"confidence" : 0.04
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 150,
				"height" : 150,
				"top" : 1638,
				"left" : 899
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 981.6,
					"y" : 1681.5
				},
				"eyeLeftTop" : {
					"x" : 940.4,
					"y" : 1679.1
				},
				"eyebrowLeftInner" : {
					"x" : 957.3,
					"y" : 1666.0
				},
				"upperLipTop" : {
					"x" : 975.7,
					"y" : 1739.1
				},
				"noseRightAlarOutTip" : {
					"x" : 998.3,
					"y" : 1716.0
				},
				"noseRootLeft" : {
					"x" : 960.7,
					"y" : 1683.6
				},
				"noseTip" : {
					"x" : 973.1,
					"y" : 1716.3
				},
				"pupilLeft" : {
					"x" : 939.0,
					"y" : 1682.6
				},
				"mouthRight" : {
					"x" : 1010.0,
					"y" : 1745.2
				},
				"pupilRight" : {
					"x" : 1001.3,
					"y" : 1676.3
				},
				"eyeRightInner" : {
					"x" : 993.4,
					"y" : 1679.0
				},
				"noseRightAlarTop" : {
					"x" : 988.8,
					"y" : 1702.4
				},
				"eyeRightBottom" : {
					"x" : 1002.6,
					"y" : 1680.4
				},
				"eyeLeftOuter" : {
					"x" : 931.3,
					"y" : 1684.4
				},
				"eyebrowRightOuter" : {
					"x" : 1023.7,
					"y" : 1664.0
				},
				"eyeLeftInner" : {
					"x" : 949.8,
					"y" : 1682.5
				},
				"underLipBottom" : {
					"x" : 980.2,
					"y" : 1767.6
				},
				"eyebrowRightInner" : {
					"x" : 976.9,
					"y" : 1664.3
				},
				"eyeLeftBottom" : {
					"x" : 940.5,
					"y" : 1685.9
				},
				"eyeRightTop" : {
					"x" : 1002.4,
					"y" : 1672.7
				},
				"noseLeftAlarOutTip" : {
					"x" : 949.7,
					"y" : 1719.5
				},
				"upperLipBottom" : {
					"x" : 976.7,
					"y" : 1746.3
				},
				"mouthLeft" : {
					"x" : 948.0,
					"y" : 1753.1
				},
				"eyeRightOuter" : {
					"x" : 1012.7,
					"y" : 1677.3
				},
				"underLipTop" : {
					"x" : 979.5,
					"y" : 1757.3
				},
				"eyebrowLeftOuter" : {
					"x" : 913.8,
					"y" : 1673.1
				},
				"noseLeftAlarTop" : {
					"x" : 956.0,
					"y" : 1705.8
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.6,
					"moustache" : 0.5,
					"sideburns" : 0.6
				},
				"age" : 34.5,
				"smile" : 0.994,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -6.4,
					"pitch" : 0.0,
					"roll" : -5.8
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.58
				},
				"emotion" : {
					"neutral" : 0.006,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.994,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.64
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.07,
					"exposureLevel" : "underExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.63
						},
						{
							"color" : "other",
							"confidence" : 0.38
						},
						{
							"color" : "gray",
							"confidence" : 0.24
						},
						{
							"color" : "red",
							"confidence" : 0.1
						},
						{
							"color" : "blond",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 130,
				"height" : 130,
				"top" : 1632,
				"left" : 171
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 246.1,
					"y" : 1665.7
				},
				"eyeLeftTop" : {
					"x" : 221.4,
					"y" : 1655.4
				},
				"eyebrowLeftInner" : {
					"x" : 234.2,
					"y" : 1643.3
				},
				"upperLipTop" : {
					"x" : 229.8,
					"y" : 1724.0
				},
				"noseRightAlarOutTip" : {
					"x" : 247.3,
					"y" : 1701.7
				},
				"noseRootLeft" : {
					"x" : 232.6,
					"y" : 1662.1
				},
				"noseTip" : {
					"x" : 231.5,
					"y" : 1692.1
				},
				"pupilLeft" : {
					"x" : 222.9,
					"y" : 1657.6
				},
				"mouthRight" : {
					"x" : 245.6,
					"y" : 1740.3
				},
				"pupilRight" : {
					"x" : 262.8,
					"y" : 1667.0
				},
				"eyeRightInner" : {
					"x" : 255.3,
					"y" : 1665.5
				},
				"noseRightAlarTop" : {
					"x" : 244.0,
					"y" : 1688.5
				},
				"eyeRightBottom" : {
					"x" : 261.4,
					"y" : 1670.6
				},
				"eyeLeftOuter" : {
					"x" : 215.0,
					"y" : 1658.0
				},
				"eyebrowRightOuter" : {
					"x" : 283.5,
					"y" : 1656.8
				},
				"eyeLeftInner" : {
					"x" : 227.1,
					"y" : 1659.9
				},
				"underLipBottom" : {
					"x" : 225.6,
					"y" : 1746.0
				},
				"eyebrowRightInner" : {
					"x" : 249.3,
					"y" : 1646.1
				},
				"eyeLeftBottom" : {
					"x" : 220.0,
					"y" : 1661.7
				},
				"eyeRightTop" : {
					"x" : 263.1,
					"y" : 1663.8
				},
				"noseLeftAlarOutTip" : {
					"x" : 217.2,
					"y" : 1693.2
				},
				"upperLipBottom" : {
					"x" : 228.2,
					"y" : 1729.6
				},
				"mouthLeft" : {
					"x" : 215.0,
					"y" : 1733.4
				},
				"eyeRightOuter" : {
					"x" : 269.4,
					"y" : 1669.7
				},
				"underLipTop" : {
					"x" : 227.4,
					"y" : 1740.9
				},
				"eyebrowLeftOuter" : {
					"x" : 211.7,
					"y" : 1635.3
				},
				"noseLeftAlarTop" : {
					"x" : 226.0,
					"y" : 1684.0
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.2,
					"sideburns" : 0.0
				},
				"age" : 29.9,
				"smile" : 0.005,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -17.5,
					"pitch" : 0.0,
					"roll" : 11.7
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.59
				},
				"emotion" : {
					"neutral" : 0.986,
					"surprise" : 0.002,
					"contempt" : 0.001,
					"happiness" : 0.005,
					"anger" : 0.0,
					"sadness" : 0.006,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.55
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.63,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.05,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.74
						},
						{
							"color" : "other",
							"confidence" : 0.31
						},
						{
							"color" : "red",
							"confidence" : 0.1
						},
						{
							"color" : "gray",
							"confidence" : 0.1
						},
						{
							"color" : "blond",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 119,
				"height" : 119,
				"top" : 1042,
				"left" : 1055
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1122.2,
					"y" : 1075.4
				},
				"eyeLeftTop" : {
					"x" : 1083.8,
					"y" : 1075.7
				},
				"eyebrowLeftInner" : {
					"x" : 1098.2,
					"y" : 1061.0
				},
				"upperLipTop" : {
					"x" : 1115.9,
					"y" : 1121.1
				},
				"noseRightAlarOutTip" : {
					"x" : 1133.6,
					"y" : 1099.6
				},
				"noseRootLeft" : {
					"x" : 1102.4,
					"y" : 1077.5
				},
				"noseTip" : {
					"x" : 1115.1,
					"y" : 1100.9
				},
				"pupilLeft" : {
					"x" : 1085.8,
					"y" : 1077.7
				},
				"mouthRight" : {
					"x" : 1139.5,
					"y" : 1128.4
				},
				"pupilRight" : {
					"x" : 1139.7,
					"y" : 1072.5
				},
				"eyeRightInner" : {
					"x" : 1130.0,
					"y" : 1074.3
				},
				"noseRightAlarTop" : {
					"x" : 1126.9,
					"y" : 1092.2
				},
				"eyeRightBottom" : {
					"x" : 1139.6,
					"y" : 1075.4
				},
				"eyeLeftOuter" : {
					"x" : 1075.7,
					"y" : 1080.5
				},
				"eyebrowRightOuter" : {
					"x" : 1161.8,
					"y" : 1062.2
				},
				"eyeLeftInner" : {
					"x" : 1094.0,
					"y" : 1077.5
				},
				"underLipBottom" : {
					"x" : 1117.6,
					"y" : 1141.6
				},
				"eyebrowRightInner" : {
					"x" : 1122.8,
					"y" : 1059.1
				},
				"eyeLeftBottom" : {
					"x" : 1085.5,
					"y" : 1080.9
				},
				"eyeRightTop" : {
					"x" : 1139.8,
					"y" : 1069.7
				},
				"noseLeftAlarOutTip" : {
					"x" : 1096.0,
					"y" : 1104.8
				},
				"upperLipBottom" : {
					"x" : 1116.1,
					"y" : 1125.1
				},
				"mouthLeft" : {
					"x" : 1092.4,
					"y" : 1131.8
				},
				"eyeRightOuter" : {
					"x" : 1147.2,
					"y" : 1072.9
				},
				"underLipTop" : {
					"x" : 1117.1,
					"y" : 1136.9
				},
				"eyebrowLeftOuter" : {
					"x" : 1063.1,
					"y" : 1071.1
				},
				"noseLeftAlarTop" : {
					"x" : 1100.9,
					"y" : 1094.1
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.7,
					"moustache" : 0.6,
					"sideburns" : 0.3
				},
				"age" : 28.9,
				"smile" : 0.999,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 0.6,
					"pitch" : 0.0,
					"roll" : -5.0
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.38
				},
				"emotion" : {
					"neutral" : 0.001,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.999,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.61,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.56
						},
						{
							"color" : "gray",
							"confidence" : 0.32
						},
						{
							"color" : "blond",
							"confidence" : 0.21
						},
						{
							"color" : "other",
							"confidence" : 0.18
						},
						{
							"color" : "red",
							"confidence" : 0.07
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 114,
				"height" : 114,
				"top" : 1599,
				"left" : 2625
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2695.2,
					"y" : 1631.7
				},
				"eyeLeftTop" : {
					"x" : 2656.3,
					"y" : 1623.7
				},
				"eyebrowLeftInner" : {
					"x" : 2678.1,
					"y" : 1615.5
				},
				"upperLipTop" : {
					"x" : 2686.6,
					"y" : 1676.6
				},
				"noseRightAlarOutTip" : {
					"x" : 2703.8,
					"y" : 1661.4
				},
				"noseRootLeft" : {
					"x" : 2680.1,
					"y" : 1630.0
				},
				"noseTip" : {
					"x" : 2690.9,
					"y" : 1656.0
				},
				"pupilLeft" : {
					"x" : 2655.2,
					"y" : 1627.2
				},
				"mouthRight" : {
					"x" : 2701.1,
					"y" : 1686.7
				},
				"pupilRight" : {
					"x" : 2707.2,
					"y" : 1635.0
				},
				"eyeRightInner" : {
					"x" : 2701.3,
					"y" : 1634.2
				},
				"noseRightAlarTop" : {
					"x" : 2699.9,
					"y" : 1650.5
				},
				"eyeRightBottom" : {
					"x" : 2708.7,
					"y" : 1637.0
				},
				"eyeLeftOuter" : {
					"x" : 2647.1,
					"y" : 1625.6
				},
				"eyebrowRightOuter" : {
					"x" : 2729.5,
					"y" : 1623.1
				},
				"eyeLeftInner" : {
					"x" : 2666.1,
					"y" : 1628.3
				},
				"underLipBottom" : {
					"x" : 2684.8,
					"y" : 1691.3
				},
				"eyebrowRightInner" : {
					"x" : 2701.7,
					"y" : 1618.8
				},
				"eyeLeftBottom" : {
					"x" : 2655.9,
					"y" : 1629.1
				},
				"eyeRightTop" : {
					"x" : 2709.5,
					"y" : 1632.4
				},
				"noseLeftAlarOutTip" : {
					"x" : 2668.6,
					"y" : 1656.9
				},
				"upperLipBottom" : {
					"x" : 2686.3,
					"y" : 1681.7
				},
				"mouthLeft" : {
					"x" : 2657.6,
					"y" : 1682.0
				},
				"eyeRightOuter" : {
					"x" : 2716.5,
					"y" : 1636.5
				},
				"underLipTop" : {
					"x" : 2684.6,
					"y" : 1685.1
				},
				"eyebrowLeftOuter" : {
					"x" : 2636.6,
					"y" : 1613.0
				},
				"noseLeftAlarTop" : {
					"x" : 2677.2,
					"y" : 1647.4
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.1,
					"moustache" : 0.0,
					"sideburns" : 0.1
				},
				"age" : 19.0,
				"smile" : 0.039,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 19.6,
					"pitch" : 0.0,
					"roll" : 3.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.13
				},
				"emotion" : {
					"neutral" : 0.96,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.039,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.08
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.82,
					"exposureLevel" : "overExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.0,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.98
						},
						{
							"color" : "other",
							"confidence" : 0.27
						},
						{
							"color" : "red",
							"confidence" : 0.12
						},
						{
							"color" : "blond",
							"confidence" : 0.04
						},
						{
							"color" : "gray",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 111,
				"height" : 111,
				"top" : 1642,
				"left" : 392
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 453.2,
					"y" : 1675.4
				},
				"eyeLeftTop" : {
					"x" : 424.0,
					"y" : 1672.2
				},
				"eyebrowLeftInner" : {
					"x" : 434.4,
					"y" : 1662.0
				},
				"upperLipTop" : {
					"x" : 443.1,
					"y" : 1716.1
				},
				"noseRightAlarOutTip" : {
					"x" : 462.8,
					"y" : 1699.1
				},
				"noseRootLeft" : {
					"x" : 437.8,
					"y" : 1675.8
				},
				"noseTip" : {
					"x" : 443.4,
					"y" : 1696.5
				},
				"pupilLeft" : {
					"x" : 426.2,
					"y" : 1676.0
				},
				"mouthRight" : {
					"x" : 470.6,
					"y" : 1722.3
				},
				"pupilRight" : {
					"x" : 474.8,
					"y" : 1671.9
				},
				"eyeRightInner" : {
					"x" : 465.2,
					"y" : 1673.3
				},
				"noseRightAlarTop" : {
					"x" : 457.1,
					"y" : 1689.8
				},
				"eyeRightBottom" : {
					"x" : 473.8,
					"y" : 1675.3
				},
				"eyeLeftOuter" : {
					"x" : 416.8,
					"y" : 1676.7
				},
				"eyebrowRightOuter" : {
					"x" : 490.6,
					"y" : 1661.7
				},
				"eyeLeftInner" : {
					"x" : 431.6,
					"y" : 1675.9
				},
				"underLipBottom" : {
					"x" : 443.0,
					"y" : 1735.1
				},
				"eyebrowRightInner" : {
					"x" : 455.1,
					"y" : 1662.3
				},
				"eyeLeftBottom" : {
					"x" : 424.0,
					"y" : 1678.6
				},
				"eyeRightTop" : {
					"x" : 472.3,
					"y" : 1668.7
				},
				"noseLeftAlarOutTip" : {
					"x" : 428.2,
					"y" : 1700.2
				},
				"upperLipBottom" : {
					"x" : 443.4,
					"y" : 1720.1
				},
				"mouthLeft" : {
					"x" : 420.5,
					"y" : 1724.8
				},
				"eyeRightOuter" : {
					"x" : 481.9,
					"y" : 1671.5
				},
				"underLipTop" : {
					"x" : 442.4,
					"y" : 1729.6
				},
				"eyebrowLeftOuter" : {
					"x" : 405.9,
					"y" : 1669.1
				},
				"noseLeftAlarTop" : {
					"x" : 433.9,
					"y" : 1690.1
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 24.5,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -8.6,
					"pitch" : 0.0,
					"roll" : 0.6
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.7
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.35
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.5,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.06,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.95
						},
						{
							"color" : "black",
							"confidence" : 0.77
						},
						{
							"color" : "other",
							"confidence" : 0.76
						},
						{
							"color" : "red",
							"confidence" : 0.36
						},
						{
							"color" : "blond",
							"confidence" : 0.18
						},
						{
							"color" : "gray",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 109,
				"height" : 109,
				"top" : 1158,
				"left" : 392
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 456.9,
					"y" : 1192.1
				},
				"eyeLeftTop" : {
					"x" : 424.7,
					"y" : 1184.4
				},
				"eyebrowLeftInner" : {
					"x" : 439.6,
					"y" : 1179.6
				},
				"upperLipTop" : {
					"x" : 445.0,
					"y" : 1231.1
				},
				"noseRightAlarOutTip" : {
					"x" : 462.7,
					"y" : 1218.4
				},
				"noseRootLeft" : {
					"x" : 440.8,
					"y" : 1190.8
				},
				"noseTip" : {
					"x" : 447.3,
					"y" : 1218.0
				},
				"pupilLeft" : {
					"x" : 424.9,
					"y" : 1186.3
				},
				"mouthRight" : {
					"x" : 468.9,
					"y" : 1238.2
				},
				"pupilRight" : {
					"x" : 474.1,
					"y" : 1190.6
				},
				"eyeRightInner" : {
					"x" : 466.1,
					"y" : 1191.6
				},
				"noseRightAlarTop" : {
					"x" : 458.4,
					"y" : 1209.5
				},
				"eyeRightBottom" : {
					"x" : 473.9,
					"y" : 1194.0
				},
				"eyeLeftOuter" : {
					"x" : 416.5,
					"y" : 1186.4
				},
				"eyebrowRightOuter" : {
					"x" : 496.4,
					"y" : 1183.7
				},
				"eyeLeftInner" : {
					"x" : 431.6,
					"y" : 1188.7
				},
				"underLipBottom" : {
					"x" : 442.7,
					"y" : 1255.6
				},
				"eyebrowRightInner" : {
					"x" : 462.9,
					"y" : 1182.6
				},
				"eyeLeftBottom" : {
					"x" : 423.5,
					"y" : 1190.2
				},
				"eyeRightTop" : {
					"x" : 474.5,
					"y" : 1187.9
				},
				"noseLeftAlarOutTip" : {
					"x" : 429.8,
					"y" : 1215.6
				},
				"upperLipBottom" : {
					"x" : 444.8,
					"y" : 1235.8
				},
				"mouthLeft" : {
					"x" : 420.0,
					"y" : 1234.7
				},
				"eyeRightOuter" : {
					"x" : 481.3,
					"y" : 1192.5
				},
				"underLipTop" : {
					"x" : 443.8,
					"y" : 1249.2
				},
				"eyebrowLeftOuter" : {
					"x" : 407.8,
					"y" : 1175.2
				},
				"noseLeftAlarTop" : {
					"x" : 434.2,
					"y" : 1207.8
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 25.4,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 1.6,
					"pitch" : 0.0,
					"roll" : 5.7
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.83
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.4
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.45,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.66
						},
						{
							"color" : "blond",
							"confidence" : 0.56
						},
						{
							"color" : "other",
							"confidence" : 0.33
						},
						{
							"color" : "red",
							"confidence" : 0.05
						},
						{
							"color" : "gray",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 99,
				"height" : 99,
				"top" : 1712,
				"left" : 2422
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 2474.3,
					"y" : 1739.9
				},
				"eyeLeftTop" : {
					"x" : 2443.2,
					"y" : 1741.6
				},
				"eyebrowLeftInner" : {
					"x" : 2456.4,
					"y" : 1731.1
				},
				"upperLipTop" : {
					"x" : 2476.1,
					"y" : 1781.3
				},
				"noseRightAlarOutTip" : {
					"x" : 2489.3,
					"y" : 1761.9
				},
				"noseRootLeft" : {
					"x" : 2462.0,
					"y" : 1741.9
				},
				"noseTip" : {
					"x" : 2475.3,
					"y" : 1762.1
				},
				"pupilLeft" : {
					"x" : 2445.7,
					"y" : 1743.8
				},
				"mouthRight" : {
					"x" : 2495.7,
					"y" : 1781.5
				},
				"pupilRight" : {
					"x" : 2488.6,
					"y" : 1737.3
				},
				"eyeRightInner" : {
					"x" : 2481.7,
					"y" : 1739.4
				},
				"noseRightAlarTop" : {
					"x" : 2482.9,
					"y" : 1754.2
				},
				"eyeRightBottom" : {
					"x" : 2489.1,
					"y" : 1740.6
				},
				"eyeLeftOuter" : {
					"x" : 2437.0,
					"y" : 1745.6
				},
				"eyebrowRightOuter" : {
					"x" : 2502.7,
					"y" : 1725.6
				},
				"eyeLeftInner" : {
					"x" : 2451.9,
					"y" : 1743.4
				},
				"underLipBottom" : {
					"x" : 2477.7,
					"y" : 1794.8
				},
				"eyebrowRightInner" : {
					"x" : 2472.6,
					"y" : 1728.5
				},
				"eyeLeftBottom" : {
					"x" : 2444.5,
					"y" : 1746.9
				},
				"eyeRightTop" : {
					"x" : 2488.3,
					"y" : 1735.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 2457.6,
					"y" : 1767.4
				},
				"upperLipBottom" : {
					"x" : 2476.4,
					"y" : 1784.8
				},
				"mouthLeft" : {
					"x" : 2453.7,
					"y" : 1788.7
				},
				"eyeRightOuter" : {
					"x" : 2496.2,
					"y" : 1737.4
				},
				"underLipTop" : {
					"x" : 2476.9,
					"y" : 1790.0
				},
				"eyebrowLeftOuter" : {
					"x" : 2422.7,
					"y" : 1736.8
				},
				"noseLeftAlarTop" : {
					"x" : 2460.5,
					"y" : 1759.4
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 27.6,
				"smile" : 0.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 7.9,
					"pitch" : 0.0,
					"roll" : -10.8
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : true
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.11
				},
				"emotion" : {
					"neutral" : 0.999,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.0,
					"anger" : 0.0,
					"sadness" : 0.001,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.54,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.09,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.57
						},
						{
							"color" : "blond",
							"confidence" : 0.47
						},
						{
							"color" : "other",
							"confidence" : 0.44
						},
						{
							"color" : "red",
							"confidence" : 0.2
						},
						{
							"color" : "gray",
							"confidence" : 0.06
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 92,
				"height" : 92,
				"top" : 1227,
				"left" : 859
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 905.7,
					"y" : 1252.3
				},
				"eyeLeftTop" : {
					"x" : 882.5,
					"y" : 1252.8
				},
				"eyebrowLeftInner" : {
					"x" : 889.2,
					"y" : 1244.2
				},
				"upperLipTop" : {
					"x" : 907.1,
					"y" : 1290.3
				},
				"noseRightAlarOutTip" : {
					"x" : 917.0,
					"y" : 1274.2
				},
				"noseRootLeft" : {
					"x" : 895.1,
					"y" : 1253.4
				},
				"noseTip" : {
					"x" : 900.4,
					"y" : 1276.5
				},
				"pupilLeft" : {
					"x" : 881.6,
					"y" : 1254.4
				},
				"mouthRight" : {
					"x" : 930.3,
					"y" : 1291.3
				},
				"pupilRight" : {
					"x" : 919.8,
					"y" : 1249.3
				},
				"eyeRightInner" : {
					"x" : 914.3,
					"y" : 1250.4
				},
				"noseRightAlarTop" : {
					"x" : 910.5,
					"y" : 1267.9
				},
				"eyeRightBottom" : {
					"x" : 921.9,
					"y" : 1250.9
				},
				"eyeLeftOuter" : {
					"x" : 875.5,
					"y" : 1254.8
				},
				"eyebrowRightOuter" : {
					"x" : 934.4,
					"y" : 1235.7
				},
				"eyeLeftInner" : {
					"x" : 890.4,
					"y" : 1254.0
				},
				"underLipBottom" : {
					"x" : 910.8,
					"y" : 1309.8
				},
				"eyebrowRightInner" : {
					"x" : 906.9,
					"y" : 1242.3
				},
				"eyeLeftBottom" : {
					"x" : 883.0,
					"y" : 1256.2
				},
				"eyeRightTop" : {
					"x" : 921.1,
					"y" : 1247.3
				},
				"noseLeftAlarOutTip" : {
					"x" : 890.9,
					"y" : 1278.6
				},
				"upperLipBottom" : {
					"x" : 907.8,
					"y" : 1294.2
				},
				"mouthLeft" : {
					"x" : 892.6,
					"y" : 1296.8
				},
				"eyeRightOuter" : {
					"x" : 928.5,
					"y" : 1247.4
				},
				"underLipTop" : {
					"x" : 909.9,
					"y" : 1305.6
				},
				"eyebrowLeftOuter" : {
					"x" : 866.5,
					"y" : 1243.6
				},
				"noseLeftAlarTop" : {
					"x" : 892.9,
					"y" : 1270.1
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 30.9,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : -17.4,
					"pitch" : 0.0,
					"roll" : -8.8
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.58
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.29
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.36,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 321,
				"height" : 321,
				"top" : 587,
				"left" : 1282
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1472.5,
					"y" : 677.6
				},
				"eyeLeftTop" : {
					"x" : 1369.2,
					"y" : 664.7
				},
				"eyebrowLeftInner" : {
					"x" : 1434.7,
					"y" : 643.4
				},
				"upperLipTop" : {
					"x" : 1441.1,
					"y" : 788.8
				},
				"noseRightAlarOutTip" : {
					"x" : 1492.3,
					"y" : 751.4
				},
				"noseRootLeft" : {
					"x" : 1426.2,
					"y" : 672.6
				},
				"noseTip" : {
					"x" : 1448.9,
					"y" : 738.5
				},
				"pupilLeft" : {
					"x" : 1365.6,
					"y" : 670.7
				},
				"mouthRight" : {
					"x" : 1495.3,
					"y" : 837.3
				},
				"pupilRight" : {
					"x" : 1518.3,
					"y" : 685.2
				},
				"eyeRightInner" : {
					"x" : 1495.1,
					"y" : 681.5
				},
				"noseRightAlarTop" : {
					"x" : 1483.0,
					"y" : 723.0
				},
				"eyeRightBottom" : {
					"x" : 1520.8,
					"y" : 691.6
				},
				"eyeLeftOuter" : {
					"x" : 1344.3,
					"y" : 668.3
				},
				"eyebrowRightOuter" : {
					"x" : 1577.3,
					"y" : 674.5
				},
				"eyeLeftInner" : {
					"x" : 1393.3,
					"y" : 670.5
				},
				"underLipBottom" : {
					"x" : 1436.2,
					"y" : 858.8
				},
				"eyebrowRightInner" : {
					"x" : 1477.1,
					"y" : 647.6
				},
				"eyeLeftBottom" : {
					"x" : 1367.6,
					"y" : 675.0
				},
				"eyeRightTop" : {
					"x" : 1523.5,
					"y" : 680.7
				},
				"noseLeftAlarOutTip" : {
					"x" : 1396.2,
					"y" : 741.4
				},
				"upperLipBottom" : {
					"x" : 1439.6,
					"y" : 800.7
				},
				"mouthLeft" : {
					"x" : 1384.0,
					"y" : 822.4
				},
				"eyeRightOuter" : {
					"x" : 1546.8,
					"y" : 689.9
				},
				"underLipTop" : {
					"x" : 1437.5,
					"y" : 843.5
				},
				"eyebrowLeftOuter" : {
					"x" : 1313.8,
					"y" : 648.2
				},
				"noseLeftAlarTop" : {
					"x" : 1410.2,
					"y" : 720.9
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.2,
					"moustache" : 0.3,
					"sideburns" : 0.4
				},
				"age" : 26.2,
				"smile" : 0.024,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 3.1,
					"pitch" : 0.0,
					"roll" : 4.2
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.82
				},
				"emotion" : {
					"neutral" : 0.229,
					"surprise" : 0.166,
					"contempt" : 0.001,
					"happiness" : 0.024,
					"anger" : 0.433,
					"sadness" : 0.035,
					"disgust" : 0.023,
					"fear" : 0.088
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.57,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.04,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.78
						},
						{
							"color" : "blond",
							"confidence" : 0.72
						},
						{
							"color" : "gray",
							"confidence" : 0.64
						},
						{
							"color" : "other",
							"confidence" : 0.53
						},
						{
							"color" : "black",
							"confidence" : 0.38
						},
						{
							"color" : "red",
							"confidence" : 0.08
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 152,
				"height" : 152,
				"top" : 483,
				"left" : 319
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 396.3,
					"y" : 527.0
				},
				"eyeLeftTop" : {
					"x" : 359.7,
					"y" : 527.9
				},
				"eyebrowLeftInner" : {
					"x" : 370.2,
					"y" : 516.6
				},
				"upperLipTop" : {
					"x" : 397.1,
					"y" : 594.8
				},
				"noseRightAlarOutTip" : {
					"x" : 414.8,
					"y" : 564.8
				},
				"noseRootLeft" : {
					"x" : 378.6,
					"y" : 529.6
				},
				"noseTip" : {
					"x" : 386.5,
					"y" : 562.9
				},
				"pupilLeft" : {
					"x" : 359.7,
					"y" : 529.6
				},
				"mouthRight" : {
					"x" : 433.0,
					"y" : 592.1
				},
				"pupilRight" : {
					"x" : 423.2,
					"y" : 518.3
				},
				"eyeRightInner" : {
					"x" : 413.9,
					"y" : 522.2
				},
				"noseRightAlarTop" : {
					"x" : 403.6,
					"y" : 551.1
				},
				"eyeRightBottom" : {
					"x" : 425.0,
					"y" : 524.4
				},
				"eyeLeftOuter" : {
					"x" : 351.9,
					"y" : 534.6
				},
				"eyebrowRightOuter" : {
					"x" : 451.9,
					"y" : 509.8
				},
				"eyeLeftInner" : {
					"x" : 370.2,
					"y" : 530.6
				},
				"underLipBottom" : {
					"x" : 399.4,
					"y" : 601.0
				},
				"eyebrowRightInner" : {
					"x" : 401.1,
					"y" : 511.6
				},
				"eyeLeftBottom" : {
					"x" : 361.4,
					"y" : 535.7
				},
				"eyeRightTop" : {
					"x" : 423.3,
					"y" : 515.0
				},
				"noseLeftAlarOutTip" : {
					"x" : 373.0,
					"y" : 569.2
				},
				"upperLipBottom" : {
					"x" : 398.2,
					"y" : 599.8
				},
				"mouthLeft" : {
					"x" : 374.9,
					"y" : 599.8
				},
				"eyeRightOuter" : {
					"x" : 434.4,
					"y" : 519.1
				},
				"underLipTop" : {
					"x" : 397.9,
					"y" : 593.7
				},
				"eyebrowLeftOuter" : {
					"x" : 331.3,
					"y" : 527.2
				},
				"noseLeftAlarTop" : {
					"x" : 374.6,
					"y" : 554.7
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 31.6,
				"smile" : 0.028,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -22.7,
					"pitch" : 0.0,
					"roll" : -7.8
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.26
				},
				"emotion" : {
					"neutral" : 0.94,
					"surprise" : 0.0,
					"contempt" : 0.023,
					"happiness" : 0.028,
					"anger" : 0.008,
					"sadness" : 0.001,
					"disgust" : 0.001,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.07
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.59,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.03,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.57
						},
						{
							"color" : "other",
							"confidence" : 0.43
						},
						{
							"color" : "blond",
							"confidence" : 0.39
						},
						{
							"color" : "gray",
							"confidence" : 0.11
						},
						{
							"color" : "red",
							"confidence" : 0.06
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 140,
				"height" : 140,
				"top" : 526,
				"left" : 915
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 997.0,
					"y" : 570.0
				},
				"eyeLeftTop" : {
					"x" : 957.9,
					"y" : 562.5
				},
				"eyebrowLeftInner" : {
					"x" : 970.5,
					"y" : 549.8
				},
				"upperLipTop" : {
					"x" : 978.7,
					"y" : 616.0
				},
				"noseRightAlarOutTip" : {
					"x" : 1006.8,
					"y" : 601.2
				},
				"noseRootLeft" : {
					"x" : 975.6,
					"y" : 568.6
				},
				"noseTip" : {
					"x" : 978.4,
					"y" : 595.2
				},
				"pupilLeft" : {
					"x" : 957.9,
					"y" : 566.0
				},
				"mouthRight" : {
					"x" : 1014.0,
					"y" : 630.3
				},
				"pupilRight" : {
					"x" : 1024.3,
					"y" : 569.4
				},
				"eyeRightInner" : {
					"x" : 1012.5,
					"y" : 570.1
				},
				"noseRightAlarTop" : {
					"x" : 999.0,
					"y" : 587.7
				},
				"eyeRightBottom" : {
					"x" : 1022.9,
					"y" : 572.8
				},
				"eyeLeftOuter" : {
					"x" : 946.7,
					"y" : 566.4
				},
				"eyebrowRightOuter" : {
					"x" : 1052.1,
					"y" : 560.9
				},
				"eyeLeftInner" : {
					"x" : 966.2,
					"y" : 568.2
				},
				"underLipBottom" : {
					"x" : 976.6,
					"y" : 642.9
				},
				"eyebrowRightInner" : {
					"x" : 1001.6,
					"y" : 550.6
				},
				"eyeLeftBottom" : {
					"x" : 956.2,
					"y" : 569.2
				},
				"eyeRightTop" : {
					"x" : 1022.8,
					"y" : 565.9
				},
				"noseLeftAlarOutTip" : {
					"x" : 956.5,
					"y" : 596.1
				},
				"upperLipBottom" : {
					"x" : 977.9,
					"y" : 623.1
				},
				"mouthLeft" : {
					"x" : 951.3,
					"y" : 626.4
				},
				"eyeRightOuter" : {
					"x" : 1032.9,
					"y" : 570.8
				},
				"underLipTop" : {
					"x" : 977.3,
					"y" : 635.1
				},
				"eyebrowLeftOuter" : {
					"x" : 930.9,
					"y" : 549.9
				},
				"noseLeftAlarTop" : {
					"x" : 966.8,
					"y" : 585.1
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.8,
					"moustache" : 0.5,
					"sideburns" : 0.8
				},
				"age" : 29.9,
				"smile" : 1.0,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : -11.6,
					"pitch" : 0.0,
					"roll" : 6.6
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.03
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.41,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 109,
				"height" : 109,
				"top" : 378,
				"left" : 1103
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1160.7,
					"y" : 407.2
				},
				"eyeLeftTop" : {
					"x" : 1133.8,
					"y" : 406.5
				},
				"eyebrowLeftInner" : {
					"x" : 1143.2,
					"y" : 400.0
				},
				"upperLipTop" : {
					"x" : 1157.0,
					"y" : 453.8
				},
				"noseRightAlarOutTip" : {
					"x" : 1170.2,
					"y" : 437.2
				},
				"noseRootLeft" : {
					"x" : 1148.1,
					"y" : 408.9
				},
				"noseTip" : {
					"x" : 1154.4,
					"y" : 435.7
				},
				"pupilLeft" : {
					"x" : 1133.8,
					"y" : 408.4
				},
				"mouthRight" : {
					"x" : 1178.0,
					"y" : 459.3
				},
				"pupilRight" : {
					"x" : 1180.1,
					"y" : 403.9
				},
				"eyeRightInner" : {
					"x" : 1171.2,
					"y" : 405.8
				},
				"noseRightAlarTop" : {
					"x" : 1164.2,
					"y" : 426.4
				},
				"eyeRightBottom" : {
					"x" : 1179.7,
					"y" : 407.9
				},
				"eyeLeftOuter" : {
					"x" : 1126.5,
					"y" : 409.9
				},
				"eyebrowRightOuter" : {
					"x" : 1199.5,
					"y" : 394.5
				},
				"eyeLeftInner" : {
					"x" : 1141.0,
					"y" : 408.6
				},
				"underLipBottom" : {
					"x" : 1157.5,
					"y" : 468.8
				},
				"eyebrowRightInner" : {
					"x" : 1161.5,
					"y" : 398.6
				},
				"eyeLeftBottom" : {
					"x" : 1133.8,
					"y" : 411.5
				},
				"eyeRightTop" : {
					"x" : 1179.2,
					"y" : 402.0
				},
				"noseLeftAlarOutTip" : {
					"x" : 1142.5,
					"y" : 439.2
				},
				"upperLipBottom" : {
					"x" : 1157.0,
					"y" : 458.9
				},
				"mouthLeft" : {
					"x" : 1143.3,
					"y" : 462.2
				},
				"eyeRightOuter" : {
					"x" : 1187.3,
					"y" : 404.2
				},
				"underLipTop" : {
					"x" : 1157.4,
					"y" : 462.3
				},
				"eyebrowLeftOuter" : {
					"x" : 1114.4,
					"y" : 403.1
				},
				"noseLeftAlarTop" : {
					"x" : 1145.8,
					"y" : 427.9
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.2,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 26.9,
				"smile" : 0.0,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -9.5,
					"pitch" : 0.0,
					"roll" : -3.6
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.7
				},
				"emotion" : {
					"neutral" : 0.987,
					"surprise" : 0.002,
					"contempt" : 0.001,
					"happiness" : 0.0,
					"anger" : 0.002,
					"sadness" : 0.008,
					"disgust" : 0.001,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.1
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.77,
					"exposureLevel" : "overExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.17,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.94
						},
						{
							"color" : "red",
							"confidence" : 0.2
						},
						{
							"color" : "other",
							"confidence" : 0.19
						},
						{
							"color" : "blond",
							"confidence" : 0.16
						},
						{
							"color" : "gray",
							"confidence" : 0.06
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 88,
				"height" : 88,
				"top" : 448,
				"left" : 813
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 862.1,
					"y" : 472.9
				},
				"eyeLeftTop" : {
					"x" : 843.3,
					"y" : 468.7
				},
				"eyebrowLeftInner" : {
					"x" : 847.5,
					"y" : 460.0
				},
				"upperLipTop" : {
					"x" : 852.0,
					"y" : 506.3
				},
				"noseRightAlarOutTip" : {
					"x" : 866.6,
					"y" : 495.3
				},
				"noseRootLeft" : {
					"x" : 852.7,
					"y" : 471.6
				},
				"noseTip" : {
					"x" : 850.1,
					"y" : 491.3
				},
				"pupilLeft" : {
					"x" : 843.9,
					"y" : 471.0
				},
				"mouthRight" : {
					"x" : 875.4,
					"y" : 516.2
				},
				"pupilRight" : {
					"x" : 877.2,
					"y" : 473.2
				},
				"eyeRightInner" : {
					"x" : 871.4,
					"y" : 472.9
				},
				"noseRightAlarTop" : {
					"x" : 862.3,
					"y" : 488.0
				},
				"eyeRightBottom" : {
					"x" : 877.2,
					"y" : 474.5
				},
				"eyeLeftOuter" : {
					"x" : 838.4,
					"y" : 470.4
				},
				"eyebrowRightOuter" : {
					"x" : 894.0,
					"y" : 464.8
				},
				"eyeLeftInner" : {
					"x" : 848.5,
					"y" : 471.4
				},
				"underLipBottom" : {
					"x" : 852.0,
					"y" : 531.8
				},
				"eyebrowRightInner" : {
					"x" : 864.1,
					"y" : 460.4
				},
				"eyeLeftBottom" : {
					"x" : 843.2,
					"y" : 472.5
				},
				"eyeRightTop" : {
					"x" : 877.4,
					"y" : 471.2
				},
				"noseLeftAlarOutTip" : {
					"x" : 840.6,
					"y" : 491.1
				},
				"upperLipBottom" : {
					"x" : 852.0,
					"y" : 510.3
				},
				"mouthLeft" : {
					"x" : 839.3,
					"y" : 513.5
				},
				"eyeRightOuter" : {
					"x" : 883.5,
					"y" : 474.3
				},
				"underLipTop" : {
					"x" : 852.1,
					"y" : 526.0
				},
				"eyebrowLeftOuter" : {
					"x" : 829.4,
					"y" : 460.0
				},
				"noseLeftAlarTop" : {
					"x" : 845.7,
					"y" : 485.2
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 13.2,
				"smile" : 0.999,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -27.4,
					"pitch" : 0.0,
					"roll" : 6.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.58
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.001,
					"contempt" : 0.0,
					"happiness" : 0.999,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.66
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.55,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.87
						},
						{
							"color" : "other",
							"confidence" : 0.64
						},
						{
							"color" : "red",
							"confidence" : 0.15
						},
						{
							"color" : "blond",
							"confidence" : 0.03
						},
						{
							"color" : "gray",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 88,
				"height" : 88,
				"top" : 318,
				"left" : 903
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 952.3,
					"y" : 344.6
				},
				"eyeLeftTop" : {
					"x" : 923.3,
					"y" : 341.8
				},
				"eyebrowLeftInner" : {
					"x" : 935.7,
					"y" : 331.9
				},
				"upperLipTop" : {
					"x" : 947.6,
					"y" : 376.5
				},
				"noseRightAlarOutTip" : {
					"x" : 962.0,
					"y" : 365.9
				},
				"noseRootLeft" : {
					"x" : 940.0,
					"y" : 344.6
				},
				"noseTip" : {
					"x" : 947.1,
					"y" : 366.2
				},
				"pupilLeft" : {
					"x" : 924.1,
					"y" : 343.4
				},
				"mouthRight" : {
					"x" : 966.6,
					"y" : 380.6
				},
				"pupilRight" : {
					"x" : 967.7,
					"y" : 343.9
				},
				"eyeRightInner" : {
					"x" : 960.1,
					"y" : 344.0
				},
				"noseRightAlarTop" : {
					"x" : 956.4,
					"y" : 358.8
				},
				"eyeRightBottom" : {
					"x" : 967.8,
					"y" : 345.8
				},
				"eyeLeftOuter" : {
					"x" : 914.6,
					"y" : 343.5
				},
				"eyebrowRightOuter" : {
					"x" : 983.4,
					"y" : 336.7
				},
				"eyeLeftInner" : {
					"x" : 930.8,
					"y" : 344.0
				},
				"underLipBottom" : {
					"x" : 946.9,
					"y" : 392.8
				},
				"eyebrowRightInner" : {
					"x" : 957.5,
					"y" : 331.9
				},
				"eyeLeftBottom" : {
					"x" : 922.8,
					"y" : 345.6
				},
				"eyeRightTop" : {
					"x" : 967.1,
					"y" : 342.4
				},
				"noseLeftAlarOutTip" : {
					"x" : 933.0,
					"y" : 367.3
				},
				"upperLipBottom" : {
					"x" : 947.3,
					"y" : 379.8
				},
				"mouthLeft" : {
					"x" : 927.2,
					"y" : 381.0
				},
				"eyeRightOuter" : {
					"x" : 974.5,
					"y" : 344.2
				},
				"underLipTop" : {
					"x" : 947.2,
					"y" : 388.1
				},
				"eyebrowLeftOuter" : {
					"x" : 906.2,
					"y" : 334.8
				},
				"noseLeftAlarTop" : {
					"x" : 937.0,
					"y" : 359.8
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 8.6,
				"smile" : 0.826,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 0.9,
						"type" : "glasses"
					},
					{
						"confidence" : 0.99,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : 3.5,
					"pitch" : 0.0,
					"roll" : -1.0
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.92
				},
				"emotion" : {
					"neutral" : 0.02,
					"surprise" : 0.103,
					"contempt" : 0.0,
					"happiness" : 0.826,
					"anger" : 0.003,
					"sadness" : 0.035,
					"disgust" : 0.0,
					"fear" : 0.012
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.5,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 84,
				"height" : 84,
				"top" : 312,
				"left" : 375
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 422.2,
					"y" : 335.1
				},
				"eyeLeftTop" : {
					"x" : 400.6,
					"y" : 331.4
				},
				"eyebrowLeftInner" : {
					"x" : 407.8,
					"y" : 326.8
				},
				"upperLipTop" : {
					"x" : 417.7,
					"y" : 371.1
				},
				"noseRightAlarOutTip" : {
					"x" : 427.6,
					"y" : 358.2
				},
				"noseRootLeft" : {
					"x" : 411.9,
					"y" : 335.6
				},
				"noseTip" : {
					"x" : 417.2,
					"y" : 358.1
				},
				"pupilLeft" : {
					"x" : 400.9,
					"y" : 333.8
				},
				"mouthRight" : {
					"x" : 432.3,
					"y" : 375.9
				},
				"pupilRight" : {
					"x" : 434.5,
					"y" : 333.1
				},
				"eyeRightInner" : {
					"x" : 429.2,
					"y" : 334.3
				},
				"noseRightAlarTop" : {
					"x" : 424.8,
					"y" : 352.8
				},
				"eyeRightBottom" : {
					"x" : 435.3,
					"y" : 336.4
				},
				"eyeLeftOuter" : {
					"x" : 394.8,
					"y" : 334.3
				},
				"eyebrowRightOuter" : {
					"x" : 449.3,
					"y" : 323.4
				},
				"eyeLeftInner" : {
					"x" : 407.0,
					"y" : 334.8
				},
				"underLipBottom" : {
					"x" : 417.6,
					"y" : 383.3
				},
				"eyebrowRightInner" : {
					"x" : 424.1,
					"y" : 326.5
				},
				"eyeLeftBottom" : {
					"x" : 400.8,
					"y" : 337.4
				},
				"eyeRightTop" : {
					"x" : 434.2,
					"y" : 330.6
				},
				"noseLeftAlarOutTip" : {
					"x" : 405.9,
					"y" : 359.1
				},
				"upperLipBottom" : {
					"x" : 417.7,
					"y" : 374.5
				},
				"mouthLeft" : {
					"x" : 403.2,
					"y" : 376.3
				},
				"eyeRightOuter" : {
					"x" : 440.7,
					"y" : 332.6
				},
				"underLipTop" : {
					"x" : 417.6,
					"y" : 377.6
				},
				"eyebrowLeftOuter" : {
					"x" : 384.4,
					"y" : 326.6
				},
				"noseLeftAlarTop" : {
					"x" : 409.4,
					"y" : 352.9
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 14.3,
				"smile" : 0.012,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -4.0,
					"pitch" : 0.0,
					"roll" : -1.0
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 1.0
				},
				"emotion" : {
					"neutral" : 0.975,
					"surprise" : 0.003,
					"contempt" : 0.0,
					"happiness" : 0.012,
					"anger" : 0.0,
					"sadness" : 0.01,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.62,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.92
						},
						{
							"color" : "black",
							"confidence" : 0.79
						},
						{
							"color" : "blond",
							"confidence" : 0.6
						},
						{
							"color" : "other",
							"confidence" : 0.52
						},
						{
							"color" : "red",
							"confidence" : 0.3
						},
						{
							"color" : "gray",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 76,
				"height" : 76,
				"top" : 344,
				"left" : 667
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 712.7,
					"y" : 367.8
				},
				"eyeLeftTop" : {
					"x" : 691.4,
					"y" : 359.1
				},
				"eyebrowLeftInner" : {
					"x" : 700.4,
					"y" : 356.5
				},
				"upperLipTop" : {
					"x" : 701.6,
					"y" : 396.9
				},
				"noseRightAlarOutTip" : {
					"x" : 714.3,
					"y" : 386.6
				},
				"noseRootLeft" : {
					"x" : 702.1,
					"y" : 365.9
				},
				"noseTip" : {
					"x" : 704.1,
					"y" : 383.5
				},
				"pupilLeft" : {
					"x" : 691.2,
					"y" : 361.9
				},
				"mouthRight" : {
					"x" : 716.1,
					"y" : 402.4
				},
				"pupilRight" : {
					"x" : 725.6,
					"y" : 368.1
				},
				"eyeRightInner" : {
					"x" : 719.7,
					"y" : 368.2
				},
				"noseRightAlarTop" : {
					"x" : 712.1,
					"y" : 381.0
				},
				"eyeRightBottom" : {
					"x" : 725.5,
					"y" : 371.1
				},
				"eyeLeftOuter" : {
					"x" : 684.5,
					"y" : 361.2
				},
				"eyebrowRightOuter" : {
					"x" : 742.5,
					"y" : 364.0
				},
				"eyeLeftInner" : {
					"x" : 696.5,
					"y" : 364.0
				},
				"underLipBottom" : {
					"x" : 698.6,
					"y" : 406.5
				},
				"eyebrowRightInner" : {
					"x" : 717.5,
					"y" : 360.0
				},
				"eyeLeftBottom" : {
					"x" : 689.6,
					"y" : 364.5
				},
				"eyeRightTop" : {
					"x" : 726.5,
					"y" : 366.0
				},
				"noseLeftAlarOutTip" : {
					"x" : 693.5,
					"y" : 383.0
				},
				"upperLipBottom" : {
					"x" : 701.0,
					"y" : 398.6
				},
				"mouthLeft" : {
					"x" : 686.5,
					"y" : 396.7
				},
				"eyeRightOuter" : {
					"x" : 731.5,
					"y" : 369.5
				},
				"underLipTop" : {
					"x" : 699.6,
					"y" : 402.6
				},
				"eyebrowLeftOuter" : {
					"x" : 676.2,
					"y" : 354.3
				},
				"noseLeftAlarTop" : {
					"x" : 697.6,
					"y" : 378.4
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.8,
					"moustache" : 0.6,
					"sideburns" : 0.4
				},
				"age" : 17.4,
				"smile" : 0.638,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -0.3,
					"pitch" : 0.0,
					"roll" : 11.1
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 1.0
				},
				"emotion" : {
					"neutral" : 0.205,
					"surprise" : 0.004,
					"contempt" : 0.0,
					"happiness" : 0.638,
					"anger" : 0.148,
					"sadness" : 0.001,
					"disgust" : 0.004,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.04
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.72,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.83
						},
						{
							"color" : "other",
							"confidence" : 0.25
						},
						{
							"color" : "red",
							"confidence" : 0.17
						},
						{
							"color" : "blond",
							"confidence" : 0.12
						},
						{
							"color" : "gray",
							"confidence" : 0.07
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 68,
				"height" : 68,
				"top" : 335,
				"left" : 1343
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1378.3,
					"y" : 355.1
				},
				"eyeLeftTop" : {
					"x" : 1357.3,
					"y" : 353.1
				},
				"eyebrowLeftInner" : {
					"x" : 1364.2,
					"y" : 349.4
				},
				"upperLipTop" : {
					"x" : 1380.0,
					"y" : 382.3
				},
				"noseRightAlarOutTip" : {
					"x" : 1387.6,
					"y" : 369.6
				},
				"noseRootLeft" : {
					"x" : 1369.2,
					"y" : 356.3
				},
				"noseTip" : {
					"x" : 1378.1,
					"y" : 374.2
				},
				"pupilLeft" : {
					"x" : 1359.1,
					"y" : 354.6
				},
				"mouthRight" : {
					"x" : 1393.9,
					"y" : 381.1
				},
				"pupilRight" : {
					"x" : 1388.8,
					"y" : 350.6
				},
				"eyeRightInner" : {
					"x" : 1383.2,
					"y" : 352.7
				},
				"noseRightAlarTop" : {
					"x" : 1382.9,
					"y" : 366.7
				},
				"eyeRightBottom" : {
					"x" : 1389.0,
					"y" : 353.5
				},
				"eyeLeftOuter" : {
					"x" : 1352.2,
					"y" : 356.0
				},
				"eyebrowRightOuter" : {
					"x" : 1399.4,
					"y" : 342.2
				},
				"eyeLeftInner" : {
					"x" : 1363.4,
					"y" : 355.6
				},
				"underLipBottom" : {
					"x" : 1381.4,
					"y" : 391.5
				},
				"eyebrowRightInner" : {
					"x" : 1379.7,
					"y" : 347.4
				},
				"eyeLeftBottom" : {
					"x" : 1357.7,
					"y" : 358.1
				},
				"eyeRightTop" : {
					"x" : 1387.4,
					"y" : 348.8
				},
				"noseLeftAlarOutTip" : {
					"x" : 1368.0,
					"y" : 373.6
				},
				"upperLipBottom" : {
					"x" : 1380.3,
					"y" : 384.7
				},
				"mouthLeft" : {
					"x" : 1366.5,
					"y" : 385.6
				},
				"eyeRightOuter" : {
					"x" : 1393.3,
					"y" : 350.1
				},
				"underLipTop" : {
					"x" : 1380.8,
					"y" : 386.9
				},
				"eyebrowLeftOuter" : {
					"x" : 1342.2,
					"y" : 351.7
				},
				"noseLeftAlarTop" : {
					"x" : 1370.0,
					"y" : 369.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 18.0,
				"smile" : 0.111,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -0.3,
					"pitch" : 0.0,
					"roll" : -11.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.87
				},
				"emotion" : {
					"neutral" : 0.888,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.111,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.21
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.62,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.9
						},
						{
							"color" : "other",
							"confidence" : 0.54
						},
						{
							"color" : "red",
							"confidence" : 0.24
						},
						{
							"color" : "blond",
							"confidence" : 0.07
						},
						{
							"color" : "gray",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 90,
				"height" : 90,
				"top" : 729,
				"left" : 1588
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1638.3,
					"y" : 755.9
				},
				"eyeLeftTop" : {
					"x" : 1610.7,
					"y" : 753.7
				},
				"eyebrowLeftInner" : {
					"x" : 1620.6,
					"y" : 743.9
				},
				"upperLipTop" : {
					"x" : 1632.7,
					"y" : 788.0
				},
				"noseRightAlarOutTip" : {
					"x" : 1648.7,
					"y" : 776.6
				},
				"noseRootLeft" : {
					"x" : 1624.3,
					"y" : 756.3
				},
				"noseTip" : {
					"x" : 1632.0,
					"y" : 778.3
				},
				"pupilLeft" : {
					"x" : 1611.6,
					"y" : 755.1
				},
				"mouthRight" : {
					"x" : 1655.6,
					"y" : 792.8
				},
				"pupilRight" : {
					"x" : 1652.4,
					"y" : 754.5
				},
				"eyeRightInner" : {
					"x" : 1645.7,
					"y" : 754.9
				},
				"noseRightAlarTop" : {
					"x" : 1642.0,
					"y" : 769.5
				},
				"eyeRightBottom" : {
					"x" : 1653.3,
					"y" : 756.8
				},
				"eyeLeftOuter" : {
					"x" : 1605.3,
					"y" : 755.2
				},
				"eyebrowRightOuter" : {
					"x" : 1669.2,
					"y" : 743.5
				},
				"eyeLeftInner" : {
					"x" : 1618.5,
					"y" : 755.7
				},
				"underLipBottom" : {
					"x" : 1633.9,
					"y" : 809.5
				},
				"eyebrowRightInner" : {
					"x" : 1642.9,
					"y" : 742.3
				},
				"eyeLeftBottom" : {
					"x" : 1611.2,
					"y" : 757.2
				},
				"eyeRightTop" : {
					"x" : 1653.5,
					"y" : 753.2
				},
				"noseLeftAlarOutTip" : {
					"x" : 1617.0,
					"y" : 776.8
				},
				"upperLipBottom" : {
					"x" : 1633.1,
					"y" : 793.9
				},
				"mouthLeft" : {
					"x" : 1610.4,
					"y" : 792.0
				},
				"eyeRightOuter" : {
					"x" : 1661.5,
					"y" : 754.6
				},
				"underLipTop" : {
					"x" : 1633.7,
					"y" : 802.4
				},
				"eyebrowLeftOuter" : {
					"x" : 1595.7,
					"y" : 744.9
				},
				"noseLeftAlarTop" : {
					"x" : 1622.2,
					"y" : 770.2
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 49.1,
				"smile" : 1.0,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : -5.2,
					"pitch" : 0.0,
					"roll" : -1.1
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.5
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.42
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.54,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 84,
				"height" : 84,
				"top" : 688,
				"left" : 218
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 263.2,
					"y" : 712.2
				},
				"eyeLeftTop" : {
					"x" : 239.8,
					"y" : 711.0
				},
				"eyebrowLeftInner" : {
					"x" : 247.2,
					"y" : 704.5
				},
				"upperLipTop" : {
					"x" : 260.3,
					"y" : 743.1
				},
				"noseRightAlarOutTip" : {
					"x" : 271.6,
					"y" : 731.7
				},
				"noseRootLeft" : {
					"x" : 252.2,
					"y" : 713.3
				},
				"noseTip" : {
					"x" : 257.7,
					"y" : 731.6
				},
				"pupilLeft" : {
					"x" : 239.7,
					"y" : 712.3
				},
				"mouthRight" : {
					"x" : 278.0,
					"y" : 749.2
				},
				"pupilRight" : {
					"x" : 277.8,
					"y" : 708.7
				},
				"eyeRightInner" : {
					"x" : 272.1,
					"y" : 710.4
				},
				"noseRightAlarTop" : {
					"x" : 266.6,
					"y" : 724.3
				},
				"eyeRightBottom" : {
					"x" : 278.0,
					"y" : 711.4
				},
				"eyeLeftOuter" : {
					"x" : 233.1,
					"y" : 713.3
				},
				"eyebrowRightOuter" : {
					"x" : 293.8,
					"y" : 701.9
				},
				"eyeLeftInner" : {
					"x" : 245.8,
					"y" : 712.9
				},
				"underLipBottom" : {
					"x" : 261.0,
					"y" : 761.9
				},
				"eyebrowRightInner" : {
					"x" : 265.7,
					"y" : 703.7
				},
				"eyeLeftBottom" : {
					"x" : 239.7,
					"y" : 714.9
				},
				"eyeRightTop" : {
					"x" : 277.4,
					"y" : 707.6
				},
				"noseLeftAlarOutTip" : {
					"x" : 248.5,
					"y" : 732.7
				},
				"upperLipBottom" : {
					"x" : 260.2,
					"y" : 746.3
				},
				"mouthLeft" : {
					"x" : 247.7,
					"y" : 751.5
				},
				"eyeRightOuter" : {
					"x" : 283.6,
					"y" : 708.9
				},
				"underLipTop" : {
					"x" : 260.5,
					"y" : 756.7
				},
				"eyebrowLeftOuter" : {
					"x" : 225.3,
					"y" : 706.7
				},
				"noseLeftAlarTop" : {
					"x" : 251.5,
					"y" : 725.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 27.4,
				"smile" : 0.707,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -8.4,
					"pitch" : 0.0,
					"roll" : -4.1
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.13
				},
				"emotion" : {
					"neutral" : 0.052,
					"surprise" : 0.0,
					"contempt" : 0.006,
					"happiness" : 0.707,
					"anger" : 0.004,
					"sadness" : 0.0,
					"disgust" : 0.232,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.58,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "blond",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.51
						},
						{
							"color" : "black",
							"confidence" : 0.22
						},
						{
							"color" : "brown",
							"confidence" : 0.2
						},
						{
							"color" : "red",
							"confidence" : 0.16
						},
						{
							"color" : "gray",
							"confidence" : 0.09
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 83,
				"height" : 83,
				"top" : 676,
				"left" : 668
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 713.9,
					"y" : 699.8
				},
				"eyeLeftTop" : {
					"x" : 693.2,
					"y" : 698.8
				},
				"eyebrowLeftInner" : {
					"x" : 700.2,
					"y" : 691.4
				},
				"upperLipTop" : {
					"x" : 706.7,
					"y" : 732.4
				},
				"noseRightAlarOutTip" : {
					"x" : 720.4,
					"y" : 719.4
				},
				"noseRootLeft" : {
					"x" : 702.6,
					"y" : 699.8
				},
				"noseTip" : {
					"x" : 705.1,
					"y" : 717.5
				},
				"pupilLeft" : {
					"x" : 693.3,
					"y" : 700.1
				},
				"mouthRight" : {
					"x" : 727.0,
					"y" : 737.8
				},
				"pupilRight" : {
					"x" : 727.0,
					"y" : 697.5
				},
				"eyeRightInner" : {
					"x" : 721.6,
					"y" : 698.1
				},
				"noseRightAlarTop" : {
					"x" : 715.9,
					"y" : 711.1
				},
				"eyeRightBottom" : {
					"x" : 727.9,
					"y" : 698.6
				},
				"eyeLeftOuter" : {
					"x" : 687.9,
					"y" : 701.4
				},
				"eyebrowRightOuter" : {
					"x" : 742.2,
					"y" : 690.9
				},
				"eyeLeftInner" : {
					"x" : 699.9,
					"y" : 699.7
				},
				"underLipBottom" : {
					"x" : 706.8,
					"y" : 753.4
				},
				"eyebrowRightInner" : {
					"x" : 715.9,
					"y" : 689.6
				},
				"eyeLeftBottom" : {
					"x" : 694.3,
					"y" : 702.1
				},
				"eyeRightTop" : {
					"x" : 727.9,
					"y" : 696.2
				},
				"noseLeftAlarOutTip" : {
					"x" : 694.1,
					"y" : 719.5
				},
				"upperLipBottom" : {
					"x" : 706.7,
					"y" : 736.7
				},
				"mouthLeft" : {
					"x" : 694.6,
					"y" : 741.0
				},
				"eyeRightOuter" : {
					"x" : 733.8,
					"y" : 698.0
				},
				"underLipTop" : {
					"x" : 706.7,
					"y" : 747.1
				},
				"eyebrowLeftOuter" : {
					"x" : 680.3,
					"y" : 691.1
				},
				"noseLeftAlarTop" : {
					"x" : 698.4,
					"y" : 712.0
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.2,
					"moustache" : 0.1,
					"sideburns" : 0.2
				},
				"age" : 28.2,
				"smile" : 0.999,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -17.5,
					"pitch" : 0.0,
					"roll" : 0.6
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.63
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.999,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.14
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.63,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.97
						},
						{
							"color" : "gray",
							"confidence" : 0.22
						},
						{
							"color" : "red",
							"confidence" : 0.1
						},
						{
							"color" : "other",
							"confidence" : 0.08
						},
						{
							"color" : "blond",
							"confidence" : 0.08
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 83,
				"height" : 83,
				"top" : 757,
				"left" : 1125
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1169.9,
					"y" : 782.3
				},
				"eyeLeftTop" : {
					"x" : 1145.2,
					"y" : 779.5
				},
				"eyebrowLeftInner" : {
					"x" : 1156.4,
					"y" : 772.9
				},
				"upperLipTop" : {
					"x" : 1169.6,
					"y" : 811.3
				},
				"noseRightAlarOutTip" : {
					"x" : 1179.5,
					"y" : 799.5
				},
				"noseRootLeft" : {
					"x" : 1160.5,
					"y" : 783.2
				},
				"noseTip" : {
					"x" : 1169.1,
					"y" : 798.1
				},
				"pupilLeft" : {
					"x" : 1145.9,
					"y" : 782.4
				},
				"mouthRight" : {
					"x" : 1183.6,
					"y" : 816.8
				},
				"pupilRight" : {
					"x" : 1185.1,
					"y" : 779.0
				},
				"eyeRightInner" : {
					"x" : 1179.6,
					"y" : 781.1
				},
				"noseRightAlarTop" : {
					"x" : 1174.0,
					"y" : 793.5
				},
				"eyeRightBottom" : {
					"x" : 1186.8,
					"y" : 782.0
				},
				"eyeLeftOuter" : {
					"x" : 1139.1,
					"y" : 783.5
				},
				"eyebrowRightOuter" : {
					"x" : 1198.6,
					"y" : 768.6
				},
				"eyeLeftInner" : {
					"x" : 1152.3,
					"y" : 782.8
				},
				"underLipBottom" : {
					"x" : 1171.6,
					"y" : 827.8
				},
				"eyebrowRightInner" : {
					"x" : 1175.0,
					"y" : 771.4
				},
				"eyeLeftBottom" : {
					"x" : 1145.5,
					"y" : 785.3
				},
				"eyeRightTop" : {
					"x" : 1185.4,
					"y" : 776.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 1155.9,
					"y" : 801.7
				},
				"upperLipBottom" : {
					"x" : 1170.1,
					"y" : 814.5
				},
				"mouthLeft" : {
					"x" : 1150.9,
					"y" : 820.2
				},
				"eyeRightOuter" : {
					"x" : 1193.0,
					"y" : 779.2
				},
				"underLipTop" : {
					"x" : 1170.9,
					"y" : 823.0
				},
				"eyebrowLeftOuter" : {
					"x" : 1132.3,
					"y" : 774.8
				},
				"noseLeftAlarTop" : {
					"x" : 1159.6,
					"y" : 793.8
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 12.6,
				"smile" : 0.782,
				"gender" : "female",
				"accessories" : [
					{
						"confidence" : 0.98,
						"type" : "glasses"
					},
					{
						"confidence" : 0.99,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : 2.7,
					"pitch" : 0.0,
					"roll" : -5.3
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.94
				},
				"emotion" : {
					"neutral" : 0.004,
					"surprise" : 0.211,
					"contempt" : 0.0,
					"happiness" : 0.782,
					"anger" : 0.001,
					"sadness" : 0.0,
					"disgust" : 0.002,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.59
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.43,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 80,
				"height" : 80,
				"top" : 724,
				"left" : 452
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 497.0,
					"y" : 748.3
				},
				"eyeLeftTop" : {
					"x" : 476.3,
					"y" : 743.4
				},
				"eyebrowLeftInner" : {
					"x" : 485.0,
					"y" : 738.6
				},
				"upperLipTop" : {
					"x" : 489.6,
					"y" : 779.4
				},
				"noseRightAlarOutTip" : {
					"x" : 502.0,
					"y" : 766.5
				},
				"noseRootLeft" : {
					"x" : 487.9,
					"y" : 747.4
				},
				"noseTip" : {
					"x" : 491.1,
					"y" : 763.3
				},
				"pupilLeft" : {
					"x" : 475.8,
					"y" : 745.5
				},
				"mouthRight" : {
					"x" : 506.6,
					"y" : 784.8
				},
				"pupilRight" : {
					"x" : 511.9,
					"y" : 748.0
				},
				"eyeRightInner" : {
					"x" : 505.4,
					"y" : 748.6
				},
				"noseRightAlarTop" : {
					"x" : 499.5,
					"y" : 759.9
				},
				"eyeRightBottom" : {
					"x" : 510.9,
					"y" : 749.4
				},
				"eyeLeftOuter" : {
					"x" : 470.5,
					"y" : 745.6
				},
				"eyebrowRightOuter" : {
					"x" : 524.6,
					"y" : 741.8
				},
				"eyeLeftInner" : {
					"x" : 480.5,
					"y" : 746.2
				},
				"underLipBottom" : {
					"x" : 489.1,
					"y" : 793.3
				},
				"eyebrowRightInner" : {
					"x" : 498.8,
					"y" : 740.3
				},
				"eyeLeftBottom" : {
					"x" : 475.6,
					"y" : 747.5
				},
				"eyeRightTop" : {
					"x" : 510.2,
					"y" : 746.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 480.2,
					"y" : 764.2
				},
				"upperLipBottom" : {
					"x" : 489.2,
					"y" : 782.4
				},
				"mouthLeft" : {
					"x" : 475.2,
					"y" : 783.4
				},
				"eyeRightOuter" : {
					"x" : 515.4,
					"y" : 748.0
				},
				"underLipTop" : {
					"x" : 488.9,
					"y" : 788.8
				},
				"eyebrowLeftOuter" : {
					"x" : 461.9,
					"y" : 738.9
				},
				"noseLeftAlarTop" : {
					"x" : 483.8,
					"y" : 758.9
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 30.9,
				"smile" : 0.999,
				"gender" : "female",
				"accessories" : [
					{
						"confidence" : 0.99,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : -4.0,
					"pitch" : 0.0,
					"roll" : 4.0
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.999,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "ReadingGlasses",
				"exposure" : {
					"value" : 0.62,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.78
						},
						{
							"color" : "other",
							"confidence" : 0.26
						},
						{
							"color" : "blond",
							"confidence" : 0.11
						},
						{
							"color" : "red",
							"confidence" : 0.1
						},
						{
							"color" : "gray",
							"confidence" : 0.08
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 77,
				"height" : 77,
				"top" : 733,
				"left" : 986
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1027.4,
					"y" : 753.2
				},
				"eyeLeftTop" : {
					"x" : 1007.2,
					"y" : 752.3
				},
				"eyebrowLeftInner" : {
					"x" : 1016.3,
					"y" : 744.7
				},
				"upperLipTop" : {
					"x" : 1026.3,
					"y" : 787.4
				},
				"noseRightAlarOutTip" : {
					"x" : 1035.3,
					"y" : 772.6
				},
				"noseRootLeft" : {
					"x" : 1018.2,
					"y" : 754.8
				},
				"noseTip" : {
					"x" : 1023.7,
					"y" : 776.6
				},
				"pupilLeft" : {
					"x" : 1008.6,
					"y" : 753.7
				},
				"mouthRight" : {
					"x" : 1039.2,
					"y" : 788.5
				},
				"pupilRight" : {
					"x" : 1039.1,
					"y" : 750.3
				},
				"eyeRightInner" : {
					"x" : 1033.0,
					"y" : 752.6
				},
				"noseRightAlarTop" : {
					"x" : 1030.4,
					"y" : 767.6
				},
				"eyeRightBottom" : {
					"x" : 1039.1,
					"y" : 752.6
				},
				"eyeLeftOuter" : {
					"x" : 1002.5,
					"y" : 754.5
				},
				"eyebrowRightOuter" : {
					"x" : 1051.5,
					"y" : 739.1
				},
				"eyeLeftInner" : {
					"x" : 1012.4,
					"y" : 754.4
				},
				"underLipBottom" : {
					"x" : 1027.4,
					"y" : 801.1
				},
				"eyebrowRightInner" : {
					"x" : 1029.9,
					"y" : 743.8
				},
				"eyeLeftBottom" : {
					"x" : 1007.6,
					"y" : 756.0
				},
				"eyeRightTop" : {
					"x" : 1037.9,
					"y" : 748.7
				},
				"noseLeftAlarOutTip" : {
					"x" : 1013.9,
					"y" : 775.8
				},
				"upperLipBottom" : {
					"x" : 1026.5,
					"y" : 789.9
				},
				"mouthLeft" : {
					"x" : 1012.0,
					"y" : 792.3
				},
				"eyeRightOuter" : {
					"x" : 1043.6,
					"y" : 749.0
				},
				"underLipTop" : {
					"x" : 1026.6,
					"y" : 796.8
				},
				"eyebrowLeftOuter" : {
					"x" : 994.2,
					"y" : 747.4
				},
				"noseLeftAlarTop" : {
					"x" : 1016.9,
					"y" : 769.0
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 26.2,
				"smile" : 0.9,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -4.1,
					"pitch" : 0.0,
					"roll" : -5.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.01,
					"surprise" : 0.074,
					"contempt" : 0.0,
					"happiness" : 0.9,
					"anger" : 0.009,
					"sadness" : 0.001,
					"disgust" : 0.007,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.68,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "blond",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.81
						},
						{
							"color" : "red",
							"confidence" : 0.34
						},
						{
							"color" : "gray",
							"confidence" : 0.09
						},
						{
							"color" : "black",
							"confidence" : 0.06
						},
						{
							"color" : "brown",
							"confidence" : 0.05
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		}
	],
	[ ],
	[
		{
			"faceRectangle" : {
				"width" : 45,
				"height" : 45,
				"top" : 315,
				"left" : 810
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 836.8,
					"y" : 328.4
				},
				"eyeLeftTop" : {
					"x" : 826.8,
					"y" : 323.2
				},
				"eyebrowLeftInner" : {
					"x" : 831.2,
					"y" : 322.7
				},
				"upperLipTop" : {
					"x" : 830.3,
					"y" : 346.9
				},
				"noseRightAlarOutTip" : {
					"x" : 837.5,
					"y" : 340.4
				},
				"noseRootLeft" : {
					"x" : 831.1,
					"y" : 327.5
				},
				"noseTip" : {
					"x" : 831.4,
					"y" : 338.3
				},
				"pupilLeft" : {
					"x" : 826.8,
					"y" : 324.8
				},
				"mouthRight" : {
					"x" : 836.7,
					"y" : 351.2
				},
				"pupilRight" : {
					"x" : 843.8,
					"y" : 328.5
				},
				"eyeRightInner" : {
					"x" : 840.6,
					"y" : 328.6
				},
				"noseRightAlarTop" : {
					"x" : 836.2,
					"y" : 335.8
				},
				"eyeRightBottom" : {
					"x" : 843.7,
					"y" : 330.3
				},
				"eyeLeftOuter" : {
					"x" : 823.7,
					"y" : 324.5
				},
				"eyebrowRightOuter" : {
					"x" : 851.1,
					"y" : 325.0
				},
				"eyeLeftInner" : {
					"x" : 829.5,
					"y" : 325.9
				},
				"underLipBottom" : {
					"x" : 827.5,
					"y" : 354.1
				},
				"eyebrowRightInner" : {
					"x" : 836.0,
					"y" : 324.0
				},
				"eyeLeftBottom" : {
					"x" : 826.2,
					"y" : 326.5
				},
				"eyeRightTop" : {
					"x" : 844.2,
					"y" : 327.5
				},
				"noseLeftAlarOutTip" : {
					"x" : 825.8,
					"y" : 337.9
				},
				"upperLipBottom" : {
					"x" : 829.7,
					"y" : 349.4
				},
				"mouthLeft" : {
					"x" : 823.3,
					"y" : 348.4
				},
				"eyeRightOuter" : {
					"x" : 847.0,
					"y" : 329.4
				},
				"underLipTop" : {
					"x" : 828.5,
					"y" : 351.2
				},
				"eyebrowLeftOuter" : {
					"x" : 820.9,
					"y" : 318.1
				},
				"noseLeftAlarTop" : {
					"x" : 828.7,
					"y" : 334.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 22.4,
				"smile" : 0.397,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -9.5,
					"pitch" : 0.0,
					"roll" : 13.1
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.14
				},
				"emotion" : {
					"neutral" : 0.585,
					"surprise" : 0.0,
					"contempt" : 0.001,
					"happiness" : 0.397,
					"anger" : 0.0,
					"sadness" : 0.015,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.72,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.0,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.98
						},
						{
							"color" : "other",
							"confidence" : 0.52
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						},
						{
							"color" : "red",
							"confidence" : 0.04
						},
						{
							"color" : "blond",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 43,
				"height" : 43,
				"top" : 281,
				"left" : 631
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 656.3,
					"y" : 294.1
				},
				"eyeLeftTop" : {
					"x" : 644.2,
					"y" : 290.3
				},
				"eyebrowLeftInner" : {
					"x" : 650.0,
					"y" : 289.7
				},
				"upperLipTop" : {
					"x" : 651.4,
					"y" : 309.9
				},
				"noseRightAlarOutTip" : {
					"x" : 657.7,
					"y" : 304.8
				},
				"noseRootLeft" : {
					"x" : 649.5,
					"y" : 292.5
				},
				"noseTip" : {
					"x" : 649.8,
					"y" : 303.9
				},
				"pupilLeft" : {
					"x" : 644.2,
					"y" : 291.2
				},
				"mouthRight" : {
					"x" : 661.5,
					"y" : 314.8
				},
				"pupilRight" : {
					"x" : 662.2,
					"y" : 294.7
				},
				"eyeRightInner" : {
					"x" : 658.6,
					"y" : 294.5
				},
				"noseRightAlarTop" : {
					"x" : 655.2,
					"y" : 301.2
				},
				"eyeRightBottom" : {
					"x" : 661.7,
					"y" : 296.0
				},
				"eyeLeftOuter" : {
					"x" : 641.6,
					"y" : 291.2
				},
				"eyebrowRightOuter" : {
					"x" : 669.5,
					"y" : 293.4
				},
				"eyeLeftInner" : {
					"x" : 646.4,
					"y" : 292.1
				},
				"underLipBottom" : {
					"x" : 650.6,
					"y" : 319.9
				},
				"eyebrowRightInner" : {
					"x" : 655.0,
					"y" : 290.5
				},
				"eyeLeftBottom" : {
					"x" : 643.7,
					"y" : 292.5
				},
				"eyeRightTop" : {
					"x" : 661.9,
					"y" : 293.6
				},
				"noseLeftAlarOutTip" : {
					"x" : 643.8,
					"y" : 302.5
				},
				"upperLipBottom" : {
					"x" : 651.4,
					"y" : 312.6
				},
				"mouthLeft" : {
					"x" : 643.5,
					"y" : 311.1
				},
				"eyeRightOuter" : {
					"x" : 665.1,
					"y" : 295.6
				},
				"underLipTop" : {
					"x" : 651.1,
					"y" : 317.0
				},
				"eyebrowLeftOuter" : {
					"x" : 636.8,
					"y" : 287.2
				},
				"noseLeftAlarTop" : {
					"x" : 646.9,
					"y" : 299.6
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.1,
					"sideburns" : 0.2
				},
				"age" : 36.4,
				"smile" : 0.999,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 0.99,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : -13.2,
					"pitch" : 0.0,
					"roll" : 7.1
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.001,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.999,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 0.93
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.55,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 0.99
						},
						{
							"color" : "brown",
							"confidence" : 0.91
						},
						{
							"color" : "other",
							"confidence" : 0.81
						},
						{
							"color" : "gray",
							"confidence" : 0.24
						},
						{
							"color" : "red",
							"confidence" : 0.05
						},
						{
							"color" : "blond",
							"confidence" : 0.01
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 43,
				"height" : 43,
				"top" : 286,
				"left" : 1064
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1089.0,
					"y" : 298.7
				},
				"eyeLeftTop" : {
					"x" : 1079.1,
					"y" : 293.9
				},
				"eyebrowLeftInner" : {
					"x" : 1082.9,
					"y" : 292.9
				},
				"upperLipTop" : {
					"x" : 1083.7,
					"y" : 316.7
				},
				"noseRightAlarOutTip" : {
					"x" : 1090.3,
					"y" : 310.4
				},
				"noseRootLeft" : {
					"x" : 1084.0,
					"y" : 297.7
				},
				"noseTip" : {
					"x" : 1084.3,
					"y" : 310.5
				},
				"pupilLeft" : {
					"x" : 1079.2,
					"y" : 295.4
				},
				"mouthRight" : {
					"x" : 1092.3,
					"y" : 318.7
				},
				"pupilRight" : {
					"x" : 1095.5,
					"y" : 298.1
				},
				"eyeRightInner" : {
					"x" : 1092.5,
					"y" : 298.5
				},
				"noseRightAlarTop" : {
					"x" : 1089.3,
					"y" : 306.9
				},
				"eyeRightBottom" : {
					"x" : 1095.5,
					"y" : 299.8
				},
				"eyeLeftOuter" : {
					"x" : 1076.2,
					"y" : 294.9
				},
				"eyebrowRightOuter" : {
					"x" : 1103.5,
					"y" : 295.7
				},
				"eyeLeftInner" : {
					"x" : 1081.6,
					"y" : 296.7
				},
				"underLipBottom" : {
					"x" : 1082.9,
					"y" : 322.6
				},
				"eyebrowRightInner" : {
					"x" : 1089.7,
					"y" : 294.2
				},
				"eyeLeftBottom" : {
					"x" : 1078.6,
					"y" : 296.8
				},
				"eyeRightTop" : {
					"x" : 1095.8,
					"y" : 296.8
				},
				"noseLeftAlarOutTip" : {
					"x" : 1078.9,
					"y" : 309.0
				},
				"upperLipBottom" : {
					"x" : 1083.6,
					"y" : 318.6
				},
				"mouthLeft" : {
					"x" : 1076.1,
					"y" : 316.4
				},
				"eyeRightOuter" : {
					"x" : 1098.4,
					"y" : 298.8
				},
				"underLipTop" : {
					"x" : 1083.3,
					"y" : 319.5
				},
				"eyebrowLeftOuter" : {
					"x" : 1073.0,
					"y" : 290.5
				},
				"noseLeftAlarTop" : {
					"x" : 1081.7,
					"y" : 305.4
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.6,
					"moustache" : 0.4,
					"sideburns" : 0.4
				},
				"age" : 31.9,
				"smile" : 0.829,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -6.6,
					"pitch" : 0.0,
					"roll" : 9.3
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.08
				},
				"emotion" : {
					"neutral" : 0.157,
					"surprise" : 0.0,
					"contempt" : 0.01,
					"happiness" : 0.829,
					"anger" : 0.002,
					"sadness" : 0.001,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.29
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.68,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.72
						},
						{
							"color" : "gray",
							"confidence" : 0.18
						},
						{
							"color" : "red",
							"confidence" : 0.16
						},
						{
							"color" : "brown",
							"confidence" : 0.13
						},
						{
							"color" : "blond",
							"confidence" : 0.08
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 43,
				"height" : 43,
				"top" : 290,
				"left" : 473
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 498.9,
					"y" : 303.8
				},
				"eyeLeftTop" : {
					"x" : 486.6,
					"y" : 299.3
				},
				"eyebrowLeftInner" : {
					"x" : 491.5,
					"y" : 297.3
				},
				"upperLipTop" : {
					"x" : 493.2,
					"y" : 319.3
				},
				"noseRightAlarOutTip" : {
					"x" : 500.9,
					"y" : 314.2
				},
				"noseRootLeft" : {
					"x" : 492.0,
					"y" : 302.7
				},
				"noseTip" : {
					"x" : 493.6,
					"y" : 313.9
				},
				"pupilLeft" : {
					"x" : 486.6,
					"y" : 300.9
				},
				"mouthRight" : {
					"x" : 502.9,
					"y" : 321.9
				},
				"pupilRight" : {
					"x" : 504.9,
					"y" : 302.9
				},
				"eyeRightInner" : {
					"x" : 501.4,
					"y" : 303.2
				},
				"noseRightAlarTop" : {
					"x" : 497.9,
					"y" : 311.1
				},
				"eyeRightBottom" : {
					"x" : 505.1,
					"y" : 304.0
				},
				"eyeLeftOuter" : {
					"x" : 483.8,
					"y" : 300.3
				},
				"eyebrowRightOuter" : {
					"x" : 513.7,
					"y" : 299.9
				},
				"eyeLeftInner" : {
					"x" : 489.4,
					"y" : 301.6
				},
				"underLipBottom" : {
					"x" : 493.0,
					"y" : 327.0
				},
				"eyebrowRightInner" : {
					"x" : 499.7,
					"y" : 297.3
				},
				"eyeLeftBottom" : {
					"x" : 486.1,
					"y" : 302.2
				},
				"eyeRightTop" : {
					"x" : 505.0,
					"y" : 301.5
				},
				"noseLeftAlarOutTip" : {
					"x" : 487.1,
					"y" : 313.9
				},
				"upperLipBottom" : {
					"x" : 493.1,
					"y" : 322.0
				},
				"mouthLeft" : {
					"x" : 484.1,
					"y" : 320.6
				},
				"eyeRightOuter" : {
					"x" : 508.1,
					"y" : 303.2
				},
				"underLipTop" : {
					"x" : 493.2,
					"y" : 323.7
				},
				"eyebrowLeftOuter" : {
					"x" : 479.9,
					"y" : 295.2
				},
				"noseLeftAlarTop" : {
					"x" : 490.0,
					"y" : 310.6
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.5,
					"moustache" : 0.5,
					"sideburns" : 0.6
				},
				"age" : 36.8,
				"smile" : 0.99,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : -4.2,
					"pitch" : 0.0,
					"roll" : 6.7
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.009,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.99,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.5,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 40,
				"height" : 40,
				"top" : 332,
				"left" : 934
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 958.2,
					"y" : 343.9
				},
				"eyeLeftTop" : {
					"x" : 948.0,
					"y" : 341.1
				},
				"eyebrowLeftInner" : {
					"x" : 954.1,
					"y" : 338.3
				},
				"upperLipTop" : {
					"x" : 952.2,
					"y" : 357.6
				},
				"noseRightAlarOutTip" : {
					"x" : 959.5,
					"y" : 353.4
				},
				"noseRootLeft" : {
					"x" : 952.6,
					"y" : 343.1
				},
				"noseTip" : {
					"x" : 952.2,
					"y" : 351.5
				},
				"pupilLeft" : {
					"x" : 946.9,
					"y" : 342.0
				},
				"mouthRight" : {
					"x" : 960.1,
					"y" : 363.5
				},
				"pupilRight" : {
					"x" : 962.4,
					"y" : 343.9
				},
				"eyeRightInner" : {
					"x" : 961.0,
					"y" : 343.7
				},
				"noseRightAlarTop" : {
					"x" : 957.4,
					"y" : 349.5
				},
				"eyeRightBottom" : {
					"x" : 963.4,
					"y" : 344.9
				},
				"eyeLeftOuter" : {
					"x" : 945.2,
					"y" : 341.5
				},
				"eyebrowRightOuter" : {
					"x" : 972.1,
					"y" : 342.5
				},
				"eyeLeftInner" : {
					"x" : 950.1,
					"y" : 342.4
				},
				"underLipBottom" : {
					"x" : 950.3,
					"y" : 368.2
				},
				"eyebrowRightInner" : {
					"x" : 958.5,
					"y" : 338.8
				},
				"eyeLeftBottom" : {
					"x" : 947.4,
					"y" : 342.7
				},
				"eyeRightTop" : {
					"x" : 964.1,
					"y" : 343.2
				},
				"noseLeftAlarOutTip" : {
					"x" : 947.6,
					"y" : 351.5
				},
				"upperLipBottom" : {
					"x" : 951.9,
					"y" : 359.9
				},
				"mouthLeft" : {
					"x" : 945.2,
					"y" : 361.5
				},
				"eyeRightOuter" : {
					"x" : 965.8,
					"y" : 344.8
				},
				"underLipTop" : {
					"x" : 950.7,
					"y" : 365.6
				},
				"eyebrowLeftOuter" : {
					"x" : 943.1,
					"y" : 337.5
				},
				"noseLeftAlarTop" : {
					"x" : 949.7,
					"y" : 348.1
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 28.3,
				"smile" : 0.998,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -12.7,
					"pitch" : 0.0,
					"roll" : 10.7
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.001,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.998,
					"anger" : 0.0,
					"sadness" : 0.001,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.3
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.74,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.2,
					"hairColor" : [
						{
							"color" : "blond",
							"confidence" : 0.96
						},
						{
							"color" : "gray",
							"confidence" : 0.82
						},
						{
							"color" : "black",
							"confidence" : 0.55
						},
						{
							"color" : "other",
							"confidence" : 0.3
						},
						{
							"color" : "red",
							"confidence" : 0.13
						},
						{
							"color" : "brown",
							"confidence" : 0.1
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 75,
				"height" : 75,
				"top" : 333,
				"left" : 701
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 744.7,
					"y" : 356.6
				},
				"eyeLeftTop" : {
					"x" : 723.8,
					"y" : 351.2
				},
				"eyebrowLeftInner" : {
					"x" : 732.5,
					"y" : 346.8
				},
				"upperLipTop" : {
					"x" : 736.6,
					"y" : 385.1
				},
				"noseRightAlarOutTip" : {
					"x" : 750.2,
					"y" : 374.6
				},
				"noseRootLeft" : {
					"x" : 736.5,
					"y" : 355.7
				},
				"noseTip" : {
					"x" : 737.3,
					"y" : 373.4
				},
				"pupilLeft" : {
					"x" : 721.8,
					"y" : 353.2
				},
				"mouthRight" : {
					"x" : 757.2,
					"y" : 390.0
				},
				"pupilRight" : {
					"x" : 755.8,
					"y" : 357.1
				},
				"eyeRightInner" : {
					"x" : 752.0,
					"y" : 357.2
				},
				"noseRightAlarTop" : {
					"x" : 747.0,
					"y" : 368.1
				},
				"eyeRightBottom" : {
					"x" : 757.2,
					"y" : 359.3
				},
				"eyeLeftOuter" : {
					"x" : 718.2,
					"y" : 353.2
				},
				"eyebrowRightOuter" : {
					"x" : 772.2,
					"y" : 354.2
				},
				"eyeLeftInner" : {
					"x" : 728.8,
					"y" : 354.1
				},
				"underLipBottom" : {
					"x" : 736.3,
					"y" : 398.2
				},
				"eyebrowRightInner" : {
					"x" : 750.2,
					"y" : 348.9
				},
				"eyeLeftBottom" : {
					"x" : 723.4,
					"y" : 355.0
				},
				"eyeRightTop" : {
					"x" : 758.0,
					"y" : 355.9
				},
				"noseLeftAlarOutTip" : {
					"x" : 727.1,
					"y" : 372.7
				},
				"upperLipBottom" : {
					"x" : 736.4,
					"y" : 387.2
				},
				"mouthLeft" : {
					"x" : 720.9,
					"y" : 385.4
				},
				"eyeRightOuter" : {
					"x" : 762.5,
					"y" : 358.7
				},
				"underLipTop" : {
					"x" : 736.6,
					"y" : 393.8
				},
				"eyebrowLeftOuter" : {
					"x" : 712.3,
					"y" : 345.8
				},
				"noseLeftAlarTop" : {
					"x" : 731.5,
					"y" : 366.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.7,
					"moustache" : 0.4,
					"sideburns" : 0.4
				},
				"age" : 32.8,
				"smile" : 1.0,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -6.5,
					"pitch" : 0.0,
					"roll" : 6.3
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.17
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.61,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.98
						},
						{
							"color" : "other",
							"confidence" : 0.26
						},
						{
							"color" : "red",
							"confidence" : 0.09
						},
						{
							"color" : "blond",
							"confidence" : 0.04
						},
						{
							"color" : "gray",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 93,
				"height" : 93,
				"top" : 323,
				"left" : 264
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 319.4,
					"y" : 351.5
				},
				"eyeLeftTop" : {
					"x" : 294.1,
					"y" : 344.4
				},
				"eyebrowLeftInner" : {
					"x" : 306.6,
					"y" : 341.0
				},
				"upperLipTop" : {
					"x" : 306.4,
					"y" : 384.9
				},
				"noseRightAlarOutTip" : {
					"x" : 322.5,
					"y" : 375.3
				},
				"noseRootLeft" : {
					"x" : 307.4,
					"y" : 350.0
				},
				"noseTip" : {
					"x" : 306.7,
					"y" : 370.3
				},
				"pupilLeft" : {
					"x" : 294.5,
					"y" : 346.2
				},
				"mouthRight" : {
					"x" : 328.1,
					"y" : 395.1
				},
				"pupilRight" : {
					"x" : 334.2,
					"y" : 352.9
				},
				"eyeRightInner" : {
					"x" : 327.8,
					"y" : 351.7
				},
				"noseRightAlarTop" : {
					"x" : 319.3,
					"y" : 365.9
				},
				"eyeRightBottom" : {
					"x" : 334.1,
					"y" : 354.7
				},
				"eyeLeftOuter" : {
					"x" : 287.0,
					"y" : 346.1
				},
				"eyebrowRightOuter" : {
					"x" : 353.9,
					"y" : 351.3
				},
				"eyeLeftInner" : {
					"x" : 300.4,
					"y" : 348.1
				},
				"underLipBottom" : {
					"x" : 301.8,
					"y" : 405.1
				},
				"eyebrowRightInner" : {
					"x" : 323.5,
					"y" : 341.9
				},
				"eyeLeftBottom" : {
					"x" : 293.8,
					"y" : 348.6
				},
				"eyeRightTop" : {
					"x" : 336.2,
					"y" : 350.3
				},
				"noseLeftAlarOutTip" : {
					"x" : 294.5,
					"y" : 367.9
				},
				"upperLipBottom" : {
					"x" : 305.4,
					"y" : 388.8
				},
				"mouthLeft" : {
					"x" : 289.5,
					"y" : 389.8
				},
				"eyeRightOuter" : {
					"x" : 340.7,
					"y" : 355.0
				},
				"underLipTop" : {
					"x" : 303.0,
					"y" : 399.6
				},
				"eyebrowLeftOuter" : {
					"x" : 280.0,
					"y" : 337.3
				},
				"noseLeftAlarTop" : {
					"x" : 301.4,
					"y" : 362.4
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 50.6,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [
					{
						"confidence" : 0.97,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : -9.8,
					"pitch" : 0.0,
					"roll" : 10.9
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.5
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.45
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.61,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.98,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 78,
				"height" : 78,
				"top" : 220,
				"left" : 390
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 437.6,
					"y" : 242.6
				},
				"eyeLeftTop" : {
					"x" : 419.4,
					"y" : 234.1
				},
				"eyebrowLeftInner" : {
					"x" : 430.4,
					"y" : 231.6
				},
				"upperLipTop" : {
					"x" : 424.3,
					"y" : 273.4
				},
				"noseRightAlarOutTip" : {
					"x" : 438.0,
					"y" : 263.8
				},
				"noseRootLeft" : {
					"x" : 427.0,
					"y" : 238.6
				},
				"noseTip" : {
					"x" : 423.3,
					"y" : 258.4
				},
				"pupilLeft" : {
					"x" : 419.1,
					"y" : 235.7
				},
				"mouthRight" : {
					"x" : 439.0,
					"y" : 282.2
				},
				"pupilRight" : {
					"x" : 450.3,
					"y" : 245.5
				},
				"eyeRightInner" : {
					"x" : 444.6,
					"y" : 243.6
				},
				"noseRightAlarTop" : {
					"x" : 434.3,
					"y" : 255.4
				},
				"eyeRightBottom" : {
					"x" : 450.5,
					"y" : 247.3
				},
				"eyeLeftOuter" : {
					"x" : 414.7,
					"y" : 234.0
				},
				"eyebrowRightOuter" : {
					"x" : 466.7,
					"y" : 243.2
				},
				"eyeLeftInner" : {
					"x" : 424.1,
					"y" : 237.0
				},
				"underLipBottom" : {
					"x" : 421.5,
					"y" : 286.5
				},
				"eyebrowRightInner" : {
					"x" : 440.6,
					"y" : 233.8
				},
				"eyeLeftBottom" : {
					"x" : 418.6,
					"y" : 237.0
				},
				"eyeRightTop" : {
					"x" : 451.3,
					"y" : 244.5
				},
				"noseLeftAlarOutTip" : {
					"x" : 414.9,
					"y" : 256.0
				},
				"upperLipBottom" : {
					"x" : 423.7,
					"y" : 276.7
				},
				"mouthLeft" : {
					"x" : 413.2,
					"y" : 273.7
				},
				"eyeRightOuter" : {
					"x" : 456.7,
					"y" : 247.7
				},
				"underLipTop" : {
					"x" : 423.3,
					"y" : 280.6
				},
				"eyebrowLeftOuter" : {
					"x" : 410.0,
					"y" : 224.3
				},
				"noseLeftAlarTop" : {
					"x" : 420.0,
					"y" : 250.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.4,
					"moustache" : 0.6,
					"sideburns" : 0.4
				},
				"age" : 54.9,
				"smile" : 0.083,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : -23.9,
					"pitch" : 0.0,
					"roll" : 17.6
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.36
				},
				"emotion" : {
					"neutral" : 0.899,
					"surprise" : 0.001,
					"contempt" : 0.003,
					"happiness" : 0.083,
					"anger" : 0.001,
					"sadness" : 0.01,
					"disgust" : 0.002,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.04
				},
				"glasses" : "ReadingGlasses",
				"exposure" : {
					"value" : 0.53,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.65,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 251,
				"height" : 251,
				"top" : 389,
				"left" : 761
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 904.9,
					"y" : 463.0
				},
				"eyeLeftTop" : {
					"x" : 832.1,
					"y" : 451.3
				},
				"eyebrowLeftInner" : {
					"x" : 862.8,
					"y" : 431.2
				},
				"upperLipTop" : {
					"x" : 886.9,
					"y" : 567.4
				},
				"noseRightAlarOutTip" : {
					"x" : 924.7,
					"y" : 525.2
				},
				"noseRootLeft" : {
					"x" : 870.1,
					"y" : 462.7
				},
				"noseTip" : {
					"x" : 891.5,
					"y" : 525.8
				},
				"pupilLeft" : {
					"x" : 834.6,
					"y" : 455.1
				},
				"mouthRight" : {
					"x" : 932.8,
					"y" : 573.7
				},
				"pupilRight" : {
					"x" : 944.5,
					"y" : 459.1
				},
				"eyeRightInner" : {
					"x" : 923.0,
					"y" : 460.9
				},
				"noseRightAlarTop" : {
					"x" : 915.0,
					"y" : 506.0
				},
				"eyeRightBottom" : {
					"x" : 942.4,
					"y" : 465.9
				},
				"eyeLeftOuter" : {
					"x" : 815.0,
					"y" : 457.2
				},
				"eyebrowRightOuter" : {
					"x" : 986.2,
					"y" : 438.1
				},
				"eyeLeftInner" : {
					"x" : 848.5,
					"y" : 458.4
				},
				"underLipBottom" : {
					"x" : 885.4,
					"y" : 593.9
				},
				"eyebrowRightInner" : {
					"x" : 917.7,
					"y" : 430.8
				},
				"eyeLeftBottom" : {
					"x" : 831.4,
					"y" : 463.0
				},
				"eyeRightTop" : {
					"x" : 941.8,
					"y" : 453.7
				},
				"noseLeftAlarOutTip" : {
					"x" : 849.7,
					"y" : 525.2
				},
				"upperLipBottom" : {
					"x" : 885.7,
					"y" : 577.7
				},
				"mouthLeft" : {
					"x" : 827.3,
					"y" : 569.6
				},
				"eyeRightOuter" : {
					"x" : 959.8,
					"y" : 461.5
				},
				"underLipTop" : {
					"x" : 885.6,
					"y" : 580.8
				},
				"eyebrowLeftOuter" : {
					"x" : 787.0,
					"y" : 434.7
				},
				"noseLeftAlarTop" : {
					"x" : 860.8,
					"y" : 503.9
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 18.5,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 5.9,
					"pitch" : 0.0,
					"roll" : 1.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 1.0
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.71,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.96
						},
						{
							"color" : "other",
							"confidence" : 0.82
						},
						{
							"color" : "red",
							"confidence" : 0.07
						},
						{
							"color" : "blond",
							"confidence" : 0.04
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 193,
				"height" : 193,
				"top" : 406,
				"left" : 923
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1028.8,
					"y" : 461.6
				},
				"eyeLeftTop" : {
					"x" : 978.5,
					"y" : 454.7
				},
				"eyebrowLeftInner" : {
					"x" : 994.8,
					"y" : 440.9
				},
				"upperLipTop" : {
					"x" : 1016.3,
					"y" : 538.5
				},
				"noseRightAlarOutTip" : {
					"x" : 1042.9,
					"y" : 511.0
				},
				"noseRootLeft" : {
					"x" : 1003.6,
					"y" : 462.3
				},
				"noseTip" : {
					"x" : 1007.6,
					"y" : 511.5
				},
				"pupilLeft" : {
					"x" : 977.8,
					"y" : 459.7
				},
				"mouthRight" : {
					"x" : 1066.1,
					"y" : 549.0
				},
				"pupilRight" : {
					"x" : 1064.2,
					"y" : 457.6
				},
				"eyeRightInner" : {
					"x" : 1050.7,
					"y" : 460.2
				},
				"noseRightAlarTop" : {
					"x" : 1031.4,
					"y" : 494.9
				},
				"eyeRightBottom" : {
					"x" : 1066.7,
					"y" : 463.2
				},
				"eyeLeftOuter" : {
					"x" : 966.9,
					"y" : 460.1
				},
				"eyebrowRightOuter" : {
					"x" : 1096.9,
					"y" : 432.1
				},
				"eyeLeftInner" : {
					"x" : 991.2,
					"y" : 461.2
				},
				"underLipBottom" : {
					"x" : 1019.2,
					"y" : 576.9
				},
				"eyebrowRightInner" : {
					"x" : 1034.7,
					"y" : 435.7
				},
				"eyeLeftBottom" : {
					"x" : 978.8,
					"y" : 464.9
				},
				"eyeRightTop" : {
					"x" : 1064.6,
					"y" : 452.5
				},
				"noseLeftAlarOutTip" : {
					"x" : 987.1,
					"y" : 512.5
				},
				"upperLipBottom" : {
					"x" : 1016.9,
					"y" : 547.5
				},
				"mouthLeft" : {
					"x" : 985.6,
					"y" : 545.1
				},
				"eyeRightOuter" : {
					"x" : 1078.9,
					"y" : 457.2
				},
				"underLipTop" : {
					"x" : 1018.3,
					"y" : 562.2
				},
				"eyebrowLeftOuter" : {
					"x" : 946.7,
					"y" : 434.6
				},
				"noseLeftAlarTop" : {
					"x" : 995.7,
					"y" : 496.0
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 36.3,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -22.7,
					"pitch" : 0.0,
					"roll" : -0.1
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 1.0
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.75,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 0.99
						},
						{
							"color" : "other",
							"confidence" : 0.91
						},
						{
							"color" : "brown",
							"confidence" : 0.62
						},
						{
							"color" : "red",
							"confidence" : 0.2
						},
						{
							"color" : "blond",
							"confidence" : 0.05
						},
						{
							"color" : "gray",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 98,
				"height" : 98,
				"top" : 243,
				"left" : 808
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 861.1,
					"y" : 274.9
				},
				"eyeLeftTop" : {
					"x" : 831.2,
					"y" : 270.0
				},
				"eyebrowLeftInner" : {
					"x" : 845.1,
					"y" : 263.0
				},
				"upperLipTop" : {
					"x" : 855.8,
					"y" : 312.0
				},
				"noseRightAlarOutTip" : {
					"x" : 870.2,
					"y" : 296.6
				},
				"noseRootLeft" : {
					"x" : 848.0,
					"y" : 274.4
				},
				"noseTip" : {
					"x" : 852.9,
					"y" : 296.7
				},
				"pupilLeft" : {
					"x" : 830.8,
					"y" : 272.2
				},
				"mouthRight" : {
					"x" : 885.9,
					"y" : 313.0
				},
				"pupilRight" : {
					"x" : 879.7,
					"y" : 273.5
				},
				"eyeRightInner" : {
					"x" : 871.0,
					"y" : 273.4
				},
				"noseRightAlarTop" : {
					"x" : 864.0,
					"y" : 288.9
				},
				"eyeRightBottom" : {
					"x" : 879.3,
					"y" : 276.2
				},
				"eyeLeftOuter" : {
					"x" : 821.9,
					"y" : 271.1
				},
				"eyebrowRightOuter" : {
					"x" : 900.2,
					"y" : 265.5
				},
				"eyeLeftInner" : {
					"x" : 840.6,
					"y" : 273.5
				},
				"underLipBottom" : {
					"x" : 857.1,
					"y" : 321.7
				},
				"eyebrowRightInner" : {
					"x" : 865.5,
					"y" : 263.2
				},
				"eyeLeftBottom" : {
					"x" : 830.3,
					"y" : 274.4
				},
				"eyeRightTop" : {
					"x" : 880.4,
					"y" : 272.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 839.4,
					"y" : 297.3
				},
				"upperLipBottom" : {
					"x" : 856.0,
					"y" : 315.0
				},
				"mouthLeft" : {
					"x" : 837.5,
					"y" : 311.3
				},
				"eyeRightOuter" : {
					"x" : 888.3,
					"y" : 275.0
				},
				"underLipTop" : {
					"x" : 858.3,
					"y" : 315.9
				},
				"eyebrowLeftOuter" : {
					"x" : 814.2,
					"y" : 259.8
				},
				"noseLeftAlarTop" : {
					"x" : 843.5,
					"y" : 289.2
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 33.5,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [
					{
						"confidence" : 0.98,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : -7.1,
					"pitch" : 0.0,
					"roll" : -0.2
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.84
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.04
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.53,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 329,
				"height" : 329,
				"top" : 303,
				"left" : 578
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 767.6,
					"y" : 400.4
				},
				"eyeLeftTop" : {
					"x" : 671.8,
					"y" : 383.6
				},
				"eyebrowLeftInner" : {
					"x" : 715.3,
					"y" : 357.0
				},
				"upperLipTop" : {
					"x" : 746.2,
					"y" : 536.5
				},
				"noseRightAlarOutTip" : {
					"x" : 794.2,
					"y" : 482.5
				},
				"noseRootLeft" : {
					"x" : 728.5,
					"y" : 399.9
				},
				"noseTip" : {
					"x" : 749.3,
					"y" : 479.1
				},
				"pupilLeft" : {
					"x" : 672.9,
					"y" : 389.8
				},
				"mouthRight" : {
					"x" : 796.1,
					"y" : 549.6
				},
				"pupilRight" : {
					"x" : 819.8,
					"y" : 392.6
				},
				"eyeRightInner" : {
					"x" : 788.7,
					"y" : 400.2
				},
				"noseRightAlarTop" : {
					"x" : 779.4,
					"y" : 452.5
				},
				"eyeRightBottom" : {
					"x" : 819.4,
					"y" : 406.8
				},
				"eyeLeftOuter" : {
					"x" : 641.9,
					"y" : 395.4
				},
				"eyebrowRightOuter" : {
					"x" : 890.6,
					"y" : 378.7
				},
				"eyeLeftInner" : {
					"x" : 697.3,
					"y" : 397.2
				},
				"underLipBottom" : {
					"x" : 740.1,
					"y" : 570.8
				},
				"eyebrowRightInner" : {
					"x" : 775.4,
					"y" : 358.6
				},
				"eyeLeftBottom" : {
					"x" : 669.5,
					"y" : 404.9
				},
				"eyeRightTop" : {
					"x" : 818.7,
					"y" : 386.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 700.0,
					"y" : 480.6
				},
				"upperLipBottom" : {
					"x" : 743.7,
					"y" : 549.8
				},
				"mouthLeft" : {
					"x" : 673.0,
					"y" : 543.0
				},
				"eyeRightOuter" : {
					"x" : 845.8,
					"y" : 398.3
				},
				"underLipTop" : {
					"x" : 740.5,
					"y" : 552.0
				},
				"eyebrowLeftOuter" : {
					"x" : 608.7,
					"y" : 365.9
				},
				"noseLeftAlarTop" : {
					"x" : 718.1,
					"y" : 452.8
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 21.9,
				"smile" : 1.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 1.5,
					"pitch" : 0.0,
					"roll" : 1.7
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.19
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.2
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.64,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.48,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.66
						},
						{
							"color" : "red",
							"confidence" : 0.65
						},
						{
							"color" : "other",
							"confidence" : 0.23
						},
						{
							"color" : "blond",
							"confidence" : 0.22
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 83,
				"height" : 83,
				"top" : 477,
				"left" : 296
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 342.6,
					"y" : 497.7
				},
				"eyeLeftTop" : {
					"x" : 317.6,
					"y" : 497.6
				},
				"eyebrowLeftInner" : {
					"x" : 328.2,
					"y" : 488.1
				},
				"upperLipTop" : {
					"x" : 342.3,
					"y" : 536.9
				},
				"noseRightAlarOutTip" : {
					"x" : 352.9,
					"y" : 519.7
				},
				"noseRootLeft" : {
					"x" : 331.1,
					"y" : 498.8
				},
				"noseTip" : {
					"x" : 343.8,
					"y" : 519.3
				},
				"pupilLeft" : {
					"x" : 317.6,
					"y" : 500.1
				},
				"mouthRight" : {
					"x" : 350.2,
					"y" : 540.4
				},
				"pupilRight" : {
					"x" : 350.8,
					"y" : 496.4
				},
				"eyeRightInner" : {
					"x" : 346.5,
					"y" : 498.0
				},
				"noseRightAlarTop" : {
					"x" : 347.8,
					"y" : 512.1
				},
				"eyeRightBottom" : {
					"x" : 352.0,
					"y" : 498.8
				},
				"eyeLeftOuter" : {
					"x" : 312.2,
					"y" : 501.2
				},
				"eyebrowRightOuter" : {
					"x" : 362.9,
					"y" : 484.1
				},
				"eyeLeftInner" : {
					"x" : 324.3,
					"y" : 500.0
				},
				"underLipBottom" : {
					"x" : 342.2,
					"y" : 547.5
				},
				"eyebrowRightInner" : {
					"x" : 343.9,
					"y" : 487.7
				},
				"eyeLeftBottom" : {
					"x" : 318.5,
					"y" : 503.1
				},
				"eyeRightTop" : {
					"x" : 351.0,
					"y" : 494.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 329.1,
					"y" : 524.9
				},
				"upperLipBottom" : {
					"x" : 342.5,
					"y" : 540.9
				},
				"mouthLeft" : {
					"x" : 324.9,
					"y" : 542.6
				},
				"eyeRightOuter" : {
					"x" : 356.6,
					"y" : 495.9
				},
				"underLipTop" : {
					"x" : 341.9,
					"y" : 542.5
				},
				"eyebrowLeftOuter" : {
					"x" : 299.9,
					"y" : 493.3
				},
				"noseLeftAlarTop" : {
					"x" : 331.7,
					"y" : 515.2
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 36.5,
				"smile" : 0.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 21.9,
					"pitch" : 0.0,
					"roll" : -7.9
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.58
				},
				"emotion" : {
					"neutral" : 0.986,
					"surprise" : 0.005,
					"contempt" : 0.0,
					"happiness" : 0.0,
					"anger" : 0.0,
					"sadness" : 0.008,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.52
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.54,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.98
						},
						{
							"color" : "other",
							"confidence" : 0.61
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						},
						{
							"color" : "red",
							"confidence" : 0.03
						},
						{
							"color" : "blond",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 75,
				"height" : 75,
				"top" : 504,
				"left" : 220
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 261.3,
					"y" : 522.5
				},
				"eyeLeftTop" : {
					"x" : 246.7,
					"y" : 515.8
				},
				"eyebrowLeftInner" : {
					"x" : 254.2,
					"y" : 510.9
				},
				"upperLipTop" : {
					"x" : 257.1,
					"y" : 556.4
				},
				"noseRightAlarOutTip" : {
					"x" : 264.2,
					"y" : 543.1
				},
				"noseRootLeft" : {
					"x" : 255.3,
					"y" : 521.6
				},
				"noseTip" : {
					"x" : 259.1,
					"y" : 540.1
				},
				"pupilLeft" : {
					"x" : 247.0,
					"y" : 519.2
				},
				"mouthRight" : {
					"x" : 264.6,
					"y" : 565.2
				},
				"pupilRight" : {
					"x" : 269.2,
					"y" : 521.8
				},
				"eyeRightInner" : {
					"x" : 265.2,
					"y" : 522.4
				},
				"noseRightAlarTop" : {
					"x" : 262.5,
					"y" : 536.8
				},
				"eyeRightBottom" : {
					"x" : 269.2,
					"y" : 524.9
				},
				"eyeLeftOuter" : {
					"x" : 242.6,
					"y" : 519.0
				},
				"eyebrowRightOuter" : {
					"x" : 277.9,
					"y" : 515.0
				},
				"eyeLeftInner" : {
					"x" : 249.8,
					"y" : 519.9
				},
				"underLipBottom" : {
					"x" : 256.8,
					"y" : 570.4
				},
				"eyebrowRightInner" : {
					"x" : 264.9,
					"y" : 514.1
				},
				"eyeLeftBottom" : {
					"x" : 246.3,
					"y" : 521.7
				},
				"eyeRightTop" : {
					"x" : 269.0,
					"y" : 519.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 250.6,
					"y" : 543.8
				},
				"upperLipBottom" : {
					"x" : 257.1,
					"y" : 559.7
				},
				"mouthLeft" : {
					"x" : 247.3,
					"y" : 564.6
				},
				"eyeRightOuter" : {
					"x" : 273.1,
					"y" : 522.8
				},
				"underLipTop" : {
					"x" : 256.9,
					"y" : 564.7
				},
				"eyebrowLeftOuter" : {
					"x" : 236.2,
					"y" : 508.7
				},
				"noseLeftAlarTop" : {
					"x" : 253.7,
					"y" : 535.9
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 22.8,
				"smile" : 0.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 16.6,
					"pitch" : 0.0,
					"roll" : 3.3
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.13
				},
				"emotion" : {
					"neutral" : 0.997,
					"surprise" : 0.001,
					"contempt" : 0.0,
					"happiness" : 0.0,
					"anger" : 0.0,
					"sadness" : 0.002,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.5
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.33,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.0,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "brown",
							"confidence" : 0.73
						},
						{
							"color" : "other",
							"confidence" : 0.71
						},
						{
							"color" : "red",
							"confidence" : 0.04
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						},
						{
							"color" : "blond",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 56,
				"height" : 56,
				"top" : 417,
				"left" : 1146
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1177.8,
					"y" : 432.0
				},
				"eyeLeftTop" : {
					"x" : 1162.2,
					"y" : 430.7
				},
				"eyebrowLeftInner" : {
					"x" : 1170.2,
					"y" : 425.6
				},
				"upperLipTop" : {
					"x" : 1175.8,
					"y" : 456.8
				},
				"noseRightAlarOutTip" : {
					"x" : 1183.0,
					"y" : 445.4
				},
				"noseRootLeft" : {
					"x" : 1171.2,
					"y" : 432.5
				},
				"noseTip" : {
					"x" : 1178.2,
					"y" : 444.8
				},
				"pupilLeft" : {
					"x" : 1163.1,
					"y" : 432.0
				},
				"mouthRight" : {
					"x" : 1182.4,
					"y" : 460.0
				},
				"pupilRight" : {
					"x" : 1184.5,
					"y" : 431.1
				},
				"eyeRightInner" : {
					"x" : 1180.3,
					"y" : 431.9
				},
				"noseRightAlarTop" : {
					"x" : 1180.5,
					"y" : 439.7
				},
				"eyeRightBottom" : {
					"x" : 1183.8,
					"y" : 433.5
				},
				"eyeLeftOuter" : {
					"x" : 1158.8,
					"y" : 432.7
				},
				"eyebrowRightOuter" : {
					"x" : 1189.9,
					"y" : 425.3
				},
				"eyeLeftInner" : {
					"x" : 1165.9,
					"y" : 432.5
				},
				"underLipBottom" : {
					"x" : 1174.5,
					"y" : 463.8
				},
				"eyebrowRightInner" : {
					"x" : 1179.3,
					"y" : 427.0
				},
				"eyeLeftBottom" : {
					"x" : 1162.2,
					"y" : 434.3
				},
				"eyeRightTop" : {
					"x" : 1183.8,
					"y" : 429.8
				},
				"noseLeftAlarOutTip" : {
					"x" : 1167.6,
					"y" : 446.5
				},
				"upperLipBottom" : {
					"x" : 1175.6,
					"y" : 458.5
				},
				"mouthLeft" : {
					"x" : 1161.0,
					"y" : 459.6
				},
				"eyeRightOuter" : {
					"x" : 1187.2,
					"y" : 431.8
				},
				"underLipTop" : {
					"x" : 1174.7,
					"y" : 461.2
				},
				"eyebrowLeftOuter" : {
					"x" : 1151.7,
					"y" : 428.5
				},
				"noseLeftAlarTop" : {
					"x" : 1170.0,
					"y" : 441.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.1,
					"moustache" : 0.0,
					"sideburns" : 0.1
				},
				"age" : 41.4,
				"smile" : 0.003,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 25.1,
					"pitch" : 0.0,
					"roll" : -2.6
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.946,
					"surprise" : 0.008,
					"contempt" : 0.002,
					"happiness" : 0.003,
					"anger" : 0.005,
					"sadness" : 0.031,
					"disgust" : 0.002,
					"fear" : 0.003
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.0
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.43,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.0,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.75
						},
						{
							"color" : "brown",
							"confidence" : 0.37
						},
						{
							"color" : "gray",
							"confidence" : 0.11
						},
						{
							"color" : "red",
							"confidence" : 0.08
						},
						{
							"color" : "blond",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 51,
				"height" : 51,
				"top" : 457,
				"left" : 889
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 921.1,
					"y" : 472.5
				},
				"eyeLeftTop" : {
					"x" : 906.2,
					"y" : 465.9
				},
				"eyebrowLeftInner" : {
					"x" : 914.6,
					"y" : 463.5
				},
				"upperLipTop" : {
					"x" : 914.6,
					"y" : 491.1
				},
				"noseRightAlarOutTip" : {
					"x" : 923.1,
					"y" : 485.5
				},
				"noseRootLeft" : {
					"x" : 915.0,
					"y" : 471.1
				},
				"noseTip" : {
					"x" : 919.2,
					"y" : 482.2
				},
				"pupilLeft" : {
					"x" : 905.2,
					"y" : 467.5
				},
				"mouthRight" : {
					"x" : 921.0,
					"y" : 497.5
				},
				"pupilRight" : {
					"x" : 926.4,
					"y" : 474.6
				},
				"eyeRightInner" : {
					"x" : 923.7,
					"y" : 474.0
				},
				"noseRightAlarTop" : {
					"x" : 921.4,
					"y" : 480.3
				},
				"eyeRightBottom" : {
					"x" : 926.7,
					"y" : 476.5
				},
				"eyeLeftOuter" : {
					"x" : 901.4,
					"y" : 466.9
				},
				"eyebrowRightOuter" : {
					"x" : 936.0,
					"y" : 469.8
				},
				"eyeLeftInner" : {
					"x" : 909.7,
					"y" : 469.4
				},
				"underLipBottom" : {
					"x" : 913.4,
					"y" : 498.9
				},
				"eyebrowRightInner" : {
					"x" : 924.2,
					"y" : 467.4
				},
				"eyeLeftBottom" : {
					"x" : 905.2,
					"y" : 469.7
				},
				"eyeRightTop" : {
					"x" : 927.8,
					"y" : 473.1
				},
				"noseLeftAlarOutTip" : {
					"x" : 909.4,
					"y" : 483.3
				},
				"upperLipBottom" : {
					"x" : 914.4,
					"y" : 493.3
				},
				"mouthLeft" : {
					"x" : 901.7,
					"y" : 492.2
				},
				"eyeRightOuter" : {
					"x" : 930.7,
					"y" : 476.3
				},
				"underLipTop" : {
					"x" : 913.9,
					"y" : 495.2
				},
				"eyebrowLeftOuter" : {
					"x" : 897.1,
					"y" : 459.3
				},
				"noseLeftAlarTop" : {
					"x" : 913.2,
					"y" : 478.8
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 32.5,
				"smile" : 0.979,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 22.9,
					"pitch" : 0.0,
					"roll" : 11.5
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.021,
					"surprise" : 0.0,
					"contempt" : 0.001,
					"happiness" : 0.979,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 0.77
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.68,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.22,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.96
						},
						{
							"color" : "blond",
							"confidence" : 0.18
						},
						{
							"color" : "other",
							"confidence" : 0.18
						},
						{
							"color" : "gray",
							"confidence" : 0.03
						},
						{
							"color" : "red",
							"confidence" : 0.02
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 49,
				"height" : 49,
				"top" : 472,
				"left" : 1299
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1325.3,
					"y" : 485.7
				},
				"eyeLeftTop" : {
					"x" : 1312.3,
					"y" : 483.9
				},
				"eyebrowLeftInner" : {
					"x" : 1317.2,
					"y" : 478.1
				},
				"upperLipTop" : {
					"x" : 1325.1,
					"y" : 505.8
				},
				"noseRightAlarOutTip" : {
					"x" : 1329.7,
					"y" : 498.1
				},
				"noseRootLeft" : {
					"x" : 1319.2,
					"y" : 486.2
				},
				"noseTip" : {
					"x" : 1324.2,
					"y" : 495.6
				},
				"pupilLeft" : {
					"x" : 1313.3,
					"y" : 485.2
				},
				"mouthRight" : {
					"x" : 1330.6,
					"y" : 510.0
				},
				"pupilRight" : {
					"x" : 1331.7,
					"y" : 484.0
				},
				"eyeRightInner" : {
					"x" : 1328.0,
					"y" : 484.8
				},
				"noseRightAlarTop" : {
					"x" : 1327.1,
					"y" : 492.6
				},
				"eyeRightBottom" : {
					"x" : 1331.8,
					"y" : 485.6
				},
				"eyeLeftOuter" : {
					"x" : 1308.8,
					"y" : 486.4
				},
				"eyebrowRightOuter" : {
					"x" : 1338.1,
					"y" : 477.1
				},
				"eyeLeftInner" : {
					"x" : 1315.7,
					"y" : 485.8
				},
				"underLipBottom" : {
					"x" : 1324.9,
					"y" : 513.5
				},
				"eyebrowRightInner" : {
					"x" : 1326.1,
					"y" : 477.4
				},
				"eyeLeftBottom" : {
					"x" : 1312.3,
					"y" : 487.4
				},
				"eyeRightTop" : {
					"x" : 1331.4,
					"y" : 482.9
				},
				"noseLeftAlarOutTip" : {
					"x" : 1317.8,
					"y" : 499.2
				},
				"upperLipBottom" : {
					"x" : 1325.0,
					"y" : 509.0
				},
				"mouthLeft" : {
					"x" : 1316.1,
					"y" : 510.8
				},
				"eyeRightOuter" : {
					"x" : 1334.8,
					"y" : 483.7
				},
				"underLipTop" : {
					"x" : 1324.8,
					"y" : 509.7
				},
				"eyebrowLeftOuter" : {
					"x" : 1303.0,
					"y" : 479.9
				},
				"noseLeftAlarTop" : {
					"x" : 1319.6,
					"y" : 493.7
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 29.6,
				"smile" : 0.0,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 7.2,
					"pitch" : 0.0,
					"roll" : -5.5
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.88
				},
				"emotion" : {
					"neutral" : 0.989,
					"surprise" : 0.002,
					"contempt" : 0.001,
					"happiness" : 0.0,
					"anger" : 0.0,
					"sadness" : 0.007,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.3
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.49,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.8
						},
						{
							"color" : "brown",
							"confidence" : 0.39
						},
						{
							"color" : "red",
							"confidence" : 0.08
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						},
						{
							"color" : "blond",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 46,
				"height" : 46,
				"top" : 610,
				"left" : 1306
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1329.8,
					"y" : 622.4
				},
				"eyeLeftTop" : {
					"x" : 1317.2,
					"y" : 621.8
				},
				"eyebrowLeftInner" : {
					"x" : 1322.4,
					"y" : 617.2
				},
				"upperLipTop" : {
					"x" : 1331.0,
					"y" : 642.3
				},
				"noseRightAlarOutTip" : {
					"x" : 1335.3,
					"y" : 634.2
				},
				"noseRootLeft" : {
					"x" : 1323.9,
					"y" : 623.3
				},
				"noseTip" : {
					"x" : 1330.0,
					"y" : 633.3
				},
				"pupilLeft" : {
					"x" : 1318.0,
					"y" : 623.3
				},
				"mouthRight" : {
					"x" : 1338.1,
					"y" : 644.6
				},
				"pupilRight" : {
					"x" : 1334.5,
					"y" : 620.7
				},
				"eyeRightInner" : {
					"x" : 1331.8,
					"y" : 621.7
				},
				"noseRightAlarTop" : {
					"x" : 1332.9,
					"y" : 630.0
				},
				"eyeRightBottom" : {
					"x" : 1335.2,
					"y" : 622.7
				},
				"eyeLeftOuter" : {
					"x" : 1314.4,
					"y" : 624.2
				},
				"eyebrowRightOuter" : {
					"x" : 1342.5,
					"y" : 615.2
				},
				"eyeLeftInner" : {
					"x" : 1320.8,
					"y" : 623.3
				},
				"underLipBottom" : {
					"x" : 1330.5,
					"y" : 648.3
				},
				"eyebrowRightInner" : {
					"x" : 1329.5,
					"y" : 615.6
				},
				"eyeLeftBottom" : {
					"x" : 1317.7,
					"y" : 625.4
				},
				"eyeRightTop" : {
					"x" : 1334.6,
					"y" : 619.0
				},
				"noseLeftAlarOutTip" : {
					"x" : 1323.3,
					"y" : 636.0
				},
				"upperLipBottom" : {
					"x" : 1331.0,
					"y" : 644.0
				},
				"mouthLeft" : {
					"x" : 1322.4,
					"y" : 646.4
				},
				"eyeRightOuter" : {
					"x" : 1338.2,
					"y" : 620.6
				},
				"underLipTop" : {
					"x" : 1330.3,
					"y" : 645.6
				},
				"eyebrowLeftOuter" : {
					"x" : 1307.5,
					"y" : 621.5
				},
				"noseLeftAlarTop" : {
					"x" : 1324.2,
					"y" : 631.7
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.2,
					"moustache" : 0.0,
					"sideburns" : 0.2
				},
				"age" : 16.8,
				"smile" : 0.0,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 0.99,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : 7.2,
					"pitch" : 0.0,
					"roll" : -10.2
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.24
				},
				"emotion" : {
					"neutral" : 0.992,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.0,
					"anger" : 0.001,
					"sadness" : 0.007,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.5
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.45,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 65,
				"height" : 65,
				"top" : 128,
				"left" : 853
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 889.2,
					"y" : 147.7
				},
				"eyeLeftTop" : {
					"x" : 870.0,
					"y" : 144.7
				},
				"eyebrowLeftInner" : {
					"x" : 879.3,
					"y" : 142.1
				},
				"upperLipTop" : {
					"x" : 888.1,
					"y" : 175.2
				},
				"noseRightAlarOutTip" : {
					"x" : 896.8,
					"y" : 164.3
				},
				"noseRootLeft" : {
					"x" : 880.2,
					"y" : 148.3
				},
				"noseTip" : {
					"x" : 887.0,
					"y" : 166.7
				},
				"pupilLeft" : {
					"x" : 870.1,
					"y" : 146.5
				},
				"mouthRight" : {
					"x" : 900.9,
					"y" : 174.5
				},
				"pupilRight" : {
					"x" : 899.8,
					"y" : 145.9
				},
				"eyeRightInner" : {
					"x" : 894.6,
					"y" : 146.6
				},
				"noseRightAlarTop" : {
					"x" : 891.7,
					"y" : 159.7
				},
				"eyeRightBottom" : {
					"x" : 899.8,
					"y" : 147.9
				},
				"eyeLeftOuter" : {
					"x" : 864.8,
					"y" : 146.5
				},
				"eyebrowRightOuter" : {
					"x" : 911.1,
					"y" : 140.4
				},
				"eyeLeftInner" : {
					"x" : 875.0,
					"y" : 146.6
				},
				"underLipBottom" : {
					"x" : 888.2,
					"y" : 181.0
				},
				"eyebrowRightInner" : {
					"x" : 887.9,
					"y" : 142.4
				},
				"eyeLeftBottom" : {
					"x" : 869.8,
					"y" : 148.1
				},
				"eyeRightTop" : {
					"x" : 899.6,
					"y" : 144.6
				},
				"noseLeftAlarOutTip" : {
					"x" : 876.0,
					"y" : 165.1
				},
				"upperLipBottom" : {
					"x" : 887.9,
					"y" : 177.1
				},
				"mouthLeft" : {
					"x" : 872.0,
					"y" : 175.4
				},
				"eyeRightOuter" : {
					"x" : 904.1,
					"y" : 146.1
				},
				"underLipTop" : {
					"x" : 887.8,
					"y" : 177.0
				},
				"eyebrowLeftOuter" : {
					"x" : 855.5,
					"y" : 143.0
				},
				"noseLeftAlarTop" : {
					"x" : 879.6,
					"y" : 160.3
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.3,
					"moustache" : 0.4,
					"sideburns" : 0.0
				},
				"age" : 82.1,
				"smile" : 0.801,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : 1.1,
					"pitch" : 0.0,
					"roll" : -3.8
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.09
				},
				"emotion" : {
					"neutral" : 0.198,
					"surprise" : 0.0,
					"contempt" : 0.001,
					"happiness" : 0.801,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 1.0
				},
				"glasses" : "ReadingGlasses",
				"exposure" : {
					"value" : 0.85,
					"exposureLevel" : "overExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "other",
							"confidence" : 0.99
						},
						{
							"color" : "black",
							"confidence" : 0.96
						},
						{
							"color" : "brown",
							"confidence" : 0.19
						},
						{
							"color" : "red",
							"confidence" : 0.14
						},
						{
							"color" : "blond",
							"confidence" : 0.12
						},
						{
							"color" : "gray",
							"confidence" : 0.11
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 44,
				"height" : 44,
				"top" : 591,
				"left" : 774
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 797.6,
					"y" : 603.3
				},
				"eyeLeftTop" : {
					"x" : 784.4,
					"y" : 605.0
				},
				"eyebrowLeftInner" : {
					"x" : 790.7,
					"y" : 598.7
				},
				"upperLipTop" : {
					"x" : 797.8,
					"y" : 621.6
				},
				"noseRightAlarOutTip" : {
					"x" : 802.8,
					"y" : 613.0
				},
				"noseRootLeft" : {
					"x" : 792.0,
					"y" : 604.9
				},
				"noseTip" : {
					"x" : 798.2,
					"y" : 613.7
				},
				"pupilLeft" : {
					"x" : 785.3,
					"y" : 605.7
				},
				"mouthRight" : {
					"x" : 804.6,
					"y" : 622.6
				},
				"pupilRight" : {
					"x" : 803.8,
					"y" : 601.0
				},
				"eyeRightInner" : {
					"x" : 800.9,
					"y" : 602.0
				},
				"noseRightAlarTop" : {
					"x" : 800.0,
					"y" : 609.6
				},
				"eyeRightBottom" : {
					"x" : 803.9,
					"y" : 602.0
				},
				"eyeLeftOuter" : {
					"x" : 781.8,
					"y" : 607.0
				},
				"eyebrowRightOuter" : {
					"x" : 809.0,
					"y" : 593.3
				},
				"eyeLeftInner" : {
					"x" : 787.7,
					"y" : 605.0
				},
				"underLipBottom" : {
					"x" : 798.6,
					"y" : 628.8
				},
				"eyebrowRightInner" : {
					"x" : 796.5,
					"y" : 597.2
				},
				"eyeLeftBottom" : {
					"x" : 784.9,
					"y" : 607.1
				},
				"eyeRightTop" : {
					"x" : 803.4,
					"y" : 599.9
				},
				"noseLeftAlarOutTip" : {
					"x" : 791.0,
					"y" : 616.4
				},
				"upperLipBottom" : {
					"x" : 798.3,
					"y" : 624.8
				},
				"mouthLeft" : {
					"x" : 788.3,
					"y" : 626.4
				},
				"eyeRightOuter" : {
					"x" : 806.3,
					"y" : 600.1
				},
				"underLipTop" : {
					"x" : 797.9,
					"y" : 625.5
				},
				"eyebrowLeftOuter" : {
					"x" : 776.6,
					"y" : 601.4
				},
				"noseLeftAlarTop" : {
					"x" : 792.5,
					"y" : 611.4
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 33.5,
				"smile" : 0.009,
				"gender" : "female",
				"accessories" : [
					{
						"confidence" : 0.99,
						"type" : "glasses"
					}
				],
				"headPose" : {
					"yaw" : 16.0,
					"pitch" : 0.0,
					"roll" : -11.7
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.967,
					"surprise" : 0.009,
					"contempt" : 0.002,
					"happiness" : 0.009,
					"anger" : 0.001,
					"sadness" : 0.011,
					"disgust" : 0.001,
					"fear" : 0.001
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.55
				},
				"glasses" : "Sunglasses",
				"exposure" : {
					"value" : 0.52,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.99
						},
						{
							"color" : "red",
							"confidence" : 0.11
						},
						{
							"color" : "blond",
							"confidence" : 0.06
						},
						{
							"color" : "brown",
							"confidence" : 0.05
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 152,
				"height" : 152,
				"top" : 372,
				"left" : 381
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 469.8,
					"y" : 415.5
				},
				"eyeLeftTop" : {
					"x" : 423.9,
					"y" : 413.9
				},
				"eyebrowLeftInner" : {
					"x" : 441.0,
					"y" : 403.9
				},
				"upperLipTop" : {
					"x" : 460.7,
					"y" : 477.2
				},
				"noseRightAlarOutTip" : {
					"x" : 483.7,
					"y" : 448.4
				},
				"noseRootLeft" : {
					"x" : 447.4,
					"y" : 417.4
				},
				"noseTip" : {
					"x" : 460.8,
					"y" : 450.8
				},
				"pupilLeft" : {
					"x" : 420.8,
					"y" : 416.4
				},
				"mouthRight" : {
					"x" : 491.8,
					"y" : 482.0
				},
				"pupilRight" : {
					"x" : 486.4,
					"y" : 411.7
				},
				"eyeRightInner" : {
					"x" : 478.4,
					"y" : 413.2
				},
				"noseRightAlarTop" : {
					"x" : 472.4,
					"y" : 436.4
				},
				"eyeRightBottom" : {
					"x" : 488.8,
					"y" : 414.9
				},
				"eyeLeftOuter" : {
					"x" : 414.2,
					"y" : 417.7
				},
				"eyebrowRightOuter" : {
					"x" : 509.6,
					"y" : 393.0
				},
				"eyeLeftInner" : {
					"x" : 435.3,
					"y" : 416.3
				},
				"underLipBottom" : {
					"x" : 463.1,
					"y" : 506.6
				},
				"eyebrowRightInner" : {
					"x" : 471.1,
					"y" : 401.8
				},
				"eyeLeftBottom" : {
					"x" : 424.8,
					"y" : 419.5
				},
				"eyeRightTop" : {
					"x" : 488.3,
					"y" : 408.5
				},
				"noseLeftAlarOutTip" : {
					"x" : 434.7,
					"y" : 452.0
				},
				"upperLipBottom" : {
					"x" : 461.0,
					"y" : 485.5
				},
				"mouthLeft" : {
					"x" : 427.4,
					"y" : 485.8
				},
				"eyeRightOuter" : {
					"x" : 499.3,
					"y" : 412.6
				},
				"underLipTop" : {
					"x" : 462.1,
					"y" : 494.9
				},
				"eyebrowLeftOuter" : {
					"x" : 396.7,
					"y" : 404.3
				},
				"noseLeftAlarTop" : {
					"x" : 442.5,
					"y" : 439.4
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.2,
					"moustache" : 0.2,
					"sideburns" : 0.2
				},
				"age" : 30.3,
				"smile" : 1.0,
				"gender" : "male",
				"accessories" : [
					{
						"confidence" : 1.0,
						"type" : "headwear"
					}
				],
				"headPose" : {
					"yaw" : -1.0,
					"pitch" : 0.0,
					"roll" : -4.2
				},
				"occlusion" : {
					"foreheadOccluded" : true,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.97
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.29
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.64,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : true,
					"bald" : 0.0,
					"hairColor" : [ ]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 46,
				"height" : 46,
				"top" : 494,
				"left" : 577
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 603.7,
					"y" : 508.0
				},
				"eyeLeftTop" : {
					"x" : 591.1,
					"y" : 504.6
				},
				"eyebrowLeftInner" : {
					"x" : 597.0,
					"y" : 502.4
				},
				"upperLipTop" : {
					"x" : 600.6,
					"y" : 526.2
				},
				"noseRightAlarOutTip" : {
					"x" : 606.1,
					"y" : 519.8
				},
				"noseRootLeft" : {
					"x" : 598.9,
					"y" : 507.6
				},
				"noseTip" : {
					"x" : 601.7,
					"y" : 519.9
				},
				"pupilLeft" : {
					"x" : 590.6,
					"y" : 505.4
				},
				"mouthRight" : {
					"x" : 608.9,
					"y" : 527.7
				},
				"pupilRight" : {
					"x" : 610.5,
					"y" : 507.5
				},
				"eyeRightInner" : {
					"x" : 607.6,
					"y" : 507.8
				},
				"noseRightAlarTop" : {
					"x" : 604.8,
					"y" : 515.6
				},
				"eyeRightBottom" : {
					"x" : 611.0,
					"y" : 508.8
				},
				"eyeLeftOuter" : {
					"x" : 587.2,
					"y" : 505.7
				},
				"eyebrowRightOuter" : {
					"x" : 619.7,
					"y" : 505.4
				},
				"eyeLeftInner" : {
					"x" : 594.1,
					"y" : 506.4
				},
				"underLipBottom" : {
					"x" : 599.3,
					"y" : 531.4
				},
				"eyebrowRightInner" : {
					"x" : 606.9,
					"y" : 503.9
				},
				"eyeLeftBottom" : {
					"x" : 590.7,
					"y" : 507.0
				},
				"eyeRightTop" : {
					"x" : 611.0,
					"y" : 506.8
				},
				"noseLeftAlarOutTip" : {
					"x" : 594.0,
					"y" : 518.5
				},
				"upperLipBottom" : {
					"x" : 600.2,
					"y" : 527.7
				},
				"mouthLeft" : {
					"x" : 588.4,
					"y" : 526.3
				},
				"eyeRightOuter" : {
					"x" : 614.1,
					"y" : 508.4
				},
				"underLipTop" : {
					"x" : 599.8,
					"y" : 529.6
				},
				"eyebrowLeftOuter" : {
					"x" : 581.6,
					"y" : 501.7
				},
				"noseLeftAlarTop" : {
					"x" : 597.4,
					"y" : 515.0
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 24.8,
				"smile" : 0.512,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 9.1,
					"pitch" : 0.0,
					"roll" : 4.4
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.62
				},
				"emotion" : {
					"neutral" : 0.485,
					"surprise" : 0.0,
					"contempt" : 0.003,
					"happiness" : 0.512,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.24
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.28,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.81
						},
						{
							"color" : "other",
							"confidence" : 0.62
						},
						{
							"color" : "red",
							"confidence" : 0.24
						},
						{
							"color" : "blond",
							"confidence" : 0.04
						},
						{
							"color" : "gray",
							"confidence" : 0.04
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 44,
				"height" : 44,
				"top" : 474,
				"left" : 1086
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1112.8,
					"y" : 486.9
				},
				"eyeLeftTop" : {
					"x" : 1099.7,
					"y" : 483.6
				},
				"eyebrowLeftInner" : {
					"x" : 1106.8,
					"y" : 479.6
				},
				"upperLipTop" : {
					"x" : 1106.6,
					"y" : 504.4
				},
				"noseRightAlarOutTip" : {
					"x" : 1114.4,
					"y" : 498.2
				},
				"noseRootLeft" : {
					"x" : 1106.8,
					"y" : 485.8
				},
				"noseTip" : {
					"x" : 1108.0,
					"y" : 496.7
				},
				"pupilLeft" : {
					"x" : 1099.9,
					"y" : 484.3
				},
				"mouthRight" : {
					"x" : 1114.4,
					"y" : 507.3
				},
				"pupilRight" : {
					"x" : 1119.8,
					"y" : 487.2
				},
				"eyeRightInner" : {
					"x" : 1116.4,
					"y" : 487.3
				},
				"noseRightAlarTop" : {
					"x" : 1113.2,
					"y" : 494.6
				},
				"eyeRightBottom" : {
					"x" : 1119.5,
					"y" : 488.5
				},
				"eyeLeftOuter" : {
					"x" : 1096.8,
					"y" : 484.1
				},
				"eyebrowRightOuter" : {
					"x" : 1128.6,
					"y" : 484.9
				},
				"eyeLeftInner" : {
					"x" : 1102.8,
					"y" : 485.0
				},
				"underLipBottom" : {
					"x" : 1106.1,
					"y" : 510.0
				},
				"eyebrowRightInner" : {
					"x" : 1114.5,
					"y" : 481.7
				},
				"eyeLeftBottom" : {
					"x" : 1099.4,
					"y" : 485.5
				},
				"eyeRightTop" : {
					"x" : 1119.7,
					"y" : 486.7
				},
				"noseLeftAlarOutTip" : {
					"x" : 1101.6,
					"y" : 495.8
				},
				"upperLipBottom" : {
					"x" : 1106.5,
					"y" : 506.6
				},
				"mouthLeft" : {
					"x" : 1098.6,
					"y" : 505.1
				},
				"eyeRightOuter" : {
					"x" : 1122.7,
					"y" : 487.9
				},
				"underLipTop" : {
					"x" : 1106.5,
					"y" : 507.1
				},
				"eyebrowLeftOuter" : {
					"x" : 1092.6,
					"y" : 478.7
				},
				"noseLeftAlarTop" : {
					"x" : 1104.1,
					"y" : 492.7
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.1,
					"moustache" : 0.4,
					"sideburns" : 0.5
				},
				"age" : 25.7,
				"smile" : 0.04,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -0.4,
					"pitch" : 0.0,
					"roll" : 9.2
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : true
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.07
				},
				"emotion" : {
					"neutral" : 0.948,
					"surprise" : 0.0,
					"contempt" : 0.005,
					"happiness" : 0.04,
					"anger" : 0.0,
					"sadness" : 0.007,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "high",
					"value" : 0.88
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.53,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.05,
					"hairColor" : [
						{
							"color" : "other",
							"confidence" : 0.97
						},
						{
							"color" : "black",
							"confidence" : 0.95
						},
						{
							"color" : "red",
							"confidence" : 0.72
						},
						{
							"color" : "blond",
							"confidence" : 0.17
						},
						{
							"color" : "gray",
							"confidence" : 0.11
						},
						{
							"color" : "brown",
							"confidence" : 0.03
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : false
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 124,
				"height" : 124,
				"top" : 723,
				"left" : 382
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 462.5,
					"y" : 763.2
				},
				"eyeLeftTop" : {
					"x" : 435.7,
					"y" : 742.4
				},
				"eyebrowLeftInner" : {
					"x" : 448.1,
					"y" : 744.5
				},
				"upperLipTop" : {
					"x" : 437.1,
					"y" : 808.2
				},
				"noseRightAlarOutTip" : {
					"x" : 463.7,
					"y" : 796.7
				},
				"noseRootLeft" : {
					"x" : 448.4,
					"y" : 756.0
				},
				"noseTip" : {
					"x" : 446.5,
					"y" : 787.7
				},
				"pupilLeft" : {
					"x" : 433.3,
					"y" : 745.7
				},
				"mouthRight" : {
					"x" : 452.4,
					"y" : 827.3
				},
				"pupilRight" : {
					"x" : 471.6,
					"y" : 762.7
				},
				"eyeRightInner" : {
					"x" : 467.7,
					"y" : 763.8
				},
				"noseRightAlarTop" : {
					"x" : 459.9,
					"y" : 784.0
				},
				"eyeRightBottom" : {
					"x" : 473.2,
					"y" : 768.5
				},
				"eyeLeftOuter" : {
					"x" : 426.4,
					"y" : 745.5
				},
				"eyebrowRightOuter" : {
					"x" : 494.7,
					"y" : 764.1
				},
				"eyeLeftInner" : {
					"x" : 441.5,
					"y" : 752.4
				},
				"underLipBottom" : {
					"x" : 430.9,
					"y" : 831.0
				},
				"eyebrowRightInner" : {
					"x" : 464.8,
					"y" : 752.7
				},
				"eyeLeftBottom" : {
					"x" : 432.8,
					"y" : 750.9
				},
				"eyeRightTop" : {
					"x" : 475.7,
					"y" : 759.8
				},
				"noseLeftAlarOutTip" : {
					"x" : 429.8,
					"y" : 783.4
				},
				"upperLipBottom" : {
					"x" : 435.8,
					"y" : 814.0
				},
				"mouthLeft" : {
					"x" : 414.8,
					"y" : 808.9
				},
				"eyeRightOuter" : {
					"x" : 479.6,
					"y" : 768.3
				},
				"underLipTop" : {
					"x" : 433.1,
					"y" : 823.4
				},
				"eyebrowLeftOuter" : {
					"x" : 418.8,
					"y" : 731.3
				},
				"noseLeftAlarTop" : {
					"x" : 437.5,
					"y" : 774.5
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.2,
					"moustache" : 0.2,
					"sideburns" : 0.1
				},
				"age" : 62.7,
				"smile" : 0.0,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -4.2,
					"pitch" : 0.0,
					"roll" : 20.3
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "medium",
					"value" : 0.39
				},
				"emotion" : {
					"neutral" : 0.911,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 0.0,
					"anger" : 0.003,
					"sadness" : 0.086,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.26
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.37,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.01,
					"hairColor" : [
						{
							"color" : "black",
							"confidence" : 1.0
						},
						{
							"color" : "other",
							"confidence" : 0.49
						},
						{
							"color" : "brown",
							"confidence" : 0.34
						},
						{
							"color" : "red",
							"confidence" : 0.33
						},
						{
							"color" : "blond",
							"confidence" : 0.15
						},
						{
							"color" : "gray",
							"confidence" : 0.09
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 123,
				"height" : 123,
				"top" : 627,
				"left" : 938
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 1006.5,
					"y" : 660.6
				},
				"eyeLeftTop" : {
					"x" : 979.9,
					"y" : 652.8
				},
				"eyebrowLeftInner" : {
					"x" : 988.6,
					"y" : 648.6
				},
				"upperLipTop" : {
					"x" : 997.1,
					"y" : 712.3
				},
				"noseRightAlarOutTip" : {
					"x" : 1012.0,
					"y" : 692.6
				},
				"noseRootLeft" : {
					"x" : 991.4,
					"y" : 658.9
				},
				"noseTip" : {
					"x" : 994.4,
					"y" : 691.1
				},
				"pupilLeft" : {
					"x" : 978.9,
					"y" : 654.8
				},
				"mouthRight" : {
					"x" : 1023.8,
					"y" : 723.1
				},
				"pupilRight" : {
					"x" : 1021.8,
					"y" : 659.2
				},
				"eyeRightInner" : {
					"x" : 1014.2,
					"y" : 660.3
				},
				"noseRightAlarTop" : {
					"x" : 1006.7,
					"y" : 684.5
				},
				"eyeRightBottom" : {
					"x" : 1021.9,
					"y" : 662.6
				},
				"eyeLeftOuter" : {
					"x" : 971.9,
					"y" : 653.7
				},
				"eyebrowRightOuter" : {
					"x" : 1043.0,
					"y" : 650.2
				},
				"eyeLeftInner" : {
					"x" : 987.4,
					"y" : 656.5
				},
				"underLipBottom" : {
					"x" : 996.2,
					"y" : 740.2
				},
				"eyebrowRightInner" : {
					"x" : 1009.5,
					"y" : 651.0
				},
				"eyeLeftBottom" : {
					"x" : 979.0,
					"y" : 657.3
				},
				"eyeRightTop" : {
					"x" : 1021.4,
					"y" : 657.3
				},
				"noseLeftAlarOutTip" : {
					"x" : 982.1,
					"y" : 690.9
				},
				"upperLipBottom" : {
					"x" : 996.8,
					"y" : 718.3
				},
				"mouthLeft" : {
					"x" : 980.6,
					"y" : 719.8
				},
				"eyeRightOuter" : {
					"x" : 1029.6,
					"y" : 659.5
				},
				"underLipTop" : {
					"x" : 997.1,
					"y" : 730.4
				},
				"eyebrowLeftOuter" : {
					"x" : 959.7,
					"y" : 639.2
				},
				"noseLeftAlarTop" : {
					"x" : 986.9,
					"y" : 684.4
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 31.1,
				"smile" : 0.242,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -9.9,
					"pitch" : 0.0,
					"roll" : 3.5
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.414,
					"surprise" : 0.281,
					"contempt" : 0.0,
					"happiness" : 0.242,
					"anger" : 0.0,
					"sadness" : 0.058,
					"disgust" : 0.001,
					"fear" : 0.004
				},
				"noise" : {
					"noiseLevel" : "medium",
					"value" : 0.37
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.56,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "red",
							"confidence" : 0.97
						},
						{
							"color" : "black",
							"confidence" : 0.86
						},
						{
							"color" : "other",
							"confidence" : 0.83
						},
						{
							"color" : "brown",
							"confidence" : 0.19
						},
						{
							"color" : "gray",
							"confidence" : 0.07
						},
						{
							"color" : "blond",
							"confidence" : 0.06
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		},
		{
			"faceRectangle" : {
				"width" : 66,
				"height" : 66,
				"top" : 560,
				"left" : 556
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 591.2,
					"y" : 577.1
				},
				"eyeLeftTop" : {
					"x" : 572.1,
					"y" : 579.3
				},
				"eyebrowLeftInner" : {
					"x" : 581.0,
					"y" : 570.9
				},
				"upperLipTop" : {
					"x" : 595.3,
					"y" : 605.9
				},
				"noseRightAlarOutTip" : {
					"x" : 601.7,
					"y" : 591.3
				},
				"noseRootLeft" : {
					"x" : 583.0,
					"y" : 579.3
				},
				"noseTip" : {
					"x" : 594.6,
					"y" : 591.6
				},
				"pupilLeft" : {
					"x" : 573.0,
					"y" : 580.7
				},
				"mouthRight" : {
					"x" : 602.2,
					"y" : 608.6
				},
				"pupilRight" : {
					"x" : 596.8,
					"y" : 574.6
				},
				"eyeRightInner" : {
					"x" : 594.3,
					"y" : 576.3
				},
				"noseRightAlarTop" : {
					"x" : 596.7,
					"y" : 587.1
				},
				"eyeRightBottom" : {
					"x" : 598.2,
					"y" : 576.0
				},
				"eyeLeftOuter" : {
					"x" : 568.1,
					"y" : 581.4
				},
				"eyebrowRightOuter" : {
					"x" : 605.4,
					"y" : 564.5
				},
				"eyeLeftInner" : {
					"x" : 577.3,
					"y" : 580.4
				},
				"underLipBottom" : {
					"x" : 597.1,
					"y" : 618.2
				},
				"eyebrowRightInner" : {
					"x" : 590.9,
					"y" : 570.1
				},
				"eyeLeftBottom" : {
					"x" : 572.5,
					"y" : 582.5
				},
				"eyeRightTop" : {
					"x" : 596.8,
					"y" : 572.8
				},
				"noseLeftAlarOutTip" : {
					"x" : 583.2,
					"y" : 598.8
				},
				"upperLipBottom" : {
					"x" : 595.9,
					"y" : 609.0
				},
				"mouthLeft" : {
					"x" : 581.5,
					"y" : 614.6
				},
				"eyeRightOuter" : {
					"x" : 601.3,
					"y" : 573.3
				},
				"underLipTop" : {
					"x" : 595.8,
					"y" : 613.3
				},
				"eyebrowLeftOuter" : {
					"x" : 559.3,
					"y" : 576.5
				},
				"noseLeftAlarTop" : {
					"x" : 584.8,
					"y" : 591.4
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 29.2,
				"smile" : 0.552,
				"gender" : "female",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : 21.9,
					"pitch" : 0.0,
					"roll" : -15.8
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "low",
					"value" : 0.0
				},
				"emotion" : {
					"neutral" : 0.24,
					"surprise" : 0.024,
					"contempt" : 0.01,
					"happiness" : 0.552,
					"anger" : 0.072,
					"sadness" : 0.039,
					"disgust" : 0.057,
					"fear" : 0.006
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.26
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.43,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.19,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 0.98
						},
						{
							"color" : "black",
							"confidence" : 0.84
						},
						{
							"color" : "other",
							"confidence" : 0.77
						},
						{
							"color" : "blond",
							"confidence" : 0.27
						},
						{
							"color" : "red",
							"confidence" : 0.23
						},
						{
							"color" : "gray",
							"confidence" : 0.01
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : true,
					"lipMakeup" : true
				}
			}
		}
	],
	[
		{
			"faceRectangle" : {
				"width" : 103,
				"height" : 103,
				"top" : 530,
				"left" : 643
			},
			"faceLandmarks" : {
				"noseRootRight" : {
					"x" : 705.6,
					"y" : 561.1
				},
				"eyeLeftTop" : {
					"x" : 681.1,
					"y" : 547.6
				},
				"eyebrowLeftInner" : {
					"x" : 691.8,
					"y" : 545.5
				},
				"upperLipTop" : {
					"x" : 688.8,
					"y" : 601.2
				},
				"noseRightAlarOutTip" : {
					"x" : 708.2,
					"y" : 587.9
				},
				"noseRootLeft" : {
					"x" : 691.8,
					"y" : 557.8
				},
				"noseTip" : {
					"x" : 689.7,
					"y" : 586.6
				},
				"pupilLeft" : {
					"x" : 682.0,
					"y" : 551.3
				},
				"mouthRight" : {
					"x" : 707.3,
					"y" : 610.7
				},
				"pupilRight" : {
					"x" : 723.9,
					"y" : 563.8
				},
				"eyeRightInner" : {
					"x" : 714.0,
					"y" : 561.7
				},
				"noseRightAlarTop" : {
					"x" : 703.6,
					"y" : 578.1
				},
				"eyeRightBottom" : {
					"x" : 721.3,
					"y" : 566.2
				},
				"eyeLeftOuter" : {
					"x" : 673.4,
					"y" : 549.2
				},
				"eyebrowRightOuter" : {
					"x" : 742.9,
					"y" : 559.6
				},
				"eyeLeftInner" : {
					"x" : 686.1,
					"y" : 553.4
				},
				"underLipBottom" : {
					"x" : 681.9,
					"y" : 619.6
				},
				"eyebrowRightInner" : {
					"x" : 711.2,
					"y" : 552.5
				},
				"eyeLeftBottom" : {
					"x" : 678.5,
					"y" : 553.5
				},
				"eyeRightTop" : {
					"x" : 723.1,
					"y" : 560.5
				},
				"noseLeftAlarOutTip" : {
					"x" : 675.7,
					"y" : 579.9
				},
				"upperLipBottom" : {
					"x" : 687.4,
					"y" : 605.4
				},
				"mouthLeft" : {
					"x" : 670.6,
					"y" : 600.4
				},
				"eyeRightOuter" : {
					"x" : 729.0,
					"y" : 565.5
				},
				"underLipTop" : {
					"x" : 684.7,
					"y" : 611.8
				},
				"eyebrowLeftOuter" : {
					"x" : 664.5,
					"y" : 536.0
				},
				"noseLeftAlarTop" : {
					"x" : 683.0,
					"y" : 574.1
				}
			},
			"faceAttributes" : {
				"facialHair" : {
					"beard" : 0.0,
					"moustache" : 0.0,
					"sideburns" : 0.0
				},
				"age" : 31.7,
				"smile" : 1.0,
				"gender" : "male",
				"accessories" : [ ],
				"headPose" : {
					"yaw" : -6.7,
					"pitch" : 0.0,
					"roll" : 16.5
				},
				"occlusion" : {
					"foreheadOccluded" : false,
					"eyeOccluded" : false,
					"mouthOccluded" : false
				},
				"blur" : {
					"blurLevel" : "high",
					"value" : 0.89
				},
				"emotion" : {
					"neutral" : 0.0,
					"surprise" : 0.0,
					"contempt" : 0.0,
					"happiness" : 1.0,
					"anger" : 0.0,
					"sadness" : 0.0,
					"disgust" : 0.0,
					"fear" : 0.0
				},
				"noise" : {
					"noiseLevel" : "low",
					"value" : 0.03
				},
				"glasses" : "NoGlasses",
				"exposure" : {
					"value" : 0.73,
					"exposureLevel" : "goodExposure"
				},
				"hair" : {
					"invisible" : false,
					"bald" : 0.02,
					"hairColor" : [
						{
							"color" : "brown",
							"confidence" : 1.0
						},
						{
							"color" : "black",
							"confidence" : 0.84
						},
						{
							"color" : "other",
							"confidence" : 0.17
						},
						{
							"color" : "blond",
							"confidence" : 0.17
						},
						{
							"color" : "red",
							"confidence" : 0.07
						},
						{
							"color" : "gray",
							"confidence" : 0.05
						}
					]
				},
				"makeup" : {
					"eyeMakeup" : false,
					"lipMakeup" : false
				}
			}
		}
	]
]'
]

{ #category : #'unsplash - urls' }
GtCSExamplesData class >> unsplashPicturesCropped3500Urls [
	^ self unsplashPicturesCroppedUrls collect: [ :anUrl |
		| queryIndex |
		queryIndex :=  anUrl findString: 'w='.
		(anUrl copyFrom: 1 to: queryIndex-1), 'w=3500&q=60' ]
]

{ #category : #'unsplash - urls' }
GtCSExamplesData class >> unsplashPicturesCroppedUrls [
	^ 'https://images.unsplash.com/photo-1501238295340-c810d3c156d2?auto=format&fit=crop&w=2850&q=60
https://images.unsplash.com/photo-1501386761578-eac5c94b800a?auto=format&fit=crop&w=1650&q=60
https://images.unsplash.com/photo-1493528237448-144452699e16?auto=format&fit=crop&w=1730&q=60
https://images.unsplash.com/photo-1495131796982-281014f71fbd?auto=format&fit=crop&w=2676&q=60
https://images.unsplash.com/photo-1478812954026-9c750f0e89fc?auto=format&fit=crop&w=1500&q=60
https://images.unsplash.com/photo-1489980478712-2ab535aa775f?auto=format&fit=crop&w=1500&q=60
https://images.unsplash.com/photo-1498489763436-1a5ffbbd2888?auto=format&fit=crop&w=998&q=60
https://images.unsplash.com/photo-1485889280870-db9129696fae?auto=format&fit=crop&w=1400&q=60
https://images.unsplash.com/photo-1481890342388-a3c6731f034d?auto=format&fit=crop&w=1500&q=60
https://images.unsplash.com/photo-1505327895416-162c40b2e87c?auto=format&fit=crop&w=1500&q=60
https://images.unsplash.com/photo-1501622549218-2c3ef86627cb?auto=format&fit=crop&w=1504&q=60
https://images.unsplash.com/photo-1500156407682-372262e56f59?auto=format&fit=crop&w=1650&q=60
https://images.unsplash.com/photo-1462927346281-d1727e290082?auto=format&fit=crop&w=668&q=60
https://images.unsplash.com/photo-1502928800718-967273b36262?auto=format&fit=crop&w=1651&q=60
https://images.unsplash.com/photo-1416453072034-c8dbfa2856b5?auto=format&fit=crop&w=1516&q=60
https://images.unsplash.com/photo-1508248839954-53aae05bddca?auto=format&fit=crop&w=1500&q=60' lines.
]

{ #category : #'unsplash - urls' }
GtCSExamplesData class >> unsplashPicturesCroppedUrlsFirst4 [
	^ self unsplashPicturesCroppedUrls first: 4
]

{ #category : #'unsplash - urls' }
GtCSExamplesData class >> unsplashPicturesFullUrls [
	^ self unsplashPicturesCroppedUrls collect: [ :anUrl |
		| queryIndex |
		queryIndex :=  anUrl indexOf: $?.
		(anUrl copyFrom: 1 to: queryIndex-1) ]
]
