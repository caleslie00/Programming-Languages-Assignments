fun merge (nil, nil) = nil
| merge (nil, h::t) = h::merge(nil, t)
| merge (h::t, nil) = h::merge(t, nil)
| merge (h::t, he::ta) = if h < he then h::merge(t,he::ta) else he::merge(h::t,ta);

fun listify [] = [[]]
  | listify (h::nil) = [[h]]
  | listify (h::t) = if h <= hd t then [h::(hd (listify t))]@(tl (listify t)) else [h]::(listify t);

fun cheatsort nil = []
  | cheatsort (h::nil) = [h]
  | cheatsort (h::t) = merge ([h], cheatsort t);
  
fun msort nil = []
  | msort (h::nil) = [h]
  | msort (h::t) = foldl merge (hd (listify (h::t))) (tl (listify (h::t)));