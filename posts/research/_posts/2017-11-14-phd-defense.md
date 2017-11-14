---
layout      : post
title       : 'PhD defense: December 8, 2017'
date        : 2017-11-14 00:00:00
permalink   : phd-defense.html
category    : research
has_excerpt : true
excerpt_separator: <!--more-->
---

I am pleased to invite you to the public defense of my PhD thesis:

<div style="display:inline-block;font-size:125%; padding:0.25em 0.1em 1em; font-style:italic;">
&ldquo;Shape reconstruction of meshed smooth surfaces<br />&nbsp;&nbsp;equipped with inertial sensors&rdquo;
</div>

**when :** December 8, 14h00  
**where :**  room C203,
[Local Inria office Grenoble - GIANT](https://www.inria.fr/en/centre/grenoble/overview/local-inria-office-grenoble-giant)
(building **50-B** in [Minatec Campus](http://bit.ly/2i96g8u))  
**language :**  English  
**composition of the jury :**
- [Mario BOTSCH](http://graphics.uni-bielefeld.de/people/botsch.php), professor, Universität Bielefeld, *reviewer*           
- [Adrien BOUSSEAU](http://www-sop.inria.fr/members/Adrien.Bousseau/), researcher HDR, Inria Sophia-Antipolis, *reviewer*           
- [Marc DANIEL](http://marc.daniel.perso.luminy.univ-amu.fr/), professor, Université d’Aix-Marseille, *examinator*
- [Stefanie HAHMANN](https://team.inria.fr/imagine/stefanie-hahmann/), professor, Grenoble INP, LJK/Inria, *thesis director*    
- [Georges-Pierre BONNEAU](http://www-evasion.imag.fr/~Georges-Pierre.Bonneau/), professor, Université Grenoble Alpes, LJK/Inria, *thesis co-director*
- Nathalie SAGUIN-SPRYNSKI, research engineer, CEA Grenoble, *thesis supervisor*  

You are also warmly welcome to the after-party, which will take place in the same room.

*See you there!*

![teaser](/assets/smi2017/teaser.jpg)

**Keywords :** 3D shape reconstruction — inertial and magnetic sensors — curve networks — smooth surfaces — variational modeling — mesh processing

**Abstract :**&nbsp;
<!--more-->
This thesis presents a complete framework for 3D shape reconstruction using inertial and magnetic sensors. When placed onto a shape, these sensors provide local surface orientations along a curve network on the shape, but their absolute position in the world space is unknown. The challenges with this type of 3D acquisition are threefold. First, sensor measurements are noisy and inconsistent. Second, since positions are unknown, the acquired curve network has to be reconstructed from orientations. Finally, the smooth surface needs to be inferred from a collection of curves with normals. To compute the shape from measured data, our main insight is to formulate the reconstruction as a set of optimization problems. Using discrete representations, these optimization problems are resolved efficiently and at interactive time rates.

We present two main contributions. First, we introduce a novel method for creating well-connected networks with cell-complex topology using only orientation and distance measurements and a set of user-defined constraints. By working directly with orientations, our method robustly resolves problems arising from data inconsistency and sensor noise. Our approach is driven by a simple principle mostly overlooked in previous works: at each intersection in a curve network, the positions and the normals of two intersecting curves have to coincide.

Second, we address the problem of surfacing a closed 3D curve network with given surface normals. Thanks to the normal vector input, the patch-finding problem can be solved unambiguously and an initial piecewise smooth triangle mesh is computed. The input normals are propagated throughout the mesh. Together with the initial mesh, the propagated normals are used to estimate mean curvature vectors. We then compute the final mesh by combining the standard Laplacian-based variational methods with the curvature information extracted from the input normals. The normal input increases shape fidelity and allows to achieve globally smooth and visually pleasing shapes.

Previous approaches used static devices placed along a network with fixed connectivity between the sensors (ribbon, grid). We explore a new dynamic setup, which used a single mobile node of sensors. As a consequence, a dense set of data can be acquired along an arbitrary smooth curve network on a surface. The proposed framework was tested on real-world data acquired using two devices equipped with mobile sensors. A quantitative evaluation was performed by computing the error of reconstruction for fabricated surfaces with known ground truth. Even for complex shapes, the mean error remains around 1%.
