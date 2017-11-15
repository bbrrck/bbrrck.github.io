---
layout      : post
title       : Zippering two pdfs
date        : 2017-09-01 00:00:00
permalink   : zippering-pdf.html
category    : cmd
---
If for some reason you have two pdfs with separated odd and even pages of a document, the following command zippers them into a single pdf.
(Assuming `odd.pdf` and `even.pdf` have the same number of pages; in this case 8.)

```bash
qpdf --empty --pages $(for i in $(seq 1 1 8); do echo " odd.pdf $i even.pdf $i "; done) -- all.pdf
```
