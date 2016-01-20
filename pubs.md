---
layout: page
permalink: /publications/
---

{% assign pubs = site.data.publications %}
{% for section in pubs %}
  <section class="pubs" id="y{{ section.year }}">
    <h2>{{ section.year }}</h2>
  {% for item in section.items %}
    <section class="pub" id="p{{ item.slug }}">
        <img src="/assets/{{ item.slug }}.png" />
        <div class="pub-content">
            <h3>{{ item.title }}</h3>
            {% if item.advisor %}<div class="advisor"><a href="{{ item.advisor_url }}">{{ item.advisor }}</a></div>{% endif %}
            <div class="description">{{ item.description }}</div>
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