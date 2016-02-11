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

<h2 class="first">Bézier splines</h2> 
<p>
Bézier curves become harder to work with as the number of control points gets bigger.
The main reason is their global nature – moving a single control point influences the whole curve.
Do you know why? (<em>Hint: take a look at the De Casteljau schema in the previous TP.</em>)
</p>

<img style="float: right;max-width:33%;" src="/assets/geo-num-2016/infinity_all.png" alt="Ck smoothness" />
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
    <div class="title">A collection of &nbsp; $ \mathcal C^k$-smooth splines interpolating the same data, left to right $k=0,1,2$.</div>
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

<h2>$\mathcal C^1$ quadratic Bézier spline</h2>
<p>
Recall that a Bézier curve of degree $2$ has the form
$$ \mathbf x(t) = \sum_{i=0}^{2} \mathbf b_i B_i^2(t) \qquad t \in [0,1] $$
where $\mathbf b_i$ are the control points and $B_i^n(t)$ are the Bernstein polynomials.
Its first derivative can be nicely written as
$$
\dot{\mathbf x}(t) = n \sum_{i=0}^{1} (\mathbf b_{i+1} - \mathbf b_i) B_i^{1}(t) = (1-t)(\mathbf b_2 - \mathbf b_1) + t(\mathbf b_1 - \mathbf b_0).
$$
(In fact, this is <em>also</em> a Bézier curve, of degree $n-1$. Don't be scared by the dot on $\dot{\mathbf x}$; it just means first derivative.)
</p>
<p>
Now, imagine we have our two Bézier curves $\mathbf x_0, \mathbf x_1$ that we want to join.
And not only that, we also want them to be joined $\mathcal  C^1$-smoothly!
As $\mathcal C^1$ also includes $\mathcal C^0$, we have these two conditions:
\begin{align}
\mathbf x_0(1) &= \mathbf x_1(0), \\
\dot{\mathbf x}_0(1) &= \dot{\mathbf x}_1(0).
\end{align}
If $\mathbf b_i$ are the control points of $\mathbf x_0$,
and $\mathbf c_i$ are the control points of $\mathbf x_1$,
this is just
\begin{align}
\mathbf b_2 &= \mathbf c_0, \\
\mathbf b_2 - \mathbf b_1 &= \mathbf c_1 - \mathbf c_0.
\end{align}
Easy, right?
</p>

<h2>$\mathcal C^2$ Bézier spline</h2>

<h2>Code</h2>

<h2>ToDo</h2>


</section>
