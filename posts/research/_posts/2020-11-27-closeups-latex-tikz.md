---
layout      : post
title       : 'Auto close-ups in Latex + Tikz'
date        : 2020-11-27 00:00:00
permalink   : closeups.html
category    : research
has_excerpt : true
---

In Latex + Tikz, you can automatically and *easily* create close-ups using the spy library.

![Example of a figure with close-ups generated using Latex and Tikz spy library.](/assets/closeup-example.png)

At the end of this post, I provide the full code used to generate this image. Let's break down one of the lines, slightly simplified for this example:

<!--more-->

```latex
\spy [closeup,magnification=2] on (FigA) 
    in node[largewindow,anchor=north west] at (FigA.north east);
```
- `\spy [...,magnification=2]` creates a spy window with zoom-in level set to `2`.
- `on (FigA)` places the small window to the center of `FigA`.
- `node[...,anchor=north west] at (FigA.north east)` creates a magnified version of the small window such that its top left corner (north west) touches the top right corner of the figure (north east). The properties width and height in closeup control the size of the larger window.
- The size of the small window is computed automatically from width and height of the larger window and the level of magnification.

You can of course move the small window around, for instance by providing a relative position w.r.t. the center of the figure: `on ($(FigA)+(-0.1,-0.1)$)`. Same goes for the position of the large window. As soon as you have everything set-up, it's very easy to change the level of magnification or the position of the small window – no stress of last-minute deadline fiddling in Illustrator!

Here is the full code:

```latex
\documentclass[10pt,tikz,crop,varwidth,border=1pt]{standalone}
\usepackage{graphicx,tikz,libertine,xcolor}
\usetikzlibrary{calc,spy}
\tikzstyle{closeup} = [
  opacity=1.0,          % opacity of both windows
  height=0.9cm,         %  height of large window
  width=0.9cm,          %   width of large window
  connect spies, green  % connects big and small window by a green line
]
\tikzstyle{largewindow} = [red, line width=0.50mm]
\tikzstyle{smallwindow} = [blue,line width=0.20mm]
\begin{document}
\begin{tikzpicture}[x=6cm, y=6cm, spy using outlines={every spy on node/.append style={smallwindow}}]
\node[anchor=south] (FigA) at (0,0) {\includegraphics[height=3cm]{example-image-a}};
\spy [closeup,magnification=2] on ($(FigA)+(+0.1,+0.1)$) 
    in node[largewindow,anchor=north west] at ($(FigA.north east) - (0,0.02)$);
\spy [closeup,magnification=3] on ($(FigA)+( 0.0, 0.0)$) 
    in node[largewindow,anchor=west]       at ($(FigA.east)$);
\spy [closeup,magnification=4] on ($(FigA)+(-0.1,-0.1)$) 
    in node[largewindow,anchor=south west] at ($(FigA.south east) + (0,0.02)$);
\node [anchor=north] at ($(FigA.south)$) {\sf left};
%
\node[anchor=south] (FigB) at (1.0,0) {\includegraphics[height=3cm]{example-image-b}};
\spy [closeup,magnification=2] on ($(FigB)+(+0.1,+0.1)$) 
    in node[largewindow,anchor=north west] at ($(FigB.north east) - (0,0.02)$);
\spy [closeup,magnification=3] on ($(FigB)+( 0.0, 0.0)$) 
    in node[largewindow,anchor=west]       at ($(FigB.east)$);
\spy [closeup,magnification=4] on ($(FigB)+(-0.1,-0.1)$) 
    in node[largewindow,anchor=south west] at ($(FigB.south east) + (0,0.02)$);
\node [anchor=north] at ($(FigB.south)$) {\sf right};
\end{tikzpicture}
\end{document}
```
