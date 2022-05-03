Class {
	#name : #GtLudoSquareSignalTokenMove,
	#superclass : #Announcement,
	#instVars : [
		'token'
	],
	#category : #'GToolkit-Demo-Ludo-Announcements'
}

{ #category : #'instance creation' }
GtLudoSquareSignalTokenMove class >> for: aToken [
	^ self new
		  token: aToken;
		  yourself
]

{ #category : #accessing }
GtLudoSquareSignalTokenMove >> token [
	^ token
]

{ #category : #accessing }
GtLudoSquareSignalTokenMove >> token: aToken [
	token := aToken
]
