### A Pluto.jl notebook ###
# v0.19.45

using Markdown
using InteractiveUtils

# ╔═╡ 1cca3d6d-a40a-455c-84d3-dec04f0b496a
using AbstractPlutoDingetjes, HypertextLiteral

# ╔═╡ e814a124-f038-11ea-3b22-f109c99dbe03
import PlutoUI

# ╔═╡ 50f734b3-ec1b-45fa-a9f3-8d007237842f
# ╠═╡ skip_as_script = true
#=╠═╡
import PlutoUI: Slider, ColorStringPicker, CounterButton
  ╠═╡ =#

# ╔═╡ 925a66b2-3564-480c-be12-0e626b01362f
# ╠═╡ skip_as_script = true
#=╠═╡
@bind fun_angle Slider(0:180)
  ╠═╡ =#

# ╔═╡ c347a8ad-c859-4eb2-8fdc-bb7f04c7f70e
# ╠═╡ skip_as_script = true
#=╠═╡
@bind second_color ColorStringPicker()
  ╠═╡ =#

# ╔═╡ fac4f50a-ce65-4f22-af23-0fc73af936f2
#=╠═╡
fun_angle, second_color
  ╠═╡ =#

# ╔═╡ ea5f57d5-1396-4d66-885e-bc08864475c1
md"""
## Functions

You can extract some code into a function, and reuse it later! Here is some code that draws a house, and we can use it to make a street!
"""

# ╔═╡ 9a900923-e407-44a0-823a-f911a22a5ada
html"""
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
"""

# ╔═╡ 553d0488-f03b-11ea-2997-3d82493cd4d7
md"# Some famous artwork"

# ╔═╡ 25dc5690-f03a-11ea-3c59-35ae694b03b5
md"""## "_The Starry Night_" 
Vincent van Gogh (1889)"""

# ╔═╡ 064091ae-b4bb-4e7d-829b-b48d98e5cca0
# ╠═╡ skip_as_script = true
#=╠═╡
@bind GO_gogh CounterButton("Another one!")
  ╠═╡ =#

# ╔═╡ 5d345ae8-f03a-11ea-1c2d-03f66115b590
md"""## "_Tableau I_"
Piet Mondriaan (1913)"""

# ╔═╡ b3f5877c-b3e9-11ea-03fe-3f3233ee2e1b
# ╠═╡ skip_as_script = true
#=╠═╡
@bind GO_mondriaan CounterButton("Another one!")
  ╠═╡ =#

# ╔═╡ cd442606-f03a-11ea-3d53-57e83c8cdb1f
md"""## "_Een Boom_"
Luka van der Plas (2020)"""

# ╔═╡ 4c1bcc58-b3ec-11ea-32d1-7f4cd113e43d
# ╠═╡ skip_as_script = true
#=╠═╡
@bind fractal_angle Slider(0:90; default=49)
  ╠═╡ =#

# ╔═╡ a7e725d8-b3ee-11ea-0b84-8d252979e4ef
# ╠═╡ skip_as_script = true
#=╠═╡
@bind fractal_tilt Slider(0:90; default=36)
  ╠═╡ =#

# ╔═╡ 49ce3f9c-b3ee-11ea-0bb5-ed348475ea0b
# ╠═╡ skip_as_script = true
#=╠═╡
@bind fractal_base Slider(0:0.01:2; default=1)
  ╠═╡ =#

# ╔═╡ f132f376-f03a-11ea-33e2-775fc026faca
md"""## "_Een coole spiraal_" 
fonsi (2020)"""

# ╔═╡ 70160fec-b0c7-11ea-0c2a-35418346592e
# ╠═╡ skip_as_script = true
#=╠═╡
@bind angle Slider(0:90; default=20)
  ╠═╡ =#

# ╔═╡ 15b677af-5a9e-4c51-b8f4-0defe6de6acf
html"""
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
"""

