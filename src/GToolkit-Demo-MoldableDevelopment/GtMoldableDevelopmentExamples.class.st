"
!Moldable development

Software is highly contextual. For tools to be effective, they need to take that context into account.

Context has many forms. Simply choosing one framework over the other will change your constraints, the code will be organized differently, and the debugging problems will be different. All these will pose different needs, and tools have to acommodate them.

A tool that gives you a button encodes in that button an assumption about your specific question and bakes the solution in the response. However, when context is king, we cannot predict the specific problem. We can predict classes of problems, but not the specific ones. For example, we can say that you will need to understand dependencies between methods or objects, but we cannot say what specific dependencies you will need to look for.

For tools to be effective, they need to take context into account.


!!McLuhan's law, or why tools are essential in software engineering

In a brilliant summary of Marshall McLuhan's work, John Culkin warned us that ''We shape our tools, and thereafter our tools shape us''. This is a remarkable statement that deserves closer scrutiny. If it is correct, we should explicitly choose the tools we use because they will determine the way we are going to think.

If you are like most people, you likely have checked your smartphone within 10 minutes of waking up this morning. This need did not exist before the introduction of the smartphone. The correlation is remarkable, and it indicates that tool manufactured the need.

Software is data. Data does not have a shape. Yet, we need shape to reason about it. The shape of software is provided by the tool. That makes the tool essential. So, what characteristics should the tool have?


!!Moldability


${class:BaselineOfGToolkitInspector}$






"
Class {
	#name : #GtMoldableDevelopmentExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}
