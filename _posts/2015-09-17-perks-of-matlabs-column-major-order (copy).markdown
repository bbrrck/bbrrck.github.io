---
layout:     post
title:      The perks of Matlab’s column-major order
date:       2015-09-17 16:00:00
permalink:  perks-of-matlab-column-major
category:   matlab
---
When working with Matlab, it's good to remember the data are stored in the column-major order; otherwise, the following (seemingly harmless) code might cause a lot of trouble.
<pre><code class="language-matlab">% both Positions and Normals are n x 3 matrices
file = ""
fid = fopen(file,'w');
% print Positions and Normals to file
fprintf(fid, '%f %f %f \t %f %f %f \n', [Positions Normals] );
fclose(fid);
</code></pre>

So what's the problem?

In this case, we expect the contents of the output file to have the form
<pre><code class="language-matlab">Px1 Py1 Pz1   Nx1 Ny1 Nz1
 ⋮  ⋮  ⋮     ⋮  ⋮  ⋮
Pxn Pyn Pzn   Nxn Nyn Nzn
</code></pre>
Instead, we get something completely different and meaningless:
<pre><code class="language-matlab">Px1 Px2 Px3   Px4 Px5 Px6
 ⋮  ⋮  ⋮    ⋮   ⋮  ⋮
            …         Nzn
</code></pre>
In case you forget, good luck debugging this!