# ╔═╡ ab083f08-b0c0-11ea-0c23-315c14607f1f
md"""
# 🐢 Behind the scenes

The code below defines the `turtle_drawing` and `forward!` etc functions.

These functions are not available by default in Julia or Pluto. If you make another notebook where you want to make turtle drawing, you have two options:
- Make a copy of this notebook, and remove all the exercises and demos above.
- Make an empty notebook, and copy all the cells below into the new notebook.

## How it works
The basic idea of the turtle notebook is quite simple: the `turtle_drawing` function outputs an SVG drawing. For example, this code:

```julia
turtle_drawing_fast() do t

	color!(t, "red")
	forward!(t, 5)

	right!(t, 90)

	color!(t, "pink")
	forward!(t, 10)

end
```

Outputs this SVG:

```svg
<svg version="1.1"
   baseProfile="full"
   width="300" height="300"
   xmlns="http://www.w3.org/2000/svg">

<rect width="300" height="300" rx="10" fill="white" />

<line x1="150.0" y1="150.0" x2="150.0" y2="100.0" stroke="red" stroke-width="4" />
<line x1="150.0" y1="100.0" x2="250.0" y2="100.0" stroke="pink" stroke-width="4" />

</svg>
```

SVG is actually quite easy to generate by hand, so that's what we did! The `Turtle` object (`t`) contains some internal state, like its current position, heading and color. Every time that `forward!` is called, a piece of SVG code is added to a vector: `"<line .../>"`. At the end, all these pieces are `join`ed together, and voilà!

The functions `right!`, `color!`, etc were easy to implement. Take a look!

If you want to understand the code, then the [original prototype](https://gist.github.com/fonsp/d88b3adc8c958dce780cf7c4df8fa437) might be easier to understand, since it does not contain any of the interactive functionality yet.

### Interactive functionality
There are two cool bonus features to help users debug their code: an **animated turtle character 🐢** and the **`@steps` macro** to highlight the line of code that corresponds to the current animation step.


#### Animated turtle character 🐢
The turtle character moves slowly, but this is not done by running the Julia code slowly (with `sleep`). In Pluto, you only see the result of a cell once it finished running, so that wouldn't work.

Instead, the whole drawing code is executed, but every command (like `right!`) also adds an entry in the command log stored in the `Turtle`. This will create a list that looks like:

```
forward 10
right 90
color red
penup true
...
```

When the result is displayed, we create a `<div>` with the regular `<img>`, followed by a `<script>` with lots of functionality. This script receives the command log and after an initial delay (during which you can already see the final painting), it will create a turtle character and start replaying the steps.

For each replayed step:
- The turtle's position and heading is set (with a CSS transtition)
- The `<img>` source is changed to an SVG where all not-yet-drawn lines have an extra attribute `style="opacity: .2;"`.

### The `@steps` macro
The steps macro works by inserting a new command at the start of every line:

```julia
# not exactly this but to demonstrate the point:
turtle_drawing() do t
	register_line_number!(t, 3); color!(t, "red")
	register_line_number!(t, 5); forward!(t, 5)

	register_line_number!(t, 6); right!(t, 90)

	register_line_number!(t, 8); color!(t, "pink")
	register_line_number!(t, 9); forward!(t, 10)
end
```
"""

# ╔═╡ 31410fde-3c7e-4adf-9671-6d93eea8975a
md"""
## Types
"""

# ╔═╡ 310a0c52-b0bf-11ea-3e32-69d685f2f45e
const Drawing = Vector{String}

# ╔═╡ 6bbb674c-b0ba-11ea-2ff7-ebcde6573d5b
begin
	# This mutable struct contains the state of the turtle drawing:
	Base.@kwdef mutable struct Turtle
		pos::Tuple{Float64, Float64}
		initial_pos::Tuple{Float64, Float64}
		heading::Float64
		initial_heading::Float64
		pen_down::Bool = true
		color::String = "black"
		history_svg::Drawing = String[]
		history_actions::Vector{Tuple{UInt8,Any}} = Tuple{UInt8,Any}[]
	end
	
	Turtle(pos::Tuple{Real, Real}, heading::Real; kwargs...) = Turtle(;
		pos, heading,
		initial_pos=pos,
		initial_heading=heading,
		kwargs...
	)
end

# ╔═╡ 5560ed36-b0c0-11ea-0104-49c31d171422
md"## Turtle commands"

# ╔═╡ 1d26071e-632c-4bdd-84d2-421634486ad6
md"""
### Hidden functions
"""

# ╔═╡ d6b0e49b-3144-4230-9c5a-9cc6f90ab0c9
warn_too_many_actions(🐢::Turtle) = if length(🐢.history_actions) > 20000
		error("Drawing too big! The turtle took too many steps to make this drawing.")
	end

