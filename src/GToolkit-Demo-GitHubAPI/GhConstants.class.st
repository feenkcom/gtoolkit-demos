"
I hold constants shared by the GitHub REST API demo classes.

My #executionConfiguration answers the AsyncFutureExecutionConfiguration under which blocking GitHub requests are drained. It uses a named #Demo group at low priority so that such work never competes with the user interface, and allows two workers so that a single wedged request does not block every later one.
"
Class {
	#name : #GhConstants,
	#superclass : #Object,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhConstants class >> executionConfiguration [
	"Answer the configuration under which blocking GitHub requests are drained.
	A fresh instance per send matches BrStreamItemsProvider class>>#defaultExecutionConfiguration."

	<return: #AsyncFutureExecutionConfiguration>
	^ AsyncFutureExecutionConfiguration new
		customGroup: self executionGroupName;
		lowPriority;
		maxAmountOfWorkers: self maxAmountOfWorkers;
		yourself
]

{ #category : #accessing }
GhConstants class >> executionGroupName [
	^ #Demo
]

{ #category : #accessing }
GhConstants class >> maxAmountOfWorkers [
	"Two rather than the default one, so that a single wedged request does not block every later one."

	^ 2
]

{ #category : #accessing }
GhConstants class >> pageSize [
	"The number of items requested per page. 100 is the maximum the GitHub REST API accepts."

	^ 100
]
