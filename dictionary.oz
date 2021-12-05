declare
fun {NewDictionary} %Creates a new diciotnary
    nil
end

fun {IsEmpty Dict}
    Dict == nil
end

fun {Insert Dict Key Value} %inserts a new value to a specific key of the dictionary
    case Dict of
    nil then
        [Key#Value]
    
    [] (K#V)|Dict2 andthen K==Key then %if the key exists, overwrites the value
        (Key#Value)|Dict2
    
    [] (K#V)|Dict2 andthen K > Key then %if the key doesn't exist (that's why K>Key), inserts the new key with the new value
        (Key#Value)|(K#V)|Dict2
    
    [] (K#V)|Dict2 andthen K < Key then %if it hasn't reached the key yet, calls the function again for the next elements
        (K#V)|{Insert Dict2 Key Value}
    end
end

fun {Get Dict Key}
    case Dict of
        nil then
            raise "Inexistent key" end
        [] (K#V)|Dict2 andthen K==Key then %found the value
            V
        
        [] (K#V)|Dict2 andthen K > Key then %there's not the key
            raise "Inexistent key" end

        [] (K#V)|Dict2 andthen K < Key then %keep looking for the key
            {Get Dict2 Key}
    end
end

fun {Size Dict} %Size of a Dictionary
    if {IsEmpty Dict} then
       0
    else
       case Dict of H|T then
          1+{Size T}
       end
    end
end

fun {Domain Dict} %returns a list of keys
    if{IsEmpty Dict} then
        nil
    else
        case Dict of (K#V)|Dict2 then
            K|{Domain Dict2}
        end
    end
end