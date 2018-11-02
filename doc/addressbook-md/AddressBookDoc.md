Address books are instances of the class `GtABAddressBook`.
```
GtABAddressBook new
    label: 'My contacts'. 
```

Contacts are then instances of `GtABContact`. They can have several properties, like name, address, description:
```
GtABContact new
    firstName: 'Jane';
    lastName: 'Doe';
    description: 'Lorem Ipsum';
    avatar: GtABAddressBookExample johnDoeAvatar
    address: (GtABAddress new
        city: 'Bern';
        country: 'Switzerland';
        telephone: (GtABTelephone new 
            prefix: '41'; 
            number: '074574363')).
```

This contact will be dispayed then in the user interface as follows:
![John Doe](JohnDoeContact.png)


Contacts can be added using the `GtABAddressBook>>#addContact:`:
```
addressBook := GtABAddressBook new
    label: 'My contacts'.
addressBook addContact: (GtABContact new
    firstName: 'Jane';
    lastName: 'Doe').
addressBook addContact: GtABContact new
    firstName: 'John';
    lastName: 'Doe'
```
