Class {
	#name : #TDJsonMapping,
	#superclass : #Object,
	#traits : 'TXdBasicJsonMapping',
	#classTraits : 'TXdBasicJsonMapping classTrait',
	#category : #'GToolkit-Demo-TodosAPI-Json'
}

{ #category : #'as yet unclassified' }
TDJsonMapping class >> collectionOfCommentsInfoMappingFor: aNeoJsonMapper [
	aNeoJsonMapper
		for: #CollectionOfCommentsInfo customDo: [ :mapping |
			mapping listOfElementSchema: TDComment ].
	self commentInfoMappingFor: aNeoJsonMapper.
]

{ #category : #'as yet unclassified' }
TDJsonMapping class >> collectionOfPostsInfoMappingFor: aNeoJsonMapper [
	aNeoJsonMapper
		for: #CollectionOfPostsInfo customDo: [ :mapping |
			mapping listOfElementSchema: TDSimplePost ].
	self postInfoMappingFor: aNeoJsonMapper.
]

{ #category : #'as yet unclassified' }
TDJsonMapping class >> collectionOfTodosInfoMappingFor: aNeoJsonMapper [
	aNeoJsonMapper
		for: #CollectionOfTodosInfo customDo: [ :mapping |
			mapping listOfElementSchema: TDTodoPost ].
	self todoInfoMappingFor: aNeoJsonMapper.
]

{ #category : #'as yet unclassified' }
TDJsonMapping class >> commentInfoMappingFor: aNeoJsonMapper [
	aNeoJsonMapper
		for: TDComment do: [ :mapping |
			mapping mapAccessor: #postId.
			mapping mapAccessor: #id.
			mapping mapAccessor: #name.
			mapping mapAccessor: #email.
			mapping mapAccessor: #body ].
]

{ #category : #'as yet unclassified' }
TDJsonMapping class >> postInfoMappingFor: aNeoJsonMapper [
	aNeoJsonMapper
		for: TDSimplePost do: [ :mapping |
			mapping mapAccessor: #userId.
			mapping mapAccessor: #id.
			mapping mapAccessor: #title.
			mapping mapAccessor: #body ].
]

{ #category : #reading }
TDJsonMapping class >> read: aJsonSchema withMapping: aMessageSymbol on: aReadStream [ 
	| reader |
	reader := (NeoJSONReader on: aReadStream).
	self perform: aMessageSymbol with: reader.
	^ reader nextAs: aJsonSchema
]

{ #category : #'as yet unclassified' }
TDJsonMapping class >> readCommentInfo: aJsonPostInfo [
	^ self
		read: TDComment
		withMapping: #commentInfoMappingFor:
		on: aJsonPostInfo readStream.
]

{ #category : #'as yet unclassified' }
TDJsonMapping class >> readCommentsInfo: aJsonCollectionOfPostsInfo [
	^ self
		read: #CollectionOfCommentsInfo
		withMapping: #collectionOfCommentsInfoMappingFor:
		on: aJsonCollectionOfPostsInfo readStream.
]

{ #category : #'as yet unclassified' }
TDJsonMapping class >> readPostInfo: aJsonPostInfo [
	^ self
		read: TDSimplePost
		withMapping: #postInfoMappingFor:
		on: aJsonPostInfo readStream.
]

{ #category : #'as yet unclassified' }
TDJsonMapping class >> readPostsInfo: aJsonCollectionOfPostsInfo [
	^ self
		read: #CollectionOfPostsInfo
		withMapping: #collectionOfPostsInfoMappingFor:
		on: aJsonCollectionOfPostsInfo readStream.
]

{ #category : #'as yet unclassified' }
TDJsonMapping class >> readTodoInfo: aJsonPostInfo [
	^ self
		read: TDTodoPost
		withMapping: #todoInfoMappingFor:
		on: aJsonPostInfo readStream.
]

{ #category : #'as yet unclassified' }
TDJsonMapping class >> readTodosInfo: aJsonCollectionOfToDosInfo [
	^ self
		read: #CollectionOfTodosInfo
		withMapping: #collectionOfTodosInfoMappingFor:
		on: aJsonCollectionOfToDosInfo readStream.
]

{ #category : #'as yet unclassified' }
TDJsonMapping class >> todoInfoMappingFor: aNeoJsonMapper [
	aNeoJsonMapper
		for: TDTodoPost do: [ :mapping |
			mapping mapAccessor: #userId.
			mapping mapAccessor: #id.
			mapping mapAccessor: #title.
			mapping mapAccessor: #completed ].
]
