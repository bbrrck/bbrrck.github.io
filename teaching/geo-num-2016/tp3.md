---
layout: page
title: "TP3 : B-splines, De Boor's algorithm"
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
Update your local repo
{% highlight bash %}
git pull
{% endhighlight %}
or clone everything if needed
{% highlight bash %}
git clone https://github.com/bbrrck/geo-num-2016.git
{% endhighlight %}
As usual,
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
You can now pass the data name as an argument
{% highlight bash %}
python ../plots/plot.py spiral
{% endhighlight %}
If you want to use gnuplot, you will need to modify the script from TP1 yourself.
</p>



<h2>B-splines</h2>
<p>
Given the degree $k$,
$n+1$ control points $\mathbf d_0,\dots,\mathbf d_n$,
and the knot vector $t_0 \leq t_1 \leq \dots \leq t_m$
with $m = n+k+1$, the B-spline curve $S(t)$ is defined as
$$
S(t) = \sum_{j=0}^n \mathbf d_j N_j^k(t), \quad t\in[t_k, t_n+1).
$$
The $N_j^k$ are the recursively-defined <em>basis</em> functions (hence the name B-spline)
$$
\begin{array}{ll}
N_j^{0}(t) =&
    \begin{cases}
    1 \quad t\in[t_j, t_j+1) \\ \\
    0 \quad \text{ otherwise }
    \end{cases}
\\
\\
N_j^k(t) =&
    \underbrace{ \frac{ t - t_j }{ t_{j+k} - t_j } }_{ w_{j,k}(t)} N_j^{k-1}(t) +
    \underbrace{ \frac{ t_{j+k+1} - t}{ t_{j+k+1} - t_{j+1} } }_{1 - w_{j+1,k}(t)} N_{j+1}^{k-1}(t)
\end{array}
$$
</p>
<p>
Looks complicated? Don't worry if you cannot get your head around all the indices and whatnot;
De Boor is here to help you!
<p>

<figure>
    <img style="max-width:15em;width:100%;margin:1em;" src="/assets/geo-num-2016/spiral_B.png" alt="" />
    <img style="max-width:15em;width:100%;margin:1em;" src="/assets/geo-num-2016/spiral_B_2.png" alt="" />
    <div class="title">A cubic B-spline with 16 segments and endpoint interpolation.</div>
</figure>

<h2>De Boor's algorithm</h2>
&hellip; also called the De Boor-Cox algorithm. It can be seen as the generalization of the de Casteljau.
(A Bézier curve is in fact a special case of B-spline.)

<ul class="algorithm">
    <li>
        <span class="algo-part">input :</span>
        <span class="algo-content">
            degree $k$
            <br />
            $n+1$ control points $\mathbf{d_{0}},\dots,\mathbf{d_{n}}$
            <br />
            knot vector $t_0 \leq t_1 \leq \dots \leq t_m$ with $m = n+k+1$
            <br />
            parameter $t \in [t_j, t_{j+1}) \quad k \leq j \leq n$
        </span>
    </li>
    <li>
        <span class="algo-part">output :</span>
        <span class="algo-content">
            The point $\mathbf S(t) = \mathbf d_j^k$ on the curve.
        </span>
    </li>
    <li>
        <span class="algo-part">compute :</span> 
        <span class="algo-content">
        Set $\mathbf d_j^0 = \mathbf d_j$ and compute the points
        $$
        \mathbf d_{j}^{r} =
        (1-w_{j,k-(r-1)}) \mathbf d_{j-1}^{r-1}
        +
           w_{j,k-(r-1)}  \mathbf d_{j  }^{r-1}
        $$
        with
        $$
        w_{j,k-(r-1)} = \frac{ t - t_j }{ t_{j+k-(r-1)} - t_j }.
        $$
       </span>
    </li>
</ul>
Be careful about the indices! Here I've expressed the point at depth $r$
in terms of the points at depth $r-1$;
that is why there is the $r-1$ everywhere in the formula.
(It becomes much more elegant if we express $r+1$ in terms of $r$.)
This might be a bit annoying, but I think it's also more practical for the implementation.

<h2>ToDo</h2>

