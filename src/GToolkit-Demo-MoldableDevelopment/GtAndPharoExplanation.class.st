"
!Glamorous Toolkit and Pharo

Glamorous Toolkit (GT) is built in Pharo, and it enables people to work with Pharo systems. Nevertheless, the goal of GT is distinct from that of Pharo and so is the realization of it.

Our goal is to provide a complete and novel development experience to allow people to make the interior of systems explainable. All our work is free and open-source under MIT. We contribute two things towards our goal. First, we provide the actual environment. Second, and perhaps more importantly, we authored moldable development, the approach GT enables.

Moldable development puts forward the hypothesis that the shape of software is essential and that it has to be customized to match the context of the developer. By now, we have a decade worth of experience and experiments in various scenarios. Moldable development was embodied in the first generation of GT which was integrated in Pharo in 2014, and it showed how we can indeed provide an experience that is distinct from any other, including the classic Smalltalk one.

The new GT takes moldable development much further. More visible is that we have new kinds of tools, like ${class:BaselineOfGToolkitDocumenter|label=Documenter}$ with its live notebooks, slide shows with interactive explanations, a ${class:BaselineOfGToolkitPlayground|label=Playground}$with snippets, or a ${class:BaselineOfGToolkitCoder|label=Coder}$ with expandable editors.

Still, there are less visible parts. Underneath there is a generic infrastructure for handling other languages. It comes with FAMIX, and it also ships with an environment for SmaCC, the parsing engine, that allows us to tackle new languages. For example, more recently we added a full parser and importer for C\+\+. Yes, C\+\+.

Then there are even more technical engines like ${class:BaselineOfGToolkitReleaser|label=Releaser}$ that make it possible to version deeply nested projects and repositories completely automatically.

You can look at GT as a set of tools, but that would likely miss the point. GT is a whole environment that enables a new way of thinking about programming. For instance, examples offer a slightly different way to capture tests, but when combined with Documenter it can change how we can document our systems and even how technical people communicate with non-technical people.

GT it relies on the vm, language, and basic libraries of Pharo, but it comes with a complete separate graphical stack (Bloc) and engines for tools, such as syntax highlighting and completion. Bloc is particularly relevant because it comes with a property of relying on a ${class:GtWhatMakesBlocSpecialExplanation|label=single rendering tree}$.

So, if we define a Smalltalk-like system as being the language \+ the environment, GT is a new such system.

That said, GT loads cleanly in Pharo. In practice, this means people working on projects built with the Pharo language have the option of two distinct environments.



"
Class {
	#name : #GtAndPharoExplanation,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> basePharoLinesOfCode [
	<gtExample>
	<noTest>
	^ self totalLinesOfCode - self gtLinesOfCode
]

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> gtLinesOfCode [
	<gtExample>
	<noTest>
	^ self gtMethods sumNumbers: [ :each | each linesOfCode ]
]

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> gtMethods [
	<gtExample>
	<noTest>
	^ self methodsInProjects: self gtProjects
]

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> gtProjects [
	| projects |
	projects := {BaselineOfGToolkit} flatCollect: [:project | 
			project version withDeepCollect: [ :each | 
				each projects collect: #version ] as: Set ].
	self assert: projects notEmpty.
	self assert: (projects noneSatisfy: #isNil).
	^ projects
]

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> methodsInProjects: aCollection [
	| mPackages packages |
	mPackages := aCollection flatCollect: [:each | each packages ].
	packages := mPackages 
		collect: [:each | RPackageOrganizer default packageNamed: each name asSymbol ifAbsent: [nil]]
		thenSelect: #notNil.
	self assert: packages notEmpty.
	^ (Smalltalk allClassesAndTraits flatCollect: #localMethods) select: [:each | 
		packages includes: each package ]
]

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> pharoToReplaceLinesOfCode [
	<gtExample>
	<noTest>
	^ self pharoToReplaceMethods sumNumbers: [ :each | each linesOfCode ]
]

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> pharoToReplaceMethods [
	<gtExample>
	<noTest>
	^ self methodsInProjects: self pharoToReplaceProjects
]

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> pharoToReplaceProjects [
	| projects |
	projects := {BaselineOfBasicTools . 
		BaselineOfShout . 
		BaselineOfGeneralHelp . 
		BaselineOfCalypso . 
		BaselineOfPharoGlamour . 
		BaselineOfPharoGT . 
		BaselineOfQA . 
		BaselineOfOSWindow. 
		BaselineOfBlueInk} flatCollect: [:project | 
			project version withDeepCollect: [ :each | 
				each projects collect: #version ] as: Set ].
	self assert: projects notEmpty.
	self assert: (projects noneSatisfy: #isNil).
	^ projects
]

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> totalLinesOfCode [
	<gtExample>
	<noTest>
	^ (Smalltalk allClassesAndTraits flatCollect: #localMethods) sumNumbers: #linesOfCode
]
