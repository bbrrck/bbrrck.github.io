---
layout: page
---
<div class="homepage">
<!-- NEWS -->
<section id="news">
{% assign allnews = site.data.news | sort: 'date' | reverse %}
<div class="row">
  <div class="col-sm-12">
    <h2>All news :</h2>
  </div>
</div>
{% for news in allnews %}
  <div class="row news">
    <div class="col-md-2 col-sm-3 news-date">
    {{ news.date | date: "%b %d, %Y " }}</div>
    <div class="col-md-10 col-sm-9 news-content">
    {{ news.text }}</div>
  </div>
{% endfor %}
</section>
</div>
