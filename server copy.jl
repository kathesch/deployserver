using HTTP
include("juliaserver/tictactoe.jl")

global A = zeros(3, 3)

function h(req)
    return HTTP.Response(200, read("juliaserver/index.html"))
end

function s(req)
    return HTTP.Response(200, read("juliaserver/tailwind/output.css"))
end

function reset(req)
    global A = zeros(3, 3)
    D = Dict(0 => "", 1 => "X", -1 => "O")
    board_update(A) = join(("""<div class="box" hx-put="tictactoe/message" hx-target="#board" id="$(i)">$(D[A'[i]])</div>""" for i in 1:9), "\n")
    return HTTP.Response(
        200,
        board_update(A)
    )
end

function message(req)
    index = Dict(req.headers)["HX-Trigger"] |> x -> parse(Int64, x)
    D = Dict(0 => "", 1 => "X", -1 => "O")
    board_update(A) = join(("""<div class="box" hx-put="tictactoe/message" hx-target="#board" id="$(i)">$(D[A'[i]])</div>""" for i in 1:9), "\n")

    if who_won(A) != Ongoing::Result
        return HTTP.Response(200, """<div id="youwin" hx-swap-oob="true">
        <span
          hx-put="tictactoe/reset"
          hx-target="#board"
          class="p-2 text-white bg-purple-500 border-2 border-solid border-black rounded"
          >Reset?</span
        >
      </div>""" * board_update(A))
    end

    A'[index] = 1
    if A[find_best_move(A)] == 0
        A[find_best_move(A)] = -1
    end

    return HTTP.Response(
        200,
        board_update(A)
    )
end

router = HTTP.Router()
HTTP.register!(router, "GET", "/tictactoe", h)
HTTP.register!(router, "GET", "/tictactoe/style.css", s)
HTTP.register!(router, "PUT", "/tictactoe/message", message)
HTTP.register!(router, "PUT", "/tictactoe/reset", reset)

# close(server)
# server = HTTP.serve!() do request::HTTP.Request
#     return resp = router(request)
# end

using Oxygen, HTTP

#write a middleware HTTP function which returns some stupid response


# function s(req)
#     return HTTP.Response(200, "Hello")
# end

# server = HTTP.serve(8080) do req
#     return resp = router(req)
# end
# close(server)

function mid(handler)
    return function st(req)
        if occursin("tictactoe", req.target)
            return router(req)
        else
            return handler(req)
        end
    end
end


staticfiles("Personal-Website-Julia/__site", "")


serve(middleware=[mid])
