---
title: "Teaching Moldable Development"
date: 2023-08-28
permalink: /posts/2023-08-28-TeachingMoldableDevelopment
---

Moldable Development is a way of developing software in which you build many, small custom tools to solve problems. This implies new tools and new associated skills. As with any new way of thinking, teaching can be challenging. In this session we go draw lessons from our experience of teaching Moldable Development in practice, including how it changes the teaching experience itself.

This blog article is based on a talk presented at [ESUG 2023](https://esug.github.io/2023-Conference/conf2023.html), in which we report on the challenges and and insights we have experienced in teaching moldable development to newcomers.

See the original article on the [feenk blog](https://lepiter.io/feenk/teaching-moldable-development-dkbj2hlidhiph2eodusb87ye6/).

---

Moldable development is a *new* way of programming. In many ways it looks like programming as we are used to it, but it actually entails fundamentally different ways of thinking about programming, and new *patterns* of programming.

# What is Moldable Development?

Moldable Development is a way of programming in which you build custom tools for each problem. In this way the system becomes *explainable*, and thus supports decision making for a range of stakeholders. Let's look at a simple example.

## Exploring the ESUG website

Let's take an easy domain that we can easily relate to, namely the [ESUG website](https://esug.github.io/). Here we are inspecting the cloned repo of the ESUG website.

[![ESUG website custom Inspector views](/assets/images/esug2023/esugWebSiteInspectorViews.png)](/assets/images/esug2023/esugWebSiteInspectorViews.png)

We can browse the pages of the website, and see the contents of a page.

[![ESUG website page contents](/assets/images/esug2023/esugPageContents.png)](/assets/images/esug2023/esugPageContents.png)

From the website inspector we also see all the links, possibly missing internal links, reachable pages, as well as an overall map of root pages (blue), reachable pages (green) and unreachable pages (red).

[![ESUG website Mondrian map](/assets/images/esug2023/mondrianMap.png)](/assets/images/esug2023/mondrianMap.png)

We can also check the status of links using a background process. Finally, we can search for pages or links by title or content.

[![ESUG website custom Spotter search](/assets/images/esug2023/esugWebsiteSpotter.png)](/assets/images/esug2023/esugWebsiteSpotter.png)

## Recap

So what have we seen? We have domain objects representing a website, the web pages and the links. We have custom views for each domain object allowing us to explore the information that interests us, and to navigate to other objects. We also have custom actions to open a web browser or to start an analysis, and we have a custom search to query lists of pages and links. 

Each of these custom tools is implemented in just a few lines of code in a method of the domain object concerned annotated with a dedicated pragma. For example, here is the code for the `Pages` view (we Alt+click on the view to see the code).

[![ESUG website pages view](/assets/images/esug2023/esugWebsitePagesView.png)](/assets/images/esug2023/esugWebsitePagesView.png)

Now we get to the key question:

*How hard is it to teach people to build their own explainable system for their domain of interest?* 

# Moldable Development Patterns

Since Moldable Development is a *way* to develop explainable systems, rather than focusing on technology, it makes sense to start from the *patterns* that we observe when building such systems.

Moldable development patterns express *best practices* in the process of molding software to make it explainable. Let's have a look a few of these patterns.

## Pattern: Moldable object

This is perhaps the hardest pattern to learn. Where would you rather be when you are developing code? Staring at the source code, or viewing the live object that you are working on?

[![PillarWebsite class coder](/assets/images/esug2023/pillarWebsiteCoder.png)](/assets/images/esug2023/pillarWebsiteCoder.png)

Here we see at the top a typical Coder view of a class where we can browse and edit the methods. But this is actually the least interesting view we can have because each method is seen divorced from the context in which it is used and interacts with other methods.

From the very first day that we start to program, we learn to write some code in a text editor, and we compile it and run it. It always takes a few steps to see the end result.

But why not reverse this? Below here we see a *moldable object*, that is, a live instance of the PillarWebsite object that we can interact with.

[![ESUG website Inspector views](/assets/images/esug2023/esugWebSiteInspectorViews.png)](/assets/images/esug2023/esugWebSiteInspectorViews.png)

While it can be cumbersome to navigate from the code view to see its effect, it is usually easy to navigate from the live object to its code. Suppose for, for example, that we want to extend the overview with new attributes. We can directly navigate to the code and adapt it.

[![ESUG website ovierview view](/assets/images/esug2023/esugWebsiteOverviewView.png)](/assets/images/esug2023/esugWebsiteOverviewView.png)

From the moldable object we can experiment with new features, extract methods and examples or tests, and immediately see the effect.

## Pattern: Viewable data wrapper

Although sometimes you may have the luxury to work on a greenfield project, most projects start from some existing data and code. When we load the data into our environment, we will obtain the default views for that data. Here, for example, we have loaded the cloned ESUG website repo and are inspecting the contents.

[![Repository files view](/assets/images/esug2023/repoFilesView.png)](/assets/images/esug2023/repoFilesView.png)

We obtain a completely generic view of the folders and files that tells us nothing about the domain. We would like to turn this into a proper domain object that tells us interesting things about itself. As a first step, then, we can *wrap* the data into a dedicated object.

When we do this, at first glance the result appears to be even worse, as now we just get a generic *Raw* view of the new object.

[![ESUG website wrapper raw view](/assets/images/esug2023/esugWrapperRawView.png)](/assets/images/esug2023/esugWrapperRawView.png)

But now we have the possibility to explore it, add behavior, and add new views. After some iterations we obtain the view we have seen earlier.

## Pattern: Contextual playground

When you program in a conventional IDE, the code is strictly disconnected from any live instance. Experimenting and exploring the state of the running program is only possible by setting breakpoints and running the code in the debugger, or by writing additional dedicated test code.

Another way is to start coding from an Inspector on a live, moldable object. This should remind you of the Smalltalk practice of coding in the debugger, but the difference is that you can code in an inspector without having to get a debugger instance.

Here we see a live instance of our simple EsugWebsiteWrapper with a Playground opened at the bottom.

[![ESUG website wrapper with playground](/assets/images/esug2023/esugWrapperWithPlayground.png)](/assets/images/esug2023/esugWrapperWithPlayground.png)

Why is this interesting?

Because the playground is *bound to the context of the object*, unlike code that we write in a normal code editor. For instance, the variable `repoDir` is bound to that slot of the live instance. We can experiment with code in the playground, and when we see something we like, we can copy the code to a method, or even directly apply an extract method refactoring.

## Pattern: Viewable Entity

How do you know when to create a custom view?

This is another fundamental pattern. The idea is that, whenever you find yourself navigating to get to some interesting objects, you should turn that navigation path into a custom view so you can get to that information directly.

Let's look at a trivial example: as we explore the Esug website model, we navigate to the pages using a Playground snippet, and then we can navigate to individual pages.

[![ESUG website wrapper with pages](/assets/images/esug2023/esugWrapperWithPages.png)](/assets/images/esug2023/esugWrapperWithPages.png)

Instead we'd like the list of pages view to be visible directly in the website object. We can inspect that view to see that it is implemented as a `#gtItemsFor:` method in the class `SequenceableCollection`. We could copy-paste the code and later adapt it, but as a first quick step we can simply define a *forwarding* view from the website to the collection.

We just open a Coder view and add the view that forwards to the existing view of the pages collection. The new view is instantly available.

[![ESUG website page files view](/assets/images/esug2023/pageFilesView.png)](/assets/images/esug2023/pageFilesView.png)

## GT Book: Moldable Development patterns

We have just seen some of the most basic moldable development patterns. They are described in further detail in the GT Book, together with several other patterns.

[![Moldable Patterns page](/assets/images/esug2023/patternsPage.png)](/assets/images/esug2023/patternsPage.png)

# What works?

Teaching Moldable Development is challenging not only because there are the patterns to learn, but also a fair bit of technology to get acquainted with. Here are a few things that can ease the learning process.

## Live documentation

GT comes with a live knowledge base of notebook pages documenting the system itself as well as numerous case studies. For example, here is a page describing how to interact with the GitHub REST API as a case study in Moldable Development.

[![GitHub REST API GT book page](/assets/images/esug2023/gitHubRestApiBookPage.png)](/assets/images/esug2023/gitHubRestApiBookPage.png)

The GT book not only offers users documentation to read and live tutorials to try out, but also serves as a concrete example for users to start their own projects from their personal database of notes.

## Discord

Discord can be a great platform for community building, however it must be well-curated. It's critical not only to make people feel welcome and encouraged to ask any kind of questions, but their questions need to be taken seriously, and answered reasonably quickly.

One interesting pattern in community building is to teach people when they share screenshots to capture an entire window showing the flows between snippets of code and views of interest. A well-designed screenshot goes a long way to telling a story or explaining an issue.

[![GT Discord](/assets/images/esug2023/discord.png)](/assets/images/esug2023/discord.png)

## Videos

Some people love to watch long, meandering videos at double speed, but I'm not one of them. A short, compact video can be a very effective way to explain and demonstrate a complex topic, but it also requires considerable planning. It can, however, take more time to prepare a seven minute video than one that runs over an hour.

[![Getting started with GT in 7'](/assets/images/esug2023/youTubeGTshorts.jpg)](/assets/images/esug2023/youTubeGTshorts.jpg)

# Challenges

Let me round up with a couple of the biggest challenges we have encountered in trying to explain moldable development.

## People hate change

People hate change, or perhaps rather it's the case that it's extremely hard for people to change habits once they have become ingrained. I personally took a long time to get into the habit of starting to code from live objects rather than heading to a code editor first. The code editor is a comfortable place to start from, even if it is not very useful for exploring implementation options or understanding existing code. 

What helps here best is live mentoring on a real project. When you see over and over again the benefits of coding from live objects, you begin to build up a Pavlovian instinct to stay away from the code editor as your starting point. Demos and videos also help, but they are not as effective as the first-hand experience.

## People focus on what they see first

The Glamorous Toolkit contains many pieces of technology that fit together to support moldable development. People like to put things into boxes, so they tend to focus on the first bit of technology that captures their imagination, and so risk to lose the big picture. For example, visualization is an important component, but it is a mistake to equate moldable development with visualization.

[![GT Book TreeMap visualization](/assets/images/esug2023/bookTreeMap.png)](/assets/images/esug2023/bookTreeMap.png)

The same can be said for the live notebooks, the language workbench, or the pervasive use of examples.

# Conclusions

In the end, what is important to convey is that Moldable Development is a *process* in which you ask questions about a software system, explore it, and build lots of small, custom tools to answer those questions and make the system explainable.

Moldable Development is a new way of programming that takes time to learn, but that in the end boils down to a set of learnable patterns.

[![Moldable Patterns map](/assets/images/esug2023/patternsMap.png)](/assets/images/esug2023/patternsMap.png)

