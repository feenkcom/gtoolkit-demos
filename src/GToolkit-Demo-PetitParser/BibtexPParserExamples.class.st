Class {
	#name : #BibtexPParserExamples,
	#superclass : #Object,
	#instVars : [
		'parser'
	],
	#category : #'GToolkit-Demo-PetitParser-Examples'
}

{ #category : #example }
BibtexPParserExamples >> aggBibtex [
	<gtExample>
	<return: #ByteString>
	^ '@misc{AGG,
	Key = {visprog agg},
	Note = {http://tfs.cs.tu-berlin.de/agg/index.html},
	Title = {{AGG} --- The Attributed Graph Grammar System},
	Url = {http://tfs.cs.tu-berlin.de/agg/index.html},
	Bdsk-Url-1 = {http://tfs.cs.tu-berlin.de/agg/index.html}}'
]

{ #category : #example }
BibtexPParserExamples >> bibEntryForAGG [
	<gtExample>
	<return: #OrderedDictionary>
	| result |
	result := parser bibEntry end parse: self aggBibtex.
	self
		assert: result keys
		equals: #('entryType' 'citeKey' 'Key' 'Note' 'Title' 'Url' 'Bdsk-Url-1').
	self
		assert: (result at: 'Title')
		equals: '{AGG} --- The Attributed Graph Grammar System'.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> bibEntryForBach15a [
	"Got an error here -- space after the entry type."

	<gtExample>
	<return: #OrderedDictionary>
	| result |
	result := parser bibEntry end
			parse: '@article { Bach15a ,
author = {Bach, B. and Henry-Riche, N. and Dwyer, T. and Madhyastha, T. and Fekete, J-D. and Grabowski, T.},
title = {Small MultiPiles: Piling Time to Explore Temporal Patterns in Dynamic Networks},
journal = {Computer Graphics Forum},
volume = {34},
number = {3},
issn = {1467-8659},
url = {http://dx.doi.org/10.1111/cgf.12615},
doi = {10.1111/cgf.12615},
pages = {31--40},
year = {2015}
}'.
	self assert: result isDictionary.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> bibFileForFeenk [
	<gtExample>
	<return: #OrderedCollection>
	| result |
	result := parser bibFile end parse: self feenkBibtex.
	self assert: result size equals: 14.
	self
		assert: (result collect: [ :each | each at: 'citeKey' ])
		equals: #('Chis15a' 'Chis15b' 'Chis15c' 'Chis15d' 'Chis16a' 'Chis16b' 'Chis17a' 'Girb17a' 'Girb19a' 'Girb20a' 'Girb21a' 'Kube15a' 'Nier22a' 'Syre15a')
				asOrderedCollection.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> bracedFieldEmpty [
	<gtExample>
	<return: #ByteString>
	| result |
	result := parser fieldValueInBraces end parse: '{}'.
	self assert: result equals: ''.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> bracedFieldWithEscapedBraces [
	<gtExample>
	<return: #ByteString>
	| result |
	result := parser fieldValueInBraces end parse: '{\}\}\{\{}'.
	self assert: result equals: '\}\}\{\{'.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> bracedFieldWithNestedBraces [
	<gtExample>
	<return: #ByteString>
	| result |
	result := parser fieldValueInBraces end
			parse: '{{AGG} --- The Attributed Graph Grammar System}'.
	self assert: result equals: '{AGG} --- The Attributed Graph Grammar System'.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> citeKeyNier22a [
	<gtExample>
	<return: #ByteString>
	| result |
	result := parser citeKey end parse: 'Nier22a'.
	self assert: result equals: 'Nier22a'.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> citeKeyWithFunnyChars [
	<gtExample>
	<return: #ByteString>
	| result |
	result := parser citeKey end parse: 'foo-bar:22_a'.
	self assert: result equals: 'foo-bar:22_a'.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> entryType [
	<gtExample>
	<return: #ByteString>
	| result |
	result := parser type end parse: '@misc'.
	self assert: result equals: 'misc'.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> feenkBibtex [
	<gtExample>
	<return: #ByteString>
	^ '@inproceedings{Chis15a,
	 author = {Andrei Chi\c{s} and Tudor G\^irba and Oscar Nierstrasz and Aliaksei Syrel},
	 title = {The {Moldable} {Inspector}},
	 booktitle = {Proceedings of the 2015 ACM International Symposium on New Ideas, New Paradigms, and Reflections on Programming and Software},
	Annote = {internationalconference},
	 series = {Onward! 2015},
	 year = {2015},
	 location = {Pittsburgh, PA, USA},
	 pages = {44--60},
	 numpages = {17},
	 url = {http://scg.unibe.ch/archive/papers/Chis15a-MoldableInspector.pdf},
	 doi = {10.1145/2814228.2814234},
	 isbn = {978-1-4503-3688-8},
	 acmid = {2814234},
	 publisher = {ACM},
	 address = {New York, NY, USA},
	 keywords = {scg-pub scg15 jb16 snf-asa1, Andrei Chis, Tudor Girba, girba feenk-pub},
	 peerreview = {yes},
	 medium = {2}
}

@inproceedings{Chis15b,
	Annote = {internationalworkshop},
	author = {Andrei Chi\c{s} and Tudor G\^irba and Oscar Nierstrasz and Aliaksei Syrel},
	title={{GTInspector}: A Moldable Domain-Aware Object Inspector},
	booktitle = {Proceedings of the Companion Publication of the 2015 ACM SIGPLAN Conference on Systems, Programming, and Applications: Software for Humanity},
	series = {SPLASH Companion 2015},
	year = {2015},
	location = {Pittsburgh, PA, USA},
	pages = {15--16},
	numpages = {2},
	url = {http://scg.unibe.ch/archive/papers/Chis15b-GTInspector.pdf},
	doi = {10.1145/2814189.2814194},
	isbn = {978-1-4503-3722-9},
	acmid = {2814194},
	publisher = {ACM},
	address = {New York, NY, USA},
	keywords = {scg-pub scg15 jb16 snf-asa1, Andrei Chis, Tudor Girba, girba feenk-pub},
	peerreview = {yes},
	medium = {2}
}

@article{Chis15c,
	title = {Practical domain-specific debuggers using the {Moldable Debugger} framework},
	journal = {Computer Languages, Systems \& Structures},
	volume = {44, Part A},
	pages = {89--113},
	year = {2015},
	Annote = {internationaljournal},
	note = {Special issue on the 6th and 7th International Conference on Software Language Engineering ({SLE} 2013 and {SLE} 2014)},
	issn = {1477-8424},
	doi = {10.1016/j.cl.2015.08.005},
	url = {http://scg.unibe.ch/archive/papers/Chis15c-PracticalDomainSpecificDebuggers.pdf},
	peerReview = {yes},
	author = {Andrei Chi\c{s} and Marcus Denker and Tudor G\^irba and Oscar Nierstrasz},
	medium = {2},
	keywords = {scg-pub scg15 jb16 snf-asa1 Andrei Chis, Tudor Girba, Debugging, Customization, Domain-specific tools, User interfaces, Programming environments, Smalltalk, girba feenk-pub}
}

@inproceedings{Chis15d,
	Author = {Andrei Chi\c{s} and Tudor G\^{i}rba and Oscar Nierstrasz},
	booktitle = {Proceedings of the 6th Workshop on Evaluation and Usability of Programming Languages and Tools},
    series = {PLATEAU ''15},
	doi = {10.1145/2846680.2846684},
	Keywords = {scg-pub scg15 jb16 snf-asa1, internationalworkshop, Andrei Chis,Tudor Girba, girba feenk-pub},
	location = {Pittsburgh, PA, USA},
	Peerreview = {yes},
	medium = {2},
	Title = {Towards moldable development tools},
	Url = {http://scg.unibe.ch/archive/papers/Chis15d_TowardsMoldableDevelopmentTools.pdf},
	Year = {2015},
	isbn = {978-1-4503-3907-0},
	pages = {25--26},
	acmid = {2846684},
	publisher = {ACM},
	address = {New York, NY, USA}
}

@inproceedings{Chis16a,
	Author = {Andrei Chi\c{s} and Tudor G\^irba and Juraj Kubelka and Oscar Nierstrasz and Stefan Reichhart and Aliaksei Syrel},
	Booktitle = {Proceedings of the 2016 ACM International Symposium on New Ideas, New Paradigms, and Reflections on Programming and Software},
	Annote = {internationalconference},
	Series = {Onward! 2016},
	Title = {Moldable, context-aware searching with {Spotter}},
	Doi = {10.1145/2986012.2986023},
	pages = {128--144},
	Numpages = {17},
	Location = {Amsterdam, Netherlands},
	Year = {2016},
	Peerreview = {yes},
	Medium = {2},
	Publisher = {ACM},
	Keywords = {scg-pub scg16 jb17 snf-asa2 Andrei Chis, Spotter, Tudor Girba, girba feenk-pub},
	Url = {http://scg.unibe.ch/archive/papers/Chis16a-MoldableContextAwareSearchingWithSpotter.pdf},
	Bdsk-Url-1 = {http://scg.unibe.ch/archive/papers/Chis16a-MoldableContextAwareSearchingWithSpotter.pdf},
	Address = {New York, NY, USA}}

@inproceedings{Chis16b,
	Annote = {internationalworkshop},
	Author = {Andrei Chi\c{s} and Tudor G\^irba and Juraj Kubelka and Oscar Nierstrasz and Stefan Reichhart and Aliaksei Syrel},
	Booktitle = {Proceedings of the Programming Experience 2016 (PX/16) Workshop},
 	Series = {PX/16},
	Location={Rome, Italy},
	Title = {Exemplifying Moldable Development},
	Doi = {10.1145/2984380.2984385},
	Isbn = {978-1-4503-4776-1},
	Pages= {33--42},
	Numpages = {10},
	Year = {2016},
	Peerreview = {yes},
	Medium = {2},
        Acmid = {2984385},
	Publisher = {ACM},
	Address = {New York, NY, USA},
	Language={English},
	Url = {http://scg.unibe.ch/archive/papers/Chis16b-ExemplifyingMoldableDevelopment.pdf},
	Bdsk-Url-1 = {http://scg.unibe.ch/archive/papers/Chis16b-ExemplifyingMoldableDevelopment.pdf},
	Bdsk-Url-2 = {http://dx.doi.org/10.1145/2984380.2984385},
	Keywords = {scg-pub, snf-asa2, scg16, jb16, internationalworkshop, Andrei Chis, Domain-specific tools, User interfaces, Programming environments, Program comprehension, Tudor Girba, girba feenk-pub}
}

@incollection{Chis17a,
	Author = {Andrei Chi\c{s} and Tudor G\^irba and Juraj Kubelka and Oscar Nierstrasz and Stefan Reichhart and Aliaksei Syrel},
	Booktitle = {PAUSE: Present And Ulterior Software Engineering},
	Editor = {Manuel Mazzara, Bertrand Meyer},
	Title = {Moldable Tools for Object-oriented Development},
	Pages= {77--101},
	Publisher = {Springer, Cham},
	Doi = {10.1007/978-3-319-67425-4_6},
	Peerreview = {yes},
	Medium = {2},
	Keywords = {scg-pub snf-asa2 scg17 jb18, Andrei Chis, Tudor Girba, girba feenk-pub},
	Url = {http://scg.unibe.ch/archive/papers/Chis17a-MoldableToolsPAUSE.pdf},
	Bdsk-Url-1 = {http://scg.unibe.ch/archive/papers/Chis16c-MoldableToolsPAUSE.pdf},
	Bdsk-Url-2 = {https://link.springer.com/chapter/10.1007/978-3-319-67425-4_6},
	Year = {2017}}

@techreport{Girb17a,
    Author  = {Tudor G\^irba},
    Title   = {Humane assessment by example},
    Institution = {feenk.com},
    Url = {http://humane-assessment.com/res/humane-assessment-case-studies-a4.pdf},
    keywords = {girba Tudor Girba feenk-pub},
    Year    = {2017}
}

@misc{Girb19a,
	Author = {Tudor G\^irba},
	Keywords = {gtoolkit examples girba feenk-pub},
	Title = {An example of example-driven development},
	Url = {https://medium.com/feenk/an-example-of-example-driven-development-4dea0d995920},
	Year = {2019}
}

@misc{Girb20a,
	Author = {Tudor G\^irba},
	Keywords = {gtoolkit graphics brick bloc girba feenk-pub},
	Title = {One rendering tree},
	Url = {https://medium.com/feenk/one-rendering-tree-918eae49bcff},
	Year = {2020}
}

@misc{Girb21a,
	Author = {Tudor G\^irba},
	Keywords = {gtoolkit lepiter girba feenk-pub},
	Title = {Introducing {Lepiter}: Knowledge Management + Multi-language Notebooks + Moldable Development},
	Url = {https://lepiter.io/feenk/introducing-lepiter--knowledge-management--e2p6apqsz5npq7m4xte0kkywn/},
	Year = {2021}
}

@inproceedings{Kube15a,
	 Author = {Kubelka, Juraj and Bergel, Alexandre and Chi\c{s}, Andrei and G\^irba, Tudor and Reichhart, Stefan and Robbes, Romain and Syrel, Aliaksei},
	 Booktitle = {Proceedings of 3rd IEEE Working Conference on Software Visualization - New Ideas and Emerging Results},
	 Pages = {145--149},
	 Publisher = {{IEEE}},
	 Series = {VISSOFT-NIER''15},
	 Doi={10.1109/VISSOFT.2015.7332426},
	 Title = {On Understanding How Developers Use the {Spotter} Search Tool},
	 Year = {2015},
	 month=sep,
 	 Peerreview = {yes},
	 Medium = {2},
	 Keywords = {scg-pub scg15 jb16 snf-asa1, Andrei Chis, Tudor Girba, girba feenk-pub},
	 Url = {http://scg.unibe.ch/archive/papers/Kube15a-OnUnderstandingHowDevelopersUseTheSpotterSearchTool.pdf}}

@inproceedings{Nier22a,
    Author    = {Oscar Nierstrasz and Tudor G\^irba},
    Title     = {Making Systems Explainable},
    Booktitle = {{VISSOFT}''22: Proceedings of the 10th IEEE Working Conference on Software Visualization},
    Abstract  = {What makes software systems explainable? As we develop
      and maintain software, we have questions to ask about
      the code, but piecing together the answers remains hard.
      The main interface the classical IDE offers is a text
      editor for the source code. Code, documentation, and the
      running system are disconnected. In this keynote
      presentation, we will show how software systems can be
      made explainable with the help of three interacting
      technologies: (i) live notebooks that can be used to
      create narratives that link documentation, source code,
      and running applications, (ii) example methods that not
      only perform tests, but produce live examples that can
      be used within narratives, to explain use cases,
      scenarios and features, and (iii) a moldable inspector
      that can be easily extended with live custom views to
      answer domain-specific questions about software systems.
      With the help of running examples we will show in the
      keynotes presentation how these technologies work
      together to provide a radically different kind of
      development experience.},
    Annote    = {internationalconference},
    Keywords  = {feenk-pub girba},
    Url = {http://scg.unibe.ch/archive/papers/Nier22a-ExplainableSystems.pdf},
    DOI = {10.1109/VISSOFT55257.2022.00009},
    Publisher = {IEEE},
    PeerReview = {yes},
    Medium = {2},
    Year = {2022}
}

@inproceedings{Syre15a,
	 abstract={Program comprehension requires developers to reason about many kinds of highly interconnected software entities. Dealing with this reality prompts developers to continuously intertwine searching and navigation. Nevertheless, most integrated development environments (IDEs) address searching by means of many disconnected search tools, making it difficult for developers to reuse search results produced by one search tool as input for another search tool. This forces developers to spend considerable time manually linking disconnected search results. To address this issue we propose Spotter, a model for expressing and combining search tools in a unified way. The current implementation shows that Spotter can unify a wide range of search tools. More information about Spotter can be found at scg.unibe.ch/research/moldablespotter},
	 author = {Aliaksei Syrel and Andrei Chi\c{s} and Tudor G\^irba and Juraj Kubelka and Oscar Nierstrasz and Stefan Reichhart},
	 title = {Spotter: towards a unified search interface in {IDEs}},
 	 booktitle = {Proceedings of the Companion Publication of the 2015 ACM SIGPLAN Conference on Systems, Programming, and Applications: Software for Humanity},
	 series = {SPLASH Companion 2015},
	 year = {2015},
	 location = {Pittsburgh, PA, USA},
	 pages = {54--55},
	 numpages = {2},
	 url = {http://scg.unibe.ch/archive/papers/Syre15a-SpotterPosterAbstract.pdf},
	 doi = {10.1145/2814189.2817269},
	 isbn = {978-1-4503-3722-9},
	 acmid = {2817269},
	 publisher = {ACM},
	 address = {New York, NY, USA},
	 keywords = {snf-asa1, scg-pub scg15 jb16, Andrei Chis, Tudor Girba, girba feenk-pub},
	 peerreview = {yes},
	 medium = {2}
}

'
]

{ #category : #example }
BibtexPParserExamples >> fieldNameWithFunnyChars [
	<gtExample>
	<return: #ByteString>
	| result |
	result := parser fieldName end parse: 'Bdsk-Url-1'.
	self assert: result equals: 'Bdsk-Url-1'.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> fieldWithBracedContent [
	<gtExample>
	<return: #Association>
	| result |
	result := parser field end
			parse: 'title = {Compact and efficient strings for Java}'.
	self assert: result equals: 'title' -> 'Compact and efficient strings for Java'.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> fieldWithNestedBraces [
	<gtExample>
	<return: #Association>
	| result |
	result := parser field end
			parse: 'author={M. {Hazhirpasand} and M. {Ghafari} and S. {Kr\"{u}ger} and E. {Bodden} and O. {Nierstrasz}}'.
	self
		assert: result
		equals: 'author'
				-> 'M. {Hazhirpasand} and M. {Ghafari} and S. {Kr\"{u}ger} and E. {Bodden} and O. {Nierstrasz}'.
	^ result
]

{ #category : #initialization }
BibtexPParserExamples >> initialize [
	parser := BibtexPParser new optimize 
]

{ #category : #example }
BibtexPParserExamples >> quotedFieldEmpty [
	<gtExample>
	<return: #ByteString>
	| result |
	result := parser fieldValueInQuotes end parse: '""'.
	self assert: result equals: ''.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> quotedFieldWithEscapedQuote [
	<gtExample>
	<return: #ByteString>
	| result |
	result := parser fieldValueInQuotes end parse: '"Z{\"u}rich, Switzerland"'.
	self assert: result equals: 'Z{\"u}rich, Switzerland'.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> rawFieldMonth [
	<gtExample>
	<return: #ByteString>
	| result |
	result := parser rawFieldString end parse: 'jan'.
	self assert: result equals: 'jan'.
	^ result
]

{ #category : #example }
BibtexPParserExamples >> rawFieldYear [
	<gtExample>
	<return: #ByteString>
	| result |
	result := parser rawFieldString end parse: '1984'.
	self assert: result equals: '1984'.
	^ result
]

{ #category : #accessing }
BibtexPParserExamples >> scgPub [
	"SCG publications, extracted from scg.bib in https://github.com/scgbern/scgbib"

	<gtExample>
	<noTest>
	| result |
	result := parser parse: self scgPubFile contents.
	self assert: result size equals: 571.
	"Check that all entries are tagged with an scg-pub keyword"
	self
		assert: (result
				reject: [ :each | 
					(each at: 'Keywords' ifAbsent: [ each at: 'keywords' ])
						includesSubstring: 'scg-pub' ]) isEmpty.

	^ result
]

{ #category : #accessing }
BibtexPParserExamples >> scgPubFile [
	"SCG publications, extracted from scg.bib in https://github.com/scgbern/scgbib"
	<gtExample>
	<noTest>
	^ FileLocator gtResource / 'feenkcom' / 'gtoolkit-demos' / 'data' / 'bibtex'
		/ 'scg-pub.bib'
]
