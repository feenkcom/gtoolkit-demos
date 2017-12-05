demos
transcriptIntro
	^ self of: { 
'transcript := GtTranscript new.

[ 50 timesRepeat: [
	| element |
	element := GtTranscriptExamples new randomElement.

	transcript next
		cr;
		putAll: ''Shape '', element geometry class name;
		putAll: '', size: '', element extent asString;
		putAll: '', color '', element background paint color asString;
		space.
	20 milliSeconds wait
] ] fork.

transcript'.

'transcript := GtTranscript new.

[ 50 timesRepeat: [
	"| element |
	element := GtTranscriptExamples new randomElement.

	transcript next
		cr;
		putAll: ''Shape '', element geometry class name;
		putAll: '', size: '', element extent asString;
		putAll: '', color '', element background paint color asString;
		space.	"
	
	transcript next
		expanded: [ GtTranscriptExamples new randomElement ];
		cr.

	20 milliSeconds wait
] ] fork.

transcript'
}