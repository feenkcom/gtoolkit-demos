To highlight faces within pictures we first need to create face objects. When creating a face we need to indicate the countour delimiting the face using the ==rectangle:== method.
${example:name=CSPictureExamples>>#faceEinstein}$

Landmakes are used to indicate the position of different elements on a face, like nose, eyes, mouth, etc. Initially a face has no landmarks. We can attach them to a ==Face== object using the method ==landmarks:==.
${example:name=CSPictureExamples>>#faceEinsteinWithLandmarks|expandedPreview=true|show=gtFaceLandmarksViewFor:}$

In case the face object is already attached to a picture with a graphical representation, we can see the landmarks overlayed on the actual face.
${example:name=CSPictureExamples>>#faceEinsteinWithLandmarksInPicture|expandedPreview=true|show=gtFaceLandmarksViewFor:}$

To create an empty picture we can directly instantiate the ==Picture== class. We can also specify a URL from where the graphical representation of the can be downloaded.
${example:name=CSPictureExamples>>#emptyPicture}$

To add faces to a picture we can use the ==addFace:== method. We can add faces before the face has a graphical representation.
${example:name=CSPictureExamples>>#pictureWithFacesWithLandmarksAndNoForm|expandedPreview=true|show=gtFacesFor:}$

Finally, to see the position of faces we can all the ==ensurePictureForm== method. This method downloads the graphical representation from the URL atached to the picture.
${example:name=CSPictureExamples>>#pictureWithFacesWithLandmarksAndForm|expandedPreview=true|show=gtFacesFor:}$