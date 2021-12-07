declare
fun {NewQueue} %creates a new queue
    queue(nil nil)
end

fun {Check Queue}
    case Queue of q(nil Back) then
        queue({Reverse Back} nil)
    else
        Queue 
    end
end

fun {Insert Queue X}
    case Queue of queue(Front Back) then
        {Check queue(Front X|Back)}
    end
end

fun {Delete Queue X}
    case Queue of 
    q(Front Back) then
        F1 in 
            Front = X|F1
            {Check queue(F1 Back)}
    [] q(nil nil) then
        raise "Empty queue" end
    end
end

fun {IsEmpty Queue}
    case Queue of queue(Front Back) then
        Front == nil
    end
end


declare Q 
Q = {NewQueue}

{Browse {IsEmpty Q}}
