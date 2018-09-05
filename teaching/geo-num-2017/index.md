---
layout: default
title: Géométrie numérique 2017
---
{% assign course = site.data.teaching.geo-num-2017 %}

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

        <div class="col-xs-12">
          {% assign allnews = (course.news  | sort: 'date' | reverse) %}
          {% for news in allnews limit:1 %}
          <div class="teaching-{{ news.type }}">
              <!--span class="date">{{ news.date | date: "(%d/%m)" }}</span-->
              {{ news.text }}
          </div>
          {% endfor %}
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <h2>Description</h2>
            <p>
            This page is dedicated to the practical part of the course <em>Géométrie Numérique</em>.
            </p>

            <p>Lectures are given by <a href="http://www-evasion.imag.fr/Membres/Georges-Pierre.Bonneau/">Georges-Pierre Bonneau</a>.
            </p>

            <h2>Codebase</h2>
            <p>A <a href="https://github.com/GeoNumTP/GeoNum2017">python codebase</a> is available on github.</p>

            <p>(You are not obliged to use the codebase. If you're not a fan of python, feel free to use your favorite language.)</p>
        </div>

        <div class="col-md-6">
            {% capture nowunix %}{{'now' | date: '%s' | plus : 172800 }}{% endcapture %}

            <h2>Syllabus</h2>
            <ul class="syllabus">            
            {% for class in course.syllabus %}
            <li{% if class.break %} class="break"{% endif %}>
            <span class="date">{{ class.date | date: "%b %d" }}</span>
            <span class="title">
            {% if class.break or class.nolink  %}
                {{ class.title }}
            {% else %}
                {% capture classtime %}{{class.date | date: '%s'}}{% endcapture %}
                {{ type }}{{ class.number }} :
                {% if classtime < nowunix %}<a href="/teaching/{{ course.slug }}/{{ type | downcase }}{{ class.number }}.html">{% endif %}{{ class.title }}{% if classtime < nowunix %}</a>{% endif %}

            {% endif %}
            </span>
            </li>
            {% endfor %}
            </ul>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <h2 id="submissions">Submissions</h2>
            <p>
            You can either work alone or in a pair.
            After each TP, you are required to submit your
            <strong style="color:#c00;">code</strong>
            and a
            <strong style="color:#c00;">pdf report</strong>
            with comments and images. The more images the better! </p>

            <p>
            Deadline for each submission will be announced here &mdash; it's usually the following TP.
            Please note that <strong style="color:#c00;">late submissions will be penalized</strong> by scoring less points.
            </p>

            <p>Every once in a while, there will be a bonus assignement which can get you some <strong>extra points.</strong></p>
        </div>

        <div class="col-md-6">
            <h2>Evaluation criteria</h2>
            Your work will score more points if you
            <ul class="criteria">
                <li>have a <strong style="color:#082">working code</strong>;</li>
                <li>experiment with <strong style="color:#082">all datasets</strong>;</li>
                <li>experiment with <strong style="color:#082">different parameters</strong>;</li>
                <li>make lots of <strong style="color:#082">images</strong>;</li>
                <li>document everything in your report;</li>
                <li>submit before the deadline.</li>
            </ul>

        </div>
    </div>

    <div class="row">

        <div class="col-md-6">
            <h2>General rules for submissions</h2>
            <ul class="submissions">
                <li>send <strong>only one mail</strong> per TP</li>
                <li>put code+report to <code class="language-bash">TPxx_LastName1_LastName2.zip</code></li>
                <li>use <code class="language-bash">[GeoNum2017] TPxx</code> as the subject</li>
                <li>send it to {% include email.html %}</li>
            </ul>
        </div>

        <div class="col-md-6">
            <h2>Past years</h2>
            <ul class="past">
            {% for past in course.past %}
            <li>
            <span class="date">{{ past.year }}</span>
            <span class="title"><a href="{{ past.url }}">{{ past.who }}</a></span>
            </li>
            {% endfor %}
            </ul>
        </div>
    </div>

</article>
