fun last f [] = NONE
  | last f (h::t) = 
  		let val temp = last f t
  		in if isSome temp
  		   then temp
  		   else if f h then SOME h else NONE
  		end;