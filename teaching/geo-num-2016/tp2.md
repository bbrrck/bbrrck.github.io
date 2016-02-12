---
layout: page
title: "TP2 : Bézier splines, $C^k$ smoothness"
date:   2016-02-12 00:00:00
permalink: /teaching/geo-num-2016/tp2.html
---

<section class="course-tp">
 
<div class="backlink">back to <a href="/teaching/geo-num-2016/">Géométrie numérique, 2016</a></div>
<h1>{{ page.title }}</h1>
<div class="meta">{{ page.date | date: "%B %-d, %Y"  }}</div>

{% include news-geo-num-2016.html %}
<h2 class="first">Code</h2> 
<p>
If you have the git repo from TP1, update it by executing
{% highlight bash %}
git pull
{% endhighlight %}
Otherwise, do the
{% highlight bash %}
git clone https://github.com/bbrrck/geo-num-2016.git
{% endhighlight %}
then <code>cd TP2</code>. We're still using <a href="http://eigen.tuxfamily.org/">Eigen</a>
so keep the <a href="http://eigen.tuxfamily.org/dox-devel/AsciiQuickReference.txt">quick reference</a> open and ready.

{% highlight c++ %}
// if A, B have the same number of cols,
// don't do this
A(i,0) = B(i,0);
A(i,1) = B(i,1);
// but rather this
A.row(i) = B.row(i);
// if they also have the same number of rows (i.e. they have the same dimensions)
// and you wanna copy the contents of one to another,
// don't run a for loop! just do
A = B;
{% endhighlight %}
</p>

<h2>Bézier splines</h2> 
<p>
Bézier curves become harder to work with as the number of control points gets bigger.
The main reason is their global nature – moving a single control point influences the whole curve.
Do you know why? (<em>Hint: take a look at the De Casteljau schema in the previous TP.</em>)
</p>

<p>
Also, more control points means higher-degree polynomial, which quickly becomes impractical.
Today, we'll be dealing with one possiblity on how to overcome this problem: the Bézier splines.
</p>

<p>
Informally, spline is a collection of curves connected with some degree of smoothness.
Of course, there is more than one way to define what does it mean for two curves to be smoothly connected.
</p>

<h2>$\mathcal C^k$ smoothness</h2>
<p>
The most commonly used is the $\mathcal C^k$ smoothness, illustrated in the following figure.
</p>

<figure>   
    <img style="max-width:30%;margin:1%;" src="/assets/geo-num-2016/infinity_c0.png" alt="C0 smoothness" />
    <img style="max-width:30%;margin:1%;" src="/assets/geo-num-2016/infinity_c1.png" alt="C1 smoothness" />
    <img style="max-width:30%;margin:1%;" src="/assets/geo-num-2016/infinity_c2.png" alt="C2 smoothness" />
    
    <img style="max-width:30%;margin:1%;" src="/assets/geo-num-2016/spiral_c0.png" alt="C0 smoothness" />
    <img style="max-width:30%;margin:1%;" src="/assets/geo-num-2016/spiral_c1.png" alt="C1 smoothness" />
    <img style="max-width:30%;margin:1%;" src="/assets/geo-num-2016/spiral_c2.png" alt="C2 smoothness" />
    
    <img style="max-width:30%;margin:1%;" src="/assets/geo-num-2016/semi_c0.png" alt="C0 smoothness" />
    <img style="max-width:30%;margin:1%;" src="/assets/geo-num-2016/semi_c1.png" alt="C1 smoothness" />
    <img style="max-width:30%;margin:1%;" src="/assets/geo-num-2016/semi_c2.png" alt="C2 smoothness" />
    <div class="title">A collection of &nbsp; $ \mathcal C^k$-smooth splines, row-wise interpolating the same data, left to right $k=0,1,2$.</div>
</figure>

<p>
Mathematically speaking, two parametric curves $\mathbf x_0(t), \mathbf x_1(t), t \in [0,1]$ are $\mathcal C^k$ smooth if they are also $\mathcal C^{k-1}$,
and the following condition holds:
$$
\frac{d^k}{dt^k} \mathbf x_0\left(1\right) = \frac{d^k}{dt^k} \mathbf x_1\left(0\right).
$$
This means the two curves agree up to their $k$-th derivatives.
</p>

