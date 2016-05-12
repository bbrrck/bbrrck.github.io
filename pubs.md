---
layout: page
permalink: /publications/
title: publications
bibtex-indent: "  "
---

{% assign pubs = site.data.publications %}

{% for year in pubs %}
  <section class="pubs" id="y{{ year.year }}">
  <div class="year">{{ year.year }}</div>
  {% for item in year.items %}
    <section class="pub" id="p-{{ item.pdf.file }}">
        <img src="/assets/{{ item.pdf.file }}.png" />
        <div class="pub-content">
            <div class="title">{{ item.bibtex.title }}</div>
            <div class="authors">{% for author in item.bibtex.authors %}{% if author.last == 'Stanko' %}TS{% else %}{% if author.url %}<a href="{{ author.url }}">{% endif %}{% assign firstparts = {author.first | split: '-'} %}{% for fpart in firstparts %}{{ fpart | split: '' | first }}{% endfor %} {{ author.last }}{% if author.url %}</a>{% endif %}{% endif %}{% if forloop.last == false %}, {% endif %}{% endfor %}</div>
            {% if item.advisor %}<div class="advisor"><a href="{{ item.advisor.url }}">{{ item.advisor.name }}</a></div>{% endif %}
            <div class="description">{{ item.description }}</div>
            <div class="links">
                [ <a href="/assets/{{ item.pdf.file }}.pdf">pdf</a> ~ {{ item.pdf.size }} MB ]
                {% if item.url %}
                    [ <a href="{{ item.url }}">www</a> ]
                {% endif %}
                <div class="bibtex">
                    [ <a href="#">bibtex</a> ]
<pre id="bibtex-{{ item.pdf.slug }}">
@{{ item.type }}&#123; {{ item.slug }},
{% for prop in item.bibtex %}{% if prop[0] == 'authors' %}{{ page.bibtex-indent }}author = &#123;{% for author in item.bibtex.authors %}{{ author.first }} {{ author.last }}{% if forloop.last == false %} and {% endif %}{% endfor %}&#125;,
{% else %}{% unless prop[0] == 'type' or prop[0] == 'slug'  or prop[0] == 'authors'  %}{{ page.bibtex-indent }}{{ prop[0] }} = &#123;{{ prop[1] }}&#125;{% if forloop.last == false %},{% endif %}
{% endunless %}{% endif %}{% endfor %}&#125;
</pre>
                </div>
            </div>
        </div>
    </section>
  {% endfor %}
  </section>

{% endfor %}
