"
We find an [IMDB list of Kurosawa films](https://www.imdb.com/list/ls569009973/). We can [export the list as CSV](https://www.imdb.com/list/ls569009973/export?ref_=ttls_otexp). We use a local copy to parse the CSV and generate a JSON using the CSV2JSON visitor.
"
Class {
	#name : #CSV2JSONExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-ParseNodeVisitor-Examples'
}

{ #category : #accessing }
CSV2JSONExamples >> kurosawaCSV [
	<gtExample>
	<return: #ByteString>
	^ (FileLocator gtResource / 'feenkcom' / 'gtoolkit-demos' / 'data' / 'imdb'
		/ 'Akira Kurosawa Movies.csv') contents
]

{ #category : #accessing }
CSV2JSONExamples >> kurosawaJson [
	<gtExample>
	<return: #GtJson>
	| json |
	json := (CSV2JSON for: self kurosawaCSV) json.
	self assert: (json isKindOf: GtJson).
	^ json
]

{ #category : #accessing }
CSV2JSONExamples >> kurosawaJsonObject [
	<gtExample>
	<return: #Array>
	| json |
	json := (CSV2JSON for: self kurosawaCSV) jsonObject.
	self assert: (json isKindOf: Array).
	self assert: json size equals: 32.
	self assert: (json first at: 'Title') equals: 'Uma'.
	self
		assert: (json collect: [ :each | each at: 'Directors' ]) asSet size
		equals: 4.
	^ json
]
