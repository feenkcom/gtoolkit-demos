Extension { #name : #P3ClientTable }

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTable >> driverStandingsTop20OverallWins [
	^ self client query: '
SELECT driverstandings.driverid, drivers.driverref, drivers.nationality, SUM(position) AS wins
FROM driverstandings, drivers 
WHERE driverstandings.driverid = drivers.driverid AND driverstandings.position = 1 
GROUP BY driverstandings.driverid, drivers.driverref, drivers.nationality 
ORDER BY wins DESC 
LIMIT 20
'
]

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTable >> gtViewDriverStandingsTop20OverallWinsIn: composite [
	<gtView>
	| normalizer plotterData |
	self name = 'driverstandings' ifFalse: [ ^ composite empty ].
	^ composite explicit
		title: 'Top 20 Overall Wins';
		stencil: [
			normalizer := BrIdentityNormalizer new.
			plotterData := GtPlotterDataGroup new values: 
								self driverStandingsTop20OverallWins recordsAsDictionaries.
			plotterData := plotterData labelled: [ :each | each at: #driverref ].
			plotterData := plotterData colored: [ :each | normalizer value: (each at: #nationality) ]. 
			GtPlotter new horizontalBarChart
				barWidthScale: (GtPlotterLinearScale new 
									domainFrom: 1 to: (plotterData values max: [ :each | each at: #wins ]));
				amountOfTicks: 1;
				barWidthData: [ :each | each at: #wins ];
				barHeightScale: (GtPlotterConstantScale new constant: 20);
				with: plotterData ]
]
