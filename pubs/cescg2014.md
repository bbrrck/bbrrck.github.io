---
layout    : publication
permalink : "/publications/cescg2014.html"
slug      : "Stanko:2014:CESCG"
---

<br />
<br />

## Choosing the weights

The proposed method allows the specification of the weights for each vertex.
We demonstrate the effect of different sets of weights on the Stanford bunny.

{:.img5grid}
![bunny_3000F_00](/assets/cescg2014/bunny_weights/bunny_3000F_00.png)
![bunny_3000F_01](/assets/cescg2014/bunny_weights/bunny_3000F_01.png)
![bunny_3000F_04](/assets/cescg2014/bunny_weights/bunny_3000F_04.png)
![bunny_3000F_02](/assets/cescg2014/bunny_weights/bunny_3000F_02.png)
![bunny_3000F_03](/assets/cescg2014/bunny_weights/bunny_3000F_03.png)

{:.img5grid}
![bunny_3000F_00](/assets/cescg2014/bunny_weights/bunny_3000F_ABS_00.png)
![bunny_3000F_01](/assets/cescg2014/bunny_weights/bunny_3000F_ABS_01.png)
![bunny_3000F_02](/assets/cescg2014/bunny_weights/bunny_3000F_ABS_02.png)
![bunny_3000F_04](/assets/cescg2014/bunny_weights/bunny_3000F_ABS_04.png)
![bunny_3000F_03](/assets/cescg2014/bunny_weights/bunny_3000F_ABS_03.png)

{:.imgCaption}
Bunny refined with various sets of weights.
<br />
Bottom row shows the curvature (red = smaller, blue = higher).



## The influence of normals

To show how the change in the prescribed normals influences the limit surface,
we applied our method on the Stanford bunny with alternative set of vertex
normals. This alternative set of normals was generated randomly from a noise
function.

{:.img4grid}
![bunny_02](/assets/cescg2014/bunny_normals/bunny_02.png)
![bunny_03](/assets/cescg2014/bunny_normals/bunny_03.png)
![bunny_random02](/assets/cescg2014/bunny_normals/bunny_random02.png)
![bunny_random03](/assets/cescg2014/bunny_normals/bunny_random03.png)

{:.imgCaption}
Left: original normals.
Right: random normals.



## Comparison with linear schemes

To compare the proposed algorithm with the linear schemes, we have used the
large-scale mesh of the Venus of Dolní Věstonice. This mesh is a discretized
version of the small nude female statuette found in Moravia south of Brno. Dated
to 29,000-25,000 BCE, it is considered one of the oldest known pieces of ceramic
in the world.

{:.img3grid}
![venus statuette](/assets/cescg2014/venus/venus_statuette.png)
![venus mesh](/assets/cescg2014/venus/venus_original_mesh.png)
![venus decimation](/assets/cescg2014/venus/venus_decimation.png)

{:.imgCaption}
Left: the statuette dating to 29,000-25,000 BCE.
<br /> Middle: scanned mesh, 131114 vertices.
<br /> Right: decimted mesh, 1356 vertices.

{:.img4grid}
![venus QFR](/assets/cescg2014/venus/QFR.png)
![venus sqrt3](/assets/cescg2014/venus/sqrt3.png)
![venus MB](/assets/cescg2014/venus/MB.png)
![venus Loop](/assets/cescg2014/venus/Loop.png)

{:.imgCaption}
The decimated mesh refined four times. <br />
Left to right: our method, √3-subdivision, Modified butterfly, Loop.

{:.img4grid}
![venus QFR color](/assets/cescg2014/venus/QFR_C.png)
![venus sqrt3 color](/assets/cescg2014/venus/sqrt3_C.png)
![venus MB color](/assets/cescg2014/venus/MB_C.png)
![venus Loop color](/assets/cescg2014/venus/Loop_C.png)

{:.img4grid}
![venus QFR histogram](/assets/cescg2014/venus/QFR_H.png)
![venus sqrt3 histogram](/assets/cescg2014/venus/sqrt3_H.png)
![venus MB histogram](/assets/cescg2014/venus/MB_H.png)
![venus Loop histogram](/assets/cescg2014/venus/Loop_H.png)

{:.imgCaption}
Hausdorff distance of the refined meshes from the ground truth (scanned mesh).

## Reconstruction of quadratic surfaces

The proposed method can also be used to reconstruct quadratic surfaces from a
coarse approximating mesh. For instance, with the right choice of weights, it is
possible to reconstruct a close approximation of the units sphere from the cube.
The initial mesh along with the first 8 iterations is shown below. The last
picture is the visualisation of the Hausdorff distance of the limit surface from
the original sphere. [red = zero distance, blue = distance ≥ 0.0025 units]

