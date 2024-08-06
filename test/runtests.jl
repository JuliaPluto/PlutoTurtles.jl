using PlutoTurtles
using Test


d1 = turtle_drawing() do t::Turtle
    forward!(t, 10)
    backward!(t, 10)
    left!(t, 90)
    right!(t, 90)
    penup!(t)
    pendown!(t)
    color!(t, "pink")
end

d2 = turtle_drawing_fast() do t::Turtle
    forward!(t, 10)
    backward!(t, 10)
    left!(t, 90)
    right!(t, 90)
    penup!(t)
    pendown!(t)
    color!(t, "pink")
end
