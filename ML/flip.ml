fun flip [] = []
 | flip (h::nil) = [h]
 | flip (h::t) = [hd t]@[h] @ flip(tl t);