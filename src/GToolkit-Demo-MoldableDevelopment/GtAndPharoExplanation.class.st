"
1. Glamorous Toolkit and Pharo
Glamorous Toolkit (GT) is built in [Pharo](https://pharo.org), and it enables people to work with Pharo systems. Nevertheless, the goal of GT is distinct from that of Pharo and so is its realization.
1. # Our goal: moldable development

Glamorous Toolkit is built by [feenk](https://feenk.com). Our goal is to provide a complete and novel development experience to allow people to make the interior of systems explainable. All our work is free and open-source under the MIT license. We contribute two things towards our goal. First, we provide the actual environment. Second, and perhaps more importantly, through GT we enable moldable development, the approach we have authored.

Moldable development puts forward the hypothesis that the shape of software is essential and that it has to be customized to match the context of the developer. By now, we have a decade worth of experience and experiments in various scenarios. For example, we use it to assess and steer the architecture of  legacy systems, or to explain the business logic to non-technical people.

Moldable development was embodied in the first generation of GT which was integrated into Pharo in 2014, and it showed how we can indeed provide an experience that is distinct from any other, including the classic Smalltalk one.

The new GT takes moldable development much further. Especially visible are new kinds of tools, like {{gtClass:BaselineOfGToolkitDocumenter|label=Documenter}} with its live notebooks, slide shows with interactive explanations, a {{gtClass:BaselineOfGToolkitPlayground|label=Playground}} with snippets, or a {{gtClass:BaselineOfGToolkitCoder|label=Coder}} with expandable editors.

Still, there are less visible parts. Underneath, we have a generic infrastructure for handling other languages. It comes with an integration of {{gtClass:BaselineOfGToolkit4Famix3|label=Famix}},  the meta-model through which we can represent various systems, and it also ships with an {{gtClass:BaselineOfGToolkit4SmaCC|label=environment for SmaCC}}, the parsing engine, that allows us to create parsers for new languages. For example, more recently we added  parsers and importers for several languages including {{gtClass:CPPParser|label=CPP}} and {{gtClass:JSParser|label=JavaScript}}.

Then there are even more technical engines. {{gtClass:BaselineOfGToolkitReleaser|label=Releaser}} makes it possible to version deeply nested projects and repositories completely automatically. {{gtClass:BaselineOfGToolkitVisualizer|label=Visualizer}}  adds significant visualization abilities to the overall environment. 

You can think of GT as a set of tools, but that would miss the point. GT is a whole environment that enables a new way of thinking about programming. We see the environment as a language, one that extends the base language with visual and interactive operators. Through this language the various components can be combined in many ways. For instance, {{gtClass:BaselineOfGToolkitExamples|label=examples}} offer a different technical way to capture tests, but when combined with Documenter they can change how we document our systems and even how technical people communicate with non-technical people.

GT relies on the vm, language, and basic libraries of Pharo, but it comes with a completely separate graphical stack (Bloc) and engines for tools, such as syntax highlighting and completion. This stack is particularly relevant because it renders every scene through {{gtClass:GtWhatMakesBlocSpecialExplanation|label=a single rendering tree}}. On the one hand, this allows us to create new kind of interfaces. On the other hand, visualizations become first class citizens at a very low cost.
1. # A code size analysis

Currently, GT code is loaded on top of a full Pharo distribution. Pharo ships with {{gtExample:GtAndPharoExplanation>>#basePharoLinesOfCode|label=#asString}} lines of code. GT adds {{gtExample:GtAndPharoExplanation>>#gtLinesOfCode|label=#asString}}. This is a significant amount of code. Let's look closer at it.

GT comes with a whole new graphical stack, and tools that completely replace the default tools of Pharo. Specifically, there are {{gtExample:GtAndPharoExplanation>>#pharoToReplaceProjects|label=#size}} projects from Pharo totalling {{gtExample:GtAndPharoExplanation>>#pharoToReplaceLinesOfCode|label=#asString}} lines of code that are not needed in GT. Still, we ship the complete Pharo code because we are in a transition period, and for the time being we want people to be able to easily access the default Pharo tools.

Now, if we take a closer look at the code from GT, there are a number of features that are not present in Pharo. For example, GT includes {{gtExample:GtAndPharoExplanation>>#smaccParsersPackages|label=#size}} parsers for other languages. These alone total {{gtExample:GtAndPharoExplanation>>#smaccParsersLinesOfCode|label=#asString}} lines of code. It includes  {{gtExample:GtAndPharoExplanation>>#famix3LinesOfCode|label=#asString}} lines of code to support code analysis of systems written in other languages. On top of that, we complement the already existing JSON support from Pharo with support for XML which adds another {{gtExample:GtAndPharoExplanation>>#xmlSupportLinesOfCode|label=#asString}} lines of code. We do that because we believe that a development environment should offer convenient support for various data formats.

{{gtExample:GtMetrics class>>#default|previewShow=#gtMapFor:|noCode=}}

All in all, we ship the extra libraries to support other languages and technologies out of the box. But, the size of the core of GT plus the size of the Pharo code we do rely on is about the same size as the size of the standard Pharo distribution.
1. # A modular system

While we bundle multiple things together, we still keep GT highly modular. It is currently built out of {{gtExample:BaselineOfGToolkit class>>#withAllContainedProjects|label=#size}} distinct, yet combinable, components. The picture below provides an overview of these components and their interdependencies.

{{gtExample:BaselineOfGToolkit class>>#itself|previewShow=#gtGtMapFor:|noCode=|previewHeight=420}}

GT loads cleanly in Pharo. In practice, this means people working on projects built on top of the Pharo runtime have the option of two distinct environments. 
1. # A distinct environment

If we define a Smalltalk-like system as being the language plus the environment, GT is a new such system. The tools and the experience are different, but more importantly, the workflow that it enables is distinct.

The traditional Smalltalk environment was a revolution when it was created. It enabled humans to interact with the inside of software systems in novel ways that then led to a new way of perceiving programming. We see moldable development as yet another leap.


"
Class {
	#name : 'GtAndPharoExplanation',
	#superclass : 'Object',
	#category : 'GToolkit-Demo-MoldableDevelopment'
}

{ #category : 'as yet unclassified' }
GtAndPharoExplanation >> basePharoLinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default basePharoLinesOfCode
]

{ #category : 'accessing' }
GtAndPharoExplanation >> famix3LinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default famix3LinesOfCode
]

{ #category : 'as yet unclassified' }
GtAndPharoExplanation >> gtLinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default gtLinesOfCode
]

{ #category : 'as yet unclassified' }
GtAndPharoExplanation >> pharoToReplaceLinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default pharoToReplaceLinesOfCode
]

{ #category : 'as yet unclassified' }
GtAndPharoExplanation >> pharoToReplaceProjects [
	<gtExample>
	<noTest>
	^ GtMetrics default pharoToReplaceProjects
]

{ #category : 'accessing' }
GtAndPharoExplanation >> smaccParsersLinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default smaccParsersLinesOfCode
]

{ #category : 'accessing' }
GtAndPharoExplanation >> smaccParsersPackages [
	<gtExample>
	<noTest>
	^ GtMetrics default smaccParserPackages
]

{ #category : 'as yet unclassified' }
GtAndPharoExplanation >> totalLinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default pharoToReplaceProjects
]

{ #category : 'accessing' }
GtAndPharoExplanation >> xmlSupportLinesOfCode [
	<gtExample>
	<noTest>
	^ GtMetrics default xmlSupportLinesOfCode
]
