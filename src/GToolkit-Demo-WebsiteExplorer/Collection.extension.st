Extension { #name : #Collection }

{ #category : #'*GToolkit-Demo-WebsiteExplorer' }
Collection >> asWebLinkGroup [
	^ WebLinkGroup withAll: self
]
