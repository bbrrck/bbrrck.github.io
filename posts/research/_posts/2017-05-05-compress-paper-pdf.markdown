---
layout      : post
title       : Compressing papers with ghostscript
date        : 2017-05-05 00:00:00
permalink   : compress-paper-pdf.html
category    : research
has_excerpt : true
excerpt_separator: <!--more-->
---

When searching for ways to compress the size of a ~50MB paper pdf,
I've discovered the following ghostscript command
([askUbuntu](https://askubuntu.com/a/256449/181265), [TeX StackExchange](https://tex.stackexchange.com/a/19047/45772))
```bash
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=compressed.pdf original.pdf
```

Argument of `-dPDFSETTINGS` can be any of:
```bash
-dPDFSETTINGS=/screen   # lower quality, smaller size.
-dPDFSETTINGS=/ebook    # for better quality, but slightly larger pdfs.
-dPDFSETTINGS=/prepress # output similar to Acrobat Distiller "Prepress Optimized" setting
-dPDFSETTINGS=/printer  # selects output similar to the Acrobat Distiller "Print Optimized" setting
-dPDFSETTINGS=/default
```
(descriptions copy-pasted from [askUbuntu](https://askubuntu.com/a/256449/181265))

I wrote a small script to test the different `-dPDFSETTINGS` modes.

<!--more-->

```bash
#!/bin/sh
file=paper
odir=compressed
declare -a pdfsettings=("screen" "ebook" "prepress" "printer" "default")
args="-sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH"
for mode in "${pdfsettings[@]}"
do
    # output file
   ofile=$odir/$file.$mode.pdf
   # compress with ghostscript
   gs $args -dPDFSETTINGS=/$mode -sOutputFile=$ofile $file.pdf
   # print size of the compressed file
   du -h $ofile
done
```

```bash
# output
912K	compressed/paper.screen.pdf
1.2M	compressed/paper.ebook.pdf
3.4M	compressed/paper.prepress.pdf
2.6M	compressed/paper.printer.pdf
9.9M	compressed/paper.default.pdf
```

<a title="click for higher resolution" href="/assets/gs-compress/full.jpg"><img src="/assets/gs-compress/preview.jpg" alt="comparison of gs pdf compression modes" /></a>
