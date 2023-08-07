Class {
	#name : #BaselineOfGToolkitDemoWebsiteExplorer,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitDemoWebsiteExplorer
}

{ #category : #accessing }
BaselineOfGToolkitDemoWebsiteExplorer >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec package: 'GToolkit-Demo-WebsiteExplorer' ]
]