# ╔═╡ e6c7e5be-b0bf-11ea-1f7e-73b9aae14382
function forward!(🐢::Turtle, distance::Number)
	warn_too_many_actions(🐢)
	old_pos = 🐢.pos
	new_pos = 🐢.pos = old_pos .+ (10distance .* (cos(🐢.heading), sin(🐢.heading)))
	push!(🐢.history_actions, (UInt8(0), Int64.(floor.(new_pos))))
	if 🐢.pen_down
		push!(🐢.history_svg, """<line x1="$(old_pos[1])" y1="$(old_pos[2])" x2="$(new_pos[1])" y2="$(new_pos[2])" stroke="$(🐢.color)" stroke-width="4" />""")
	end
	🐢
end

# ╔═╡ 573c11b4-b0be-11ea-0416-31de4e217320
backward!(🐢::Turtle, by::Number) = forward!(🐢, -by)

# ╔═╡ fc44503a-b0bf-11ea-0f28-510784847241
function right!(🐢::Turtle, angle_degrees::Number)
	warn_too_many_actions(🐢)
	🐢.heading += angle_degrees * pi / 180
	push!(🐢.history_actions, (UInt8(1), Int64(floor(🐢.heading * 180 / pi))))
	🐢
end

# ╔═╡ d88440c2-b3dc-11ea-1944-0ba4a566d7c1
function draw_star(turtle, points, size)
	for i in 1:points
		right!(turtle, 360 / points)
		forward!(turtle, size)
		backward!(turtle, size)
	end
end

# ╔═╡ 47907302-b0c0-11ea-0b27-b5cd2b4720d8
left!(🐢::Turtle, angle::Number) = right!(🐢, -angle)

# ╔═╡ 8f55e3f7-4082-4df9-b290-2b9183b067d8
# ╠═╡ skip_as_script = true
#=╠═╡
function drawhouse(t)
	# floor
	forward!(t, 6)

	# wall
	left!(t, 90)
	forward!(t, 6)

	# roof
	left!(t, 45)
	forward!(t, sqrt(2) * 3)
	left!(t, 90)
	forward!(t, sqrt(2) * 3)
	left!(t, 45)

	# wall
	forward!(t, 6)
	left!(t, 90)
end
  ╠═╡ =#

# ╔═╡ 4c173318-b3de-11ea-2d4c-49dab9fa3877
function pendown!(🐢::Turtle, value::Bool=true)
	warn_too_many_actions(🐢)
	🐢.pen_down = value
	push!(🐢.history_actions, (UInt8(2), value))
	🐢
end

# ╔═╡ 1fb880a8-b3de-11ea-3181-478755ad354e
penup!(🐢::Turtle, value::Bool=true) = pendown!(🐢, !value)

# ╔═╡ 2e7c8462-b3e2-11ea-1e41-a7085e012bb2
function color!(🐢::Turtle, color::AbstractString="black")
	warn_too_many_actions(🐢)
	🐢.color = color
	push!(🐢.history_actions, (UInt8(3), color))
	🐢
end

# ╔═╡ 678850cc-b3e4-11ea-3cf0-a3445a3ac15a
function draw_mondriaan(turtle, width, height)
	#propbability that we make a mondriaan split
	p = if width * height < 8
		0
	else
		((width * height) / 900) ^ 0.5
	end
		
	if rand() < p
		#split into halves
		
		split = rand(width * 0.1 : width * 0.9)

		#draw split
		forward!(turtle, split)
		right!(turtle, 90)
		color!(turtle, "black")
		pendown!(turtle)
		forward!(turtle, height)
		penup!(turtle)

		#fill in left of split
		right!(turtle, 90)
		forward!(turtle, split)
		right!(turtle, 90)
		draw_mondriaan(turtle, height, split)
		
		#fill in right of split
		forward!(turtle, height)
		right!(turtle, 90)
		forward!(turtle, width)
		right!(turtle, 90)
		draw_mondriaan(turtle, height, width - split)
		
		#walk back
		right!(turtle, 90)
		forward!(turtle, width)
		right!(turtle, 180)
		
	else
		#draw a colored square
		square_color = rand(["white", "white", "white", "red", "yellow", "blue"])
		color!(turtle, square_color)
		for x in (.4:.4:width - .4) ∪ [width - .4]
			forward!(turtle, x)
			right!(turtle, 90)
			forward!(turtle, .2)
			pendown!(turtle)
			forward!(turtle, height - .4)
			penup!(turtle)
			right!(turtle, 180)
			forward!(turtle, height - .2)
			right!(turtle, 90)
			backward!(turtle, x)
		end
	end
