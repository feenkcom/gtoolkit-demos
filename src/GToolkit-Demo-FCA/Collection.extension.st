Extension { #name : #Collection }

{ #category : #'*GToolkit-Demo-FCA' }
Collection >> asBitSet [
	^ BitSet withAll: self
]
