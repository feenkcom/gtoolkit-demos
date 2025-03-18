Extension { #name : #Collection }

{ #category : #'*GToolkit-Demo-FCA' }
Collection >> asBitSet [
	"Caveat: this will create a BitSet with the shared, cachedMap."
	^ BitSet withAll: self
]
