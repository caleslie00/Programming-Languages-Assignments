fun first f [] = NONE
  | first f (h::t) = if f h then SOME h else first f t; 