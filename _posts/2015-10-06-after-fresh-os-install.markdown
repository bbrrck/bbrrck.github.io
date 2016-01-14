---
layout: post
title:  "After a fresh OS install"
date:   2015-10-06 14:30:00
categories:
---
In the past few months, I've experimented with various Linux distros, before sticking with Fedora-based <a href="https://kororaproject.org/">Korora</a> and Gnome 3 desktop. Korora comes with many pre-installed packages, including <code>vlc</code>, <code>audacity</code>, <code>deluge</code>, <code>gimp</code>, <code>inkscape</code> and <code>git</code>, which is great; still, each time I'm reinstalling my laptop, I spend too much time figuring out which additional applications, packages and libraries I need to install. To facilitate this rather tedious process in the future, I've compiled the following list, plus some pointers to useful web resources.

Note: Since Fedora 22, the <a href="https://en.wikipedia.org/wiki/DNF_(software)">DNF</a> is the default package manager, replacing the now-deprecated yum. (DNF actually stands for <em>Dandified Yum</em>.) 

<h2>First things first</h2>
As always, first step after a fresh install is to update everything.
<pre class="lang:shell">dnf update</pre>

Firefox is the default browser in Korora; I prefer Chrome, which is easy to install.
<pre class="lang:shell">dnf install google-chrome-stable</pre>

Next, I use <a href="http://negativo17.org/">negativo17</a>'s repos to install <a href="http://negativo17.org/nvidia-driver/">Nvidia drivers</a>, <a href="http://negativo17.org/skype-and-skype-pidgin-plugin/">Skype</a> and <a href="http://negativo17.org/spotify-client/">Spotify client</a>.

<pre class="lang:shell">
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-nvidia.repo
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-skype.repo
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
dnf remove \*nvidia\*
dnf install nvidia-driver
dnf install spotify-client skype
</pre>

<h2>Package groups</h2>
Dnf provides many useful package groups; to obtain list of available groups:

<pre class="lang:shell">
dnf group list -v
</pre>

To get the details of a group:

<pre class="lang:shell">
dnf group info 'Group Name'
</pre>

To install a group:

<pre class="lang:shell">
dnf group install 'Group Name'
</pre>

To install the optional packages in the group, add parameter <code>with-optional</code> before the name of the group.

<pre class="lang:shell">
dnf group install with-optional 'Group Name'
</pre>

Now, let's look at specific groups.

<h3>Environment Group: Development and Creative Workstation</h3>
<pre class="lang:shell">
dnf group install with-optional 'Development and Creative Workstation'
</pre>

This is actually a <em>metagroup</em> – a group of groups. Includes <code>C Development Tools and Libraries</code> and <code>X Software Development</code>. Optional groups include <code>Python</code> and <code>PHP</code>. [<a title="Basic Web Server
C Development Tools and Libraries
Common NetworkManager Submodules
Core
Development Libraries
Development Tools
Dial-up Networking Support
Fedora Eclipse
Fedora Packager
Firefox Web Browser
Fonts
GNOME
GNOME Software Development
Guest Desktop Agents
Hardware Support
Input Methods
KDE Frameworks 5 Software Development
KDE Software Development
Multimedia
Printing Support
RPM Development Tools
Standard
Virtualization
X Software Development
base-x" href="#" onclick="return false;">mandatory</a>] [<a href="#" onclick="return false;" title="3D Printing
Cloud Management Tools
Design Suite
Electronic Lab
Font design and packaging
Haskell
Java Application Server
Java Development
Legacy Software Development
MariaDB (MySQL) Database
Milkymist
MinGW cross-compiler
MongoDB
OCaml
PHP
Perl for Web
PostgreSQL Database
Python
Robotics
Ruby on Rails">optional</a>]

<h3>Group: Authoring &amp; Publishing</h3>
<pre class="lang:shell">
dnf group install with-optional 'Authoring and Publishing'
</pre>
Includes <code>texlive, pdftk.</code>

<h3>Group: Engineering and Scientific</h3>
<pre class="lang:shell">
dnf group install 'Engineering and Scientific'
</pre>
Includes <code>R, gnuplot, maxima, octave, python-matplotlib, texmaker.</code>

<h2>Applications</h2>
<pre class="lang:shell">
dnf install amarok asymptote blender dropbox emacs filezilla guake meshlab
</pre>

There's an unofficial google drive client called <strike>Grive</strike> <a href="https://www.thefanclub.co.za/overgrive/installation-instructions-fedora">overGrive</a>. Licence ($4.99) is required. For installing zotero, I'm using Sebastiaan Mathôt's <a href="https://github.com/smathot/zotero_installer">zotero_installer</a>

<h2>Setting up Git</h2>

<pre class="lang:shell">
git config --global user.name "Tibor Stanko"
git config --global user.email *my@ema.il*
git config --global core.editor emacs
git config --global credential.helper cache
git config --global push.default simple
</pre>

<h2>Libs</h2>
Some additional libraries, mostly for my scientific activities: <code>GLEW, GLFW, Eigen, CGAL, libigl.</code> (See also <a href="http://libigl.github.io/libigl/tutorial/tutorial.html">libigl tutorial</a>.)
<pre class="lang:shell">
dnf install glew-devel glfw-devel eigen3-devel CGAL-devel
cd ~/Tibb/cplus
git clone --recursive https://github.com/libigl/triangle.git
git clone --recursive https://github.com/libigl/libigl.git
cd libigl/external
git clone --recursive https://github.com/libigl/CoMISo.git
</pre>


<h2>BitBucket stuff</h2>
<a href="http://haroldsoh.com/2011/10/07/clone-all-repos-from-a-bitbucket-source/">use this script to clone all repos at once</a>

<h2>Setting up Matlab</h2>
After installing Matlab from iso, I like to do some additional setting up. First, create a symlink to matlab executable in /usr/bin/:

<pre class="lang:shell">
ln -s /usr/local/MATLAB/R2014b/bin/matlab /usr/bin/matlab
</pre>

Second, we need to tell Gnome about Matlab by creating a <code>.desktop</code> entry:

<pre class="lang:shell">
vim /usr/share/applications/matlab.desktop
</pre>

Add the following to <code>matlab.desktop</code>:

<pre class="lang:shell">
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=Matlab2014b
Comment=Matlab:The Tool of Technical Computing
Exec=/usr/local/MATLAB/R2014b/bin/matlab -desktop
Icon=matlab
Categories=Development;Matlab;
</pre>


<h2>Additional desktops</h2>
Having an alternative desktop installed might be handy, in case Gnome gives you the jolly 'Oops! Something has gone wrong.'
<pre class="lang:shell">
dnf group install xfce-desktop
</pre>


<h2>Gnome tweaks</h2>
When everything's installed, let's make some final adjustements using the Gnome Tweak Tool.
<ul>
<li>increase font size</li>
<li>add startup applications (<code>guake</code>, <code>amarok</code>)</li>
<li>&hellip;</li>
</ul>

And we're good to go!

<h2>additional resources</h2>
<a href="http://www.tecmint.com/install-lamp-linux-apache-mysql-php-on-fedora-22/">LAMP on Fedora 22</a> [tecmint.com]
<a href="https://www.howtoforge.com/fedora-21-apache-mysql-php-lamp">LAMP on Fedora 21</a> [howtoforge.com]