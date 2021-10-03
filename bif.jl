function orbit_log_map(xi,it) # condiții inițiale și numărul de iterații

f(x0,r) = x0*r*(1-x0) #funcția logistică
r = 2:0.001:4 #intervalul parametrilor
nr = length(r)
M = zeros(Float64, (it*nr+1,2)) 

q = 2
M[q-1,1] = xi #condiții inițiale
for ri in r   
    M[q-1,2] = ri
    p = q:1:(q+it-1)
    for t in p
        M[t,2] = ri
        M[t,1] = f(M[t-1,1], ri) #Încarcă rezultatele
    end
    q = q+it
end
return M
end

M = orbit_log_map(0.3,100) 

using PyPlot
pygui(true)
ps = scatter(M[:,2],M[:,1], s=0.1,label = L"Bifurcația modelului logistic x_{t+1}=x_t*(1+r*(1-x_t))")
title(L"Bifurcația modelului logistic $x_{t+1}=r*x_t*(1-x_t)$")
xlabel("Parametrul (r)")
ylabel(L"x_{t+1}")

