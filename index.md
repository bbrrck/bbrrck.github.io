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
  I am currently a postdoc at <a href="https://team.inria.fr/graphdeco/">GraphDeco</a> (Inria Sophia Antipolis)
  working with <a href="http://www-sop.inria.fr/members/Adrien.Bousseau/">Adrien Bousseau</a> and <a href="http://www.cgg.unibe.ch/">David Bommes</a> (University of Bern).
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

<!--  REVIEWING -->
<section id="reviewing">
<div class="row">
  <div class="col-xs-12">
    <h2>Reviewing service</h2>
    <ul>
      <li>2020: <a href="https://www.journals.elsevier.com/computer-aided-design" title="CAD journal">Computer-Aided Design</a></li>
      <li>2019: <a href="https://www.journals.elsevier.com/computer-aided-geometric-design" title="CAGD journal">Computer-Aided Geometric Design</a></li>
      <li>2018: <a href="https://www.journals.elsevier.com/computers-and-graphics" title="C&amp;G journal">Computers &amp; Graphics</a>, <a href="https://dgci2019.sciencesconf.org/" title="DGCI 2019 conference">DGCI 2019</a></li>
    </ul>
  </div>
</div>
</section>

<!--  TA -->
<section id="teaching">
<div class="row">
  <div class="col-xs-12">
    <h2>Teaching (TA)</h2>
    <p style="color:#999; font-size:90%;">
    UCA: Université Côte d'Azur              <br />
    UGA: Université Grenoble Alpes           <br />
    INPG: Institut polytechnique de Grenoble       <br />
    </p>
    <ul>
      <li>2020, UCA : Mathematics for biologists (<a href="https://math.unice.fr/~hoering/l1sv-s2-20.html">contents</a>)</li>
      <li>2019, UCA : Foundations of mathematics 1 (contents:
        <a href="https://math.unice.fr/~emiliton/fondement1/fondement1.html">calculus</a>,
        <a href="https://math.unice.fr/~phm/enseignement.html#FMalgebre">linear algebra</a>)</li>
      <li>2017, INPG : <a href="/teaching/analyse-num-2017/">Numerical analysis</a></li>
      <li>2017, UGA : <a href="/teaching/geo-num-2017/">Numerical geometry</a></li>
      <li>2016, UGA : <a href="/teaching/geo-num-2016/">Numerical geometry</a></li>
    </ul>
  </div>
</div>
</section>

<!--  STUDENTS -->
<section id="students">
<div class="row">
  <div class="col-xs-12">
    <h2>Students co-supervised</h2>
    <ul>
      <li> Emilie Yu (M2 internship at Inria Sophia-Antipolis, 2020) </li>
      <li> Lucas Lesage (M1 internship at Inria Grenoble, summer 2017) </li>
    </ul>
  </div>
</div>
</section>

<!--  MISC -->
<section id="misc">
<div class="row">
  <div class="col-xs-12">
    <h2>Misc <a href="links.html">graphics &amp; geometry bookmarks</a></h2>

    <!-- <p>My PhD work was featured in CEA-Leti annual reports:
    <a href="http://www.cea.fr/cea-tech/leti/Documents/Rapport%20scientifique/Rapports%202016/RapportLETI-2017-num.pdf">2017</a> (p. 54)
    and
    <a href="http://www.cea.fr/cea-tech/leti/Documents/plaquettes/Rapports-Scientifique/Leti_Scientific_Repport_2018.pdf">2018</a> (p. 89)
    </p> -->

    <h2>Choir singing is fun!</h2>
    <p>
      I <s>am</s> was a member of the <a href="http://www.choeur-philharmonique-nice.fr/">Choeur Philharmonique de Nice</a>. Before, I was singing in <a href="http://www.zbortechnik.sk/english/">University Choir Technik STU</a> and <a href="https://www.facebook.com/canticanova.tt/">Cantica Nova</a>.
      Some of my favorite compositions include
      <a href="https://open.spotify.com/album/35J3H2XNpCmFqk2KxmvWzs?si=9I22pGCiQBya7CQ5XL5S7g">Fauré's '<em>Requiem</em></a>
      and
      <a href="https://open.spotify.com/album/6MY9yVtW2gkkE1og4av96t?si=bEVfabAoTtC3vzeXA-Jb6Q">Rutter's <em>Magnificat</em></a>.
    </p>
  </div>
</div>
</section>

<!--  STUFF -->
<section id="stuff">
<div class="row">
  <div class="col-xs-12">
    <h2>Random stuff</h2>
    <div class="row">
      <div class="col-md-4 col-sm-6 col-xs-12">
        <a title="conformal flattening of a whale curve" href="whale.html"><img src="/assets/stuff/whale.png" alt="whale" /></a>
      </div>
      <div class="col-md-4 col-sm-6 col-xs-12">
        <a title="confocal ellipses &amp; hyperbolas" href="confocal.html"><img src="/assets/stuff/confocal.png" alt="confocal" /></a>
      </div>
      <div class="col-md-4 col-sm-6 col-xs-12">
        <a title="Shape from Sensors - video summary of my PhD" href="https://www.youtube.com/watch?v=o03eTFT3-ms"><img src="/assets/stuff/smartphone.gif" alt="shape from sensors - smartphone" /></a>
      </div>
    </div>
  </div>
</div>
</section>
</div>
