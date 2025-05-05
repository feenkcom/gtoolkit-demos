"
{{gtClass:GtABCartoonAddressBookExample}} contains an example of a larger address book.
{{gtExample:GtABCartoonAddressBookExample>>#cartoonAddressBook}}


"
Class {
	#name : #GtABCartoonAddressBookExample,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Demo-AddressBook-Examples'
}

{ #category : #'examples - contacts' }
GtABCartoonAddressBookExample >> bugsBunnyContact [
	<gtExample>
	<label: 'Bugs Bunny contact'>
	<return: #GtABContact>
	| contact |
	contact := GtABContact new
			firstName: 'Bugs';
			lastName: 'Bunny';
			description: self bugsBunnyDescription;
			avatar: (self readAvatarWithId: 'bugs-bunny');
			addTelephone: (GtABTelephone new
					prefix: '+1202';
					number: '5550146');
			addAddress: (GtABAddress new
					city: 'Universal City';
					country: 'USA').

	self assert: contact firstName equals: 'Bugs'.
	self assert: contact lastName equals: 'Bunny'.
	self assert: contact description equals: self bugsBunnyDescription.
	self assert: contact addresses size equals: 1.
	self assert: contact telephones size equals: 1.


	^ contact
]

{ #category : #accessing }
GtABCartoonAddressBookExample >> bugsBunnyDescription [
	^ 'Bugs Bunny is an animated cartoon character, created by the staff of Leon Schlesinger Productions (later Warner Bros. Cartoons) and voiced originally by the "Man of a Thousand Voices," Mel Blanc. Bugs is best known for his starring roles in the Looney Tunes and Merrie Melodies series of animated short films, produced by Warner Bros. during the golden age of American animation. His popularity during this era led to his becoming an American cultural icon, as well as a corporate mascot of Warner Bros. Entertainment.'
]

{ #category : #'examples - addressbook' }
GtABCartoonAddressBookExample >> cartoonAddressBook [
	<gtExample>
	<label: 'Cartoon characters address book'>
	<return: #GtABAddressBook>
	| addressBook |
	addressBook := GtABAddressBook new label: 'Cartoons'.
	addressBook addContact: self bugsBunnyContact.
	addressBook addContact: self daffyDuckContact.
	addressBook addContact: self porkyPigContact.
	addressBook addContact: self roadRunnerContact.
	addressBook addContact: self wileECoyoteContact.
	addressBook addContact: self woodyWoodpeckerContact.

	self assert: addressBook contacts size equals: 6.

	^ addressBook
]

{ #category : #'examples - contacts' }
GtABCartoonAddressBookExample >> daffyDuckContact [
	<gtExample>
	<label: 'Daffy Duck contact'>
	<return: #GtABContact>
	| contact |
	contact := GtABContact new
			firstName: 'Daffy';
			lastName: 'Duck';
			description: self daffyDuckDescription;
			avatar: (self readAvatarWithId: 'daffy-duck');
			addTelephone: (GtABTelephone new
					prefix: '+1202';
					number: '5550151');
			addAddress: (GtABAddress new
					city: 'Universal City';
					country: 'USA').

	self assert: contact firstName equals: 'Daffy'.
	self assert: contact lastName equals: 'Duck'.
	self assert: contact description equals: self daffyDuckDescription.
	self assert: contact addresses size equals: 1.
	self assert: contact telephones size equals: 1.


	^ contact
]

{ #category : #accessing }
GtABCartoonAddressBookExample >> daffyDuckDescription [
	^ 'Daffy Duck is an animated cartoon character produced by Warner Bros. Styled as an anthropomorphic black duck, the character has appeared in cartoon series such as Looney Tunes and Merrie Melodies, where he usually has been depicted as the best friend and occasional arch-rival of Bugs Bunny. Daffy was one of the first of the new "screwball" characters that emerged in the late 1930s to replace traditional everyman characters who were more popular earlier in the decade,[citation needed] such as Mickey Mouse and Popeye. Daffy starred in 133 shorts in the golden age, making him the third-most frequent character in the Looney Tunes/Merrie Melodies cartoons, behind Bugs Bunny''s 166 appearances and Porky Pig''s 159 appearances.'
]

{ #category : #accessing }
GtABCartoonAddressBookExample >> loremIpsum [
	"Return a constant string with one paragraph of text, the famous Lorem ipsum filler text.
	The result is pure ASCII (Latin words) and contains no newlines."
	
	^ 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
]

{ #category : #'examples - contacts' }
GtABCartoonAddressBookExample >> porkyPigContact [
	<gtExample>
	<label: 'Porky Pig contact'>
	<return: #GtABContact>
	| contact |
	contact := GtABContact new
			firstName: 'Porky';
			lastName: 'Pig';
			description: self porkyPigDescription;
			avatar: (self readAvatarWithId: 'porky-pig');
			addTelephone: (GtABTelephone new
					prefix: '+1202';
					number: '5550138');
			addAddress: (GtABAddress new
					city: 'Universal City';
					country: 'USA').

	self assert: contact firstName equals: 'Porky'.
	self assert: contact lastName equals: 'Pig'.
	self assert: contact description equals: self porkyPigDescription.
	self assert: contact addresses size equals: 1.
	self assert: contact telephones size equals: 1.

	^ contact
]

{ #category : #accessing }
GtABCartoonAddressBookExample >> porkyPigDescription [
	^ 'Porky Pig is an animated cartoon character in the Warner Bros. Looney Tunes and Merrie Melodies series of cartoons. He was the first character created by the studio to draw audiences based on his star power, and the animators created many critically acclaimed shorts using the fat little pig. Even after he was supplanted by later characters, Porky continued to be popular with moviegoers and, more importantly, the Warners directors, who recast him in numerous everyman and sidekick roles.'
]

{ #category : #'private - utilities' }
GtABCartoonAddressBookExample >> readAvatarWithId: anId [
	anId ifNil: [ ^GtABContact unknowsJoeAvatar ].
	^ (PNGReadWriter formFromFileNamed: (GtResourcesUtility resourceAtPath: Path *
		'feenkcom' / 
		'gtoolkit-demos' /
		'data' / 
		'addressbook' /
		'icons' / 
		(anId,'.png')))
]

{ #category : #'examples - contacts' }
GtABCartoonAddressBookExample >> roadRunnerContact [
	<gtExample>
	<label: 'Road Runner contact'>
	<return: #GtABContact>
	| contact |
	contact := GtABContact new
			firstName: 'Road';
			lastName: 'Runner';
			description: self roadRunnerDescription;
			avatar: (self readAvatarWithId: 'road-runner');
			addTelephone: (GtABTelephone new
					prefix: '+1202';
					number: '5550110');
			addAddress: (GtABAddress new
					city: 'Burbank';
					country: 'USA').

	self assert: contact firstName equals: 'Road'.
	self assert: contact lastName equals: 'Runner'.
	self assert: contact description equals: self roadRunnerDescription.
	self assert: contact addresses size equals: 1.
	self assert: contact telephones size equals: 1.

	^ contact
]

{ #category : #accessing }
GtABCartoonAddressBookExample >> roadRunnerDescription [
	^ 'Road Runner was created by animation director Chuck Jones in 1948 for Warner Bros., while the template for their adventures was the work of writer Michael Maltese. The characters star in a long-running series of theatrical cartoon shorts (the first 16 of which were written by Maltese) and occasional made-for-television cartoons. It was originally meant to parody chase cartoons like Tom and Jerry, but became popular in its own right.'
]

{ #category : #'examples - contacts' }
GtABCartoonAddressBookExample >> wileECoyoteContact [
	<gtExample>
	<label: 'Wile E. Coyote contact'>
	<return: #GtABContact>
	| contact |
	contact := GtABContact new
			firstName: 'Wile';
			lastName: 'E. Coyote';
			description: self wileECoyoteDescription;
			avatar: (self readAvatarWithId: 'wile-e-coyote');
			addTelephone: (GtABTelephone new
					prefix: '+1202';
					number: '5550171');
			addAddress: (GtABAddress new
					city: 'Burbank';
					country: 'USA').

	self assert: contact firstName equals: 'Wile'.
	self assert: contact lastName equals: 'E. Coyote'.
	self assert: contact description equals: self wileECoyoteDescription.
	self assert: contact addresses size equals: 1.
	self assert: contact telephones size equals: 1.

	^ contact
]

{ #category : #accessing }
GtABCartoonAddressBookExample >> wileECoyoteDescription [
	^ 'Wile E. Coyote (also known simply as "The Coyote") and The Road Runner are a duo of characters from the Looney Tunes and Merrie Melodies series of cartoons. In the cartoons, Coyote repeatedly attempts to catch and subsequently eat the Road Runner, a fast-running ground bird, but is never successful. Coyote, instead of his species'' animal instincts, uses absurdly complex contraptions (sometimes in the manner of Rube Goldberg) and elaborate plans to pursue his prey, which always comically backfire with Wile normally getting injured by the slapstick humor.'
]

{ #category : #'examples - contacts' }
GtABCartoonAddressBookExample >> woodyWoodpeckerContact [
	<gtExample>
	<label: 'Woody Woodpecker contact'>
	<return: #GtABContact>
	| contact |
	contact := GtABContact new
			firstName: 'Woody';
			lastName: 'Woodpecker';
			description: self woodyWoodpeckerDescription;
			avatar: (self readAvatarWithId: 'woody-woodpecker');
			addTelephone: (GtABTelephone new
					prefix: '+1202';
					number: '5550112');
			addAddress: (GtABAddress new
					city: 'Universal City';
					country: 'USA').

	self assert: contact firstName equals: 'Woody'.
	self assert: contact lastName equals: 'Woodpecker'.
	self assert: contact description equals: self woodyWoodpeckerDescription.
	self assert: contact addresses size equals: 1.
	self assert: contact telephones size equals: 1.

	^ contact
]

{ #category : #accessing }
GtABCartoonAddressBookExample >> woodyWoodpeckerDescription [
	^ 'Woody Woodpecker is an anthropomorphic animated woodpecker who appeared in theatrical short films produced by the Walter Lantz animation studio and distributed by Universal Pictures. Though not the first of the screwball characters that became popular in the 1940s, Woody is one of the most indicative of the type.'
]
