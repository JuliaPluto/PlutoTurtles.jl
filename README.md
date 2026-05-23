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

# Testimonials

> Hi there @fonsp and friends!  
> This is not an actual issue, I just wanted to share a nice experience I've had with your package. Last week I was tasked with mentoring a group of students for an intro to programming, one of whom had never coded before (let's call them A). I tried having A do the same tasks as the rest of the group, but it ended up being too difficult since they had never encountered key concepts like variables and loops.  
> So in the end I had A work on the intro notebook with turtles, and it was a great educational tool! In the beginning A was skeptical, but then they started experimenting on their own by drawing increasingly complex shapes. The definite highlight was when A figured out it was possible to draw a near perfect circle using a regular polygon with enough vertices, Archimedes style 😎 When we said goodbye, A was wondering how to draw a stop sign using only the turtle.  
> Thanks again for your amazing work!

[gdalle](https://github.com/JuliaPluto/PlutoTurtles.jl/issues/2)

> Hey!
>
> Just used this to demonstrate cause (code) and effect (turtle moving graphics) to 3 year olds!
> They don't know words, so I had to use emojis instead! I think it worked! Will keep you posted
> Many thanks 🥰
