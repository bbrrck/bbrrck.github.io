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

### Chaikin

$$
\left\lbrace
\begin{align}
    \mathbf x_{2i  }^{n+1} & = \tfrac34 \mathbf x_i^n + \tfrac14 \mathbf x_{i+1}^n \\
    \mathbf x_{2i+1}^{n+1} & = \tfrac14 \mathbf x_i^n + \tfrac34 \mathbf x_{i+1}^n
\end{align}
\right.
$$
    
### Corner-cutting

For $0 < a < b < 1$ :

$$
\left\lbrace
\begin{align}
    \mathbf x_{2i  }^{n+1} & = (1-a) \mathbf x_i^n + a \mathbf x_{i+1}^n \\
    \mathbf x_{2i+1}^{n+1} & = (1-b) \mathbf x_i^n + b \mathbf x_{i+1}^n
\end{align}
\right.
$$

### 4-point scheme

$$
\left\lbrace
\begin{align}
    \mathbf x_{2i  }^{n+1} & = \mathbf x_i^n \\
    \mathbf x_{2i+1}^{n+1} & = \tfrac1{16} \left( - \mathbf x_{i-1}^n + 9 \mathbf x_{i}^n + 9 \mathbf x_{i+1}^n - \mathbf x_{i+2}^n \right)
\end{align}
\right.
$$


## ToDo
1.
