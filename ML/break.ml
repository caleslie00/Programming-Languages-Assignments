fun addToAll c [] = []
    | addToAll c (h::t) = (c^h)::(addToAll (c^h) (t));

fun createAll [] = []
    | createAll (h::t) = h::(addToAll h t)@(createAll t);

fun listify nil = nil : string list list
  | listify [x] = [[x]]
  | listify (x::y::z) =
        let val (h::t) = listify (y::z)
        in if x <= y 
        then (x::h)::t
        else [x]::(h::t)
        end;

fun merge ([],[]) = [] : string list
    | merge ([],x::y) = x::merge([],y)
    | merge (h::t,[]) = h::merge(t,[])
    | merge (h::t,x::y) = if h < x then h::merge(t,x::y) else x::merge(h::t,y);

fun mlergesort [] = [] : string list
    | mlergesort (h::nil) = [h]
    | mlergesort (h::t) = foldl merge (hd(listify(h::t))) (tl(listify(h::t)));

fun remDupes [] : string list = []
    | remDupes [h] = [h]
    | remDupes (x::y::z) = if x = y then remDupes (x::z) else x::remDupes(y::z);

fun break "" = [] : string list
    | break s = remDupes (mlergesort (createAll (map str (explode s))));