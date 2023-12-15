"
A LoggingProxy demos method wrappers using the ""minimal object"" technique. The class inherits from ProtoObject, so it implements almost nothing. Any message sent to itr is trapped by doesNotUnderstand:. The proxy then does its logging action and forwards the message to its subject.
"
Class {
	#name : #LoggingProxy,
	#superclass : #ProtoObject,
	#instVars : [
		'subject',
		'invocationCount'
	],
	#category : #'GToolkit-Demo-Reflection-Intercession'
}

{ #category : #'instance creation' }
LoggingProxy class >> for: aSubject [
	^ self new become: aSubject
]

{ #category : #'error-handling' }
LoggingProxy >> doesNotUnderstand: aMessage [
	Transcript
		show: 'performing ' , aMessage printString;
		cr.
	invocationCount := invocationCount + 1.
	^ aMessage sendTo: subject
	
]

{ #category : #'initialize-release' }
LoggingProxy >> initialize [
	invocationCount := 0.
	subject := self.
]

{ #category : #accessing }
LoggingProxy >> invocationCount [
	^ invocationCount
]
