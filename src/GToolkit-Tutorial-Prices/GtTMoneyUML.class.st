"
A UML diagram for the EDD tutorial.
"
Class {
	#name : #GtTMoneyUML,
	#superclass : #Object,
	#category : #'GToolkit-Tutorial-Prices-Examples'
}

{ #category : #accessing }
GtTMoneyUML >> umlDiagram [
	<gtExample>
	| positions associations classes m |
	classes := GtTMoney withAllSubclasses
			add: GtTCurrency;
			yourself.
	associations := {GtTMoney
				-> {{'currency'.
							GtTCurrency}}}.
	positions := {(89.5@430.5). (218.5919952392578@430.5). (316.65999603271484@430.5). (228.6409969329834@325.90216064453125). (408.83799743652344@326.5). (168.99350700226074@355.5). (265.8842391659055@355.5). (280.12078286668503@355.5). (302.8829975128174@319.79786533230504). (302.8829975128174@319.79786533230504). (302.8829975128174@319.79786533230504). (302.8829975128174@319.79786533230504). (302.8829975128174@319.79786533230504)}.

	m := UmlClassDiagram new
			classHierarchyFor: classes
			withAssociationsAndLabels: associations.

	m layout custom: BlBasicLayout new.

	m root children withIndexDo: [ :child :n | child relocate: (positions at: n) ].
	^ m
]
