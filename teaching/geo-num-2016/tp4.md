---
layout: tp-geo-num-2016
title: "TP4 : Subdivision curves"
date:   2016-03-04
permalink: /teaching/geo-num-2016/tp4.html
---

## Code
Do
{% highlight bash %}
git pull
{% endhighlight %}
or, if you don't have the local repo,
{% highlight bash %}
git clone https://github.com/bbrrck/geo-num-2016.git
{% endhighlight %}
As usual, test by
{% highlight bash %}
cd TP4/
mkdir build
cd build
cmake ..
make
./geonum_TP4 simple
{% endhighlight %}

## Subdivision Curves
A subdivision curve is defined as the limit of recursive refinement of the input polyline $\mathbf x_i = \mathbf x_i^0$.
Your today's task is to implement three curve subdivision schemes from lecture.
For the sake of simplicity, we will be only working with closed curves.
The three schemes are the following.

### Chaikin

$$
\left\lbrace
\begin{align}
    \mathbf x_{2i  }^{k+1} & = \tfrac34 \mathbf x_i^k + \tfrac14 \mathbf x_{i+1}^k \\
    \mathbf x_{2i+1}^{k+1} & = \tfrac14 \mathbf x_i^k + \tfrac34 \mathbf x_{i+1}^k
\end{align}
\right.
$$
    
### Corner-cutting

$ 0 < a < b < 1 $ :

$$
\left\lbrace
\begin{align}
    \mathbf x_{2i  }^{k+1} & = (1-a) \mathbf x_i^k + a \mathbf x_{i+1}^k \\
    \mathbf x_{2i+1}^{k+1} & = (1-b) \mathbf x_i^k + b \mathbf x_{i+1}^k
\end{align}
\right.
$$

### 4-point scheme

$$
\left\lbrace
\begin{align}
    \mathbf x_{2i  }^{k+1} & = \mathbf x_i^k \\
    \mathbf x_{2i+1}^{k+1} & = \tfrac1{16} \left( - \mathbf x_{i-1}^k + 9 \mathbf x_{i}^k + 9 \mathbf x_{i+1}^k - \mathbf x_{i+2}^k \right)
\end{align}
\right.
$$


## ToDo
1. Implement the three subdivision schemes for closed curves.
2. Test your implementation on the `simple` and `infinity` datasets.
   Visualise by `python ../plots/plot.py infinity`.
3. Experiment with different values of $a,b$ in corner cutting. Specifically, try using
     - $b=a+\frac12$
     - $b \neq a+\frac12$
   
   What do you observe?