end

# ╔═╡ d1ae2696-b3eb-11ea-2fcc-07b842217994
function lindenmayer(turtle, depth, angle, tilt, base)
	if depth < 10
		old_pos = turtle.pos
		old_heading = turtle.heading

		size = base * .5 ^ (depth * 0.5)

		pendown!(turtle)
		color!(turtle, "hsl($(depth * 30), 80%, 50%)")
		forward!(turtle, size * 8)
		right!(turtle, tilt / 2)
		lindenmayer(turtle, depth + 1, angle, tilt, base)
		left!(turtle, angle)
		lindenmayer(turtle, depth + 1, angle, tilt, base)


		turtle.pos = old_pos
		turtle.heading = old_heading
	end
end

# ╔═╡ 8f7af43c-13fc-4a65-8cd6-ede6bbbbf80d
function register_line_number!(🐢::Turtle, lnn::Some{LineNumberNode})
	warn_too_many_actions(🐢)
	push!(🐢.history_actions, (UInt8(20), something(lnn).line))
end

# ╔═╡ 5aea06d4-b0c0-11ea-19f5-054b02e17675
md"## Function to make turtle drawings with"

# ╔═╡ 5030944f-efec-4226-9511-95ae3a4c179d
make_svg(🐢::Turtle; 
	background="white",
	size::Tuple{Real,Real}=(30, 30),
) = """<svg version="1.1"
     baseProfile="full"
     width="$(10 * size[1])" height="$(10 * size[2])"
     xmlns="http://www.w3.org/2000/svg">
  <rect width="$(10 * size[1])" height="$(10 * size[2])" rx="10" fill="$(background)" />$(
	join(🐢.history_svg))</svg>"""

# ╔═╡ 6dbce38e-b0bc-11ea-1126-a13e0d575339
"""
The same as `turtle_drawing`, but without the animated turtle. This makes it a bit faster for interactive drawings!
"""
function turtle_drawing_fast(f::Function; 
	background="white", 
	size::Tuple{Real,Real}=(30, 30),
)
	🐢 = Turtle(size .* 10 ./ 2, pi*3/2)
	
	f(🐢)
	
	return PlutoUI.Show(MIME"image/svg+xml"(), make_svg(🐢; background, size))
end

# ╔═╡ 45e31b3e-7f25-411a-b7c7-a1a8a7c77ddd
# ╠═╡ skip_as_script = true
#=╠═╡
turtle_drawing_fast() do t
	for color in ["red", "orange", "yellow", "green", "turquoise", "blue", "purple"]
		# draw the line
		color!(t, color)
		forward!(t, 10)
		backward!(t, 10)

		# take a step left
		penup!(t)
		left!(t, 90)
		forward!(t, 0.4)
		right!(t, 90)
		pendown!(t)
	end
end
  ╠═╡ =#

# ╔═╡ 9dc072fe-b3db-11ea-1568-857a664ce4d2
#=╠═╡
starry_night = turtle_drawing_fast(background = "#000088") do t
	GO_gogh
	
	star_count = 100
	
	color!(t, "yellow")
	
	for i in 1:star_count
		#move
		penup!(t)
		random_angle = rand() * 360
		right!(t, random_angle)
		random_distance = rand(1:8)
		forward!(t, random_distance)
		
		#draw star
		pendown!(t)
		
		draw_star(t, 5, 1)
	end
end
  ╠═╡ =#

# ╔═╡ e04a9296-b3e3-11ea-01b5-8ff7dc0ced56
#=╠═╡
# turtle_drawing_fast() is the same as turtle_drawing(), but it does not show a little turtle taking the individual steps

mondriaan = turtle_drawing_fast() do t	
	GO_mondriaan
	size = 30
	
	#go to top left corner
	penup!(t)
	forward!(t, size / 2)
	left!(t, 90)
	forward!(t, size / 2)
	right!(t, 180)
		
	#draw painting
	draw_mondriaan(t, size, size)
	
	#white border around painting
	color!(t, "white")
	pendown!(t)
	for i in 1:4
		forward!(t, size)
		right!(t, 90)
	end
