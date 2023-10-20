---
title: "Teaching"
permalink: /teaching/
author_profile: true
---

From 1994 to 2021 I taught numerous courses in the areas of programming and software engineering at the University of Bern.
	
Please see the [SCG Teaching](https://scg.unibe.ch/teaching) page for a list of courses and course evaluations.
You can also find archives there of PDFs of the slides.
Much of the course material is available on GitHub under Creative Commons licenses.
You will find links to the repos on the same page.

# Guest lectures

Since then I have continued to give occasional guest lectures on topics close to my work interests.

{% for post in site.teaching reversed %}
  {% include archive-single.html %}
{% endfor %}