<ol class="assignements">
<li>Implement the De Boor's algorithm. (<code>Vec2 DeBoor</code>)</li>
<li>Implement the evaluation of a B-spline curve. (<code>evaluateBSpline</code>)</li>
<li>Compute the B-spline curve for the <code>simple</code> dataset. Then, modify the knot vector and recompute. What happened?</li>
<li>Compute the B-spline curve for the <code>spiral</code> dataset. Try using the knot vector <code style="display:inline-block;">0 0 0 0 1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 5</code>. What changed?
</li>
<li>Compute the B-spline curve for the <code>camel</code> dataset. Move the front leg by changing the x-coordinate of the very last control point to <code>-1.5</code>. Which segments of the curve have changed? Why?</li>
</ol>



<h2>NURBS</h2>
<p>
If you've done the tests with the <code>circle.bspline</code> dataset, you might have been disappointed,
as the resulting curve is far from being a nice circle.
The truth is, it's mathematically impossible to represent the unit circle as a B-spline.
However, it <em>is</em> possible (and not so hard) using a further generalization of the B-spline curves: the non-uniform rational B-splines or <strong>NURBS</strong>.
</p>

<p>
If you examine the <code>circle.nurbs</code> file, you'll find it's not so different from the <code>circle.bspline</code>.
The only thing that's changed is the additional number after each control point.
It almost looks like the control points don't live in 2D, but in 3D.
If that thought occured to you, you're not far from the truth:
together, those three numbers define the homogeneous (or projective) coordinates of a control point.
The third number is often called a weight of the control point.
</p>

<p>
Here's the good news: even with the homogeneous coordinates, we can apply exactly the same De Boor's algorithm without any modifications. So, if you're up for it, here's a secret recipe for transforming your 2D B-splines into 2D NURBS:
<ul>
<li>
Use a matrix of type <code>MatX3</code> to store the control points (the first and second column are the x and y coordinates, respectively; the third column hold the weights).
For reading the <code>circle.nurbs</code> file,
you can still use the method <code>readBSpline</code>, no change here;
just make sure the second argument you pass is a three-column matrix.
Let's call this matrix <code>ControlPoints3</code>.
</li>
<li>
<code>DeBoor3:</code> you can copy-paste everything from the 2D version, just be sure to change the types to <code>Vec3</code> and <code>MatX3</code>.</li>
<li>
Before you begin the evaluation, you need to multiply the x and y coordinates
(first two columns of the <code>ControlPoints3</code> matrix)
by the weights (third column). You can do this with
<code style="display:inline-block;">ControlPoints3.col(i) = ControlPoints3.col(i).array() * ControlPoints3.col(2).array();</code>
<br />for <code>i=0,1.</code>
The <code>.array()</code> tells the Eigen to perform the operation element-wise.
</li>
<li>
Proceed by evaluating the <code>SplinePoints3</code> with three coordinates.
</li>
<li>
The last step is to return to the plane coordinates.
To do that, you need to divide by the weights.
Much like before, this is done with
<code style="display:inline-block;">SplinePoints2.col(i) = SplinePoints3.col(i).array() / SplinePoints3.col(2).array();</code></li>
</ul>
</p>

<h2>Bonus ToDo</h2>
<ol class="assignements">
<li>Implement the NURBS curve by extending your B-spline methods.</li>
<li>Compute and visualise the circle as a NURBS curve.</li>
</ol>

<h2 class="resources">Resources</h2>
<ul class="resources">
<li>
<a href="https://en.wikipedia.org/wiki/B-spline">B-spline</a> and <a href="https://en.wikipedia.org/wiki/De_Boor's_algorithm">De Boor's algorithm</a> on wikipedia
</li>
<li>
<a href="http://web.mit.edu/hyperbook/Patrikalakis-Maekawa-Cho/node17.html">1.4.2 B-spline curve</a> and <a href="http://web.mit.edu/hyperbook/Patrikalakis-Maekawa-Cho/node18.html">1.4.3 Algorithms for B-spline curves</a>,
online chapters from the book <em>Shape Interrogation for Computer Aided Design and Manufacturing</em>
by N. Patrikalakis, T. Maekawa &amp; W. Cho
</li>
<li>
<a href="https://en.wikipedia.org/wiki/Non-uniform_rational_B-spline">NURBS</a> on wikipedia (includes the circle example)
</li>
<li>
<a href="http://pages.cs.wisc.edu/~deboor/">homepage of Prof. de Boor</a>
</li>
</ul>

</section>
