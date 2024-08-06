# PlutoTurtles.jl
Learn Julia programming with interactive drawings and color!


https://github.com/user-attachments/assets/29953264-f364-4f47-98c6-533ce7218af8


# Not yet released

This package is not yet released! But will be released soon. Until then, you can use it like so in Pluto:


```julia
begin
    import Pkg
    # activate a temporary environment
    Pkg.activate(mktempdir())
    Pkg.add([
        Pkg.PackageSpec(url="https://github.com/JuliaPluto/PlutoTurtles.jl"),
        Pkg.PackageSpec(name="PlutoUI", version="0.7"),
    ])
    using PlutoTurtles, PlutoUI
end
```

