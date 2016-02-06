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
   <span class="{{ meta[0] }}">{{ meta[1] }}</span>
   {% if meta[0] == 'type' %}{% assign type = meta[1] %}{% endif %}
  {% endfor %}
 {% endfor %}
</div>

{% include news-geo-num-2016.html %}

<h3>Description</h3>
<img src="/assets/teapot.png" alt="Utah teapot" title="Utah teapot" />
<p>
This page is dedicated to the practical part of the <em>Géométrie Numérique</em> course, with lectures given by <a href="http://www-evasion.imag.fr/Membres/Georges-Pierre.Bonneau/">Georges-Pierre Bonneau</a>. Assignements (and some theory) will be published here.
</p>

<h3>Assignements</h3>
<p>
You can either work alone or in pairs. A <a href="https://github.com/bbrrck/geo-num-2016">c++ codebase</a> is provided, but not obligatory – use your favourite language in case you're not a fan of c++ .
</p>

<h3 id="submissions">Submission &amp; Grading</h3>
After each TP, you are required to submit your work, namely :
<ol>
    <li>your <strong>code</strong>, just the files you've modified, no need to include everything ;</li>
    <li>a <strong>pdf report with pictures</strong> and additional comments if needed (in English or French).</li>
</ol>

These are the general rules for submission :
<ul class="submissions">
    <li>Don't submit partial work; send <strong>only one mail</strong> (when you're sure you won't be adding anything else).</li>
    <li>Zip everything as <code>LastName.zip</code> or <code>LastName1_LastName2.zip</code>.</li>
    <li>Use <code>[GeoNum2016] TPxx</code> as the subject.</li>
    <li>Send your mail to {% include email.html %}.</li>
</ul>

<h3>Syllabus</h3>
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

<h3>Past years</h3>
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

