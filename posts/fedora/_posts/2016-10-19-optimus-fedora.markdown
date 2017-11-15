---
layout      : post
title       : Nvidia Optimus
date        : 2016-10-19 00:00:00
permalink   : nvidia-optimus-fedora.html
category    : fedora
has_excerpt : true
excerpt_separator: <!--more-->
---

[Bumblebee on fedoraproject.com](https://fedoraproject.org/wiki/Bumblebee)

Fedora 24 version, closed source solution from managed NVidia repo

```bash
dnf -y --nogpgcheck install http://install.linux.ncsu.edu/pub/yum/itecs/public/bumblebee/fedora24/noarch/bumblebee-release-1.2-1.noarch.rpm
dnf install bumblebee-nvidia bbswitch-dkms VirtualGL primus kernel-devel
```

And test

```bash
optirun glxgears
```

I wanted to test `optirun` with Matlab, so I ran

```bash
optirun /usr/local/MATLAB/R2016a/bin/matlab -desktop
```

which resulted in a bunch of errors

```bash
MATLAB is selecting SOFTWARE OPENGL rendering.
version `CXXABI_1.3.8' not found (required by /usr/lib64/VirtualGL/librrfaker.so)
version `CXXABI_1.3.9' not found (required by /usr/lib64/VirtualGL/librrfaker.so)
```

<!--more-->
This is caused by matlab loading an old version of `libstdc++.so`.
A simple [solution](http://stackoverflow.com/a/34348019/1606707) is to tell matlab where to look for the correct version of the lib.

```bash
LD_PRELOAD=/usr/lib64/libstdc++.so.6 optirun /usr/local/MATLAB/R2016a/bin/matlab -desktop
```

No errors this time!

```bash
» disp(opengl('data'))
                      Version: '4.5.0 NVIDIA 367.44'
                       Vendor: 'NVIDIA Corporation'
                     Renderer: 'Quadro K2000M/PCIe/SSE2'
               MaxTextureSize: 16384
                       Visual: 'Visual 0x20, (RGBA 32 bits (8 8 8 8), Z depth 16 bits, Hardware acceleration, Double buffer, Antialias 8 samples)'
                     Software: 0
         HardwareSupportLevel: 'full'
    SupportsGraphicsSmoothing: 1
SupportsDepthPeelTransparency: 1
   SupportsAlignVertexCenters: 1
                   Extensions: {327x1 cell}
           MaxFrameBufferSize: 16384
```

[Screenshot: ![matlab quaternion filter](/assets/mtlb-qfilter.png)](/assets/mtlb-qfilter.png)
