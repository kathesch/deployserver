

#=
We slide along the string looking one ahead and adding each element to the stack. 
If we have a + registered and see another + ahead, we can call reduce. 
If we have a + registered and see a * ahead, we have to wait. 
If we have * registered and see a * ahead, we call reduce
If we have * registered and see a + ahead we call reduce
=#
function tokenize(str)
    words = String[]
    stack = ""
    for i in str
        if i in "+-*/"
            push!(words, stack)
            push!(words, string(i))
            stack = ""
        else
            stack *= i
        end
    end
    push!(words, stack)
    push!(words, "\$")
    return words
end

function reduced!(stk)
    while length(stk) >= 3
        a,op,b = [pop!(stk) for i in 1:3]
        a,b = (parse(Float64, a), parse(Float64, b))

        result = if op== "*"
            b*a 
        elseif op == "/"
            b/a 
        elseif op == "+"
            b+a
        elseif op == "-"
            b-a
        end

        push!(stk, string(result))
    end
end

function calculate(str)
    tkn = tokenize(str)
    stk = String[]
    for (i,val) in enumerate(tkn)
        if val == "\$" break end
        lookahead = tkn[i+1]
        push!(stk, val)
        if lookahead ∉ ["*", "/"] && val ∉ ["*", "/"]
            try reduced!(stk) catch; stk = ["Error"] end
        end
    end
    return stk[1]
end
str = "2-3*2/3"
calculate(str)
Meta.parse(str) |> eval



    
### Scratch work



str = "2-3*2/3"
tkn = tokenize(str)

stk = []
precedence = 0
stateful_tkn = Iterators.Stateful(tkn)
for i in stateful_tkn
    lookahead = peek(stateful_tkn)
    
    push!(stk, i)
    
    if lookahead ∉ ["*", "/"] && i ∉ ["*", "/"]
    while length(stk) >= 3
        println(stk)
        reduced!(stk)
    end
end
stk

Meta.parse(str) |> eval

function reduced!(stk)
    a,op,b = [pop!(stk) for i in 1:3]
    a,b = (parse(Float64, a), parse(Float64, b))
    
    result = if op== "*"
        b*a 
    elseif op == "/"
        b/a 
    elseif op == "+"
        b+a
    elseif op == "-"
        b-a
    end
    push!(stk, string(result))
end



end
stk

Meta.parse(str) |> eval


function reduced!(stk)
    a,op,b = [pop!(stk) for i in 1:3]
    
    if op== "*"
        result = parse(Float64, b) * parse(Float64, a) |> string
    elseif op =="/"
        result = parse(Float64, b) / parse(Float64, a) |> string
    elseif op == "+"
        result = parse(Float64, b) + parse(Float64, a) |> string
    elseif op == "-"
        result = parse(Float64, b) - parse(Float64, a) |> string
    end
    push!(stk, result)
end

function reduce_multiply!(stk)
    a,b = [pop!(stk) for i in 1:2]
    result = parse(Float64, a) * parse(Float64, b) |> string
    push!(stk, result)
end

for i in reverse(ops)
    if i == "*" reduce_multiply!(tkn) end
    if i == "+" reduce_add!(tkn) end
end

tkn

Meta.parse(str) |> eval








operators = eachmatch(r"[\+\-\*\/]", str) |> collect

filter(contains(r"[\+\-\*\/]"), split(str,""))


filter(occursin("+*"), split(str, ""))

split(str, r"[+*]")

join(split(str, ""),',')


function tokenize(str)
    words = String[]
    stack = ""
    for i in str
        if i in "+*"
            push!(words, stack, string(i))
            stack = ""
            continue
        end
        stack *= i
    end
    if !isempty(stack) push!(words,stack) end
    return words
end

str = "1+222*2"
tkn = tokenize(str)

a = @view tkn[(1:3) .+ 1]

if a[2] == "+"
    parse(Float64, a[1]) + parse(Float64, a[3])
end

if a[2] == "*"
    parse(Float64, a[1]) + parse(Float64, a[3])
end

str = "1+34*2"

tkn = tokenize(str)



reduce_multiply!(tkn)


Meta.parse(str) |> eval

function reduce_add!(stk)
    a,_,b = [pop!(stk) for i in 1:3]
    result = parse(Float64, a) + parse(Float64, b) |> string
    push!(stk, result)
end

function reduce_multiply!(stk)
    a,_,b = [pop!(stk) for i in 1:3]
    result = parse(Float64, a) * parse(Float64, b) |> string
    push!(stk, result)
end


a = ["1", "*", "2"]

reduce_multiply!(a)





records=["a", "b", "c"]
itr = Iterators.Stateful(records)

for i in itr
    if peek(itr) == nothing
        println(" <- that was the penultimate value")
    end
    println(i)
end

if i == "+" precedence=1 end
    if i == "*" precendence=2 end
    if lookahead == "+" && precendence <= 1
        while length(stk) != 1
            reduce_add!(stk)
        end
        precendence = 0
    end

    if lookahead == "*"

    push!(stk, i)
    if lookahead === nothing
        while length(stk) != 1
            reduce_multiply!(stk)
        end
        while length(stk) != 1
            reduce_add!(stk)
        end
        break
    end



if i == "+"
    precedence = 1
end
if i == "*"
    precendence = 2
end




operands = split(str, r"[\+\-\*\/]")
