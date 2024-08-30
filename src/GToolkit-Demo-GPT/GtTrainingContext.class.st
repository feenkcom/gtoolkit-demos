Class {
	#name : #GtTrainingContext,
	#superclass : #PBProxyObject,
	#category : #'GToolkit-Demo-GPT-Proxies'
}

{ #category : #'as yet unclassified' }
GtTrainingContext class >> pythonClass [
	^ 'nanogpt.TrainingContext'
]

{ #category : #'as yet unclassified' }
GtTrainingContext >> gtDependenciesGraphFor: aView [
	<gtView>
	^ aView forward
		title: 'Architecture';
		priority: 10;
		object: [ self model name: 'Root' ];
		view: #gtDependenciesGraphFor:
]
