---
layout: page
---

{% assign list = site.categories %}  
{% if list.first[0] == null %}
{% for cat in list %} 
<a href="#{{ cat }}">{{ cat | capitalize }} <span>({{ site.cats[cat].size }})</span></a>
{% endfor %}
{% else %}
{% for cat in list %} 
<a href="#{{ cat[0] }}">{{ cat[0] | replace: "-", " " | capitalize }} <span>({{ cat[1].size }})</span></a>
{% endfor %}
{% endif %}
{% assign list = nil %}

{% for cat in site.categories %} 
<h2 id="{{ cat[0] }}">{{ cat[0] | replace: "-", " " | capitalize }}</h2>
{% assign pages_list = cat[1] %}  
{% for post in pages_list %}
{% if post.title != null %}
{% if group == null or group == post.group %}
<a href="{{ post.url }}">{{ post.title }}</a>
{% endif %}
{% endif %}
{% endfor %}
{% assign pages_list = nil %}
{% assign group = nil %}
{% endfor %}
