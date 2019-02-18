using Statistics

function acf_series(n::Int, rho::Float64)::Vector{Float64}
    out = zeros(n)
    out[1] = randn()
    @inbounds for i in 2:n
        out[i] = randn() + out[i-1]*rho
    end
    return out
end
