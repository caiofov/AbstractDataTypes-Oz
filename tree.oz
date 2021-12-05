declare
fun {NewTree} %creates a new tree
    leaf
end

fun {Insert Tree Key Value}
    case Tree of
        leaf then %if tree is empty
            tree(Key Value leaf leaf)

        [] tree(K V T1 T2) andthen Key == K then %found the key
            tree(Key Value T1 T2)

        [] tree(K V T1 T2) andthen Key > K then %key is greater than the current node -> go to right node
            tree(K V T1 {Insert T2 Key Value})
            
        [] tree(K V T1 T2) andthen Key < K then %key is smaller than the current node -> go to left node
            tree(K V {Insert T1 Key Value} T2)
    end
end

declare Tree
Tree = {NewCell {NewTree}}
Tree := {Insert @Tree 1 3}
Tree := {Insert @Tree 0 4}
{Browse @Tree}