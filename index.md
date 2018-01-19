---
layout: page
---
<div class="row">
<div class="col-xs-12">
  <p>{{ site.data.home.greet }}</p>
</div>
<div class="col-sm-8">
    {{ site.data.home.intro }}
</div>
<div class="col-sm-4">
  <a href="/assets/ts-cv-2page.pdf"><img class="avatar" src="{{ site.data.home.photo }}" alt="labiaci" /></a>
</div>
</div>

{% assign papers = site.data.publications | where:"front",true | sort: 'date' %}
<div class="row">
  <div class="col-xs-12">
    <h2 style="margin-top:2em;">Latest papers</h2>
    <a style="font-size:90%;display:inline-block;margin-left:0.5em;" href="/publications/">see all publications</a>
  </div>
</div>
{% for pub in papers limit:2 %}
  {% include publication-overview.html %}
{% endfor %}

{% assign allnews = site.data.news | sort: 'date' | reverse %}
<div class="row">
  <div class="col-sm-12">
    <h2 style="margin-top:1em;">News</h2>
  </div>
</div>
{% for news in allnews limit:5 %}
  <div class="row news" style="margin-top:0.25em;">
    <div class="col-md-2 col-sm-3 news-date">
    {{ news.date | date: "%b %d, %Y " }}</div>
    <div class="col-md-10 col-sm-9 news-content">
    {{ news.text }}</div>
  </div>
{% endfor %}

{% assign posts = site.posts | sort: 'date' | reverse %}
<div class="row">
  <div class="col-sm-12">
    <h2 style="margin-top:2em;">Latest posts</h2>
  </div>
</div>
{% for post in posts limit:3 %}
  {%   assign today = site.time | date: '%s'      %}
  {%   assign start = post.date | date: '%s'  %}
  {%   assign secondsSince = today | minus: start     %}
  {%   assign hoursSince = secondsSince | divided_by: 60 | divided_by: 60     %}
  {%   assign daysSince = hoursSince | divided_by: 24  %}
  {%   assign weeksSince  = daysSince | divided_by: 7  %}
  {%   assign monthsSince = daysSince | divided_by: 30  %}
  {%   assign yearsSince  = daysSince | divided_by: 365  %}
  <div class="row news" style="margin-top:0.25em;">
    <div class="col-md-2 col-sm-3 news-date">
    {% comment %}
    {%      if  yearsSince > 0 %}{{ yearsSince }} years ago
    {% else if monthsSince > 0 %}{{ monthsSince }} months ago
    {% else if weeksSince > 0  %}{{ weeksSince }} weeks ago
    {% else if daysSince > 0   %}{{ daysSince }} days ago
    {% endif %}
    {% endcomment %}
    {{ post.date | date: "%b %d, %Y " }}
    </div>
    <div class="col-md-10 col-sm-9 news-content">
    <a href="{{ post.permalink }}">{{ post.title }}</a></div>
  </div>
{% endfor %}
