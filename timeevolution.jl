using LinearAlgebra
using Plots


function hamiltonian(n::Int)
   matrix = zeros(n, n)
   for i in 1:n-1
      matrix[i+1,i] = 1
      matrix[i,i+1] = 1

   end
   return matrix
end

function timeevolution(n::Int,t::Float64)
    psi = zeros(n, 1)
    psi[1,1] = 1
    psifinal = exp(-im*(hamiltonian(n))*t)*psi
    return psifinal
end

function timeevplot(n::Int, t::Float64)
    vector = timeevolution(n, t)
    output = []
    for i in vector
        push!(output, i * conj(i))
    end
    plot(1:n, output)
end

t_values = range(0, stop=50, length=300)
plots = []

@gif for t in t_values
    timeevplot(50, t)
end