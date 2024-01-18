Class {
	#name : #KBBoardExample,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Kanban-Examples'
}

{ #category : #accessing }
KBBoardExample >> database [
	<gtExample>
	| db |
	db := LeDatabase new.
	db parent: LeDatabasesRegistry uniqueInstance defaultLogicalDatabase.
	^ db
]