<p>
Let's look at a particular case when $\mathbf x_0(t)$ and $\mathbf x_1$ are Bézier curves.
</p>



<h2>$\mathcal C^1$ quadratic spline</h2>
<p>
Recall that a quadratic Bézier curve has the form
$$ \mathbf x(t) = \sum_{i=0}^{2} \mathbf b_i B_i^2(t) \qquad t \in [0,1] $$
where $\mathbf b_i$ are the control points and $B_i^n(t)$ are the Bernstein polynomials.
Its first derivative can be nicely written as
$$
\dot{\mathbf x}(t) = n \sum_{i=0}^{1} (\mathbf b_{i+1} - \mathbf b_i) B_i^{1}(t) = (1-t)(\mathbf b_2 - \mathbf b_1) + t(\mathbf b_1 - \mathbf b_0).
$$
(In fact, this is <em>also</em> a Bézier curve, of degree $n-1$. Don't be scared by the dot on $\dot{\mathbf x}$; it just means first derivative.)
</p>
<p>
Now, imagine we have our two Bézier curves $\mathbf x_0, \mathbf x_1$ that we want to join $\mathcal C^1$-smoothly.
As $\mathcal C^1$ also includes $\mathcal C^0$, we have these two conditions:
\begin{align}
\mathbf x_0(1) &= \mathbf x_1(0), \\
\dot{\mathbf x}_0(1) &= \dot{\mathbf x}_1(0).
\end{align}
If $\mathbf b_i^0$ are the control points of $\mathbf x_0$,
and $\mathbf b_i^1$ are the control points of $\mathbf x_1$,
this comes down to
\begin{align}
\mathbf b_2^0 &= \mathbf b_0^1, \\
\mathbf b_2^0 - \mathbf b_1^0 &= \mathbf b_1^1 - \mathbf b_0^1.
\end{align}
</p>




<h2>ToDo$^1$</h2>
<p>
Your first task today will be to implement $\mathcal C^1$ quadratic Bézier spline,
interpolating a given sequence of points $\mathbf p_i, i=0,\dots,n$.
To construct the spline, you'll need $n$ quadratic Bézier curves $\mathbf c_i, i=1,\dots,n$, each with three control points:
$\mathbf p_{i-1} = \mathbf b_0^i, \mathbf b_1^i, \mathbf b_2^i = \mathbf p_i$.
(Don't get confused: here, the upper indices have nothing to do with de Casteljau!)
This means that for each curve, you only need to compute a single control point, $\mathbf b_1^i$.
Applying the formula from above, we get
$$
\mathbf b_1^i - \mathbf b_0^i = \mathbf b_2^{i-1} - \mathbf b_1^{i-1}
$$
and from there, directly 
\begin{align}
\mathbf b_1^i &= \mathbf b_2^{i-1} - \mathbf b_1^{i-1} + \mathbf b_0^i \\ 
              &= 2 \mathbf p_{i-1} - \mathbf b_1^{i-1} .
\end{align}
</p>

<figure>
    <img style="max-width:100%;width:100%;" src="/assets/geo-num-2016/simple_c1.png" alt="C1 smoothness simple" />
</figure>

<p>
This gives us a way to compute all $\mathbf b_1^i$ iteratively.
Of course, you need to fix $\mathbf b_1^0$;
try the midpoint $\mathbf b_1^0 = 0.5(\mathbf p_0 + \mathbf p_1)$.
Later, you can change its position to see how it affects the computed spline.
</p>

<ol class="assignements">
<li>Implement the computation of control points of a quadratic interpolating Bézier spline for a given sequence of points $\mathbf p_i$.</li>
<li>Evaluate and visualise the computed quadratic spline.</li>
</ol>






<h2>$\mathcal C^2$ cubic spline</h2>

<p>
Splines, especially the cubic splines, are very common in the world of digital geometry.
The algorithm you just implemented (hopefully) works well, but it has one major drawback:
it requires setting the first $\mathbf b_1^0$ by hand. That's no fun!
</p>

<p>
That is why, to compute an interpolating cubic spline in this part, we will adopt a slightly different approach
– we'll be solving a linear system. We'll do the math, crunch in the data, and let the solver do the work!
</p>

<p>
To do that, imagine a situation much like the one before: given a sequence of points $\mathbf p_i, i=0,\dots,n$,
find a $\mathcal C^2$ cubic spline which interpolates these datapoints.
This time, there will be two unknown interior control points (and not one as in the quadratic case.)
</p>

<p>
Again, let's take only two cubic curves to understand what's going on,
$\mathbf x_0$ with control points $\mathbf b_i^0$
and
$\mathbf x_1$ with control points $\mathbf b_i^1$.
$\mathcal C^2$ means also $\mathcal C^1$: but we already know how to write $\mathcal C^1$ in terms of control points!
Let's add the $\mathcal C^2$:
\begin{align}
\mathbf b_3^0 &= \mathbf b_0^1 \\
\mathbf b_3^0 - \mathbf b_2^0 &= \mathbf b_1^1 - \mathbf b_0^1 \\
\mathbf b_3^0 - 2\mathbf b_2^0 + \mathbf b_1^0 &= \mathbf b_2^1 - 2\mathbf b_1^1 + \mathbf b_0^1 \\
\end{align}
Well, it's starting to look like a system,
but all this indexing is confusing.
So let's take a step back.
</p>

<p>
Imagine we want to interpolate four points, i.e. we have three curves to compute.
That's 10 unique control points in total. We'll denote those as $A,B,C,D,E,F,G,H,I,J$. (Phew.)
The points to interpolate are $A,D,G,J$.
</p>

<figure>
    <img style="max-width:90%;width:100%;" src="/assets/geo-num-2016/simple_c2.png" alt="C1 smoothness simple" />
</figure>

Let's rewrite our conditions in terms of this notation.

$\mathcal C^0$:
\begin{align}
A = & A \\
D = & D \\
G = & G \\
J = & J
\end{align}
Seems pretty obvious, right? Now, we have two joints, that means two equations for $\mathcal C^1$:
\begin{align}
D - C =& E - D \\
G - F =& H - G
\end{align}
And two equations for $\mathcal C^2$:
\begin{align}
D - 2C + B =& F - 2E + D  \\
G - 2F + E =& I - 2H + G 
\end{align}
If you've counted well, this is 8 equations for 10 points; we need two more equations to be able to solve the system.
(In general, this is $(n+1)+(n-1)+(n-1)=3n-1$ equations for $3n+1$ points and we still need two more equations.)
One example is the so-called natural spline with vanishing second derivatives at the endpoints:
\begin{align}
A - 2B + C =& \mathbf 0 \\
H - 2I + J =& \mathbf 0
\end{align}
where $\mathbf 0 = (0,0)$ is the zero vector.
And that's it! It's all much clearer using the matrix notation:
\[
\left[
\begin{array}{rr|rr|rr|rr|rr}
 1 &   &   &   &   &   &   &   &   &   \\
   &   &   & 1 &   &   &   &   &   &   \\
   &   &   &   &   &   & 1 &   &   &   \\
   &   &   &   &   &   &   &   &   & 1 \\
   \hline
   &1  &-2 &  1&   &   &   &   &   &   \\
   &   &   &   &  1& -2& 1 &   &   &   \\
   \hline
   & 1 &-2 &   & 2 & -1&   &   &   &   \\
   &   &   &   &  1& -2&   & 2 &-1 &   \\
   \hline
 1 & -2& 1 &   &   &   &   &   &   &   \\
   &   &   &   &   &   &   &  1&-2 & 1 \\
\end{array}
\right]

\left[
\begin{array}{@{}cc@{}}
A \\
B \\
C \\
D \\
E \\
F \\
G \\
H \\
I \\
J
\end{array}
\right]

=

\left[
\begin{array}{@{}cc@{}}
A \\
B \\
C \\
D \\
   \hline
\mathbf 0 \\
\mathbf 0 \\
   \hline
\mathbf 0 \\
\mathbf 0 \\
   \hline
\mathbf 0 \\
\mathbf 0
\end{array}
\right]
\]

<h2>ToDo$^2$</h2>
The seconds part of today's TP is about implementing $\mathcal C^2$ cubic spline by solving the above system.
More info is in the code, don't hesitate to ask if things are not clear.

<ol start="3" class="assignements">
<li>Implement the computation of control points of a cubic interpolating Bézier spline for a given sequence of points $\mathbf p_i$.</li>
<li>Evaluate and visualise the computed cubic spline.</li>
</ol>

</section>
