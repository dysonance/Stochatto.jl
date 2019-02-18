using Stochatto
using Test

@testset "Algorithms" begin
    N = 1000
    R = 0.01:0.01:0.99
    X = zeros((N, length(R)))
    for (j, rho) in enumerate(R)
        X[:,j] = acf_series(N, rho)
    end
    A = [cor(X[1:N-1,j], X[2:N,j]) for j in 1:size(X,2)]
    @test cor(A, R) >= 0.99
end
