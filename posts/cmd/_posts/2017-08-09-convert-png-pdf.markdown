---
layout      : post
title       : A bunch of png to pdf
date        : 2017-08-09 00:00:00
permalink   : convert-png-pdf.html
category    : cmd
---

```bash
for file in *.png; do convert $file ${file%.png}.pdf; done
```
