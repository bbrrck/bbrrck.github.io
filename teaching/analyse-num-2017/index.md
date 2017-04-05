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
        <div class="col-md-12">
            <h2>TD1 : Approximation de fonctions</h2>
            <p style="margin-top:-0.5em;color:silver;">la semaine de 13/03/2017</p>
            <ul style="list-style-type: square;">
                <li><a href="/assets/analysenum2017/TD1_sujet.pdf">sujet.pdf</a></li>
                <li><a href="/assets/analysenum2017/TD1_correction.pdf">correction.pdf</a></li>
                <li><a href="https://fr.wikipedia.org/wiki/Quartet_d'Anscombe">[wiki] Quartet d'Anscombe</a></li>
            </ul>
            
            <h2>TP2 : Scilab et Approximation de fonctions</h2>
            <p style="margin-top:-0.5em;color:silver;">la semaine de 20/03/2017</p>
            <ul style="list-style-type: square;">
                <li><a href="/assets/analysenum2017/TP2_sujet.pdf">sujet.pdf</a></li>
                <li><a href="/assets/analysenum2017/TP2_exo4.sce">exo4.sce</a></li>
                <li><a href="/assets/analysenum2017/TP2_exo5.sce">exo5.sce</a></li>
            </ul>
            
            <h2>TD3 : </h2>
            <p style="margin-top:-0.5em;color:silver;">la semaine de 27/03/2017</p>
            <ul style="list-style-type: square;">
                <li><a href="/assets/analysenum2017/TD3_sujet.pdf">sujet.pdf</a></li>
                <li><a href="/assets/analysenum2017/TD3_correction.pdf">correction.pdf</a></li>
                <li><a href="https://fr.wikipedia.org/wiki/D%C3%A9composition_QR">[wiki] Décomposition QR</a></li>
                <li><a href="https://fr.wikipedia.org/wiki/D%C3%A9composition_LU">[wiki] Décomposition LU</a></li>
            </ul>
            
            <h2>TP4 : </h2>
            <p style="margin-top:-0.5em;color:silver;">la semaine de 03/04/2017</p>
            <ul style="list-style-type: square;">
                <li><a href="/assets/analysenum2017/TP4_sujet.pdf">sujet.pdf</a></li>
                <li><a href="/assets/analysenum2017/TP4_spline.sce">exo1: spline.sce</a></li>
                <li><a href="/assets/analysenum2017/TP4_heat.sce">exo2: heat.sce</a></li>
            </ul>
        </div>
    </div>
</article>

