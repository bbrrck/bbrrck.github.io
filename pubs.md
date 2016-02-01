---
layout: page
permalink: /publications/
title: publications
bibtex-indent: "  "
---

{% assign pubs = site.data.publications %}
{% for section in pubs %}
  <section class="pubs" id="y{{ section.year }}">
    <h2>{{ section.year }}</h2>
  {% for item in section.items %}
    <section class="pub" id="p-{{ item.pdf[0].slug }}">
        <img src="/assets/{{ item.pdf[0].slug }}.png" />
        <div class="pub-content">
            <h3>{{ item.title }}</h3>
            {% if item.advisor %}<div class="advisor">
                {% for adv in item.advisor %}
                <a href="{{ adv.url }}">{{ adv.name }}</a>
                {% endfor %}
            </div>{% endif %}
            <div class="description">{{ item.description }}</div>
            <div class="links">
                [ <a href="/assets/{{ item.pdf[0].slug }}.pdf">pdf</a> ~ {{ item.pdf[0].size }} MB ]
                {% if item.url %}
                    [ <a href="{{ item.url }}">www</a> ]
                {% endif %}
                <div class="bibtex">
                    [ <a href="#">bibtex</a> ]
<pre id="bibtex-{{ item.pdf[0].slug }}">
@{{ item.bibtex }}&#123; {{ item.slug }},
{% for prop in item %}{% unless prop[0] == 'bibtex' or prop[0] == 'advisor' or prop[0] == 'pdf' or prop[0] == 'slug' or prop[0] == 'description'  %}{{ page.bibtex-indent }}{{ prop[0] }} = &#123;{{ prop[1] }}&#125;,
{% endunless %}{% endfor %}{{ page.bibtex-indent }}year = &#123;{{ section.year }}&#125;
&#125;
</pre>
                </div>
            </div>
        </div>
    </section>
  {% endfor %}
  </section>
{% endfor %}