"
Address books are instances of the class ${class:GtABAddressBook}$.
[[[ 
	GtABAddressBook new
]]]

Contacts are then instances of ${class:GtABContact}$. They can have several properties, like name, address, description.
${example:GtABAddressBookExample>>#janeDoeContact}$
This contact will be dispayed then in the user interface as follows:
${example:GtABAddressBookExample>>#johnDoeContact|show=#gtViewPreviewOn:|noCode}$

Contacts can be added using the ${method:GtABAddressBook>>#addContact:}$
${example:GtABAddressBookExample>>#myContactsAddressBook}$


"
Class {
	#name : #GtABAddressBookExample,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Demo-AddressBook-Examples'
}

{ #category : #'as yet unclassified' }
GtABAddressBookExample class >> janeDoeAvatar [
	^ Form fromBinaryStream: self janeDoeAvatarBase64Encoded base64Decoded readStream binary
]

{ #category : #'as yet unclassified' }
GtABAddressBookExample class >> janeDoeAvatarBase64Encoded [
	^ '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'
]

{ #category : #'as yet unclassified' }
GtABAddressBookExample class >> johnDoeAvatar [
	^ Form fromBinaryStream: self johnDoeAvatarBase64Encoded base64Decoded readStream binary
]

{ #category : #'as yet unclassified' }
GtABAddressBookExample class >> johnDoeAvatarBase64Encoded [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAHkAAACJCAAAAAAtA8iMAAAKfklEQVR42u2bW3Nc13GFv9V7zwyIC8GbSJOWZMlULNul2E7JifOWt+QhvzpVSapUsaQksmzZEUmLlEiKIgiCoEAAc3avRJhyJQE5xDkzpPSQfCgAhcvBQq/uvbs3zoHuAuIkLEC2QylcSCOwlCCRhIxN6OgrPagA5iTCSSCK7cBph1PCDkXXhcJTjyScIHMyquE+yqmCExoS3xC1ZTtcUckpo1FzY0znECB6UbPX98oWQollQmZ/e2dnZ+2V8xsrziRoh6V0LXq7Ld0zfTDELJtuMZk+fLj15V4p2VZ/9CY5dipIq1GUFr2Uv+rltkMmIFoWtemtmw8YBVj7K6+dQZsb7YDRhAQQfoExK5yRu/sbq9O9/f2dL55EUXN4xHRqRufOe2+6duXMSA3JLyZmKR0ZCh/cvbm3cTa3HrYWRYmEM2RwNkpq4/Ll8+5GmcVWOLVQzOKIDAC1upsH977YGWVTCc1Z8d678tNLnbKgdHGesKpOLOpunG107/p+t8MKUZmDQKsPPl1fb7VJkS1OcD1O2kEYN0bTT25tfe25pSMdvWbJB3ceR3HrTJ60tqpOCBlTD/+4XZRjtzInd+aIrNNr985evDRtRAJaxG1xhKNj/Oj6rTbKLsDPEbZx+PHuvZ1Tp2m1Yi3jNmjU3bp+SOdIipnhY4BtRWZTyS8/fqBK6yJO6Bh6rm4r3L41Wyadi3g2lgyKcO2KP+uuTsYT2gl23/ezzc5ICaS7H28Hsui1HytFi7W4etUdYYyG5dniG7pSH1x/KGEMmBMxpvBwhdZVJ5LmXTZHWZKRahze/tKjbMEQVEsZ02ayC+Q5yND9Oy1aDBNOx8HN1VeiaeZBDKpto3Bj97PtQloMQWS5/eFtIm0UhSHKCmHVun0/pZKNQZRQ2flk68gqz/Fbc2OWTZ0+bLVrHui20/tRtr7oQgJ7UMxuiOjufTV1FMsMQYqx0ne+Mkgxb1ltzUlztOo7H20XsSA6PPer80+qaxuWZ1x18zcPIlgUjx5d259Ay0HKlMytP2zVETqCRWh3bjuCMkzZ4a2vam2ewSLU3d9u23MkVDWnPMvB44z8U3GJBYi6tbMJ7djFfn7MiuxGLcMsTov6YBrhgRUGhw5bS+SZrLe/zpwjUees1cz9Bw6lOMIsgODR49OhQb2KYHe3JJjFsazDqJ2eNWhpXq8q3iPMUgi03arEDPdbVfuPqoxYAhPcedQG9io9uNtZeCnlRtnds2GG/idzY87d3YDllEONyJKDdhISjRvSMtKK5tjXwDxHyUQ2S9Bcwo+mGpjnhm2WQqaVz7d5Zp4VzEFiaUzhyX4beLoRaFlhga0YepY0WNZydtubGzUH7Z4pM3tZAHFEFlKXNwbOnlqmrn0ENspXRt2wPEcRS+KCo62m5iho3snIWnYPk1BWYti5ShNssRQpdeNR6Qaeq8YbU5ZE0F2cZAzLc65eyJBZAmPn62MPnIa8cv4GSyY6o+mclDzN/JnE1HWnlnU7z50JD+0YMVHLJZUzvldGFoP2MDSeAMuFHdMv3/vLlU4DlEXm5NTjumTHUtneHf+ytiEziYJy6pERy9BC3ac/uDBkPYsg1nBbMs+dysHjMizPGeP1NgrlUma3VDjVK2Yxe5OM1zqWEqaputmWZpyQZ2EBwWglUtYyZreQUtXM0El5FkjCk1M2S+BQS2gD+zP26JQRS1GKHaEZ8+YwP+XIaPVrgWFRfWcgNZ5pNnXO54UnK4crZpn5QKVzwjC3TZ463ZZsVkJyDFQGT87WFEscNeypKCseNIch0JnTnWGJAi9Snj9fBt+7aZsXdyzD4udode3y+kluHyt9W23tAhhp4bCnVrnonrOnmJHC9eypNIsfMlzTF88HmtMNn/nnRUu4RXSL5dnYdpLtrQ3loHlbuBiVxcvaQWntrdfFHEL/G2ZIdsSZ8yxsdggOLr97tvHUzz6C+vRFMyKZrm10lcVQZOtW39lsYcEM9ZkMTKSYnI4Ui5FdvPbz74+SOGEy0NP7nqy1VbMABlJX/vqNlSkNPT/PzzruK9fXkwWQjcdvX8lOjMyf6NmrMqBtrt0dtUipf2nZAVYrb7/acABo4KSPidV1EQrhnrECInGuX/3x6WNG91ROAR5t1hYp0xMLB3nuz9dXz427WWlpiPIMOdk8tSdDRm9laPXqO2kfsNjdfh1Jt80NI6mvsIH02vcigRILPVuhtBRsrGYXDtMPKZU6e7ErLtMsYDQ0ZjuwfGodlOne69i4bq5xdIkXctsKcPrcRCVC0L+4ywQ0chQWy7NSkvKHFw7730cRDqhngZQMSAs/T7Jxady5E/0IJ3HmtQa2WepJlsbV01mUA0YRnV91nz9TV5nnoLx8Yasp+kknwpNXjfBJNp24UrO8tt7cN2YVfPa1ZiTJ6Jn0e3rHZnOyR19Eq1fGU8RzUI88m4CDfSx6YTpNXm9Fxwps6O5pIoGUaPTD4e+/4hQItNjTeHaEVVxYkaN3zI7zY3cx+2ChmCVIN9TaxfWkp3KER6O+ja3qeftRjjKeNJP9b1A1Z2HGYnlO62hiDv79fu0bc7bwYRSWUVZxqlHH5cYNF/dULqHcOVxOGQmV2k1vvrddkqQnrd3+wkkf6rzSrq2pu//+9TaS6UkXmnx9782aQ5Q1K8mMVsJdITLw7/7p0AXTF6lMy73DsanuChZH+LmnG6tmU1FW70+ilZbd1kc3nlQxADWy3f3jj2o3rbWLcC+30zFyUltWR+m+vvuvd7sYMQw7tPfplfXqZJQ+6decIRsrWhE5ffDZb7cZFdsMQSZLN/75L0slQf2UMSE3hZ989cm1fcblIGQGIUhieurNn12qdBT3UZazuJXg8a2PP6Om6kFVikFkyA5NvfYX76zKfdyeKWTh7tYfrhPh4hb1YOw2SNtERobp6g9/cmWVBOY+ua880iRS0s7v398jQmTYDtGCYShrB0HL0VtXf7CSDjtI6enupaYUThV1n/7b57Nat6zZewZjcUTz+Bc/26SJFLLCPu62HSIVX3z8+8PKi8Ilu/rqT95YpZnqjKdjzq5mRpl++NFDxnRieWSii5LNo1fffn0DOldS1vE8266H//xhjpzFZnmElUgmPbn846srCXB8ctbUVdz+l2uuDqYjm+Vx2JFEEs0bf/buaVKdah5fVTH94DcPI2xhB8tjRplYSE57fPnq2YurbsXHc/L5r29Oi8AC82LcJtIiC61kshaXfvrGMTul/MdPHlEty+IFSWPJzBBJEpMrv3g9Mku6kCjoyt98tFcjjXiB6NhkVeNg+/bjS+MQBRMYl1/tFxwKXh7pVGX/3r1YrzoMNTmLyt9GdBHJS0RFmVFy+8b98cpKCyLEfykD0fxSY0ZIUvjBNZ9dkR1uKn9PIivMS6NghJKI/Pxe3RjRFJS/a4jAvDyMZFtkujy6wZkVFP4mzzRk8dIQtkIKgkZ+roujZtVoRNjhlxoz+L//N+N9/dWKMsKluZJ8a6j++r0DupqRQSe+RVr5oL57KviGb1PYQfDBf1BtvmUyprX73ZuVb50kurj7D9+BsrDcXQu+G6Tgu+L/lf9vKFeb7wRH8t3Q/ScE5sOAVeRwkwAAAABJRU5ErkJggg=='
]

{ #category : #accessing }
GtABAddressBookExample class >> loremIpsum [
	"Return a constant string with one paragraph of text, the famous Lorem ipsum filler text.
	The result is pure ASCII (Latin words) and contains no newlines."
	
	^ 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
]

{ #category : #'examples ' }
GtABAddressBookExample >> addressTelephone [
	<gtExample>
	| telephone |
	telephone := GtABTelephone new 
		prefix: '41'; 
		number: '074574363'.
	
	self assert: telephone prefix equals: '41'.
	self assert: telephone number equals: '074574363'.
	self assert: telephone fullNumber equals: '+41-074574363'.
	
	^ telephone
]

{ #category : #'examples ' }
GtABAddressBookExample >> contactAddress [
	<gtExample>
	| address |
	address := GtABAddress new
		city: 'Bern';
		country: 'Switzerland';
		telephone: self addressTelephone.

	self assert: address city equals: 'Bern'.
	self assert: address country equals: 'Switzerland'.
	self assert: address telephone notNil.
	
	^ address
]

{ #category : #'examples ' }
GtABAddressBookExample >> janeDoeContact [
	<gtExample>
	| contact |
	contact := GtABContact new
		firstName: 'Jane';
		lastName: 'Doe';
		description: self class loremIpsum;
		avatar: self class janeDoeAvatar;
		address: self contactAddress.

	self assert: contact firstName equals: 'Jane'.
	self assert: contact lastName equals: 'Doe'.
	self assert: contact description equals: self class loremIpsum.
	self assert: contact address notNil.

	^ contact
]

{ #category : #'examples ' }
GtABAddressBookExample >> johnDoeContact [
	<gtExample>
	| contact |
	contact := GtABContact new
		firstName: 'John';
		lastName: 'Doe';
		description: self class loremIpsum;
		avatar: self class johnDoeAvatar;
		address: self contactAddress.
	
	self assert: contact firstName equals: 'John'.
	self assert: contact lastName equals: 'Doe'.
	self assert: contact description equals: self class loremIpsum.
	self assert: contact address notNil.

	^ contact
]

{ #category : #'examples ' }
GtABAddressBookExample >> myContactsAddressBook [
	<gtExample>
	| addressBook |
	addressBook := GtABAddressBook new
		label: 'My contacts'.
	addressBook addContact: self johnDoeContact.
	addressBook addContact: self janeDoeContact.
	
	self assert: addressBook contacts size equals: 2.
	self assert: (addressBook includesContactWithName: 'John*').
	self assert: (addressBook includesContactWithName: 'Jane*').
	
	^ addressBook
]
