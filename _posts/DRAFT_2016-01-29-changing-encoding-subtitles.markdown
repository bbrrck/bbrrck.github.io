---
layout: post
title:  "Converting subtitles to UTF-8"
date:   2016-01-29 15:00:00
permalink: subtitles-utf8
draft: true
---

[Plex](https://plex.tv/) and
[chromecast](www.google.com/chromecast)
is quite a powerful combination. No more HDMI cables!

One thing that sucks is watching 
[Bron/Broen](http://www.imdb.com/title/tt1733785/)

{% highlight bash %}
iconv -f cp1250 -t UTF-8 subs_cp1250.srt > subs_utf8.srt
{% endhighlight %}

[stackoverflow:64860](https://stackoverflow.com/questions/64860/)