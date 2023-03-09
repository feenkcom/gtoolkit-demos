Class {
	#name : #BaselineOfGToolkitMoldableDevelopmentDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitMoldableDevelopmentDemo
}

{ #category : #baselines }
BaselineOfGToolkitMoldableDevelopmentDemo >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'GToolkitPresenter'
				with: [ spec repository: 'github://feenkcom/gtoolkit-presenter:main/src' ].
			spec
				package: 'GToolkit-Demo-MoldableDevelopment'
				with: [ spec includes: #(GToolkitPresenter) ] ]
]
