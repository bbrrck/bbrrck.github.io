---
layout: teaching-geonum2017
title: "TP1 : Bézier curves, De Casteljau’s algorithm"
date:   2017-02-03
permalink: /teaching/geo-num-2017/tp1.html
---
[casteljau-gif]: https://upload.wikimedia.org/wikipedia/commons/0/0b/BezierCurve.gif

## Bézier curves
A degree $n$ [Bézier curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) takes the form

$$
\mathbf x(t) = \sum_{i=0}^{n} \mathbf b_i B_i^n(t) \qquad t \in [0,1]
$$

where

$$
B_{i}^{n}(t) = \begin{pmatrix}n \\ i\end{pmatrix} (1-t)^{n-i} t^i
$$

are the degree $n$ [Bernstein polynomials](https://en.wikipedia.org/wiki/Bernstein_polynomial), and the binomial coefficients are defined as

$$
\begin{pmatrix}n \\ i\end{pmatrix} = \frac{n!}{(n-i)! i!}.
$$

The Bézier points $\mathbf b_i \in \mathbb R^d$ form the *control polygon*.

## De Casteljau’s algorithm

{:.algorithm}
* <span class="algo-part">input</span> <span class="algo-content">Bézier points $\mathbf b_i$ for $i = 0, \dots, n$, and parameter $t \in [0,1]$.</span>
* <span class="algo-part">output</span> <span class="algo-content">The point $\mathbf b_0^n$ on the curve.</span>
* <span class="algo-part">compute</span> <span class="algo-content">Set $\mathbf b_i^0 = \mathbf b_i$ and compute the points</span>
   
   $$\mathbf b_i^k (t) = (1-t) \mathbf b_i^{k-1} + t \mathbf b_{i+1}^{k-1} \qquad \text{for} \qquad k=1,\dots,n, \quad i=0,\dots,n-k.$$

{:.img600}
![Visualisation of the steps of the De Casteljau's algorithm](/assets/geo-num-2016/casteljau-curve.png)

{:.imgCaption}
Visualisation of the steps of the De Casteljau's algorithm, $t=0.5$.

{:#decasteljau-schema}
The [De Casteljau’s algorithm](https://en.wikipedia.org/wiki/De_Casteljau%27s_algorithm)
provides an efficient means for evaluating a Bézier curve $\mathbf{x}(t)$.
It is useful to look at this algorithm in its schematic form. For a cubic curve ($n=3$):

$$
\begin{array}{ccccccc}
\mathbf b_0 = \mathbf b_0^0 &        &               &        &               &        &                \\
                            & \ddots &               &        &               &        &                \\
\mathbf b_1 = \mathbf b_1^0 & \dots  & \mathbf b_0^1 &        &               &        &                \\
                            & \ddots &               & \ddots &               &        &                \\
\mathbf b_2 = \mathbf b_2^0 & \dots  & \mathbf b_1^1 & \dots  & \mathbf b_0^2 &        &                \\
                            & \ddots &               & \ddots &               & \ddots &                \\
\mathbf b_3 = \mathbf b_3^0 & \dots  & \mathbf b_2^1 & \dots  & \mathbf b_1^2 & \dots  & \mathbf b_0^3 = \mathbf x(t) 
\end{array}
$$

{:.img600}
![Animation of the De Casteljau's algorithm for a quintic curve][casteljau-gif]

{:.imgCaption}
Animation of the De Casteljau's algorithm for a quintic curve ($n=5$).

## Code
* [general instructions](https://github.com/GeoNumTP/GeoNum2017#géométrie-numérique-spring-2017)  
* [TP1 instructions](https://github.com/GeoNumTP/GeoNum2017/tree/master/TP1#tp1--bézier-curves-de-casteljaus-algorithm)  

## ToDo

{:.assignements}
1. Implement the De Casteljau algorithm and use it to evaluate the Bézier curves in the
<code class="language-bash">data</code> folder. Visualise the curves together with their control polygons.
2. Try varying the sampling density. How many samples are needed to give the impression of a smooth curve?
3. Pick one dataset and visualise <em>all</em> intermediate polygons $\mathbf b_i^k$ from the De Casteljau algorithm for a fixed parameter, for instance $t=0.5$.  
<strong>Hint</strong>: each column in the above schema represents one such polygon.

## Resources

{:.resources}
* [Handbook of CAGD](http://www.sciencedirect.com/science/book/9780444511041), edited by Gerald Farin, Josef Hoschek, Myung-Soo Kim
* [A Primer on Bézier Curves](http://pomax.github.io/bezierinfo/) by Pomax
* [Bézier Curves and Picasso](http://jeremykun.com/2013/05/11/bezier-curves-and-picasso/) by Jeremy Kun
* [Bézier Curves and Type Design: A Tutorial](http://learn.scannerlicker.net/2014/04/16/bezier-curves-and-type-design-a-tutorial/) by Fábio Duarte Martins
* [The Bézier Game](http://bezier.method.ac/)
* [Bézier Curve Simulation](http://tholman.com/bezier-curve-simulation/)
