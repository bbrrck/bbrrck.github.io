---
layout      : post
title       : Auto reload Latex-generated pdfs on MacOS
date        : 2018-12-16 00:00:00
permalink   : autoreload-latex-pdf-macos.html
category    : macos
#has_excerpt : true
#excerpt_separator: <!--more-->
---

I like to write my Latex docs in [Atom](https://atom.io/) and use [Latexmk](http://personal.psu.edu/jcc8//software/latexmk-jcc/) to watch for changes and recompile everything automatically. The problem is that on macOS, there aren't that many pdf viewers supporting automatic file reload  (e.g. in Adobe Acrobat there is no such feature). I was using [Skim](https://skim-app.sourceforge.io/), which *can* reload changed files, but it stopped working: it still syncs the file after the first few updates, but then it stops for some reason (no idea why).

A solution is to open the pdf in [TeXShop](https://pages.uoregon.edu/koch/texshop/) and keep editing the tex file in Atom, as described in [this StackExchange post](https://tex.stackexchange.com/a/43059/45772). TeXShop steals window focus when it reloads the pdf, which is very annoying -- fortunately, this can be prevented by executing the following in the terminal (kudos to this [comment](https://tex.stackexchange.com/a/43059/45772/#comment434276_43059)):

```bash
defaults write TeXShop BringPdfFrontOnAutomaticUpdate NO
```
