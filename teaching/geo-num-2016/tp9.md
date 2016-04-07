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


## Loop Subdivision Scheme
Today, you'll be implementing the Loop subdivision scheme for triangle meshes. The scheme consists of two general steps:

1. Split the topology; each triangle is replaced by four smaller triangles.
2. Computation new vertex positions from the old positions.

<br />

The first step is already provided in the code, only the second part needs to be implemented.

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
Matrix V stores the geometry, its i-th row corresponds to the position of the i-th vertex.
Matrix F stores topology, its j-th row corresponds to the indices of three vertices in j-th triangle.

## ToDo

{:.assignements}
1. Implement the computation of new geometry in the Loop subdivision scheme using the original weights $\beta$.
2. Use the simplified weights by Warren and compare the results.

<br />

<div style="text-align:center;">
    <video width="500" height="500" autoplay loop>
        <source src="/assets//geo-num-2016/tp9/loop.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
</div>

{:.imgCaption}
First few iterations of Loop.


## Test Surfaces
This is the list of all provided test surfaces, with vertex and face counts.

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
