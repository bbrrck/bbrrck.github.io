---
layout: teaching-geonum2016
title: "TP9 : Subdivision Surfaces on Triangle Meshes"
date:   2016-04-08
permalink: /teaching/geo-num-2016/tp9.html
---

## Code
As always, do
{% highlight bash %}
git pull
{% endhighlight %}
or, if you don't have the local repo,
{% highlight bash %}
git clone https://github.com/bbrrck/geo-num-2016.git
{% endhighlight %}
Then
{% highlight bash %}
cd TP9/
mkdir build
cd build
cmake ..
make
./geonum_TP9 sphere 
{% endhighlight %}

Later, you can specify number of subdivision steps via additional command line parameter.
{% highlight bash %}
./geonum_TP9 sphere 3
{% endhighlight %}

<code>SimpleViewer</code> controls are listed below (should be the same on AZERTY keyboard).
{% highlight bash %}
face toggle  : F
edge toggle  : E
light on/off : L
smooth/flat  : S
zoom         : (mouse scroll) or [pageup]/[pagedown]
rotate       : (mouse click & drag)
{% endhighlight %}

**Important:** For those still having problems with <code>SimpleViewer</code>, a code with python binding to OpenGL is provided.
More info on how to configure everything is at the [end of the text](#pyopengl).


## Subdivision surfaces
Mesh subdivision is a powerful tool, extensively used in modern geometric modeling.
Unlike B-spline subdivision you implemented in [TP8](tp8.html), subdivision surfaces are not limited to rectangular topology;
in fact they provide the means for representing surfaces of *arbitrary* topology.

Almost every current animated movie uses subdivision surfaces to some extent.
Even though their mathematical foundations date back to 1978,
Pixar's short *Geri's Game* (1997) is considered to be the first 'real' application.

{:.img2gridH}
![Geri's game](/assets/geo-num-2016/tp9/geri.png)
![Geri mesh](/assets/geo-num-2016/tp9/geri-mesh.jpg)

{:.imgCaption}
Geri's game, an Academy award-winning short movie by Pixar.


## Loop subdivision scheme
Today, you'll be implementing the Loop subdivision scheme for triangle meshes. Like every surface subdivision scheme,
it consists of two general steps:

1. Split the topology; each triangle is replaced by four smaller triangles.
2. **Compute the new vertex positions from the old positions.**

<br />

The first step is already provided in the code; only the second part needs to be implemented.

To compute the new geometry, two sets of vertices are recognized, each with its own rules:
new edge midpoints and old vertices. The masks for both groups are visualised below.

![Loop subdivision masks](/assets/geo-num-2016/tp9/loop_masks.png)

{:.imgCaption}
Edge and vertex masks for the Loop subdivision scheme.

The $n$ in the vertex mask denotes the number of neighbours.
The original definition of $\beta$ was introduced by Charles Loop in his master's thesis (1987):

$$
\beta = \frac1{n} \left( \frac58 - \left( \frac38 + \frac14 \cos{\frac{2\pi}{n}} \right)^2  \right)
$$

Joe Warren proposed using the simplified weights (1995):

$$
\beta =
\begin{cases}
\frac{3}{8n} & n > 3, \\
\frac{3}{16} & n = 3 .
\end{cases}
$$



## Implementation
To represent a triangle mesh with arbitrary topology, we use two matrices.

* geometry <code>V</code> — <code>V.row(i)</code> is the position of the vertex <code>i</code>.
* topology <code>F</code> — <code>F.row(j)</code> are the indices of three vertices in triangle <code>j</code>.

<br />

### Example: sphere

<div style="width:40%; float:left;">
{% highlight matlab %}
V = [
   0.0000  -1.0000   0.0000
   0.7236  -0.4472   0.5257
  -0.2764  -0.4472   0.8506 
  -0.8944  -0.4472   0.0000
  -0.2764  -0.4472  -0.8506
   0.7236  -0.4472  -0.5257
   0.2764   0.4472   0.8506
  -0.7236   0.4472   0.5257
  -0.7236   0.4472  -0.5257
   0.2764   0.4472  -0.8506
   0.8944   0.4472   0.0000
   0.0000   1.0000   0.0000
];

F = [
  0  1  2
  1  0  5
  0  2  3
  0  3  4
  0  4  5
  1  5 10
  2  1  6
  3  2  7
  4  3  8
  5  4  9
  1 10  6
  2  6  7
  3  7  8
  4  8  9
  5  9 10
  6 10 11
  7  6 11
  8  7 11
  9  8 11
 10  9 11
];
{% endhighlight %}
</div>

<div style="width:55%; text-align:center; margin: 1%; float:left;">
    <img style="width:80%;margin:0.5em 0 1.5em;" alt="icosphere mesh" src="/assets/geo-num-2016/tp9/icosphere.png" />
    <video width="320" height="320" autoplay loop controls>
        <source src="/assets//geo-num-2016/tp9/loop.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
    
    <div class="imgCaption" style="font-size: 90%;">
    Four iterations of the Loop scheme on the sphere.
    </div>
</div>

<div style="clear:both;"></div>


### Adjacency

The topological step is implemented in the function <code>triangleSplit( F0,V0, F1,V1, VertexAdjacency, MidpointAdjacency );</code>.&nbsp;
After the execution of this function, the last two arguments contain indices necessary to compute the new geometry.

If v, e is the number of vertices and edges in the mesh <code>V0, F0</code>, then

* <code>VertexAdjacency</code> is a matrix with v rows, row i contains adjacency information for old vertex i.  
column 0: number of adjacent vertices = $n$  
columns 1-n: indices of adjacent vertices (weight $\beta$)
* <code>MidpointAdjacency</code> is a matrix with e rows, row j contains adjacency information for new midpoint vertex j.  
columns 0 and 1: indices of adjacent edge vertices (weight $\frac38$)  
columns 2 and 3: indices of opposite vertices (weight $\frac18$)


## ToDo


{:.assignements}
1. Implement the computation of new geometry in the Loop subdivision scheme using the original weights $\beta$.
2. Use the simplified weights (Warren) and compare the results.
3. Subdivide the sphere and cube five times. Which surface is closer to the real sphere? Why?



## Test surfaces
This is the list of all provided test surfaces, with vertex and face counts.

Don't apply too many iterations on surfaces with more faces, as the number of faces grows exponentially.
Take the horse mesh with 1000 faces for instance: we get 4000 faces after one iteration, 16000 after two, and 64000 after three.

In general, three iterations are sufficient.
For the sphere and cube, up to five iterations should work.
If you get a failed assertion somewhere, it probably means there are too many vertices in the mesh.

|          | #V  |  #F |
|----------|-----|-----|
| cube     |   8 |  12 |
| sphere   |  12 |  20 |
| testsurf |  69 | 134 |
| bumpycube| 201 | 398 |
| cow      | 278 | 552 |
| armadillo| 434 | 864 |
| horse    | 502 |1000 |
{:.table50}


## Resources
1. Pixar's [OpenSubdiv](http://graphics.pixar.com/opensubdiv/docs/intro.html)
1. [A Quick Introduction to Subdivision Surfaces](http://www.holmes3d.net/graphics/subdivision/) by Ryan Holmes
1. [Subdivision](https://graphics.stanford.edu/~mdfisher/subdivision.html) by Matthew Fischer
1. [behind the scenes video](https://www.youtube.com/watch?v=Y-3L9BOTEtw&t=162) showing the use of subdivision surfaces in Brave

## Appendix: PyOpenGL
{:#pyopengl}

Here are the instructions on how to configure [PyOpenGL](http://pyopengl.sourceforge.net/) and use the python script <code>viewsurface.py</code>
based on the [code by Matthijs Douze](http://sed.inrialpes.fr/~douze/numpy_training/s2/#longer).
Modify the configuration as needed. Be sure to use absolute paths!

{% highlight bash %}
curl -O https://pypi.python.org/packages/source/P/PyOpenGL/PyOpenGL-3.1.0b3.tar.gz
tar xvzf PyOpenGL-3.1.0b3.tar.gz
cd PyOpenGL-3.1.0b3
mkdir -p /home/tibor/TP-geo-num/TP9/plots/lib/python2.7/site-packages/
export PYTHONPATH=/home/tibor/TP-geo-num/TP9/plots/lib/python2.7/site-packages/
python setup.py install --prefix=/home/tibor/TP-geo-num/TP9/plots
cd /home/tibor/TP-geo-num/TP9/plots
python viewsurface.py sphere
{% endhighlight %}

This assumes you already have an exported <code>sphere.off</code> in your plots folder.
You can also test using the input data:

{% highlight bash %}
python viewsurface.py ../data/sphere
{% endhighlight %}

Don't forget to use <code>cmake/CMakeLists2.txt</code> and to comment the lines 2, 61-65 in <code>main.cpp</code>.
