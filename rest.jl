# rest.jl
using Genie
import Genie.Renderer.Json: json

include("lp.jl")

Genie.config.run_as_server = true

route("/") do
    (:message => solve_lp()) |> json
end

up()