end
  ╠═╡ =#

# ╔═╡ 60b52a52-b3eb-11ea-2e3c-9d185f4fbc2b
#=╠═╡
fractal = turtle_drawing_fast() do t
	penup!(t)
	backward!(t, 15)
	pendown!(t)
	lindenmayer(t, 0, fractal_angle, fractal_tilt, fractal_base)
end
  ╠═╡ =#

# ╔═╡ c6017be5-b9c7-45f3-8e37-4da8cbb3f3f9
md"""
### Animated JavaScript version
"""

# ╔═╡ 329138a4-4f37-4ccc-a5f0-f4bbfbd17a89
function turtle_drawing(f::Function; 
	background="white", 
	size::Tuple{Real,Real}=(30, 30),
)
	🐢 = Turtle(size .* 10 ./ 2, pi*3/2)
	
	f(🐢)

	step_delay = 1.0 / sqrt(length(🐢.history_actions))
	
	PlutoUI.ExperimentalLayout.Div([
		PlutoUI.Show(MIME"image/svg+xml"(), make_svg(🐢; background, size)),
		@htl("""
		<script>
		const _x = $(rand())
		const step_delay = $(step_delay)
		const history = $(identity(🐢.history_actions))
		const wrapper = currentScript.closest(".turtle-wrapper")
		const img = wrapper.firstElementChild

		const div = document.createElement("div")
		div.style.cssText = `
			position: absolute; 
			left: 0; 
			top: 0;
		    display: flex;
		    width: 100%;
		    height: 100%;
		`
		const turtle_image = document.createElement("pl-turtle-image")
		turtle_image.innerText = `🐢`
		turtle_image.style.cssText = `
			display: block; 
			transform: translate(-50%, -50%) rotate(.5turn);
		`

		const turtle = document.createElement("pl-turtle")
		turtle.style.cssText = `
			display: block; 
			opacity: 0;
			transition: 
				transform \${step_delay}s ease-in-out,
				opacity \${step_delay}s ease-in-out; 
			transform-origin: top left;
		`
		
		turtle.appendChild(turtle_image)
		div.appendChild(turtle)

		const line_highlighter = document.createElement("style")
		div.appendChild(line_highlighter)

		const restart_btn = document.createElement("button")
		restart_btn.innerText = "Restart"
		restart_btn.style.cssText = `
			position: absolute;
			bottom: .3em;
			right: .3em;
			transition: opacity .3s ease-in-out; 
		`
		const set_restart_visible = (val) => {
			restart_btn.style.opacity = val ? "1" : "0"
			restart_btn.inert = !val;
		}
		set_restart_visible(false)
		div.appendChild(restart_btn)
		

		let svg_data = null
		const stop_promise = invalidation.then(_x => null)
		let current_blob_url = null
		const blur_future_steps = (current_line_index) => {
			setTimeout(() => {
				Promise.race([stop_promise, svg_data]).then(txt => {
					if(txt != null) {
						let i = 0
						let new_img = txt.replaceAll(`<line`, () =>  
							i++ <= current_line_index ? `<line` : `<line opacity=".2"`
						)
						let old_url = current_blob_url
						current_blob_url = URL.createObjectURL(new Blob([new_img], { type: `image/svg+xml` }))
						img.src = current_blob_url
						if(old_url != null) 
							URL.revokeObjectURL(old_url)
					}
				})
			}, step_delay * 1000 / 2)
		}
		invalidation.then(() => {
			if(current_blob_url != null) 
						URL.revokeObjectURL(current_blob_url)
		})

		let current_pos = $(🐢.initial_pos)
		let current_heading = $(🐢.initial_heading * 180 / pi)

		let current_scale = 1
		
		let set_turtle_pos = (pos, heading) => {
			current_pos = pos
			current_heading = heading
			turtle.style.transform = `scale(\${current_scale}) translate(\${pos[0]}px, \${pos[1]}px) rotate(\${heading}deg)`
		}

		let reset_turtle_pos = () => set_turtle_pos($(🐢.initial_pos), $(🐢.initial_heading * 180 / pi))

		const running = {current: true}
		invalidation.then(() => {
			running.current = false
		})

		let calc_scale = () => {
			current_scale = img.scrollWidth / $(10 * size[1])
			set_turtle_pos(current_pos, current_heading)
		}
		calc_scale()
		const resizeObserver = new ResizeObserver(calc_scale)
		resizeObserver.observe(img)
		invalidation.then(() => resizeObserver.disconnect())

		let last_styled_element = null
		const highlight_line = (line) => {
			delayed(() => {
				if(last_styled_element != null) {
					last_styled_element.style.background = null
				}

				if(line != null && running.current) {
					let line_el = currentScript
						.closest("pluto-cell")
						.querySelector(`pluto-input .cm-editor .cm-line:nth-child(\${line})`)
			
					line_el.style.background = `#a0b1ff45`;
					last_styled_element = line_el
				}
			}, step_delay * 2)
		}
		invalidation.then(() => highlight_line(null))


		let current_num_lines = -1
		let current_pendown = true
		let take_step = (action, arg) => {
			if(action === 0) {
				if(current_pendown) {
					current_num_lines += 1
					blur_future_steps(current_num_lines)
				}
				set_turtle_pos(arg, current_heading)
			} else if(action === 1) {
				set_turtle_pos(current_pos, arg)
			} else if(action === 2) {
				current_pendown = arg
			} else if(action === 20) {
				highlight_line(arg)
			}
		}

		let current_step = -1
		let step = () => {
			current_step += 1
			if(current_step < history.length && running.current) {
				take_step(...history[current_step])
				setTimeout(step, 1000 * $(step_delay))
			} else {
				// done!
				highlight_line(null)
				turtle.style.opacity = "0"
				setTimeout(() => set_restart_visible(true), 2000)
			}
		}

		const delayed = (f, delay) => {
			const ref = setTimeout(f, delay)
			invalidation.then(() => clearTimeout(ref))
		}

		const start = () => {
			current_step = -1
			current_num_lines = -1
			current_pendown = true
			reset_turtle_pos()
			set_restart_visible(false)
			turtle.style.opacity = "1"
			blur_future_steps(-1)
			delayed(step, 800)
		}
		delayed(() => {
			svg_data = fetch(img.src).then(r => r.text())
			start()
		}, 800)
		restart_btn.onclick = start

		return div
		</script>
		""")
	]; class="turtle-wrapper", style="position: relative; contain: all;")
