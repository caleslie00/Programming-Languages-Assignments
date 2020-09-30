fun cycle ((h::t),0) = h::t 
 | cycle ((h::t),n) = cycle (t @ [h],n-1);