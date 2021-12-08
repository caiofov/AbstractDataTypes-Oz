declare
fun {Length List} %returns the length of a list
    case List of
    nil then
        0
    [] _|L then
        1+{Length L}
    end
end

fun {Append List X} %add X to the end of the list
    case List of
    nil then
        X
    [] E|L then
        E|{Append L X}
    end
end

fun {GetElement List Index} %returns an element of the list (using a given index)
    if Index == 1 then
        List.1
    elseif Index > 1 then
        {GetElement List.2 Index-1}
    end
end

fun {Reverse L}
    case L of nil then
        nil
    [] X|Xr then
        {Append {Reverse Xr} [X]}
    end
end

fun {Sum L}
    case L of
    nil then
        0
    [] E1|L1 then
        E1+{Sum L1}
    end
end

{Browse {Sum [1 2 3]}}