---
layout: page
---
<div class="homepage">

<!-- CONTACT -->
<section id="contact">
<div class="row">
  <div class="col-sm-8 col-xs-12">
        Postdoctoral researcher
  <br /><a href="https://team.inria.fr/graphdeco/">GraphDeco</a>, <a href="https://www.inria.fr/en/centre/sophia">Inria Sophia-Antipolis</a>
  <br /><br />
  e-mail:&nbsp;&nbsp;{% include email.html %}
  <br />phone:&nbsp;&nbsp;<a href="tel:0033492387840">(+33) 4 92 38 78 40</a>
  <br /><span style="display:inline-block;">office:&nbsp;&nbsp;<br />&nbsp;<br />&nbsp;</span><span style="display:inline-block;">Inria Sophia-Antipolis<br />2004 Route des Lucioles, BP 93<br />06902 Sophia Antipolis, France</span>
  </div>
  <div class="col-sm-4 col-xs-12">
    <img class="avatar" src="https://68.media.tumblr.com/da1535f6b683262c546957245f5cd922/tumblr_ojzacmvGtV1u2r5sio1_1280.jpg" alt="labiaci" />
  </div>
</div>
</section>

<!-- NEWS -->
<section id="news">
{% assign allnews = site.data.news | sort: 'date' | reverse %}
<div class="row">
  <div class="col-sm-12">
    <h2>News <a href="./news.html">∀</a></h2>
  </div>
</div>
{% for news in allnews limit:3 %}
  <div class="row news">
    <div class="col-md-2 col-sm-3 news-date">
    {{ news.date | date: "%b %d, %Y " }}</div>
    <div class="col-md-10 col-sm-9 news-content">
    {{ news.text }}</div>
  </div>
{% endfor %}
</section>

<!-- PUBLICATIONS -->
<section id="publications">
<!-- {% assign papers = site.data.publications | where:"front",true | sort: 'date' %} -->
{% assign papers = site.data.publications %}
<div class="row">
  <div class="col-xs-12">
    <h2>Publications</h2>
  </div>
</div>
{% for pub in papers limit:999 %}
  {% include publication-overview.html %}
{% endfor %}
</section>

<!-- SHORT BIO -->
<section id="bio">
<div class="row">
<div class="col-xs-12">
  <h2>Short Bio <a href="/assets/cv.pdf">∮</a></h2>
<p>
  I’m currently a postdoc at <a href="https://team.inria.fr/graphdeco/">GraphDeco</a> (Inria Sophia Antipolis)
  working with <a href="http://www-sop.inria.fr/members/Adrien.Bousseau/">Adrien Bousseau</a> and <a href="https://www.aices.rwth-aachen.de/en/people/bommes">David Bommes</a>.
</p>
<p>
  I got my PhD from Université Grenoble Alpes, my advisors were
  <a title="personal page" href="https://team.inria.fr/imagine/stefanie-hahmann/">Stefanie Hahmann</a>,
  <a title="personal page" href="http://www-evasion.inrialpes.fr/~Georges-Pierre.Bonneau/">Georges-Pierre Bonneau</a>
  (Inria Grenoble) and Nathalie Saguin-Sprynski (CEA-Leti).
  My thesis was one of the three recognized with the <a href="https://prixigrv2018.sciencesconf.org/">Prix de thèse IG-RV 2018</a>.
  Before that, I got my BSc and MSc from Comenius University in Bratislava, my advisor was <a title="researchgate profile" href="https://www.researchgate.net/profile/Pavel_Chalmoviansky">Pavel Chalmovianský</a>.
</p>
</div>
</div>
</section>

<!--  STUDENTS -->
<section id="students">
<div class="row">
  <div class="col-xs-12">
    <h2>Students</h2>
    <ul>
      <li>Lucas Lesage (internship at Inria Grenoble, summer 2017)</li>
    </ul>
  </div>
</div>
</section>

<!--  TA -->
<section id="teaching">
<div class="row">
  <div class="col-xs-12">
    <h2>Teaching</h2>
    <ul>
      <li><a href="/teaching/analyse-num-2017/">Numerical analysis</a>, Grenoble INP, spring 2017</li>
      <li><a href="/teaching/geo-num-2017/">Numerical geometry</a>, UGA, spring 2017</li>
      <li><a href="/teaching/geo-num-2016/">Numerical geometry</a>, UGA, spring 2016</li>
    </ul>
  </div>
</div>
</section>

<!--  BOOKMARKS -->
<section id="bookmarks">
<div class="row">
  <div class="col-xs-12">
    <h2>Misc <a href="links.html">graphics &amp; geometry bookmarks</a> for work and fun</h2>
  </div>
</div>
</section>

<!--  STUFF -->
<section id="stuff">
<div class="row">
  <div class="col-xs-12">
    <h2></h2>
    <div class="row">
      <div class="col-md-4 col-sm-6 col-xs-12">
        <a href="whale.html"><img src="/assets/stuff/whale.png" alt="whale" /></a>
      </div>
      <div class="col-md-4 col-sm-6 col-xs-12">
        <a href="confocal.html"><img src="/assets/stuff/confocal.png" alt="confocal" /></a>
      </div>
    </div>
  </div>
</div>
</section>

</div>
