world menu
menuCommandOn: aBuilder
	<worldMenu>

	(aBuilder item: #'SCG - Moldable Editor')
		order: 0.0;
		target: self;
		iconName: #glamorousGo.
	
	(aBuilder item: #'0. Title')
		order: 0.1;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self title ].
	
	(aBuilder item: #'1. Transcript - api')
		order: 0.1;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self transcriptApi ].
		
	(aBuilder item: #'2. Transcript - intro')
		order: 0.2;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self transcriptIntro ].

	(aBuilder item: #'3. Transcript - animation')
		order: 0.3;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self transcriptAnimation ].

	(aBuilder item: #'4. Transcript - object shower')
		order: 0.4;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self transcriptObjectShower ].

	(aBuilder item: #'5. Connector - examples')
		order: 0.5;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self connectorMethod ].
	
	(aBuilder item: #'6. Rope tree')
		order: 0.6;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self ropeTree ].
	
	(aBuilder item: #'7. Mapping of elements')
		order: 0.7;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self editorElements ].
	
	(aBuilder item: #'8. Text - rotated')
		order: 0.8;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self rotatedText ].
		
	(aBuilder item: #'9. Text - 10`000`000')
		order: 0.9;
		iconName: #catalogIcon; 
		parent: 'SCG - Moldable Editor';
		action: [ self text10k ].
	
	(aBuilder item: #'10. Documenter - editor')
		order: 1.0;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self documenterEditor ].
	
	(aBuilder item: #'Reset')
		order: 3.0;
		iconName: #catalogIcon; 
		parent: #'SCG - Moldable Editor';
		action: [ self reset ].