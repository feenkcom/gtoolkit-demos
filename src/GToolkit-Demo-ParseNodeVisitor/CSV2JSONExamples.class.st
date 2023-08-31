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
	^ FileLocator gtResource / 'feenkcom' / 'gtoolkit-demos' / 'data' / 'imdb'
		/ 'Akira Kurosawa Movies.csv'
]

{ #category : #accessing }
CSV2JSONExamples >> kurosawaJson [
	<gtExample>
	^ (CSV2JSON for: self kurosawaCSV) json
]
