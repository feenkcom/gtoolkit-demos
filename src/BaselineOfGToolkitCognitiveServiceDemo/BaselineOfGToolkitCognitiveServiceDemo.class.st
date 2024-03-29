"
1. Exemplifying software - the Cognitive Service
The exemplifying software tutorial based on a case study of face recognition using the Azure Face API:
[esug-2018-exemplifying-software.pillar](fileLocator://gtResource/feenkcom/gtoolkit-demos/doc/tutorial/esug-2018/esug-2018-exemplifying-software.pillar)


"
Class {
	#name : #BaselineOfGToolkitCognitiveServiceDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitCognitiveServiceDemo
}

{ #category : #baseline }
BaselineOfGToolkitCognitiveServiceDemo >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'GToolkitUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:main/src' ];
			baseline: 'Bloc' with: [
				spec repository: 'github://feenkcom/Bloc:main/src' ].
		spec 
			package: 'GToolkit-Demo-CognitiveServices-FaceAPI';
			package: 'GToolkit-Demo-CognitiveServices-FaceAPI-Examples' with: [
				spec requires: #('GToolkitUtility' 'GToolkit-Demo-CognitiveServices-FaceAPI' ). ];
			package: 'GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' with: [
				spec requires: #('GToolkit-Demo-CognitiveServices-FaceAPI' ). ];
			package: 'GToolkit-Demo-CognitiveServices-FaceAPI-Extensions' with: [
				spec requires: #('GToolkit-Demo-CognitiveServices-FaceAPI' ). ];
			package: 'GToolkit-Demo-CognitiveServices-FaceAPI-UI' with: [
				spec requires: #('GToolkitUtility' 'GToolkit-Demo-CognitiveServices-FaceAPI' 'Bloc' ). ];
			package: 'GToolkit-Demo-CognitiveServices-FaceAPI-Experiments' with: [
				spec requires: #('GToolkit-Demo-CognitiveServices-FaceAPI' ). ];
			package: 'GToolkit-Demo-AddressBook'. ].

]
