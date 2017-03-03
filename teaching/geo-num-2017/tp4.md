---
layout: teaching-geonum2017
title: "TP4 : Subdivision curves"
date:   2017-03-03
permalink: /teaching/geo-num-2017/tp4.html
---

## Code
* [TP4 on github](https://github.com/GeoNumTP/GeoNum2017/tree/master/TP4#tp4--subdivision-curves)  
* [general instructions](https://github.com/GeoNumTP/GeoNum2017#géométrie-numérique-spring-2017)  

## Subdivision Curves
A subdivision curve is defined as the limit of *recursive refinement* of the input polyline $\mathbf x_i = \mathbf x_i^0$.
Your today's task is to implement three curve subdivision schemes from the lecture.
For the sake of simplicity, we'll be working with closed curves only.

Generally, one iteration of curve subdivision has the following form:
1. **Topological step**: curve is upsampled by inserting a new vertex between each two adjacent vertices.
This doubles the number of vertices: if there were $n$ vertices, now there is $2n$ of them.
2. **Geometric step**: new positions are computed for all vertices.

<br />

{:.img500}
![subdivision-animation](/assets/geo-num-2016/chaikin-animation.gif)

There are two kinds of schemes: *approximating* schemes change the positions of old vertices,
while the *interpolating* schemes don't.

### Chaikin's scheme
Introduced in 1974 by George Chaikin, this algorithm revolutionized the world of numerical geometry.
Limit curve is a uniform quadratic B-spline.

$$
\left\lbrace
\begin{align}
    \mathbf x_{2i  }^{k+1} & = \tfrac34 \mathbf x_i^k + \tfrac14 \mathbf x_{i+1}^k \\
    \mathbf x_{2i+1}^{k+1} & = \tfrac14 \mathbf x_i^k + \tfrac34 \mathbf x_{i+1}^k
\end{align}
\right.
$$

{:.img500}
![chaikin-scheme](/assets/geo-num-2016/chaikin-scheme.gif)

### Corner-cutting
Generalization of Chaikin's algorithm with two parameters
$ 0 < a < b < 1 $.

$$
\left\lbrace
\begin{align}
    \mathbf x_{2i  }^{k+1} & = (1-a) \mathbf x_i^k + a \mathbf x_{i+1}^k \\
    \mathbf x_{2i+1}^{k+1} & = (1-b) \mathbf x_i^k + b \mathbf x_{i+1}^k
\end{align}
\right.
$$

Setting $a=0.25, b=0.75$ gives Chaikin.
The following example uses $a = 0.1, b = 0.6$:

{:.img500}
![4-point](/assets/geo-num-2016/corner-cutting.gif)

### Four-point
Unlike corner cutting, the four-point scheme is interpolatory.

$$
\left\lbrace
\begin{align}
    \mathbf x_{2i  }^{k+1} & = \mathbf x_i^k \\
    \mathbf x_{2i+1}^{k+1} & = \tfrac1{16} \left( - \mathbf x_{i-1}^k + 9 \mathbf x_{i}^k + 9 \mathbf x_{i+1}^k - \mathbf x_{i+2}^k \right)
\end{align}
\right.
$$

{:.img500}
![4-point](/assets/geo-num-2016/four-point.gif)


## ToDo
1. Implement the three subdivision schemes.
2. Experiment with different values of $a,b$ in corner cutting. Specifically, try using
     - $b=a+\frac12$
     - $b \neq a+\frac12$
   
   What do you observe?
3. *Generalized four-point* uses the mask
$[-\omega,\frac12+\omega,\frac12+\omega,-\omega].$  
($\omega=\frac1{16}$ in the original scheme.)
Modify your implementation of this algorithm to account for the tension parameter $\omega$
and try varying its value.
You should get $\mathcal C^1$ limit curves for $\omega \in \left[0,(\sqrt 5 - 1)/8 \approx 0.154 \right]$.


## Resources

{:.resources}
* [Subdivision curves](http://www.numerical-tours.com/matlab/meshwav_1_subdivision_curves/) on Numerical Tours by Gabriel Peyré
* [Lecture on subdivision curves](https://www.cs.utexas.edu/~fussell/courses/cs384g/lectures/lecture17-Subdivision_curves.pdf) by Don Fussell
