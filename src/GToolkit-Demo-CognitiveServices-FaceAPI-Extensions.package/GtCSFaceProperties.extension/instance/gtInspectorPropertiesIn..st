*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions
gtInspectorPropertiesIn: composite
	<gtInspectorPresentationOrder: 25>
	^ composite table
		title: 'Properties';
		display: [ self properties associations ];
		column: 'Name' evaluated: #key width: 150;
		column: 'Value' evaluated: #value;
		children: [ :association |
			association value isDictionary
				ifTrue: [ association value associations ]
				ifFalse: [ #() ] ];
		send: #value