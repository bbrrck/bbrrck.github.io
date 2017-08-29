---
layout: posts
permalink: /posts/
---

{% for c in site.categories %}
 <h2 id="{{ c[0] }}">{{ c[0] | replace: "-", " " | capitalize }}</h2>
 {% assign pagelist = c[1] %}
 {% for post in pagelist %}
  {{ post.date | date: "%Y-%m-%d" }} <a href="{{ post.url }}">{{ post.title }}</a>
 {% endfor %}
{% endfor %}
