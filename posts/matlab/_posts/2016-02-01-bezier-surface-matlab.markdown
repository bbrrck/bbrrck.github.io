---
layout      : post
title       : Bézier surfaces in Matlab
date        : 2016-02-01 16:30:00
permalink   : bezier-surfaces-matlab.html
category    : matlab
---

<figure>
    <video style="max-width:100%" width="700" poster="/assets/teapot.gif" autoplay loop>
        <source src="/assets/teapot.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
</figure>

The following code is my attempt for a fast and compact Matlab implementation of Bézier surfaces using three-dimensional arrays. It runs in less than ones second for the [teapot](http://www.holmes3d.net/graphics/teapot/teapotrim.bpt) dataset with 32 cubic patches and 10 000 surface points per patch. The computation itself (4064 calls to the `casteljau` function) takes only &#8531; of a second.

<pre><code class="language-matlab">%% compute and display a Bézier surface
samples = 100;
dim     = 3;
% teapot data from http://www.holmes3d.net/graphics/teapot/
patches = readBPT('teapotrim.bpt',dim);
figure(gcf); clf; hold on; axis equal; axis on; grid on;
for i=1:length(patches),
    % patch degree
    degU = patches(i).deg(1);
    degV = patches(i).deg(2);
    % control net
    Net = reshape(patches(i).verts,degU+1,degV+1,dim);
    % parameter grid
    t = linspace(0,1,samples);
    [U,V] = meshgrid(t,t);
    % compute surface points
    S = casteljau(degU,degV,0,0,U,V,Net,dim);
    % plot
    h = surf(...
        S(:,:,1),...
        S(:,:,2),...
        S(:,:,3)...
    );
end

function S = casteljau(k,l,i,j,u,v,Net,dim)
% S = casteljau(k,l,i,j,u,v,Net,dim)
%
%   Compute the point V_{i,j}^{k,l}
%   from the De Casteljau's algorithm
%   for parameter values (u,v).
%   V_{0,0}^{degU,degV} is a surface point.
%
    if k==0 && l==0,
        S = repmat(Net(i+1,j+1,:),size(u)); % size(u)==size(v)
        return;
    elseif k > 0,
        uu = repmat(u,1,1,dim);
        A = casteljau(k-1,l,i  ,j,u,v,Net,dim);
        B = casteljau(k-1,l,i+1,j,u,v,Net,dim);
        S = (1-uu).*A + uu.*B;
        return;
    else
        vv = repmat(v,1,1,dim);
        A = casteljau(k,l-1,i,j  ,u,v,Net,dim);
        B = casteljau(k,l-1,i,j+1,u,v,Net,dim);
        S = (1-vv).*A + vv.*B;
        return;
    end
end

function patches = readBPT(filename,dim)
% patches = readBTP( filename, dim )
%
%   Dirty way to read Bezier patches' control nets
%   stored in the BPT format.
%   e.g.: http://www.holmes3d.net/graphics/teapot/teapotrim.bpt
%
    file = fopen(filename);
    pcount = fscanf(file,'%i',1);
    patches = struct('deg',[],'cp',[]);
    for i=1:pcount,
        deg = fscanf(file,'%i',2);
        patches(i).deg = deg;
        vcount = (deg(1)+1)*(deg(2)+1);
        V = fscanf(file,'%f',[dim,vcount]);
        patches(i).verts = V';
    end
    fclose(file);
end
</code></pre>
