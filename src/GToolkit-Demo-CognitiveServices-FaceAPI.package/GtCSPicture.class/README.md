I am an object that models a picture that can contain faces.

I know how to maintain a list of faces and a pictureForm that represents the graphical representation of the picture.  I know also how to extract a list of faces from a JSON structure returned by the Azures Face API.

Currently I also store the URL from where the picture can be downloaded. This is just a temporary behaviour and should be removed in the future.

Public API and Key Messages

- addFacesFromJsonData: adds face objects from the given data to the picture
- hasFaceStorage true if any face data was already added to the picture

The fact that the attribute faces is not null indicates that a client of this object already added face data to the picture. An empty list indicates that the picture has no face objects. 