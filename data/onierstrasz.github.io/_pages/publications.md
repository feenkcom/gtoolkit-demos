---
title: "Publications"
permalink: /publications/
author_profile: true
---

Below you will find a few recent publications.
You can find an archive of [all my publications](https://scg.unibe.ch/scgbib/?query=Nierstrasz&filter=Year) on the [SCG website](https://scg.unibe.ch), including bibtex references and downloadable PDFs.

You can find citation data on [Google Scholar](http://scholar.google.com/citations?user=Yi00hUYAAAAJ) and
[Semantic Scholar](https://www.semanticscholar.org/author/O.-Nierstrasz/144591580).
Alternative bibtex references are available from [DBLP](http://www.informatik.uni-trier.de/~ley/db/indices/a-tree/n/Nierstrasz:Oscar.html).

My [Erdös number](https://en.wikipedia.org/wiki/Erd%C5%91s_number) is 3: [Oscar Nierstrasz &mdash; David M. Jackson &mdash; E. Rodney Canfield &mdash; Paul Erdös](https://scg.unibe.ch/scgbib/?query=onerdos123&filter=Year)

# Some recent publications

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

{% for post in site.publications reversed %}
  {% include archive-single.html %}
{% endfor %}