<hr style="clear:both;" />
<br />

### Sphere

<br />

{:.img5grid}
![cube 0](/assets/cescg2014/reconstruction/cube/cube00.png)
![cube 1](/assets/cescg2014/reconstruction/cube/cube01.png)
![cube 2](/assets/cescg2014/reconstruction/cube/cube02.png)
![cube 3](/assets/cescg2014/reconstruction/cube/cube03.png)
![cube 4](/assets/cescg2014/reconstruction/cube/cube04.png)
![cube 5](/assets/cescg2014/reconstruction/cube/cube05.png)
![cube 6](/assets/cescg2014/reconstruction/cube/cube06.png)
![cube 7](/assets/cescg2014/reconstruction/cube/cube07.png)
![cube 8](/assets/cescg2014/reconstruction/cube/cube08.png)
![cube dist](/assets/cescg2014/reconstruction/cube/sphere00.png)


<hr style="clear:both;" />
<br />

### Cylinder

<br />

{:.img4grid}
![cylinder 0](/assets/cescg2014/reconstruction/cylinder/cylinder00.png)
![cylinder 1](/assets/cescg2014/reconstruction/cylinder/cylinder01.png)
![cylinder 2](/assets/cescg2014/reconstruction/cylinder/cylinder02.png)

{:.img4grid}
![cylinder 3](/assets/cescg2014/reconstruction/cylinder/cylinder03.png)
![cylinder 4](/assets/cescg2014/reconstruction/cylinder/cylinder04.png)
![cylinder 5](/assets/cescg2014/reconstruction/cylinder/cylinder05.png)

{:.img4grid}
![cylinder 6](/assets/cescg2014/reconstruction/cylinder/cylinder06.png)
![cylinder 7](/assets/cescg2014/reconstruction/cylinder/cylinder07.png)
![cylinder 8](/assets/cescg2014/reconstruction/cylinder/cylinder08.png)

<hr style="clear:both;" />
<br />

### Elliptic paraboloid

<br />

{:.img4grid}
![elliptic 0](/assets/cescg2014/reconstruction/elliptic/elliptic00.png)
![elliptic 1](/assets/cescg2014/reconstruction/elliptic/elliptic01.png)
![elliptic 2](/assets/cescg2014/reconstruction/elliptic/elliptic02.png)

{:.img4grid}
![elliptic 3](/assets/cescg2014/reconstruction/elliptic/elliptic03.png)
![elliptic 4](/assets/cescg2014/reconstruction/elliptic/elliptic04.png)
![elliptic 5](/assets/cescg2014/reconstruction/elliptic/elliptic05.png)

{:.img4grid}
![elliptic 6](/assets/cescg2014/reconstruction/elliptic/elliptic06.png)
![elliptic 7](/assets/cescg2014/reconstruction/elliptic/elliptic07.png)
![elliptic 8](/assets/cescg2014/reconstruction/elliptic/elliptic08.png)

<hr style="clear:both;" />
<br />

### Hyperbolic paraboloid

<br />

{:.img4grid}
![hyperbolic 0](/assets/cescg2014/reconstruction/hyperbolic/hyperbolic00.png)
![hyperbolic 1](/assets/cescg2014/reconstruction/hyperbolic/hyperbolic01.png)
![hyperbolic 2](/assets/cescg2014/reconstruction/hyperbolic/hyperbolic02.png)

{:.img4grid}
![hyperbolic 3](/assets/cescg2014/reconstruction/hyperbolic/hyperbolic03.png)
![hyperbolic 4](/assets/cescg2014/reconstruction/hyperbolic/hyperbolic04.png)
![hyperbolic 5](/assets/cescg2014/reconstruction/hyperbolic/hyperbolic05.png)

{:.img4grid}
![hyperbolic 6](/assets/cescg2014/reconstruction/hyperbolic/hyperbolic06.png)
![hyperbolic 7](/assets/cescg2014/reconstruction/hyperbolic/hyperbolic07.png)
![hyperbolic 8](/assets/cescg2014/reconstruction/hyperbolic/hyperbolic08.png)

<hr style="clear:both;" />
<br />

## Implementation

The proposed method was implemented using
<a href="http://openmesh.org/" title="official OpenMesh website">OpenMesh</a>
and
<a href="http://arma.sourceforge.net/" title="Armadillo on SourceForge">Armadillo</a>.
All figures were created in
<a href="http://meshlab.sourceforge.net/" title="MeshLab on SourceForge">MeshLab</a>.

<br />
<br />
<br />
<br />
<br />