end

# ╔═╡ aa724bc5-563f-4421-a55c-84ebd766f364
#=╠═╡
turtle_drawing() do t

	for i in 1:10
		color!(t, "black")
		forward!(t, 3)

		right!(t, fun_angle)

		color!(t, second_color)
		forward!(t, 3)
	end
	
end
  ╠═╡ =#

# ╔═╡ d30c8f2a-b0bf-11ea-0557-19bb61118644
#=╠═╡
turtle_drawing() do t
	
	for i in 0:.1:10
		right!(t, angle)
		forward!(t, i)
	end
	
end
  ╠═╡ =#

# ╔═╡ acc30d89-9e69-4131-876f-f802158a7496
md"""
## `@steps` macro
"""

# ╔═╡ fc08d52f-91fb-47d4-9122-d45a287c0e7f
# ╠═╡ disabled = true
#=╠═╡
@steps turtle_drawing() do t

	# take 5 steps
	forward!(t, 5)
	forward!(t, 5)

	# turn right, 90 degrees
	right!(t, 90)
	right!(t, 90)
	right!(t, 90)

	# take 10 steps
	forward!(t, 10)

	penup!(t)

	
	right!(t, 120)
	forward!(t, 5)

	pendown!(t)

	right!(t, 60)
	forward!(t, 5)

	right!(t, 60)
	forward!(t, 5)
end
  ╠═╡ =#

# ╔═╡ fbcf4e5b-e748-4e26-b334-5c7b25e2cf72
with_lnn_registrations(x; turtle_name::Symbol) = x

# ╔═╡ 32a78ca2-7a1b-40a5-9158-911b576139db
function with_lnn_registrations(ex::Expr; turtle_name::Symbol)
	Expr(
		ex.head,
		Iterators.flatten(
			if a isa LineNumberNode
				if ex.head ∈ (:block, :for)
					(a,:($(register_line_number!)($turtle_name, $(Some(a)))))
				else
					(a,)
				end
			else
				(with_lnn_registrations(a; turtle_name),)
			end for a in ex.args
		)...
	)
end

