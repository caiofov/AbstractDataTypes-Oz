declare
fun {NewStack} /*creates a new stack*/
   nil
end

fun {Push Stack Element} /*adds a new element on the top of the stack*/
   if {IsEmpty Stack} then
      [Element]
   else
      Element|Stack
   end

end

fun {Pop Stack Element} /*removes the element on the top of the stack*/
   case Stack of X|Tail then
      Element=X
      Tail
   end
end

fun {IsEmpty Stack} /*checks if the stack is empty*/
   Stack==nil
end

fun {Size Stack} %Size of a stack
   if {IsEmpty Stack} then
      0
   else
      case Stack of H|T then
         1+{Size T}
      end
   end
end

fun {Sum Stack} %sum of all elements
   if {IsEmpty Stack} then
      0
   else
      case Stack of H|T then
         H+{Sum T}
      end
   end
end