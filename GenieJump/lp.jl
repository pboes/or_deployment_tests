using JuMP
using HiGHS

function solve_lp(b)
    model = Model(HiGHS.Optimizer)
    @variable(model, x >= 0)
    @variable(model, 0 <= y <= 3)
    @objective(model, Min, b*x + 20y)
    @constraint(model, c1, 6x + 8y >= 100)
    @constraint(model, c2, 7x + 12y >= 120)
    optimize!(model)
    return objective_value(model)
end