# ╔═╡ 675d76e1-7f14-4f9d-97b3-5129d0ef68b9
begin
	turtle_drawing
	with_lnn_registrations
	macro steps(ex)
		@assert (
			Meta.isexpr(ex, :do, 2) &&
			Meta.isexpr(ex.args[1], :call) && ex.args[1].args[1] === :turtle_drawing &&
			Meta.isexpr(ex.args[2], Symbol("->"), 2) && 
				Meta.isexpr(ex.args[2].args[1], :tuple)
		) "Use me like this:\n\n@steps turtle_drawing() do t\n\t# my drawing here\n\t...\nend\n"
			
		turtle_name = ex.args[2].args[1].args[1]
	
		Expr(:do, 
			ex.args[1], 
			Expr(
				Symbol("->"), 
				esc(ex.args[2].args[1]), 
				esc(with_lnn_registrations(ex.args[2].args[2]; turtle_name))
			)
		)
	end
end

# ╔═╡ a84af845-7f7a-45eb-b1d4-dde8047cb8e8
# ╠═╡ skip_as_script = true
#=╠═╡
@steps turtle_drawing() do t

	for i in 1:10
		color!(t, "red")
		forward!(t, 5)
		right!(t, 160)

		
		color!(t, "pink")
		forward!(t, 5)
		left!(t, 160)
	end
	
end
  ╠═╡ =#

# ╔═╡ 1f3a56d1-0756-410d-be55-504398052149
#=╠═╡
@steps turtle_drawing() do t
	penup!(t)
	right!(t, 90)
	backward!(t, 14)
	pendown!(t)

	for i in 1:4
		drawhouse(t)
		
		penup!(t)
		forward!(t, 7)
		pendown!(t)
	end
end
  ╠═╡ =#

# ╔═╡ 2722c8d8-58e0-4a3b-abdb-b810604384bf
# ╠═╡ disabled = true
#=╠═╡
cellid_from_fname(s) = try
	Base.UUID(split(String(s), "#==#")[2])
catch
	nothing
end
  ╠═╡ =#

# ╔═╡ 7f87e5be-f2fa-4fed-89a7-cb48ee554325


# ╔═╡ e0e86411-62cb-4af1-b91f-9069a5a20508
#=╠═╡
function from_which_cell()
	this_cell = cellid_from_fname(@__FILE__)

	cellids = (cellid_from_fname(stack.file) for stack in stacktrace(backtrace()))

	Iterators.filter(x -> x ∉ (nothing, this_cell), cellids) |> collect
end
  ╠═╡ =#

# ╔═╡ 03c983b3-42f2-418d-89c2-fdfe74a4032a
#=╠═╡
x()
  ╠═╡ =#

# ╔═╡ a3727d0a-3096-493c-a4fc-19e5a43cd683
#=╠═╡
x() = from_which_cell()
  ╠═╡ =#

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
AbstractPlutoDingetjes = "6e696c72-6542-2067-7265-42206c756150"
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
AbstractPlutoDingetjes = "~1.3.2"
HypertextLiteral = "~0.9.5"
PlutoUI = "~0.7.55"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "8b72179abc660bfab5e28472e019392b97d0985c"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.4"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.4.0+0"

