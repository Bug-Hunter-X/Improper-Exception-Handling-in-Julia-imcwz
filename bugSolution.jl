```julia
function myfunction(x)
  if x > 0
    return x^2
  elseif x == 0
    return 0
  else
    return -1  # Return a value instead of throwing an error
  end
end

println(myfunction(2))
println(myfunction(0))
println(myfunction(-2))

#Alternative solution using try...catch
function myfunction_trycatch(x)
  try
    if x < 0
      throw(DomainError(x, "x must be non-negative"))
    end
    return x^2
  catch e
    if isa(e, DomainError)
      println("Error: ", e.msg)
      return NaN #or some other default value
    else
      rethrow(e) #Rethrow unexpected exceptions
    end
  end
end

println(myfunction_trycatch(2))
println(myfunction_trycatch(0))
println(myfunction_trycatch(-2))
```