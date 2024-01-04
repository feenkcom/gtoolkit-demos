Class {
	#name : #GtP3F1ClientObject,
	#superclass : #Object,
	#instVars : [
		'p3Client'
	],
	#category : #'GToolkit-Demo-P3-F1'
}

{ #category : #accessing }
GtP3F1ClientObject >> p3Client [
	^ p3Client
]

{ #category : #accessing }
GtP3F1ClientObject >> p3Client: aP3Client [
	p3Client := aP3Client
]

{ #category : #accessing }
GtP3F1ClientObject >> url: urlString [
	p3Client := P3Client url: urlString.
]
