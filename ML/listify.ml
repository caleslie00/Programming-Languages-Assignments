fun listify [] = [[]]
  | listify (h::nil) = [[h]]
  | listify (h::t) = if h <= hd t then [h::(hd (listify t))]@(tl (listify t)) else [h]::(listify t);

fun listify nil = nil
  | listify [x] = [[x]]
  | listify (x::y::z) =
  		let val (h::t) = listify (y::z)
  		if x <= y
  		then (x::h)::t
  		else [x]::(h::t)
  		end;