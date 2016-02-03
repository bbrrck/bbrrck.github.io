---
layout: page
title: teaching
---

{% assign courses = site.data.teaching %}

{% for course in courses %}
<section class="course">
 
<h2>{{ course.name }} <a href="{{ course.url }}">{{ course.code }}</a></h2>

<div class="meta">
 {% for metas in course.meta %}
  {% for meta in metas %}
   <span>{{ meta[1] }}</span>
   {% if meta[0] == 'type' %}{% assign type = meta[1] %}{% endif %}
  {% endfor %}
 {% endfor %}
</div>

<img src="/assets/teapot.png" alt="Utah teapot" title="Utah teapot" />
<h3>description</h3>
{{ course.info | prettyprint | paragraph }}

<h3>assignements</h3>
<p>
You can either work alone or in pairs. A <a href="https://github.com/bbrrck/geo-num-2016">github codebase</a> is provided, but not obligatory – use your favourite language in case you're not a fan of c++.
For rendering, take a look at <a href="http://gnuplot.info/">gnuplot</a> or <a href="http://matplotlib.org/">matplotlib</a> (or any similar library).
</p>
<p>
After each TP, send your code and a short report with images to <code>tibor.stanko@inria.fr</code>.
Put everything into an archive and name it <code>LastName.zip</code> or <code>LastName1_LastName2.zip</code>.
Use <code>[GeoNum2016] TPxx</code> as the subject of your mail.
</p>

<h3>planning</h3>
 <ul class="calendar">
 {% for class in course.syllabus %}
   <li{% if class.break %} class="break"{% endif %}>
   <span class="date">{{ class.date | date: "%b %d" }}</span>
   <span class="title">
   {% if class.break %}
   {{ class.title }}
   {% else %}
   {{ type }} {{ class.number }} :
   <a href="/teaching/{{ course.slug }}/{{ type | downcase }}{{ class.number }}.html">{{ class.title }}</a>
   {% endif %}
   </span>
   </li>
 {% endfor %}
 </ul>

<h3>past years</h3>
 <ul class="past">
 {% for past in course.past %}
 <li>
  <span class="date">{{ past.year }}</span> 
  <span class="title"><a href="{{ past.url }}">{{ past.who }}</a></span>
 </li>
 {% endfor %}
 </ul>

</section>
{% endfor %}

