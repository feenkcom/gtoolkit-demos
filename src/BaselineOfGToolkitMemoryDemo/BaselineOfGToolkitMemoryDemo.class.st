"
How to load:

```
Metacello new
   baseline: 'GToolkitMemoryDemo';
   repository: 'github://feenkcom/gtoolkit-demos:main/src';
   load
```

"
Class {
	#name : #BaselineOfGToolkitMemoryDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitMemoryDemo
}

{ #category : #accessing }
BaselineOfGToolkitMemoryDemo >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec package: 'GToolkit-Demo-Memory' ]
]
