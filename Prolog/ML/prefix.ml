fun prefix ([], h::t) = true
 | prefix (h::t, he::ta) = if h = he then prefix (t, ta) else false;
