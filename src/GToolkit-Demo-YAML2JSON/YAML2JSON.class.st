"
A simple Facade.

YAML2JSON fromFilePath: 'gtoolkit.yaml'

YAML2JSON jsonPrettyFromFilePath: 'gtoolkit.yaml'

"
Class {
	#name : #YAML2JSON,
	#superclass : #Object,
	#category : #'GToolkit-Demo-YAML2JSON'
}

{ #category : #accessing }
YAML2JSON class >> fromFile: aYamlFileReference [
	^ self fromString: aYamlFileReference contents
]

{ #category : #accessing }
YAML2JSON class >> fromFilePath: aYamlFilePath [
	^ self fromFile: aYamlFilePath asFileReference
]

{ #category : #accessing }
YAML2JSON class >> fromString: aString [
	^ (YAMLParser parse: aString) acceptVisitor: YAML2JSONVisitor new
]

{ #category : #accessing }
YAML2JSON class >> jsonPrettyFromFile: aYamlFileReference [
	^ STONJSON toStringPretty: (self fromFile: aYamlFileReference)
]

{ #category : #accessing }
YAML2JSON class >> jsonPrettyFromFilePath: aYamlFileReference [
	^ STONJSON toStringPretty: (self fromFilePath: aYamlFileReference)
]
