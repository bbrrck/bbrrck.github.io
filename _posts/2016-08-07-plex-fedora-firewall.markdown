---
layout:     post
title:      How to get Plex through the Fedora firewall
date:       2016-08-07 12:36:00
permalink:  plex-fedora-firewall
category:   fedora
---

before
http://bendavis.me/2015/03/29/setup-plex-media-server-on-fedora/

test to see if not app issue
https://192.168.0.17:32400/web/index.html
is not available

screenshot: plex settings, remote not working
(still accessible via indirect connection)

try disabling firewall:
https://www.reddit.com/r/Fedora/comments/2t8mzb/plex_and_fedora_21/

it works, so firewall issue

add plex ports
https://forums.plex.tv/discussion/132381/easy-firewalld-config

reboot

screenshot: plex settings, remote working
