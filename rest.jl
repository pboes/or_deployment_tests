# rest.jl
using Genie
import Genie.Renderer.Json: json

include("lp.jl")

Genie.config.run_as_server = true

route("/") do
    b = params(:b, 2)
    (:message => solve_lp(parse(Int,b))) |> json
end

up()
