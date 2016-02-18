---
layout: page
title: "TP3 : B-splines, De Boor's algorith"m
date:   2016-02-19 00:00:00
permalink: /teaching/geo-num-2016/tp3.html
---

<section class="course-tp">
 
<div class="backlink">back to <a href="/teaching/geo-num-2016/">Géométrie numérique, 2016</a></div>
<h1>{{ page.title }}</h1>
<div class="meta">{{ page.date | date: "%B %-d, %Y"  }}</div>

{% include news-geo-num-2016.html %}



<h2 class="first">Code</h2> 

<p>
First, update your git repo
{% highlight bash %}
git pull
{% endhighlight %}
or clone everything if needed
{% highlight bash %}
git clone https://github.com/bbrrck/geo-num-2016.git
{% endhighlight %}
Then 
{% highlight bash %}
cd TP3/
mkdir build
cd build
cmake ..
make
./geonum_TP3 simple
{% endhighlight %}
We're still using <a href="http://eigen.tuxfamily.org/">Eigen</a>
so keep the <a href="http://eigen.tuxfamily.org/dox-devel/AsciiQuickReference.txt">quick reference</a> open and ready.
Python script for rendering is included in the <code>plots/</code> folder.
You can now pass the data name as an argument, e.g.
{% highlight bash %}
python ../plots/plot.py spiral
{% endhighlight %}
If you want to use gnuplot, you will need to modify the script from TP1 yourself.
</p>



<h2>B-splines</h2>



<h2>The De Boor algorithm</h2>



<h2>ToDo</h2>
<p></p>

<ol class="assignements">
<li>
</li>
</ol>

<figure>
    <img style="max-width:100%;width:100%;" src="/assets/geo-num-2016/simple_c1.png" alt="" />
</figure>



<h2>Bonus: NURBS</h2>
<p>Non-uniform rational B-splines (NURBS)</p>



<h2 class="resources">Resources</h2>
<ul class="resources">
<li></li>
</ul>

</section>
