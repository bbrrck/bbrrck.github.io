---
layout      : post
title       : Push to all git remotes at once
date        : 2017-05-11 00:00:00
permalink   : git-push-all-remotes.html
category    : git
---
```bash
git remote | xargs -L1 git push --all
```

<p style="text-align:right;color:silver;">
[<a href="http://stackoverflow.com/a/18674313/1606707">source</a>]
</p>
