Class {
	#name : #UmlClassDiagramExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #accessing }
UmlClassDiagramExamples >> collectionHierarchy [
	<gtExample>
	^ UmlClassDiagram new
		classHierarchyFor:
			{Object.
			Collection.
			SequenceableCollection.
			ArrayedCollection.
			Array.
			String.
			ByteString.
			Symbol.
			Text.
			OrderedCollection.
			SortedCollection.
			LinkedList.
			Interval.
			Heap.
			HashedCollection.
			Set.
			Dictionary.
			IdentityDictionary.
			Bag}
]
