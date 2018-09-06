baselines
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec baseline: 'Bloc' with: [ spec 
				repository: 'github://pharo-graphics/Bloc/src' ].
		spec
			package: 'Cognitive-Services-FaceAPI';
			package: 'Cognitive-Services-FaceAPI-Examples' with: [ 
				spec requires: #('Cognitive-Services-FaceAPI') ];
			package: 'Cognitive-Services-FaceAPI-BlocExtensions' with: [ 
				spec requires: #('Cognitive-Services-FaceAPI') ];
			package: 'Cognitive-Services-FaceAPI-Extensions' with: [ 
				spec requires: #('Cognitive-Services-FaceAPI') ];
			package: 'Cognitive-Services-FaceAPI-UI' with: [ 
				spec requires: #('Cognitive-Services-FaceAPI' 'Bloc') ];
			package: 'Cognitive-Services-FaceAPI-Experiments' with: [ 
				spec requires: #('Cognitive-Services-FaceAPI') ].
			
		spec 
			group: 'part1' with: #('Cognitive-Services-FaceAPI' 'Cognitive-Services-FaceAPI-Examples' 'Cognitive-Services-FaceAPI-Extensions');
			group: 'part2' with: #('part1' 'Cognitive-Services-FaceAPI-UI' 'Cognitive-Services-FaceAPI-Experiments');
			group: 'default' with: #('part1' 'part2') ]
