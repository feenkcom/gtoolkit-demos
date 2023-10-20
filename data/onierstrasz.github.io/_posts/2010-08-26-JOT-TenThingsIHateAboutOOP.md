---
title: 'Ten Things I Hate About Object-Oriented Programming'
date: 2010-08-26
permalink: /posts/2010-08-26-JOT-TenThingsIHateAboutOOP
---

Boy, I some days I really hate object-oriented programming.

Apparently I’m not the only one. In the immortal words of Edsger Dijkstra: *“Object-oriented programming is an exceptionally bad idea which could only have originated in California.”*

Well, I’m not normally one to complain, but I think it is time to step back and take a serious look at what is wrong with OOP. In this spirit, I have prepared a modest list of *Ten Things I Hate About Object-Oriented Programming*.

# 1. Paradigm

What is the object-oriented paradigm anyway? Can we get a straight story on this? I have heard so many different versions of this that I really don’t know myself what it is.

If we go back to the origins of Smalltalk, we encounter the mantra, “Everything is an object”. Except variables. And packages. And primitives. And numbers and classes are also not really objects, and so on. Clearly “Everything is an object” cannot be the essence of the paradigm.

What is fundamental to OOP? [Peter Wegner once proposed](http://doi.acm.org/10.1145/38807.38823) that *objects + classes + inheritance* were essential to object-oriented languages. Every programming language, however, supports these features differently, and they may not even support them as built-in features at all, so that is also clearly not the paradigm of OOP.

Others argue convincingly that OOP is really about *Encapsulation*, *Data Abstraction* and *Information Hiding*. The problem is that some sources will tell you that these are just different words for the same concepts. Yet other sources tell us that the three are fundamentally different in subtle ways.

Since the mid-eighties, several myths have been propagated about OOP. One of these is the *Myth of Reuse*, which says that OOP makes you more productive because instead of developing your code from scratch, you can just inherit from existing code and extend it. The other is the *Myth of Design*, which implies that analysis, design and implementation follow seamlessly from one another because i*t’s objects all the way down*. Obviously neither of these candidates could really be the OO paradigm.

Let’s look at other paradigms which offer a particular way to solve programming problems. Procedural programming is often described as *programs = data + algorithms*. Logic programming says *programs = facts + rules*. Functional programming might be *programs = functions + functions*. This suggest that OOP means *programs = objects + messages*. Nice try, but this misses the point, I think.

For me the point of OOP is that it isn’t a paradigm like procedural, logic or functional programming. Instead, OOP says “for every problem you should design your own paradigm”. In other words, the OO paradigm really is: *Programming is Modeling*

# 2. Object-Oriented Programming Languages

Another thing I hate is the way that everybody loves to hate the other guy’s programming language. We like to divide the world into curly brackets vs square brackets vs round brackets.

Here are some of the nice things that people have said about some of our favorite OOPLs:

*“C makes it easy to shoot yourself in the foot; C++ makes it harder, but when you do, it blows away your whole leg.”*

It was Bjarne Stroustrup who said that, so that’s ok, I guess.

*“Actually I made up the term ‘object-oriented’, and I can tell you I did not have C++ in mind.”* — Alan Kay

*“There are only two things wrong with C++: The initial concept and the implementation.”* — Bertrand Meyer

*“Within C++, there is a much smaller and cleaner language struggling to get out.”* — Bjarne Stroustrup

*“C++ is history repeated as tragedy. Java is history repeated as farce.”* — Scott McKay

*“Java, the best argument for Smalltalk since C++.”* — Frank Winkler

*“If Java had true garbage collection, most programs would delete themselves upon execution.”* — Robert Sewell

But perhaps the best blanket condemnation is the following:

*“There are only two kinds of languages: the ones people complain about and the ones nobody uses.”* — Bjarne Stroustrup

# 3. Classes

Classes drive me crazy. That might seem strange, so let me explain why.

Clearly classes should be great. Our brain excels at classifying everything around us. So it seems natural to classify everything in OO programs too.

However, in the real world, there are only objects. *Classes exist only in our minds.* Can you give me a single real-world example of class that is a true, physical entity? No, I didn’t think so.

Now, here’s the problem. Have you ever considered why it is so much harder to understand OO programs than procedural ones?

Well, in procedural programs procedures call other procedures. Procedural source code shows us … procedures calling other procedures. That’s nice and easy, isn’t it?

In OO programs, objects send messages to other objects. OO source code shows us … classes inheriting from classes. Oops. There is a complete disconnect in OOP between the source code and the runtime entities. Our tools don’t help us because our IDEs show us classes, not objects.

I think that’s probably why Smalltalkers like to program in the debugger. The debugger lets us get our hands on the running objects and program them directly.

Here is my message for tool designers: please give us an IDE that shows us objects instead of classes!

# 4. Methods

To be fair, I hate methods too.

As we have all learned, methods in good OO programs should be short and sweet. Lots of little methods are good for development, understanding, reuse, and so on. Well, what’s the problem with that?

Well, consider that we actually spend more time reading OO code than writing it. This is what is known as productivity. Instead of spending many hours writing a lot of code to add some new functionality, we only have to write a few lines of code to get the new functionality in there, but we spend many hours trying to figure out *which* few lines of code to write!

One of the reasons it takes us so long is that we spend much of our time bouncing back and forth between … lots of little methods.

This is sometimes known as the *Lost in Space* syndrome. It has been reported since the early days of OOP. To quote Adele Goldberg, *“In Smalltalk, everything happens somewhere else.”*

I believe that the code-oriented view of today’s IDEs is largely to blame — given that OO code does not accurately reflect the running application, the IDE gets in our way instead of helping us to bridge the gap. Another reason I believe that Smalltalkers like to develop in the debugger is that it lets them clearly see which objects are communicating with which other objects. I am guessing that one of the reasons that Test-Driven Development is popular is that it also exposes object interactions during development.

It is not OOP that is broken — we just haven’t figured out (after over 40 years) how best to develop with it. We need to ask ourselves: *Why should the source code be the dominant view in the IDE?*

I want an IDE that lets me jump from the running application to the code and back again. (For a demonstration of this idea, have a look at the [Seaside web development platform](http://seaside.st) which allows you to navigate directly from a running web application to the editable source code.)

# 5. Types

OK, I admit it. I am an impatient guy, and I hate having to say everything twice. Types force me to do that.

I’m sure some of you are thinking — “Oh, how could you program in an *untyped* language. You could never be sure your code is correct.”

Of course there is no such thing as an “untyped” programming language — there are just statically and dynamically typed ones. Static types just prevent you from writing certain kinds of code. There is nothing wrong with that, in principle.

There are several problems, however, with types as we know them. First of all they tend to lead to a false sense of security. Just because your Java program compiles does not mean it has no errors (even type errors).

Second of all, and much more evil, is that type systems assume the world is consistent, *but it isn’t!* This makes it harder to write certain useful kinds of programs (especially reflective ones). Type systems cannot deal well with the fact that programs change, and that different bits of complex systems may not be consistent.

Finally, type systems don’t cope well with the fact that *there are different useful notions of types*. There is no one type system to rule them all. Recall the pain we experienced to extend Java with generics. These days there are many interesting and useful type systems being developed, but we cannot extend Java to accommodate them all. [Gilad Bracha has proposed](http://bracha.org/pluggableTypesPosition.pdf) that type systems should not only be *optional*, in the sense that we should be able to run programs even if the type system is unhappy, but that they should be *pluggable*, meaning that we can plug multiple type systems into different parts of our programs.  We need to take this proposal seriously and explore how our languages and development tools can be more easily adapted to diverse type systems.

# 6. Change

*“Change is inevitable — except from a vending machine.”* — Robert C. Gallagher

We all hate change, right? So, if everyone hates change, why do we all complain when things don’t get better? We know that useful programs must change, or they degrade over time.

(Incidentally, you know the difference between hardware and software? Hardware degrades if you *don’t* maintain it.)

Given that real programs must change, you would think that languages and their IDEs would support this. I challenge you, however, to name a *single* programming language mechanism that supports change. Those mechanisms that do deal with change restrict and control it rather than enable it.

The world is not consistent, but we can cope with that just fine. *Context* is a great tool for managing change and inconsistency. We are perfectly comfortable adapting our expectations and our behavior in our daily lives depending on the context in which we find ourselves, but the programs we write break immediately if their context changes.

I want to see context as a first-class concept in OO languages and IDEs. Both source code and running software should be able to adapt to changing context. I believe that many design patterns and idioms (such as visitors, and dependency injection) are simply artifacts of the lack of support for context, and would disappear if context were available as a first-class construct.

# 7. Design Patterns

Patterns. Can’t live with ’em, can’t live without ’em.

Every single design pattern makes your design more complicated.

Visitors. I rest my case.

# 8. Methodologies

*“All methodologies are based on fear.”* — Kent Beck

Evidently some of my students follow the Chuck Norris school of Agile Development:

*“Chuck Norris pairs alone.”*

*“Chuck Norris doesn’t do iterative development. It’s right the first time, every time.”*

*“Chuck Norris doesn’t do documentation. He stares down the code until it tells him everything he wants to know.”*

# 9. UML

Bertrand Meyer tells this story about always wondering why diagrammatic modeling languages were always so popular, until one day it hit him: *“Bubbles don’t crash.”* I believe his point is that OO languages are modeling languages. (AKA “All you need is code”)

There similarly appears to be something fundamentally wrong with model-driven development as it is usually understood — instead of *generating* code from models, the model should *be* the code.

By analogy, when FORTRAN was invented, it was sold as a high-level language from which *source code* would be generated. Nowadays we think of the high-level languages as *being* the source code.

I like to think that one day, when we grow up, perhaps we will think of the *model* as being the source code.

# 10. The Next New Thing

Finally, I hate the catchphrase: “Objects are not enough. We need …” Over the years we have needed frameworks, components, aspects, services (which, curiously, seems to bring us back to procedural programming!).

Given the fact that objects clearly *never* were enough, isn’t it odd that they have served us so well over all these years?

# Conclusion?

25 years ago we did not expect object-oriented programming to last as a “new” phenomenon for so long. We thought that OO conferences like ECOOP, OOPSLA and TOOLS would last for 4 or 5 years and then fade into the mainstream. It is too soon to dismiss OOP as just being part of the mainstream. Obviously we cannot feel passionately about something that does not interest us. The fact that academic and industrial research is still continuing suggests that there is something deep and important going on that we do not yet fully understand.

OOP is about taming complexity through modeling, but we have not mastered this yet, possibly because we have difficulty distinguishing real and accidental complexity.

I believe that to make further progress we must focus on change and how OOP can facilitate change. After all these years, we are still in the early days of OOP and understanding what it has to offer us.

Oscar Nierstrasz

---

*Banquet speech given at ECOOP 2010. Maribor, June 24, 2010.*

First published on [The JOT Blog](https://blog.jot.fm/2010/08/26/ten-things-i-hate-about-object-oriented-programming/).
DOI: [10.5381/jot.2010.9.5.e1](http://dx.doi.org/10.5381/jot.2010.9.5.e1)
