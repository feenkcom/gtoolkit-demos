"
I announce the fact that the user has clicked on a square of the board, so there is a request to move the token on that square (if any).
"
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
