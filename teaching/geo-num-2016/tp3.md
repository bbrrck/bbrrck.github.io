---
layout: page
title: "TP3 : B-splines, de Boor's algorithm"
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
Given the degree $k$,
$n+1$ control points $\mathbf{d_{0}},\dots,\mathbf{d_{n}}$,
and the knot vector $t_{0} \leq t_{1} \leq \dots \leq t_{m}$
with $m = n+k+1$, the B-spline curve $S(t)$ is defined as
$$
S(t) = \sum_{i=0}^{n} \mathbf{d_{i}} N_{i}^{k}(t), \quad t\in[t_{k}, t_{n+1}).
$$
The $N_{i}^{k}(t)$ are the recursively-defined <em>basis</em> functions (hence the name B-spline)
$$
\begin{array}{l}
N_{i}^{0}(t) =
\begin{cases}
1 & \quad t\in[t_{i}, t_{i+1}) \\ \\
0 & \quad \text{ otherwise }
\end{cases}
\\ \\
N_{i}^{k}(t) = 
    \frac{t-t_i}{t_{i+k}-t_i} N_{i}^{k-1}(t) + 
    \frac{t_{i+k+1}-t}{t_{i+k+1}-t_{i+1}} N_{i+1}^{k-1}(t)
\end{array}
$$


<figure>
    <img style="max-width:15em;width:100%;margin:1em;" src="/assets/geo-num-2016/spiral_B.png" alt="" />
    <img style="max-width:15em;width:100%;margin:1em;" src="/assets/geo-num-2016/spiral_B_2.png" alt="" />
    <div class="title">A cubic B-spline with 16 segments and endpoint interpolation.</div>
</figure>

<h2>De Boor's algorithm</h2>
&hellip; also called the DeBoor-Cox algorithm. It can be seen as the generalization of the de Casteljau.
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
        \begin{array}{cccccc}
            \mathbf d_{j}^{r+1} = &
            \underbrace{ \left( \frac{t-t_{j}}{t_{j+k-r+1}-t_{j}} \right) } & \mathbf d_{j}^{r} & + & 
            \underbrace{ \left( \frac{t_{j+k-r+1}-t}{t_{j+k-r+1}-t_{j}} \right) } & \mathbf d_{j-1}^{r} \\
            & w_{j,k-r}(t) & & & 1-w_{j,k-r}(t) &
        \end{array}
        $$
       </span>
    </li>
</ul>


<h2>ToDo</h2>

<ol class="assignements">
<li>Implement the de Boor's algorithm. (<code>Vec2 DeBoor</code>)</li>
<li>Implement the evaluation of a B-spline curve. (<code>evaluateBSpline</code>)</li>
<li>Compute the B-spline curve for the <code>simple</code> dataset. Then, modify the knot vector (add / remove / change knots) and recompute. What happened?</li>
<li>Compute the B-spline curve for the <code>spiral</code> dataset. Try using the knot vector <code style="display:inline-block;">0 0 0 0 1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 5</code>. What changed?
</li>
<li>Compute the B-spline curve for the <code>camel</code> dataset. Move the front leg by changing the x-coordinate of the very last control point to <code>-1.5</code>. Which segments of the curve have changed? Why?</li>
</ol>



<h2>Bonus: NURBS</h2>
<p>
If you've done the tests with the <code>circle.bspline</code> dataset, you might have been disappointed,
as resulting curve is far from being a nice circle.
The truth is, it's mathematically impossible to represent the unit circle as a B-spline.
However, it <em>is</em> possible (and not so hard) using a further generalization of the B-spline curves:
the non-uniform rational B-splines or <strong>NURBS</strong>.
</p>

<p>
If you examine the <code>circle.nurbs</code> file, you'll find it's not so different from the <code>circle.bspline</code>.
The only thing that's changed is the additional number after each control point.
It almost looks like the control points don't live in 2D, but in 3D.
If that thought occured to you, you're not far from the truth:
together, those three numbers define the homogeneous (also projective) coordinates of a control point.
The third number is often called a weight of the control point.
</p>

<p>
Here's the good news: even using the homogeneous coordinates, we can apply exactly the same de Boor's algorithm
without any modifications. So, if you're up for it, here's a secret recipe for making your B-spline implementation work with weights:
<ul>
<li>Use a matrix of type <code>MatX3</code> to store the control points (first two columns are x and y coordinates, third column are weights). For reading the <code>circle.nurbs</code> file,
you can still use the method <code>readBSpline</code>, no change here; just make sure the second argument is a three-column matrix <code>ControlPoints3</code>.</li>
<li><code>DeBoor3:</code> you can copy-paste everything from the 2D version, just be sure to change the types to <code>Vec3</code> and <code>MatX3</code>.</li>
<li>Before you begin the evaluation, you need to multiply the x and y coordinates (first two columns of the <code>ControlPoints3</code> matrix)
by the weights (third column, same matrix). You can do this as follows:
<code style="display:inline-block;">ControlPoints3.col(i) = ControlPoints3.col(i).array() * ControlPoints3.col(2).array();</code>
<br />for <code>i=0,1.</code> The <code>.array()</code> here tells the Eigen to perform the operation element-wise.</li>
<li>Proceed by evaluating the <code>SplinePoints3</code> with three coordinates.</li>
<li>The last step is to return to the plane coordinates. To do that, you need to divide by the weights. Much like before, this will be
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
<li><a href="https://en.wikipedia.org/wiki/B-spline">B-spline</a> and <a href="https://en.wikipedia.org/wiki/De_Boor%27s_algorithm">de Boor's algorithm</a> on wikipedia</li>
<li><a href="http://www.cs.mtu.edu/~shene/COURSES/cs3621/NOTES/spline/de-Boor.html">De Boor's Algorithm</a> notes by C.-K. Shene</li>
<li><a href="https://en.wikipedia.org/wiki/Non-uniform_rational_B-spline">NURBS</a> on wikipedia (includes the circle example)</li>
</ul>

</section>
