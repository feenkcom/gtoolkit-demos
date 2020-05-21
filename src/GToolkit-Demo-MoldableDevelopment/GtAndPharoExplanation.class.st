"
!Glamorous Toolkit and Pharo

Glamorous Toolkit (GT) is built in *Pharo>https://pharo.org*, and it enables people to work with Pharo systems. Nevertheless, the goal of GT is distinct from that of Pharo and so is the realization of it.

!!Our goal: moldable development

Glamorous Toolkit is build by *feenk>https://feenk.com*. Our goal is to provide a complete and novel development experience to allow people to make the interior of systems explainable. All our work is free and open-source under MIT. We contribute two things towards our goal. First, we provide the actual environment. Second, and perhaps more importantly, we authored moldable development, the approach GT enables.

Moldable development puts forward the hypothesis that the shape of software is essential and that it has to be customized to match the context of the developer. By now, we have a decade worth of experience and experiments in various scenarios. Moldable development was embodied in the first generation of GT which was integrated in Pharo in 2014, and it showed how we can indeed provide an experience that is distinct from any other, including the classic Smalltalk one.

The new GT takes moldable development much further. More visible is that we have new kinds of tools, like ${class:BaselineOfGToolkitDocumenter|label=Documenter}$ with its live notebooks, slide shows with interactive explanations, a ${class:BaselineOfGToolkitPlayground|label=Playground}$with snippets, ${class:BaselineOfGToolkitInspector|label=Inspector}$ combined with  ${class:BaselineOfGToolkitSpotter|label=Spotter}$ , or a ${class:BaselineOfGToolkitCoder|label=Coder}$ with expandable editors.

Still, there are less visible parts. Underneath, we have a generic infrastructure for handling other languages. It comes with an integration of ${class:BaselineOfGToolkit4Famix3|label=Famix}$,  the meta-model through which we can represent various systems, and it also ships with an ${class:BaselineOfGToolkit4SmaCC|label=environment for SmaCC}$, the parsing engine, that allows us to create parsers for new languages. For example, more recently we added a  parsers and importers for several languages including ${class:CPPParser|label=CPP}$ and ${class:JSParser|label=JavaScript}$.

Then there are even more technical engines. ${class:BaselineOfGToolkitReleaser|label=Releaser}$ makes it possible to version deeply nested projects and repositories completely automatically. ${class:BaselineOfGToolkitVisualizer|label=Visualizer}$  adds significant visualization abilities to the overall environment. 

You can look at GT as a set of tools, but that would likely miss the point. GT is a whole environment that enables a new way of thinking about programming. We see the environment as a language, one that extends the base language with visual and interactive operators. Through this language the various components can be combined in many ways. For instance, ${class:BaselineOfGToolkitExamples|label=examples}$ offer a different technical way to capture tests, but when combined with Documenter it can change how we can document our systems and even how technical people communicate with non-technical people.

GT relies on the vm, language, and basic libraries of Pharo, but it comes with a complete separate graphical stack (Bloc) and engines for tools, such as syntax highlighting and completion. This stack is particularly relevant because it relies on ${class:GtWhatMakesBlocSpecialExplanation|label=a single rendering tree}$. On the one hand, this allows us to create new kind of interfaces. On the other hand, visualizations become first class citizens at very low costs.


!!A code size analysis

Currently, GT code is loaded on top of a full Pharo distribution. Pharo ships with ${example:GtAndPharoExplanation>>#basePharoLinesOfCode|label=#asString}$ lines of code. GT adds ${example:GtAndPharoExplanation>>#gtLinesOfCode|label=#asString}$. This is a significant amount of code. Let's look closer at it.

GT comes with a whole new graphical stack and tools that completely replace the ones from the default Pharo. Specifically, there are ${example:GtAndPharoExplanation>>#pharoToReplaceProjects|label=#size}$ projects from Pharo totalling ${example:GtAndPharoExplanation>>#pharoToReplaceLinesOfCode|label=#asString}$ lines of code that are not needed in GT. Still, we ship the complete Pharo code because we are in a transition period, and for the time being we want people to be able to easily have access to the default Pharo tools.

Now, if we take a closer look at the code from GT, there are a number of abilities that are not present in the default Pharo. For example, GT includes ${example:GtAndPharoExplanation>>#smaccParsersPackages|label=#size}$ parsers for other languages. These alone total ${example:GtAndPharoExplanation>>#smaccParsersLinesOfCode|label=#asString}$ lines of code. It also includes  ${example:GtAndPharoExplanation>>#famix3LinesOfCode|label=#asString}$ lines of code for supporting code analysis written in other languages. We also believe that a development environment should offer convenient support for various data formats. Pharo already includes support for JSON. We also include the support for XML which totals ${example:GtAndPharoExplanation>>#xmlSupportLinesOfCode|label=#asString}$ lines of code.


${example:GtMetrics class>>#default|previewShow=#gtMapFor:|noCode=}$


The extra libraries allow us to tackle new classes of use cases that appear in practical development settings that go well beyond the typical Smalltalk realm. This supports the core GT proposition of being a moldable development environment for systems written in many languages.

!!A modular system

While we bundle multiple things together, we still keep GT highly modular. It is currently made out of ${example:BaselineOfGToolkit class>>#withAllContainedProjects|label=#size}$ distinct, yet combinable, components. The picture below provides an overview of these components and their interdependencies.

${example:BaselineOfGToolkit class>>#itself|previewShow=#gtGtMapFor:|noCode=|previewHeight=420}$

!!A distinct environment

If we define a Smalltalk-like system as being the language plus the environment, GT is a new such system. The tools and the experience is different, but more importantly, the workflow that it enables is distinct.

The traditional Smalltalk environment was a revolution when it was created. It enabled humans to interact with the inside of software systems in novel ways that then led to a new way of perceiving programming. We see moldable development as yet another leap.

That said, GT loads cleanly in Pharo. In practice, this means people working on projects built on top of the Pharo runtime have the option of two distinct environments. 

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
	^ GtMetrics default basePharoLinesOfCode
]

{ #category : #accessing }
GtAndPharoExplanation >> famix3LinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default famix3LinesOfCode
]

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> gtLinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default gtLinesOfCode
]

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> pharoToReplaceLinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default pharoToReplaceLinesOfCode
]

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> pharoToReplaceProjects [
	<gtExample>
	<noTest>
	^ GtMetrics default pharoToReplaceProjects
]

{ #category : #accessing }
GtAndPharoExplanation >> smaccParsersLinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default smaccParsersLinesOfCode
]

{ #category : #accessing }
GtAndPharoExplanation >> smaccParsersPackages [
	<gtExample>
	<noTest>
	^ GtMetrics default smaccParserPackages
]

{ #category : #'as yet unclassified' }
GtAndPharoExplanation >> totalLinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default pharoToReplaceProjects
]

{ #category : #accessing }
GtAndPharoExplanation >> xmlSupportLinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default xmlSupportLinesOfCode
]
