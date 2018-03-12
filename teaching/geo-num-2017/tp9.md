---
layout: teaching-geonum2017
title: "TP9 : Subdivision Surfaces on Triangle Meshes"
date:   2016-04-07
permalink: /teaching/geo-num-2017/tp9.html
---

## Code
* [TP9 on github](https://github.com/GeoNumTP/GeoNum2017/tree/master/TP9)  
* [general instructions](https://github.com/GeoNumTP/GeoNum2017#géométrie-numérique-spring-2017)  

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
2. Compute the new vertex positions from the old positions.

<br />

To compute the new geometry, two sets of vertices are recognized, each with its own rules:
new edge midpoints and old vertices. Subdivision masks for both groups are visualised below.

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

* geometry `V` — `V[i]` is the position of the vertex `i`.
* topology `F` — `F[j]` are the indices of the three vertices in triangle `j`.

<br />

### Example: sphere


```c++
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
```

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
Our mesh is represented in a matrix form.
To perform the topological step of the subdivision (replace each triangle by four smaller triangles),
we will construct *an edge matrix* `E` with 6 columns and one row for each old face.
The even columns `0`,`2`,`4` will contain the old vertices, while the odd columns `1`,`3`,`5` will store the newly inserted midpoints. All odd columns initially contain `-1`.
We then progress through this matrix and at each iteration, we 'subdivide' one edge -- we just need to make sure all instances of this edge are modified at the same time by assigning the same midpoint index.

Take for instance the face matrix of a tetrahedron :
```c++
3  1  0
3  2  1
3  0  2
2  0  1
```
We will look at the construction of the corresponding edge matrix. We start with
```c++
3 -1  1 -1  0 -1
3 -1  2 -1  1 -1
3 -1  0 -1  2 -1
2 -1  0 -1  1 -1
```
Now, we look at the first midpoint which has not yet been set, in this case `3 -1 1`. This corresponds to the edge `3 1`.
The next midpoint will have index `4`: we need to make sure to change midpoints for both instances of the edge `3 1` in the matrix E. The other one is in row 2:
```c++
3  4  1 -1  0 -1
3 -1  2 -1  1  4
3 -1  0 -1  2 -1
2 -1  0 -1  1 -1
```
Changing the next 'free' midpoint `1 -1 0` we get
```c++
3  4  1  5  0 -1
3 -1  2 -1  1  4
3 -1  0 -1  2 -1
2 -1  0  5  1 -1
```
Changing the next 'free' midpoint `0 -1 3` we get
```c++
3  4  1  5  0  6
3 -1  2 -1  1  4
3  6  0 -1  2 -1
2 -1  0  5  1 -1
```
...and so on until we change the last 'free' midpoint:
```c++
3  4  1  5  0  6
3  7  2  8  1  4
3  6  0  9  2  7
2  9  0  5  1  8
```

## ToDo

{:.assignements}
1. Implement the computation of new geometry in the Loop subdivision scheme using the original weights $\beta$.
2. Use the simplified weights (Warren) and compare the results.
3. Subdivide the sphere and cube five times. Which surface is closer to the real sphere? Why?


## Test surfaces
This is the list of all provided test surfaces, with vertex and face counts.

**Don't apply too many iterations on surfaces with more faces**, as the number of faces grows exponentially.
Take the horse mesh with 1000 faces for instance: we get 4000 faces after one iteration, 16000 after two, and 64000 after three.

In general, three iterations are sufficient. For the sphere and cube, up to five iterations should be ok.

|          | #V  |  #F |
|----------|-----|-----|
| tetra    |   4 |   4 |
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
