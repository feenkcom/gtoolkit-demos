accessing
propertyAt: aName
 	^ face landmarks propertyAt: aName ifAbsent: [ 0@0 ]