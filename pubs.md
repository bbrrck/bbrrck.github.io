---
layout: page
permalink: /pubs/
---

{% assign pubs = site.data.publications %}
{% for section in pubs %}
  <section class="publications" id="y{{ section.year }}">
    <title class="year">{{ section.year }}</title>
  {% for item in section.items %}
    <section class="publication" id="p{{ item.slug }}">
        <div class="pub-image">
            <img src="/assets/{{ item.slug }}.png" />
        </div>
        <div class="pub-wrapper">
            <title>{{ item.title }}</title>
            {% if item.advisor %}<div class="advisor"><a href="{{ item.advisor_url }}">{{ item.advisor }}</a></div>{% endif %}
            <div class="type">{{ item.description }}</div>
            <div class="links">
                {% if item.pdf_size %}
                    [ <a href="/assets/{{ item.slug }}.pdf">pdf</a> ~ {{ item.pdf_size }} MB ]
                {% endif %}
                {% if item.www %}
                    [ <a href="{{ item.www }}">www</a> ]
                {% endif %}
            </div>
        </div>
    </section>
  {% endfor %}
  </section>
{% endfor %}