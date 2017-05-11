---
layout:     post
title:      Selecting extraordinary vertices in Blender
date:       2016-07-28 12:53:00
permalink:  blender-select-extra.html
category:   blender
---

<figure>
<img alt="selecting extraordinary vertices in blender" src="/assets/blender-select-extraordinary.gif" />
</figure>

Extraordinary vertices in a polygon mesh are the ones which are not regular --
their degree is other than 6 in a triangle mesh and other than 4 in a quad mesh.
Here's how to select all extraordinary mesh vertices in Blender:

1. Select a regular vertex.
2. <code class="language-bash">Select->Select Similar->Amount of connecting edges</code>.  
This will select all regular vertices.
3. Hit <code class="language-bash">Ctrl+I</code> to invert the selection.
