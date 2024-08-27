Class {
	#name : #GtTorchTensor,
	#superclass : #PBProxyObject,
	#category : #'GToolkit-Demo-GPT-Proxies'
}

{ #category : #'as yet unclassified' }
GtTorchTensor class >> pythonClass [
	^ 'torch.Tensor'
]

{ #category : #'as yet unclassified' }
GtTorchTensor >> collect: aBlock as: aNumber [
	^ self flattened_list collect: aBlock as: aNumber
]

{ #category : #'as yet unclassified' }
GtTorchTensor >> columnCount [
	^ self shape at: 2
]

{ #category : #'as yet unclassified' }
GtTorchTensor >> do: aBlock [
	^ self flattened_list do: aBlock
]

{ #category : #'as yet unclassified' }
GtTorchTensor >> gtMatrixFor: aView [
	<gtView>
	self ndim = 2 ifFalse: [ ^ aView empty ].

	^ aView explicit
		title: 'Matrix';
		priority: 1;
		stencil: [ GLMBlocMatrixElement new matrix: self ]
]
