"
!Exemplifying software - the Cognitive Service

The exemplifying software tutorial based on a case study of face recognition using the Azure Face API:
${icebergFile:path=feenkcom/gtoolkit-demos/doc/tutorial/esug-2018/esug-2018-exemplifying-software.pillar}$

"
Class {
	#name : #BaselineOfGToolkitCognitiveServiceDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitCognitiveServiceDemo
}

{ #category : #baselines }
BaselineOfGToolkitCognitiveServiceDemo >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec baseline: 'GToolkitUtility' with: [ spec 
				repository: 'github://feenkcom/gtoolkit-utility/src' ].
		spec baseline: 'Bloc' with: [ spec 
				repository: 'github://pharo-graphics/Bloc/src' ].
		spec
			package: 'GToolkit-Demo-CognitiveServices-FaceAPI';
			package: 'GToolkit-Demo-CognitiveServices-FaceAPI-Examples' with: [ 
				spec requires: #( 'GToolkitUtility' 'GToolkit-Demo-CognitiveServices-FaceAPI') ];
			package: 'GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' with: [ 
				spec requires: #('GToolkit-Demo-CognitiveServices-FaceAPI') ];
			package: 'GToolkit-Demo-CognitiveServices-FaceAPI-Extensions' with: [ 
				spec requires: #('GToolkit-Demo-CognitiveServices-FaceAPI') ];
			package: 'GToolkit-Demo-CognitiveServices-FaceAPI-UI' with: [ 
				spec requires: #( 'GToolkitUtility' 'GToolkit-Demo-CognitiveServices-FaceAPI' 'Bloc') ];
			package: 'GToolkit-Demo-CognitiveServices-FaceAPI-Experiments' with: [ 
				spec requires: #('GToolkit-Demo-CognitiveServices-FaceAPI') ];
			package: 'GToolkit-Demo-AddressBook'.
			
		spec 
			group: 'part1' with: #('GToolkit-Demo-CognitiveServices-FaceAPI' 'GToolkit-Demo-CognitiveServices-FaceAPI-Examples' 'GToolkit-Demo-CognitiveServices-FaceAPI-Extensions');
			group: 'part2' with: #('part1' 'GToolkit-Demo-CognitiveServices-FaceAPI-UI' 'GToolkit-Demo-CognitiveServices-FaceAPI-Experiments');
			group: 'default' with: #('part1' 'part2' 'GToolkit-Demo-AddressBook') ]

]
