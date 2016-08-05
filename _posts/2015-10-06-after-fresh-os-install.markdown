---
layout:     post
title:      After a fresh OS install
date:       2015-10-06 14:30:00
permalink:  fresh-os-install
category:   os
---

In the past few months, I've experimented with various Linux distros, before sticking with Fedora-based
[Korora](https://kororaproject.org/) and Gnome 3 desktop.
Korora comes with many pre-installed packages,
including `vlc`, `audacity`, `deluge`, `gimp`, `inkscape` and `git`, which is great; 
still, each time I'm reinstalling my laptop, I spend too much time figuring out
which additional applications, packages and libraries I need to install.
To facilitate this rather tedious process in the future,
I've compiled the following list, plus some pointers to useful web resources.

Note: Since Fedora 22, the
[Dnf](https://en.wikipedia.org/wiki/DNF_(software))
is the default package manager, replacing the now-deprecated yum.
(Dnf actually stands for *Dandified Yum*.) 

### First things first
As always, first step after a fresh install is to update everything.

<pre><code style="bash">dnf update</code></pre>

Firefox is the default browser in Korora; I prefer Chrome, which is easy to install.
<pre><code style="bash">dnf install google-chrome-stable</code></pre>

Next, I use
[negativo17](http://negativo17.org/)'s repos to install
[Nvidia drivers](http://negativo17.org/nvidia-driver/),
[Skype](http://negativo17.org/skype-and-skype-pidgin-plugin/) and
[Spotify client](http://negativo17.org/spotify-client/).

<pre><code style="bash">dnf config-manager --add-repo=http://negativo17.org/repos/fedora-nvidia.repo
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-skype.repo
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
dnf remove \*nvidia\*
dnf install nvidia-driver
dnf install spotify-client skype
</code></pre>

### Package groups
Dnf provides many useful package groups; to obtain list of available groups:
<pre><code style="bash">dnf group list -v
</code></pre>
To get the details of a group:
<pre><code style="bash">dnf group info 'Group Name'
</code></pre>
To install a group:
<pre><code style="bash">dnf group install 'Group Name'
</code></pre>
To install the optional packages in the group, add parameter `with-optional` before the name of the group.
<pre><code style="bash">dnf group install with-optional 'Group Name'
</code></pre>
Now, let's look at some specific groups.

<pre><code style="bash">dnf group install with-optional 'Development and Creative Workstation'
</code></pre>
This is actually a *metagroup* – a group of groups.
Includes `C Development Tools and Libraries` and `X Software Development`. Optional groups include `Python` and `PHP`.

<pre><code style="bash">dnf group install with-optional 'Authoring and Publishing'
</code></pre>
Includes `texlive, pdftk.`

<pre><code style="bash">dnf group install with-optional 'Engineering and Scientific'
</code></pre>
Includes `R, gnuplot, maxima, octave, python-matplotlib, texmaker.`

### Applications

<pre><code style="bash">dnf install amarok asymptote blender dropbox emacs filezilla guake meshlab
</code></pre>

There's an unofficial google drive client called <strike>Grive</strike>
[overGrive](https://www.thefanclub.co.za/overgrive/installation-instructions-fedora).
Licence ($4.99) is required.
For installing zotero, I'm using Sebastiaan Mathôt's
[zotero_installer](https://github.com/smathot/zotero_installer).

### Setting up Git
<pre><code style="bash">git config --global user.name "Tibor Stanko"
git config --global user.email my@email.com
git config --global credential.helper cache
git config --global push.default simple
</code></pre>

### Libs
Some additional libraries, mostly for my scientific activities: `GLEW, GLFW, Eigen, CGAL, libigl.`
(See also the [libigl tutorial](http://libigl.github.io/libigl/tutorial/tutorial.html).)

<pre><code style="bash">dnf install glew-devel glfw-devel eigen3-devel CGAL-devel
cd ~/Tibb/cplus
git clone --recursive https://github.com/libigl/triangle.git
git clone --recursive https://github.com/libigl/libigl.git
cd libigl/external
git clone --recursive https://github.com/libigl/CoMISo.git
</code></pre>

### Setting up Matlab
After installing Matlab from iso, I like to do some additional setting up.
First, create a symlink to matlab executable in `/usr/bin/`:

<pre><code style="bash">ln -s /usr/local/MATLAB/R2014b/bin/matlab /usr/bin/matlab
</code></pre>

Second, we need to tell Gnome about Matlab by creating a `.desktop` entry:

<pre><code style="bash">vim /usr/share/applications/matlab.desktop
</code></pre>

Add the following to `matlab.desktop`:

<pre><code style="ini">[Desktop Entry]
Type = Application
Encoding = UTF-8
Name = Matlab2014b
Comment = Matlab:The Tool of Technical Computing
Exec = /usr/local/MATLAB/R2014b/bin/matlab -desktop
Icon = matlab
Categories = Development;Matlab;
</code></pre>


### BitBucket stuff
[use this script to clone all repos at once](http://haroldsoh.com/2011/10/07/clone-all-repos-from-a-bitbucket-source/)

### Additional desktops
Having an alternative desktop installed might be handy, in case Gnome gives you the jolly *Oops! Something has gone wrong.*

<pre><code style="bash">dnf group install xfce-desktop</code></pre>

### Gnome tweaks
When everything's installed, let's make some final adjustements using the Gnome Tweak Tool.

* increase font size
* add startup applications (`guake`)
* &hellip;

And we're good to go!
