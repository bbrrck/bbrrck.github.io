---
layout: tp-geo-num-2016
title: "TP3 : B-splines, De Boor's algorithm"
date:   2016-02-19
permalink: /teaching/geo-num-2016/tp3.html
---
[eigen]: http://eigen.tuxfamily.org/
[eigen-quick]: http://eigen.tuxfamily.org/dox-devel/AsciiQuickReference.txt


## Code 
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
We're still using [Eigen][eigen] so keep the [quick reference][eigen-quick] open and ready.
Python script for rendering is included in the `plots/` folder.
You can now pass the data name as an argument
{% highlight bash %}
python ../plots/plot.py spiral
{% endhighlight %}
If you want to use gnuplot, you will need to modify the script from TP1 yourself.

## B-splines
Given the degree $k$, $n+1$ control points $\mathbf d_0,\dots,\mathbf d_n$,
and the knot vector $t_0 \leq t_1 \leq \dots \leq t_m$
with $m = n+k+1$, the B-spline curve $S(t)$ is defined as

$$
S(t) = \sum_{j=0}^n \mathbf d_j N_j^k(t), \quad t\in[t_k, t_n+1).
$$

The $N_j^k$ are the recursively-defined *basis* functions (hence the name B-spline)

$$
\begin{array}{ll}
N_j^{0}(t) =&
    \begin{cases}
    1 \quad t\in[t_j, t_{j+1}) \\ \\
    0 \quad \text{ otherwise }
    \end{cases}
\\
\\
N_j^k(t) =&
    \underbrace{ \frac{ t - t_j }{ t_{j+k} - t_j } }_{ w_{j,k}(t)} N_j^{k-1}(t) +
    \underbrace{ \frac{ t_{j+k+1} - t}{ t_{j+k+1} - t_{j+1} } }_{1 - w_{j+1,k}(t)} N_{j+1}^{k-1}(t)
\end{array}
$$


Looks complicated? Don't worry if you cannot get your head around all the indices and whatnot;
De Boor is here to help you!


<figure>
    <img style="width:100%;" src="/assets/geo-num-2016/bbasis.gif" alt="" />
    <div class="title">
    B-spline basis functions $N^k_j$ up to degree 5 for the knot sequence $(0,1,2,3,4,5,6,7)$.
    </div>
</figure>

## De Boor's algorithm
&hellip; also called the De Boor-Cox algorithm. It can be seen as the generalization of the de Casteljau.
(A Bézier curve is in fact a special case of B-spline.)

{:.algorithm}
* <span class="algo-part">input :</span>
   <span class="algo-content">
            degree $k$
            <br />
            $n+1$ control points $\mathbf{d_{0}},\dots,\mathbf{d_{n}}$
            <br />
            knot vector $t_0 \leq t_1 \leq \dots \leq t_m$ with $m = n+k+1$
            <br />
            parameter $t \in [t_i, t_{i+1}) \quad k \leq i \leq n$
        </span>
* <span class="algo-part">output :</span>
   <span class="algo-content"> The point $\mathbf S(t) = \mathbf d_j^k$ on the curve.</span>
* <span class="algo-part">compute :</span>
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

Be careful about the indices! Here I've expressed the point at depth $r$
in terms of the points at depth $r-1$;
that is why there is the $r-1$ everywhere in the formula.
(It becomes much more elegant if we express $r+1$ in terms of $r$.)
This might be a bit annoying, but I think it's also more practical for the implementation.

{:.img2grid}
![spiral1](/assets/geo-num-2016/spiral_B.png)
![spiral2](/assets/geo-num-2016/spiral_B_2.png)

{:.imgCaption}
A cubic B-spline with 16 segments and endpoint interpolation.

## ToDo

{:.assignements}
1. Implement the De Boor's algorithm. (`Vec2 DeBoor`)
2. Implement the evaluation of a B-spline curve. (`evaluateBSpline`)
3. Compute the B-spline curve for the `simple` dataset. Then, modify the knot vector and recompute. What happened?
4. Compute the B-spline curve for the `spiral` dataset. Try using the knot vector <code style="display:inline-block;">0 0 0 0 1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 5`. What changed?
5. Compute the B-spline curve for the `camel` dataset. Move the front leg by changing the x-coordinate of the very last control point to `-1.5`. Which segments of the curve have changed? Why?

## NURBS

If you've done the tests with the `circle.bspline` dataset, you might have been disappointed,
as the resulting curve is far from being a nice circle.
The truth is, it's mathematically impossible to represent the unit circle as a B-spline.
However, it *is* possible (and not so hard) using a further generalization of the B-spline curves: the non-uniform rational B-splines or <strong>NURBS</strong>.

If you examine the `circle.nurbs` file, you'll find it's not so different from the `circle.bspline`.
The only thing that's changed is the additional number after each control point.
It almost looks like the control points don't live in 2D, but in 3D.
If that thought occured to you, you're not far from the truth:
together, those three numbers define the homogeneous (or projective) coordinates of a control point.
The third number is often called a weight of the control point.

Here's the good news: even with the homogeneous coordinates, we can apply exactly the same De Boor's algorithm without any modifications. So, if you're up for it, here's a secret recipe for transforming your 2D B-splines into 2D NURBS:
* Use a matrix of type `MatX3` to store the control points (the first and second column are the x and y coordinates, respectively; the third column hold the weights).
For reading the `circle.nurbs` file, you can still use the method `readBSpline`, no change here; just make sure the second argument you pass is a three-column matrix.
Let's call this matrix `ControlPoints3`.
   
*`DeBoor3:` you can copy-paste everything from the 2D version, just be sure to change the types to `Vec3` and `MatX3`.
   
* Before you begin the evaluation, you need to multiply the x and y coordinates (first two columns of the `ControlPoints3` matrix)
by the weights (third column). You can do this with  
`ControlPoints3.col(i) = ControlPoints3.col(i).array() * ControlPoints3.col(2).array();`  
for `i=0,1.`
The `.array()` tells the Eigen to perform the operation element-wise.
   
* Proceed by evaluating the `SplinePoints3` with three coordinates.
   
* The last step is to return to the plane coordinates. To do that, you need to divide by the weights. Much like before, this is done with  
`SplinePoints2.col(i) = SplinePoints3.col(i).array() / SplinePoints3.col(2).array();`

## Bonus ToDo

{:.assignements}
1. Implement the NURBS curve by extending your B-spline methods.
2. Compute and visualise the circle as a NURBS curve.

## Resources

{:.resources}
* [B-spline](https://en.wikipedia.org/wiki/B-spline) and [De Boor's algorithm](https://en.wikipedia.org/wiki/De_Boor's_algorithm)
* [1.4.2 B-spline curve](http://web.mit.edu/hyperbook/Patrikalakis-Maekawa-Cho/node17.html)
   and 
   [1.4.3 Algorithms for B-spline curves](http://web.mit.edu/hyperbook/Patrikalakis-Maekawa-Cho/node18.html),
   online chapters from the book *Shape Interrogation for Computer Aided Design and Manufacturing* by N. Patrikalakis, T. Maekawa &amp; W. Cho
* [NURBS](https://en.wikipedia.org/wiki/Non-uniform_rational_B-spline) on wikipedia (includes the circle example)
* [homepage of Prof. de Boor](http://pages.cs.wisc.edu/~deboor/)
