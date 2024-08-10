# PlutoTurtles.jl
Learn Julia programming with interactive drawings and color!

[**Read the (interactive) featured notebook →**](https://featured.plutojl.org/basic/turtles.html)

https://github.com/user-attachments/assets/29953264-f364-4f47-98c6-533ce7218af8


# How to use

Open a Pluto notebook, and write:

```julia
using PlutoTurtles
```

Now you can start making turtle drawings! For example, you can make a triangle. Add a cell with this code:

```julia
@steps turtle_drawing() do t
    
    forward!(t, 3)
    right!(t, 60)

    forward!(t, 3)
    right!(t, 60)
    
    forward!(t, 3)
    right!(t, 60)
end
```

To learn more, [**read the (interactive) featured notebook →**](https://featured.plutojl.org/basic/turtles.html)
