world menu
connectorMenuCommandOn: aBuilder
	<worldMenu>

	(aBuilder item: #'4. Connector')
		order: 0.4;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self connectorMethod ].