Class {
	#name : #DemoMarkdownWebsite,
	#superclass : #Object,
	#classInstVars : [
		'cache'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Demo'
}

{ #category : #accessing }
DemoMarkdownWebsite class >> cache [
	^ cache
]

{ #category : #'instance creation' }
DemoMarkdownWebsite class >> canadaClub [
	| key repoUrl webUrl repoDir navMenuLinks |
	key := 'canadaClub'.
	webUrl := 'https://canadaclub.ch'.
	repoUrl := 'https://github.com/canadaclub/canadaclub.github.io'.
	repoDir := (FileLocator imageDirectory / 'canadaclub.github.io')
			asFileReference.
	navMenuLinks := {'/contact'.
			'/contact-fr'.
			'/events'.
			'/events-fr'.
			'/index'.
			'/index-fr'.
			'/links'.
			'/links-fr'.
			'/websiteinfo'.
			'/websiteinfo-fr'}.
	^ cache
		at: key
		ifAbsentPut: [ MarkdownWebsite new
				initializeRepoDir: repoDir fromRepoUrl: repoUrl;
				repoDir: repoDir;
				url: webUrl;
				navigationMenuLinks: navMenuLinks ]
]

{ #category : #'instance creation' }
DemoMarkdownWebsite class >> iceberne [
	| key repoUrl webUrl repoDir navMenuLinks |
	key := 'icberne'.
	webUrl := 'https://icberne.github.io'.
	repoUrl := 'https://github.com/icberne/icberne.github.io'.
	repoDir := (FileLocator imageDirectory / 'icberne.github.io') asFileReference.
	navMenuLinks := {'/about/'.
			'/activities/'.
			'/communications/'.
			'/join/'.
			'/contact-2/'}.
	^ cache
		at: key
		ifAbsentPut: [ MarkdownWebsite new
				initializeRepoDir: repoDir fromRepoUrl: repoUrl;
				repoDir: repoDir;
				url: webUrl;
				navigationMenuLinks: navMenuLinks ]
]

{ #category : #initialization }
DemoMarkdownWebsite class >> initialize [
	super initialize.
	cache := Dictionary new
]

{ #category : #'instance creation' }
DemoMarkdownWebsite class >> nierstraszFamily [
	| key repoUrl webUrl repoDir navMenuLinks |
	key := 'nierstraszFamily'.
	webUrl := 'https://www.family.nierstrasz.org'.
	repoUrl := 'https://github.com/onierstrasz/nierstrasz.org'.
	repoDir := (FileLocator imageDirectory / 'nierstrasz.org') asFileReference.
	navMenuLinks := {'/HahnAarsse-en/'.
			'/HahnAarsse-en/Aarsse-Fritz'.
			'/HahnAarsse-en/DoEnHuug'.
			'/HahnAarsse-en/DoNaarBoekarest'.
			'/HahnAarsse-en/Elspeet'.
			'/HahnAarsse-en/Hahn-Aarsse'.
			'/HahnAarsse-en/HenrietteDeRidder'.
			'/HahnAarsse-en/JetAarsse'.
			'/HahnAarsse-en/JetHahn'.
			'/HahnAarsse-en/LettersFromGeorg'.
			'/HahnAarsse-en/LydiaDeRidder'.
			'/HahnAarsse-en/NaDeOorlog'.
			'/HahnAarsse-en/OomLouis'.
			'/HahnAarsse-en/Speelzolder'.
			'/HahnAarsse-en/TanteVictoire'.
			'/HahnAarsse-en/catalog'.
			'/HahnAarsse-en/deGrauw'.
			'/HahnAarsse-en/index'.
			'/HahnAarsse/'.
			'/HahnAarsse/Aarsse-Fritz'.
			'/HahnAarsse/DoEnHuug'.
			'/HahnAarsse/DoNaarBoekarest'.
			'/HahnAarsse/Elspeet'.
			'/HahnAarsse/Hahn-Aarsse'.
			'/HahnAarsse/HenrietteDeRidder'.
			'/HahnAarsse/JetAarsse'.
			'/HahnAarsse/JetHahn'.
			'/HahnAarsse/LettersFromGeorg'.
			'/HahnAarsse/LydiaDeRidder'.
			'/HahnAarsse/NaDeOorlog'.
			'/HahnAarsse/OomLouis'.
			'/HahnAarsse/Speelzolder'.
			'/HahnAarsse/TanteVictoire'.
			'/HahnAarsse/catalog'.
			'/HahnAarsse/deGrauw'.
			'/HahnAarsse/index'.
			'/crest'.
			'/nierstrass'.
			'/origin'.
			'/sitemap/'.
			'/sources'.
			'/tree'}.
	^ cache
		at: key
		ifAbsentPut: [ MarkdownWebsite new
				initializeRepoDir: repoDir fromRepoUrl: repoUrl;
				repoDir: repoDir;
				url: webUrl;
				navigationMenuLinks: navMenuLinks ]
]

{ #category : #'instance creation' }
DemoMarkdownWebsite class >> oscarHomePage [
	| key repoUrl webUrl repoDir navMenuLinks |
	key := 'oscar'.
	webUrl := 'https://www.oscar.nierstrasz.org'.
	repoUrl := 'https://github.com/onierstrasz/onierstrasz.github.io'.
	repoDir := (FileLocator imageDirectory / 'onierstrasz.github.io')
			asFileReference.
	navMenuLinks := {'/cv/'.
			'/low-road-blog/'.
			'/oddsAndEnds/'.
			'/publications/'.
			'/talks/'.
			'/teaching/'}.
	^ cache
		at: key
		ifAbsentPut: [ MarkdownWebsite new
				initializeRepoDir: repoDir fromRepoUrl: repoUrl;
				repoDir: repoDir;
				url: webUrl;
				navigationMenuLinks: navMenuLinks ]
]

{ #category : #'instance creation' }
DemoMarkdownWebsite class >> scg [
	<todo: 'This needs some work as there are no permalinks in the YAML headers, and links are of a special form with %base_url% etc. We will need a subclass of MarkdownWebsite'>

	| key repoUrl webUrl repoDir navMenuLinks |
	key := 'scg'.
	webUrl := 'https://scg.unibe.ch'.
	repoUrl := 'https://github.com/scgbern/scgpico'.
	repoDir := (FileLocator imageDirectory / 'scgpico') asFileReference.
	navMenuLinks := {'/research'.
			'/teaching'.
			'/publications'.
			'/staff'.
			'/wiki'.
			'scgbib'}.
	^ cache
		at: key
		ifAbsentPut: [ MarkdownWebsite new
				initializeRepoDir: repoDir fromRepoUrl: repoUrl;
				repoDir: repoDir;
				url: webUrl;
				navigationMenuLinks: navMenuLinks ]
]
