---
layout      : post
title       : Lerp vs Slerp
date        : 2018-05-06 00:00:00
permalink   : lerp-vs-slerp.html
category    : geometry
#has_excerpt : true
---

Here's a demonstration of the difference between two common unit vector interpolation schemes.

The first option is to use [linear interpolation](https://en.wikipedia.org/wiki/Linear_interpolation)
in the ambient Euclidean space, followed by a normalization step. Simple and fast,
but the angular velocity is not uniform.

$$
\mathbf v = (1-t) \, \mathbf v_0 + t \, \mathbf v_1
$$

[Spherical linear interpolation](https://en.wikipedia.org/wiki/Slerp)
produces uniform angular velocity at the expense of non-linear computation.
Slerp is commonly used to interpolate between rotations represented by quaternions.

$$
\mathbf v =
\frac{\sin{[(1-t) \theta]}}{\sin{\theta}} \, \mathbf v_0
+
\frac{\sin{[t \theta]}}{\sin{\theta}} \, \mathbf v_1
$$

<div style="text-align:center;margin-top:2em;">
  <canvas id="canvas" width="500" height="500">
  Your browser does not support the HTML5 canvas tag.</canvas>
  <script>
  var canvas = document.getElementById('canvas');
  if (canvas.getContext) {

    // animation
    const t_step = 0.02;
    var t = 0;
    var is_animating = false;

    // rendering parameters : circle
    const cx = 250;
    const cy = cx;
    const rad = 0.95*cx;

    // angle in [-Pi,PI]
    var theta = 0.75 * Math.PI;

    // start vector
    var T0x = Math.cos(theta);
    var T0y = Math.sin(theta);

    // end vector = [1, 0]
    const T1x = 1.;
    const T1y = 0.;

    // current vector
    var Tx;
    var Ty;

    // list of intermediate vectors
    var x = []
    var y = []

    canvas.addEventListener('click', function(event) {
      if (is_animating) return;

      // reset intermediate vectors
      x = [];
      y = [];

      // get vector from cursor position
      tx = event.offsetX - cx;
      ty = event.offsetY - cy;

      // norm of the vector
      norm = Math.sqrt( tx*tx + ty*ty );

      // update
      theta = Math.atan2(-ty/norm,tx/norm);
      T0x = Math.cos(theta);
      T0y = Math.sin(theta);
      console.log(theta);
    }, false);

    var ctx = canvas.getContext('2d');

    // requestAnimationFrame callback
    var requestAnimationFrame = function(callback) { return setTimeout(callback, 40); };

    var render = function(){
      // clear the canvas
      ctx.clearRect(0, 0, canvas.width, canvas.height);

      // draw circle, part 1
      ctx.beginPath();
      if(theta > 0)
        ctx.arc(cx,cy,rad,0,-theta);
      else
        ctx.arc(cx,cy,rad,-theta,0);
      ctx.strokeStyle="#1f87ea";
      ctx.stroke();

      // draw circle, part 2
      ctx.beginPath();
      if(theta > 0)
      ctx.arc(cx,cy,rad,-theta,0);
      else
        ctx.arc(cx,cy,rad,0,-theta);
      ctx.strokeStyle="#ccc";
      ctx.stroke();

      // draw T
      if( t > 0 && t <= 1 ){
        ctx.beginPath();
        ctx.moveTo(cx,cy);
        ctx.lineTo( cx+rad*Tx, cy-rad*Ty );
        ctx.strokeStyle="#1f87ea";
        ctx.stroke();
      }

      // draw T0
      ctx.beginPath();
      ctx.moveTo(cx,cy);
      ctx.lineTo(cx+rad*T0x,cy-rad*T0y);
      ctx.strokeStyle="#f00";
      ctx.stroke();

      // draw T1
      ctx.beginPath();
      ctx.moveTo(cx,cy);
      ctx.lineTo(cx+rad*T1x,cy-rad*T1y);
      ctx.strokeStyle="#f00";
      ctx.stroke();

      // draw intermediate points
      for (var i=0; i<x.length; i++) {
        ctx.beginPath();
        ctx.arc(cx+rad*x[i],cy-rad*y[i],2,0,2*Math.PI);
        ctx.fillStyle="#f00";
        ctx.fill();
      }

      // redraw
      requestAnimationFrame(render);
    };

    // initial render
    render();

    // linear interpolation
    var interpolate = function(SLERP) {
      if( is_animating ) return;
      // reset
      t = 0;
      x = [];
      y = [];
      is_animating = true;

      var step = function() {

        if( SLERP ){
          // spherical linear interpolation
          var w0 = Math.sin((1-t) * theta) / Math.sin(theta);
          var w1 = Math.sin(   t  * theta) / Math.sin(theta);
        } else {
          // linear interpolation
          var w0 = (1-t);
          var w1 = t;
        }

        // interpolate
        Tx = w0 * T0x + w1 * T1x;
        Ty = w0 * T0y + w1 * T1y;

        if( SLERP )
          var norm = 1.0;
        else
          var norm = Math.sqrt(Tx*Tx + Ty*Ty);

        // push the new vector to the list
        x.push(Tx / norm);
        y.push(Ty / norm);

        if (t <= 1) {
          requestAnimationFrame(step);
        } else {
          is_animating = false;
        }
        t += t_step;
      };
      return step();
    };
  };
  </script>
  <br />
  <button type="button" onclick="interpolate(false)">Lerp</button>
  <button type="button" onclick="interpolate(true)">Slerp</button>
</div>
