Class {
	#name : #GtArgoUMLInvalidUMLModulesDependencies,
	#superclass : #GtArgoUMLConstraint,
	#category : #'GToolkit-Demo-Argouml-ArchitectureRules'
}

{ #category : #accessing }
GtArgoUMLInvalidUMLModulesDependencies >> description [
	^ 'UML modules for different programming language should not depend on one another.'
]

{ #category : #accessing }
GtArgoUMLInvalidUMLModulesDependencies >> issues [
	|modulesNames modulesPackages modulesByName allInvalidDependencies|
	 modulesNames := #('cpp' 'csharp' 'java' 'php' 'sql').
	 modulesPackages := self model allModelNamespaces select: [:aNamespace |
		| fullName |
		fullName := aNamespace mooseName.
		modulesNames anySatisfy: [ :moduleName |
			fullName beginsWith: 'org::argouml::language::', moduleName]].
		modulesByName := modulesPackages groupedBy: [ :aNamespace |    
			aNamespace withAllParentScopes reversed fourth mooseName ].
		
	allInvalidDependencies := OrderedCollection new.
	modulesByName keysAndValuesDo: [ :moduleName :packages |
		| moduleDependencies invalidDependencies otherModulesNames |
		 moduleDependencies := packages flatCollect: #queryAllOutgoing. 
		otherModulesNames := modulesByName keys copyWithout: moduleName.
		 
		invalidDependencies := moduleDependencies select: [:aDependency |
			aDependency to asOrderedCollection anySatisfy: [ :aCandidate |
				otherModulesNames anySatisfy: [ :anotherModuleName |
					aCandidate mooseName beginsWith: anotherModuleName ] ] ] .
		allInvalidDependencies addAll: invalidDependencies ].
	^ allInvalidDependencies
]

{ #category : #accessing }
GtArgoUMLInvalidUMLModulesDependencies >> name [
	 ^ 'Invalid dependencies between UML modules'
]

{ #category : #accessing }
GtArgoUMLInvalidUMLModulesDependencies >> stakeholder [
	^ GtArgoUMLConstraintStakeholder architectureTeam
]
