---
layout: post
title:  "Bézier surfaces in Matlab"
date:   2016-01-29 15:00:00
permalink: bezier-surface-matlab
draft: true
categories: matlab
---

{% highlight matlab %}
samples = 50;
degreeU = 3;
degreeV = 3;
dim     = 3;
%% Control net
Net = zeros(degreeU,degreeV,dim);
    % from [Farin 2002, p.249]
    Net(:,:,1) = [ % x-coords
        0   2   4
        0   2   4
        0   2   4
    ]; 
    Net(:,:,2) = [ % x-coords
        0   0   0
        2   2   2
        4   4   4
    ];
    Net(:,:,3) = [ % y-coords
        0   0   0 
        0   0   2
        0   4   4
    ];
%% Parameter grid
t = linspace(0,1,samples);
[U,V] = meshgrid(t,t);
%% Compute surface points
S = casteljau(degreeU-1,degreeV-1,0,0,U,V,Net,dim);
%% Plot
figure(gcf); clf; hold on; axis equal; grid on; view(3);
s = surf(...
    S(:,:,1),...
    S(:,:,2),...
    S(:,:,3)...
);
s.FaceColor = 'g';
s.EdgeColor = 'k';
s.EdgeAlpha = 0.3;
lighting phong;
light;
{% endhighlight %}
with the function casteljau defined as
{% highlight matlab %}
function S = casteljau(k,l,i,j,u,v,Net,dim)
    if k==0 && l==0,
        S = repmat(Net(i+1,j+1,:),size(u)); % size(u)==size(v)
    elseif k > 0,
        uu = repmat(u,1,1,dim);
        A = casteljau(k-1,l,i  ,j,u,v,Net,dim);
        B = casteljau(k-1,l,i+1,j,u,v,Net,dim);
        S = (1-uu).*A + uu.*B;
    else
        vv = repmat(v,1,1,dim);
        A = casteljau(k,l-1,i,j  ,u,v,Net,dim);
        B = casteljau(k,l-1,i,j+1,u,v,Net,dim);
        S = (1-vv).*A + vv.*B;
    end
end
{% endhighlight %}