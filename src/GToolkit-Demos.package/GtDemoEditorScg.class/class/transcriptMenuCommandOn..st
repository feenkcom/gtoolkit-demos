demos
transcriptMenuCommandOn: aBuilder
	<worldMenu>

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

	(aBuilder item: #'3+. Transcript - object shower')
		order: 0.35;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self transcriptObjectShower ]