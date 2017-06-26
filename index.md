---
layout: page
---
<div class="row">
<div class="col-sm-4">
  <img src="{{ site.data.home.photo }}" alt="me with an apple" />
</div>
<div class="col-sm-8">
    {{ site.data.home.intro }}
</div>
</div>



{% assign papers = (site.data.publications | sort: 'date' | where:"front",true ) %}
<div class="row">
  <div class="col-sm-12">
    <h2 style="margin-top:2em;">Latest papers</h2>
    <a style="font-size:90%;display:inline-block;margin-left:0.5em;" href="/publications/">see all publications</a>
  </div>
</div>
{% for pub in papers limit:2 %}
  {% include publication-overview.html %}
{% endfor %}



{% assign allnews = (site.data.news  | sort: 'date' | reverse) %}
<div class="row">
  <div class="col-sm-12">
    <h2 style="margin-top:1em;">News</h2>
  </div>
</div>
{% for news in allnews limit:5 %}
  <div class="row news" style="margin-top:0.25em;">
    <div class="col-md-2 col-sm-2 col-xs-12 news-date" style="color:#666;text-align:right;">
    {{ news.date | date: "%d %b %y " }}</div>
    <div class="col-md-10 col-sm-10 col-xs-12 news-content">
    {{ news.text }}</div>
  </div>
{% endfor %}
