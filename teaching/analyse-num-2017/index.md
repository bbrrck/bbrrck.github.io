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
            <h2>TP1 : Approximation de fonctions</h2>
            <ul>
                <li><a href="/assets/analysenum2017/TP1_sujet.pdf">sujet.pdf</a></li>
                <li><a href="/assets/analysenum2017/TP1_correction.pdf">correction.pdf</a></li>
            </ul>
            
            <h2>TP2 : Scilab et Approximation de fonctions</h2>
            <ul>
                <li><a href="/assets/analysenum2017/TP2_sujet.pdf">sujet.pdf</a></li>
                <li><a href="/assets/analysenum2017/TP2_exo4.sce">exo4.sce</a></li>
                <li><a href="/assets/analysenum2017/TP2_exo5.sce">exo5.sce</a></li>
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

