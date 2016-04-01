---
layout: teaching-geonum2016
title: "TP8 : Uniform B-splines as Subdivision Surfaces"
date:   2016-04-01
permalink: /teaching/geo-num-2016/tp8.html
---

## Code
Do
{% highlight bash %}
git pull
{% endhighlight %}
or, if you don't have the local repo,
{% highlight bash %}
git clone https://github.com/bbrrck/geo-num-2016.git
{% endhighlight %}
As usual, test by
{% highlight bash %}
cd TP8/
mkdir build
cd build
cmake ..
make
./geonum_TP8 torus
{% endhighlight %}

If everything goes well, you should see a cube. The viewer can be controlled with the mouse: click and drag to rotate, scroll to zoom (also works with pageup/pagedown keys), press W to toggle the wireframe mode (or Z on AZERTY keyboard).

In case the SimpleViewer does not work, you can still export and visualise the surfaces via the python script, included in <code>plots/<code>.

## Algorithm
Much like in the curve case (recall [Chaikin in TP4](tp4.html) or [Lane-Riesenfeld in TP5](tp5.html)),
a uniform bi-quadratic B-spline surface ($k=2,l=2$) can be evaluated by iterative subdivision
of the initial control net $V^0_{i,\;j}$. Here's the algorithm to perform one step of the subdivision.

At the $k$-th iteration, for each cell of the grid composed of the vertices
$V^k_{i,\;j}$
$V^k_{i+1,\;j}$
$V^k_{i,\;j+1}$
$V^k_{i+1,\;j+1}$
we define a new grid as follows

$$
\begin{array}{ll}
 V^{k+1}_{2i,\;2j}     &= \frac1{16} \left( 9V^k_{i,\;j} + 3V^k_{i+1,\;j} + 3V^k_{i,\;j+1} + 1V^k_{i+1,\;j+1} \right), \\
 V^{k+1}_{2i+1,\;2j}   &= \frac1{16} \left( 3V^k_{i,\;j} + 9V^k_{i+1,\;j} + 1V^k_{i,\;j+1} + 3V^k_{i+1,\;j+1} \right), \\ 
 V^{k+1}_{2i,\;2j+1}   &= \frac1{16} \left( 3V^k_{i,\;j} + 1V^k_{i+1,\;j} + 9V^k_{i,\;j+1} + 3V^k_{i+1,\;j+1} \right), \\ 
 V^{k+1}_{2i+1,\;2j+1} &= \frac1{16} \left( 1V^k_{i,\;j} + 3V^k_{i+1,\;j} + 3V^k_{i,\;j+1} + 9V^k_{i+1,\;j+1} \right). 
\end{array}
$$

**Important**: If the surface is closed (cyclic) in the direction $u$, the subscripts $\scriptstyle i+1$ of $V^k$ are taken modulo the number of vertices in the direction $u$. The same applies for the direction $v$ and the subscripts $\scriptstyle j+1$.


{:.img700}
![subdivision](/assets/geo-num-2016/tp8/closed.gif)

{:.imgCaption}
A subdivision step, surface closed in one direction.


## Implementation
As before, the surfaces are represented via three coordinate matrices <code>X, Y, Z</code>. Apply the algorithm to each matrix individually. 
The openness/closedness of a surface in a particular direction is controled via the parameters <code>u_closed, v_closed</code> (these are read from the input file).

Start by implementing the algorithm for a surface closed in both directions as this is easier to do; test on <code>[torus]</code>. Don't forget to use the modulo arithmetic where needed. Then, think about what needs to be changed if the surface is open in one or both directions.


## ToDo

{:.assignements}
1. Implement one step of the above subdivision algorithm for **closed** uniform B-spline surfaces. <code>[torus]</code>
2. Modify you implementation for surfaces which are **open**: either in one direction only <code>[cylinder]</code>
or in both directions <code>[grid]</code>.

<br />

{:.img500}
![subdivision](/assets/geo-num-2016/tp8/open.gif)

{:.imgCaption}
A subdivision step, open surface.
