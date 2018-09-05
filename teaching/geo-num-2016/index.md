---
layout: default
title: Géométrie numérique
---
{% assign course = site.data.teaching.geo-num-2016 %}

<article class="single course page">

    <div class="row">
        <div class="col-xs-12">
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
            This page is dedicated to the practical part of the <em>Géométrie Numérique</em> course, with lectures given by <a href="http://www-evasion.imag.fr/Membres/Georges-Pierre.Bonneau/">Georges-Pierre Bonneau</a>. Assignements (and some theory) will be published here.
            </p>

            <h2>Assignements</h2>
            <p>
            You can either work alone or in pairs.
            A <a href="https://github.com/bbrrck/geo-num-2016">c++ codebase</a> is provided, but not obligatory – use your favourite language in case you're not a fan of c++ .
            For linear algebra (vectors, matrices), we'll be using the Eigen library; take a look at its
            <a href="http://eigen.tuxfamily.org/index.php?title=Main_Page">docs</a>. Here's also a very useful
            <a href="http://eigen.tuxfamily.org/dox-devel/AsciiQuickReference.txt">quick reference for Eigen</a>.
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
            <h2 id="submissions">Submissions</h2>
            After each TP, you are required to submit your work, namely:
            <ol>
                <li>your <strong>code</strong>, just the files you've modified, no need to include everything ;</li>
                <li>a <strong>pdf report with pictures</strong> and additional comments if needed (in English or French).</li>
            </ol>
            These are the general rules for submission :
            <ul class="submissions">
                <li>Don't submit partial work; send <strong>only one mail</strong> (when you're sure you won't be adding anything else).</li>
                <li>Zip everything as <code class="language-bash">LastName.zip</code> or <code class="language-bash">LastName1_LastName2.zip</code>.</li>
                <li>Use <code class="language-bash">[GeoNum2016] TPxx</code> as the subject.</li>
                <li>Send your mail to {% include email.html %}.</li>
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
