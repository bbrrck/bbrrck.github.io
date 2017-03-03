---
layout      : post
title       : Gif screencast with byzanz
date        : 2017-03-03 00:00:00
permalink   : gif-screencast-byzanz
category    : fedora
---
Here's a simple example for gif screencasting with [byzanz](https://github.com/GNOME/byzanz).
See the thread 
[How to create animated GIF images of a screencast?](http://askubuntu.com/a/123515/181265)
on askubuntu.com.

```bash
byzanz-record --duration=12 --x=725 --y=365 --width=487 --height=375 out.gif
```

{:.img400}
![Chaikin animation captured with byzanz](/assets/geo-num-2016/subdivision.gif)

{:.imgCaption}
Animation of Chaikin curve subdivision scheme captured with byzanz.

On [Fedora](https://fedoraproject.org/wiki/ScreenCasting#Byzanz), byzanz can be installed from the official [repo](https://apps.fedoraproject.org/packages/byzanz).
```bash
sudo dnf install byzanz
```
