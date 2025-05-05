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
	<return: #GtMondrian>
	| positions associations classes m |
	classes := GtTMoney withAllSubclasses
			add: GtTCurrency;
			yourself.
	associations := {GtTCurrencyMoney
				-> {{'currency'.
							GtTCurrency}}}.
	positions := {222.41666666666669 @ 418.83333333333337.
			361.96166102091473 @ 418.83333333333337.
			469.02966181437176 @ 418.83333333333337.
			372.91766421000165 @ 315.2354939778646.
			235.86966578165692 @ 314.4311726888021.
			303.6868829815867 @ 344.83333333333337.
			410.00180439479846 @ 344.83333333333337.
			425.6921337133648 @ 344.83333333333337.
			268.0018000284831 @ 344.02901204427087.
			268.0018000284831 @ 344.02901204427087.
			268.0018000284831 @ 344.02901204427087.
			268.0018000284831 @ 344.02901204427087.
			268.0018000284831 @ 344.02901204427087}.
	m := UmlClassDiagram new
			classHierarchyFor: classes
			withAssociationsAndLabels: associations.
	m layout custom: BlBasicLayout new.
	m root children withIndexDo: [ :child :n | child relocate: (positions at: n) ].
	^ m
]
