"
To load the P3 F1 demo with its dependencies execute

```
Metacello new
   baseline: 'DemoP3F1';
   repository: 'github://feenkcom/gtoolkit-demos';
   load.
```
"
Class {
	#name : #BaselineOfDemoP3F1,
	#superclass : #BaselineOf,
	#category : #BaselineOfDemoP3F1
}

{ #category : #accessing }
BaselineOfDemoP3F1 >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				baseline: 'GToolkit4P3'
				with: [ spec repository: 'github://feenkcom/gt4p3' ].
			spec 
				package: 'GToolkit-Demo-P3-F1'
				with: [ spec requires: #('GToolkit4P3') ] ]
]
