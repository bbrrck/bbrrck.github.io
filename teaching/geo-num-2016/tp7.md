---
layout: teaching-geonum2016
title: "TP7 : B-spline Surfaces"
date:   2016-03-25
permalink: /teaching/geo-num-2016/tp7.html
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
cd TP7/
mkdir build
cd build
cmake ..
make
{% endhighlight %}

To test the viewer, try running
{% highlight bash %}
./geonum_TP7 simple
{% endhighlight %}
If everything goes well, you should see a cube.

The viewer can be controlled with the mouse: click and drag to rotate, scroll to zoom (also works with pageup/pagedown keys).

In case the SimpleViewer does not work


## B-spline curves revisited
Back in [TP3](tp3.html), we were working with B-spline curves.
A B-spline curved is defined by the following:

$$
k : \text{ degree } \\
\mathbf d_{0},\dots, \mathbf d_{n}  : \text{ control polygon } \\
t_{0},\dots,t_{m+k+1} : \text{ knot vector } 
$$

## Tensor product B-spline surfaces
A B-spline surface is defined via

$$
k, l : \text{ degrees in } u, v
\\
\text{ }
\\
\left(
\begin{array}{ccc}
 \mathbf d_0^0 & \dots & \mathbf d_m^0 \\
 \vdots & \ddots & \vdots \\
 \mathbf d_0^n & \dots & \mathbf d_m^n
\end{array}
\right) : \text{ control net }
\\
\text{ }
\\
u_0,\dots,u_{m+k+1} : \text{ knot vector in } u
\\
v_0,\dots,v_{n+l+1} : \text{ knot vector in } v
$$

The B-spline surface is defined for $(u,v) \in [u_k,u_{m+1}] \times [v_l,v_{n+1}]$ as 

$$
S(u,v) = \sum_{i=0}^m \sum_{j=0}^n \mathbf d_{ij} N_{i}^{k}(u) N_{j}^{l}(v).
$$


## Surface Patches
Recall that a B-spline curve is made from many smaller pieces, defined over parameter intervals $[t_j,t_{j+1}]$.
Analogically, a B-spline surface consists of $(m-k+1) \times (n-l+1)$ patches, each defined over a parameter rectangles

$$
\begin{array}{llll}
 [u_{k},u_{k+1}] \times [v_{l  },v_{l+1}]  &  [u_{k+1},u_{k+1}] \times [v_{l  },v_{l+1}]  &   \dots  & [u_{m},u_{m+1}] \times [v_{l  },v_{l+1}] \\
 [u_{k},u_{k+1}] \times [v_{l+1},v_{l+2}]  &  [u_{k+1},u_{k+1}] \times [v_{l+1},v_{l+2}]  &   \dots  & [u_{m},u_{m+1}] \times [v_{l+1},v_{l+2}] \\
 \vdots & \vdots & \ddots & \vdots \\
 [u_{k},u_{k+1}] \times [v_{n-1},v_{n  }]  &  [u_{k+1},u_{k+1}] \times [v_{n-1},v_{n  }]  &   \dots  & [u_{m},u_{m+1}] \times [v_{n-1},v_{n  }] \\
 [u_{k},u_{k+1}] \times [v_{n  },v_{n+1}]  &  [u_{k+1},u_{k+1}] \times [v_{n  },v_{n+1}]  &   \dots  & [u_{m},u_{m+1}] \times [v_{n  },v_{n+1}] \\
\end{array}
$$

Each patch needs to be evaluated individually, then stored in one big matrix (per coordinate).

## Evaluation
We'll use the same paradigm as in the previous TP, i.e. coordinates are stored in matrices X, Y, Z.

Try to reuse your implementation for B-spline curves.
A recursive implementation of the DeBoor's algorithm is included in <code>TP7.h</code>.

## ToDo
1. Implement the evaluation of B-spline surfaces.

<br />

{:.img2grid}
![simple full](/assets/geo-num-2016/tp7/simple-full.png)
![simple wire](/assets/geo-num-2016/tp7/simple-wire.png)

{:.img2grid}
![torus full](/assets/geo-num-2016/tp7/torus-full.png)
![torus wire](/assets/geo-num-2016/tp7/torus-wire.png)
