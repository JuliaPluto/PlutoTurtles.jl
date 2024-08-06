module PlutoTurtles
include("./notebook.jl")
export @steps, turtle_drawing, turtle_drawing_fast, Turtle
export forward!, backward!, left!, right!, penup!, pendown!, color!
end