I model a face present in a picture object.

I maintain properties for the face object, including the rectangle delimiting the face within the picture. I also point to the picture object that contains the face.

Public API and Key Messages

- hasFaceForm - indicates if a graphical representation of the face can be computed   
- faceForm - returns the graphical representation of the face
- initializeFromJson: initializes the properties if the face based on the given data. The given data should be a dictionary following the structure returned by the Azures Face API