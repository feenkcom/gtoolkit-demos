"
A LoggingProxy demos method wrappers using the ""minimal object"" technique. The class inherits from ProtoObject, so it implements almost nothing. Any message sent to itr is trapped by doesNotUnderstand:. The proxy then does its logging action and forwards the message to its subject.
"
Class {
	#name : #LoggingProxy,
	#superclass : #ProtoObject,
	#instVars : [
		'subject',
		'messageLog'
	],
	#category : #'GToolkit-Demo-Reflection-Intercession'
}

{ #category : #'instance creation' }
LoggingProxy class >> for: aSubject [
	self new become: aSubject.
	^ aSubject
]

{ #category : #'error-handling' }
LoggingProxy >> doesNotUnderstand: aMessage [
	messageLog addLast: aMessage.
	^ aMessage sendTo: subject
	
]

{ #category : #view }
LoggingProxy >> gtLogFor: aView [
	<gtView>
	^ aView list
		title: 'Log';
		priority: 10;
		items: [ self messageLog ];
		actionUpdateButton
]

{ #category : #'initialize-release' }
LoggingProxy >> initialize [
	messageLog := OrderedCollection new.
	subject := self.
]

{ #category : #accessing }
LoggingProxy >> messageLog [
	^ messageLog
]

{ #category : #accessing }
LoggingProxy >> subject [
	^ subject
]
