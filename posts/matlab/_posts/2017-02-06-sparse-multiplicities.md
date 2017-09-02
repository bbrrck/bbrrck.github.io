---
layout      : post
title       : Array multiplicities via sparse
date        : 2017-02-06 00:00:00
permalink   : array-multiplicities-via-sparse.html
category    : matlab
---
Multiplicities of array elements can be efficiently computed using `sparse`.
I've found this elegant solution in an [old Newsgroup thread](http://fr.mathworks.com/matlabcentral/newsreader/view_thread/68132).

```matlab
% generate some data
A = randi(10,1,100);
% construct the sparse matrix
S = sparse(A,1,1);
% get unique elements and multiplicities
[uA,~,mult] = find(S);
```

```matlab
mult =
   (1,1)        8
   (2,1)       15
   (3,1)       11
   (4,1)        5
   (5,1)       10
   (6,1)        6
   (7,1)       10
   (8,1)       13
   (9,1)       13
  (10,1)        9
```

This method is faster than [other solutions](http://stackoverflow.com/questions/21710781/how-to-quickly-get-the-array-of-multiplicities/) -- almost twice as fast as `histc`.

```matlab
% test array: 2000 random integers from the set 1:1000
% 1000 iterations
Elapsed time is 0.228704 seconds. % histc
Elapsed time is 1.838388 seconds. % bsxfun
Elapsed time is 0.128791 seconds. % sparse
```
