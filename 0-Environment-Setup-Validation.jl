# using Pkg
# Pkg.status()
# Pkg.add("DifferentialEquations")
# Pkg.add("Plots")

using DifferentialEquations
using Plots

## First the sample to make sure that basic package is working as expected.

f(u,p,t) = 1.01*u
u0 = 1/2
tspan = (0.0,1.0)
prob = ODEProblem(f,u0,tspan)
sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8)

plot(sol,linewidth=5,title="Solution to the linear ODE with a thick line",
     xaxis="Time (t)",yaxis="u(t) (in μm)",label="My Thick Line!") # legend=false
plot!(sol.t, t->0.5*exp(1.01t),lw=3,ls=:dash,label="True Solution!")

## And now an example from the book to see if I understand how to use the package.

vdp(du, u, p, t) = ((1-u^2)*du - u) / 0.3
vdpspan = (0.0, 20.0)
vdpprob = SecondOrderODEProblem(vdp, 0.0, 1.0, vdpspan)
vdpsol = solve(vdpprob)

plot(vdpsol)