[[LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.6.4+0"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.1.10"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.23+4"

[[Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.10.0"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "ab55ee1510ad2af0ff674dbcced5e94921f867a9"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.59"

[[PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.10.0"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.10.0"

[[SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.2.1+1"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[Tricks]]
git-tree-sha1 = "eae1bb484cd63b36999ee58be2de6c178105112f"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.8"

[[URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+1"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.52.0+1"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"
"""

# ╔═╡ Cell order:
# ╠═a84af845-7f7a-45eb-b1d4-dde8047cb8e8
# ╟─45e31b3e-7f25-411a-b7c7-a1a8a7c77ddd
# ╠═e814a124-f038-11ea-3b22-f109c99dbe03
# ╠═50f734b3-ec1b-45fa-a9f3-8d007237842f
# ╟─925a66b2-3564-480c-be12-0e626b01362f
# ╟─c347a8ad-c859-4eb2-8fdc-bb7f04c7f70e
# ╟─fac4f50a-ce65-4f22-af23-0fc73af936f2
# ╟─aa724bc5-563f-4421-a55c-84ebd766f364
# ╟─ea5f57d5-1396-4d66-885e-bc08864475c1
# ╟─8f55e3f7-4082-4df9-b290-2b9183b067d8
# ╠═1f3a56d1-0756-410d-be55-504398052149
# ╟─9a900923-e407-44a0-823a-f911a22a5ada
# ╟─553d0488-f03b-11ea-2997-3d82493cd4d7
# ╟─25dc5690-f03a-11ea-3c59-35ae694b03b5
# ╟─064091ae-b4bb-4e7d-829b-b48d98e5cca0
# ╟─9dc072fe-b3db-11ea-1568-857a664ce4d2
# ╟─d88440c2-b3dc-11ea-1944-0ba4a566d7c1
# ╟─5d345ae8-f03a-11ea-1c2d-03f66115b590
# ╟─b3f5877c-b3e9-11ea-03fe-3f3233ee2e1b
# ╟─e04a9296-b3e3-11ea-01b5-8ff7dc0ced56
# ╟─678850cc-b3e4-11ea-3cf0-a3445a3ac15a
# ╟─cd442606-f03a-11ea-3d53-57e83c8cdb1f
# ╟─4c1bcc58-b3ec-11ea-32d1-7f4cd113e43d
# ╟─a7e725d8-b3ee-11ea-0b84-8d252979e4ef
# ╟─49ce3f9c-b3ee-11ea-0bb5-ed348475ea0b
# ╟─60b52a52-b3eb-11ea-2e3c-9d185f4fbc2b
# ╟─d1ae2696-b3eb-11ea-2fcc-07b842217994
# ╟─f132f376-f03a-11ea-33e2-775fc026faca
# ╟─70160fec-b0c7-11ea-0c2a-35418346592e
# ╟─d30c8f2a-b0bf-11ea-0557-19bb61118644
# ╟─15b677af-5a9e-4c51-b8f4-0defe6de6acf
# ╟─ab083f08-b0c0-11ea-0c23-315c14607f1f
# ╟─31410fde-3c7e-4adf-9671-6d93eea8975a
# ╟─6bbb674c-b0ba-11ea-2ff7-ebcde6573d5b
# ╟─310a0c52-b0bf-11ea-3e32-69d685f2f45e
# ╟─5560ed36-b0c0-11ea-0104-49c31d171422
# ╟─e6c7e5be-b0bf-11ea-1f7e-73b9aae14382
# ╟─573c11b4-b0be-11ea-0416-31de4e217320
# ╟─fc44503a-b0bf-11ea-0f28-510784847241
# ╟─47907302-b0c0-11ea-0b27-b5cd2b4720d8
# ╟─1fb880a8-b3de-11ea-3181-478755ad354e
# ╟─4c173318-b3de-11ea-2d4c-49dab9fa3877
# ╟─2e7c8462-b3e2-11ea-1e41-a7085e012bb2
# ╟─1d26071e-632c-4bdd-84d2-421634486ad6
# ╟─d6b0e49b-3144-4230-9c5a-9cc6f90ab0c9
# ╟─8f7af43c-13fc-4a65-8cd6-ede6bbbbf80d
# ╟─5aea06d4-b0c0-11ea-19f5-054b02e17675
# ╟─5030944f-efec-4226-9511-95ae3a4c179d
# ╟─6dbce38e-b0bc-11ea-1126-a13e0d575339
# ╟─c6017be5-b9c7-45f3-8e37-4da8cbb3f3f9
# ╠═1cca3d6d-a40a-455c-84d3-dec04f0b496a
# ╟─329138a4-4f37-4ccc-a5f0-f4bbfbd17a89
# ╟─acc30d89-9e69-4131-876f-f802158a7496
# ╟─fc08d52f-91fb-47d4-9122-d45a287c0e7f
# ╟─fbcf4e5b-e748-4e26-b334-5c7b25e2cf72
# ╟─32a78ca2-7a1b-40a5-9158-911b576139db
# ╟─675d76e1-7f14-4f9d-97b3-5129d0ef68b9
# ╟─2722c8d8-58e0-4a3b-abdb-b810604384bf
# ╟─7f87e5be-f2fa-4fed-89a7-cb48ee554325
# ╟─e0e86411-62cb-4af1-b91f-9069a5a20508
# ╟─03c983b3-42f2-418d-89c2-fdfe74a4032a
# ╟─a3727d0a-3096-493c-a4fc-19e5a43cd683
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
