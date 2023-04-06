Class {
	#name : #YAMLMissingKeyVisitor,
	#superclass : #YAMLParseNodeVisitor,
	#category : #'GToolkit-Demo-YAML2JSON'
}

{ #category : #accessing }
YAMLMissingKeyVisitor >> visitMapping: aMapping [
	aMapping key ifNil: [ self error: 'Missing key!' ].
	^ super visitMapping: aMapping
]
