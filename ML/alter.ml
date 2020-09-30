fun alter [] = 0
  | alter (h::nil) = h
  | alter (h::t::z) = h-t + alter z;