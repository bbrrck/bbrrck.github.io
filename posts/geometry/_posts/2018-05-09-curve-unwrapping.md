---
layout      : post
title       : How to animate isometric unwrapping of a curve
date        : 2018-05-09 00:00:00
permalink   : curve-unwrapping.html
category    : geometry
has_excerpt : true
---

A while ago I was thinking about how to illustrate the input data in [Shape from sensors](http://127.0.0.1:4000/publications/smi2017.html) --- in 2D, the input is the unit tangent field parametrized by arc-length.

I ended with this cool-looking [isometric](https://en.wikipedia.org/wiki/Isometry) and [isotopic](https://en.wikipedia.org/wiki/Homotopy#Isotopy) unwrapping.

<iframe style="border: 1px dashed #ccc;" frameborder="0" width="100%" height="400px" src="/whale.html"></iframe>

{:.center}
*Move the slider to unwrap the curve. You can also [play around in fullscreen](/whale.html).*

The effect is achieved by interpolating between the input curve and a straight line with the same length in the tangent space (using [spherical linear interpolation](/lerp-vs-slerp.html)).

<!--more-->

I did my original implementation in Matlab; for this post, I wanted to try out doing the same thing in-browser using [geometry-processing-js](https://github.com/geometrycollective/geometry-processing-js)
(I actually only use the linear algebra package).

The idea for computing the intermediate curve $\gamma$ is to interpolate between the source tangent field $\mathrm T_0$ (of the original curve) and the target tangent field $\mathrm T_1$ (of the straight line).

$$
T(t) = \text{Slerp}(\mathrm T_0,\mathrm T_1,t)
$$

The in-between tangent field $\mathrm T$ is then integrated by solving a Poisson problem.

$$
\Delta \gamma = \nabla \cdot \mathrm T
$$

In code, this simply translates to

```javascript
// A contains the Cholesky factorization of the Laplacian matrix
const X = A.solvePositiveDefinite(B);
```

The nice thing about this approach is that the Laplacian matrix can be build and pre-factored *once*, prior to the choice of $t$ and computation of the right-hand side `B` of the system.

```javascript
// nv-2 is the number of (unknown) inner vertices
// ew contains edge weights for the Laplacian (inverse edge lengths)
var buildLaplacian = function() {
  // build triplets (w,i,j)
  let wij = new Triplet(nv-2,nv-2);
  // loop over rows
  for (let r=0; r<nv-2; r++){
    // cols
    let c0 = r-1;
    let c1 = r;
    let c2 = r+1;
    // weights
    let w0 = -ew[c1];
    let w1 = +ew[c1]+ew[c2];
    let w2 =        -ew[c2];
    wij.addEntry(w1,r,c1);
    if (r > 0)    wij.addEntry(w0,r,c0);
    if (r < nv-3) wij.addEntry(w2,r,c2);
  }
  // Laplacian : build from triplets
  const A = SparseMatrix.fromTriplet(wij);
  // return the Cholesky factorization
  return A.chol();
}
```

Since the curve is open, we need boundary constraints: I fix the starting point to $[0,0]$ and the endpoint to $(1-t) P  + t [L,0]$ with $P$ being the endpoint of the original curve.

Details of the discretization are in *["Robust Fairing via Conformal Curvature Flow"](https://www.cs.cmu.edu/~kmcrane/Projects/ConformalWillmoreFlow/paper.pdf) [Crane et al. 2013]*.
