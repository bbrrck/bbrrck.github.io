---
layout: default
title: Analyse numérique
---
{% assign course = site.data.teaching-analysenum2017 %}

<article class="single course page">
    
    <div class="row">
        <div class="col-md-12">
            <h1>{{ course.name }} <a href="{{ course.url }}">{{ course.code }}</a></h1>
            <div class="meta">
            {% for metas in course.meta %}
            {% for meta in metas %}
            <span class="{{ meta[0] }}">{{ meta[1] }}</span>
            {% if meta[0] == 'type' %}{% assign type = meta[1] %}{% endif %}
            {% endfor %}
            {% endfor %}
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-6">
            <h2>Description</h2>
            <p>
            Course of basic numerical analysis, practical part.
            </p>
        </div>

        <div class="col-md-6">
            <h2>Syllabus</h2>
            <ul class="syllabus">
            {% for class in course.syllabus %}
            <li{% if class.break %} class="break"{% endif %}>
            <span class="date">{{ class.date | date: "%b %d" }}</span>
            <span class="title">
            {% if class.break or class.nolink %}
            {{ class.title }}
            {% else %}
            {{ type }}{{ class.number }} :
            <a href="/teaching/{{ course.slug }}/{{ type | downcase }}{{ class.number }}.html">{{ class.title }}</a>
            {% endif %}
            </span>
            </li>
            {% endfor %}
            </ul>
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-6">
        </div>
        
        <div class="col-md-6">
        </div>
    </div>
</article>

