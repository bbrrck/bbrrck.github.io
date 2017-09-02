---
layout: default
permalink: /publications/
title: publications
---
{% for section in site.data.pubsections %}
<div class="row"><div class="publication-section col-xs-12"><h2>{{ section.name }}</h2></div></div>
{% for pub in site.data.publications %}{% for type in section.types %}{% if pub.type == type %}
{% include publication-overview.html %}
{% endif %}{% endfor %}{% endfor %}
{% endfor %}
