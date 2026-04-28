### A Pluto.jl notebook ###
# v0.20.24

using Markdown
using InteractiveUtils

# ╔═╡ 71bc54d5-d0ed-42d3-9bc1-48aa86e91d1d
TableOfContents(title="📚 MATH102: Calculus III", indent=true, depth=4)
# ╔═╡ e414122f-b93a-4510-b8ae-026c303e0df9
begin
    struct LocalImage
        filename
    end

    function Base.show(io::IO, ::MIME"image/png", w::LocalImage)
        write(io, read(w.filename))
    end
end
# ╔═╡ 8408e369-40eb-4f9b-a7d7-26cde3e34a74
begin
    text_book = post_img("https://www.dropbox.com/scl/fi/upln00gqvnbdy7whr23pj/larson_book.jpg?rlkey=wlkgmzw2ernadd9b8v8qwu2jd&dl=1", 200)
    md""" # Syllabus
    ## Syallbus
    See here [Term 252 - MATH102 - Syllabus](https://math.kfupm.edu.sa/docs/default-source/css-library/math102-252.pdf)
    ## Textbook
    __Textbook: Edwards, C. H., Penney, D. E., and Calvis, D. T., Differential Equations and Linear Algebra, Fourth edition, Pearson, 2021__
    $text_book

    ## Office Hours
    I strongly encourage all students to make use of my office hours. These dedicated times are a valuable opportunity for you to ask questions, seek clarification on lecture material, discuss challenging problems, and get personalized feedback on your work. Engaging with me during office hours can greatly enhance your understanding of the course content and improve your performance. Whether you're struggling with a specific concept or simply want to delve deeper into the subject, I am here to support your learning journey. Don't hesitate to drop by; __your success is my priority__.

    | Day       | Time        |
    |-----------|-------------|
    | Sunday    | 11:00-11:50AM |
    | Tuesday    | 11:00-11:50AM |
    Also you can ask for an online meeting through __TEAMS__.
    """
end
# ╔═╡ cd269caf-ef81-43d7-a1a8-6668932b6363
# exportqrcode("https://www.mathmatize.com/")
# let
#     img = LocalImage("../qrcode.png")
# end
# ╔═╡ d6d85087-9ecc-4043-9002-e4a6442b829e
md"""

# [AI-STUDY RESOURCE](https://notebooklm.google.com/notebook/f9f5eb4d-5782-4586-9f7e-abdb60f1b694)
"""
# ╔═╡ 1f1b3439-630e-4db6-9a01-321ed75bed84
md""" # 7.1 Area of a Region Between Two Curves

> 1. __Objectives__
> 1. Find the area of a region between two curves using integration.
> 1. Find the area of a region between intersecting curves using integration.
> 1. Describe integration as an accumulation process.

"""
# ╔═╡ 3df06d3d-7bd1-45fe-bd46-c1429b11ee14
begin
    cnstSlider = @bind cnstslider Slider(-2:1:2, default=0)
    n1Slider = @bind n1slider Slider(1:200, default=1, show_value=true)
    sec71Chbx = @bind sec71chbx CheckBox(default=true)
    md"""
    | | | |
    |---|---|---|
    |move $cnstSlider| ``n`` = $n1Slider| Cases $sec71Chbx
    |||
    """
end
# ╔═╡ dda364fa-80e5-4d6c-8ed1-9b2bfccf4b18
let
    p1Opt = (framestyle=:origin, aspectration=1)
    f1(x) = sin(x) + 3 + cnstslider
    f2(x) = cos(2x) + 1 + cnstslider
    f3(x) = cos(2x) + 4 + cnstslider
    x = symbols("x", real=true)
    poi1 = solve(f1(x) - f3(x), x) .|> p -> real(p.n()) .|> Float64
    theme(:wong)
    a1, b1 = 1, 5
    Δx1 = (b1 - a1) / n1slider
    x1Rect = a1:Δx1:b1
    x1 = a1:0.1:b1
    y1 = f1.(collect(x1))
    y2 = f2.(x1)
    y3 = f3.(x1)

    p1 = plot(x1, y1, fill=(y2, 0.25, :green), label=nothing, c=:red)
    p2 = plot(x1, y1, fill=(y3, 0.25, :green), label=nothing, c=:red)

    plot!(p1, x1, y2, label=nothing)
    plot!(p2, x1, y3, label=nothing)
    annotate!(p1, [
        (3.5, 3.5 + cnstslider, L"y=f(x)", :red),
        (5.9, 0, L"x"),
        (0.2, 6, L"y"),
        (3.2, 1 + cnstslider, L"y=g(x)", :blue)
    ]
    )
    annotate!(p2, [
        (1.2, 4.5 + cnstslider, L"y=f(x)", :red),
        (5.9, 0, L"x"),
        (0.2, 6, L"y"),
        (4, 5 + cnstslider, L"y=g(x)", :blue)
    ]
    )

    plot!(p1; p1Opt..., ylims=(-3, 6), xlims=(-1, 6))
    recs = [
        Shape([(xi, f2(xi)), (xi + Δx1, f2(xi)), (xi + Δx1, f1(xi + Δx1)), (xi, f1(xi + Δx1))]) for xi in x1Rect[1:end-1]
    ]
    n1slider > 2 && plot!(p1, recs, label=nothing, c=:green)
    plot!(p2; p1Opt..., ylims=(-3, 6), xlims=(-1, 6))

    scatter!(p2, (poi1[1], f3(poi1[1])), label="Point of instersection", legend=:bottomright)
    # save("./imgs/6.1/sec6.1p2.png",p2)
    # annotate!(p2,[(4,0.51,(L"$\sum_{i=1}^{%$n2} f (x^*_{i})\Delta x=%$s2$",12))])
    formula = sec71chbx ? cm"""```math
     Area = \int_a^b \left[{\color{red}f(x)} - {\color{blue}g(x)}\right] dx
     ```""" : cm"""```math
     Area = \int_a^b \left|f(x) - g(x)\right| dx
     ```"""

    cm""" **How can we find the area between the two curves?**
    	
    $(sec71chbx && p1)
    
    	
    $(!sec71chbx && p2)
    
    $(formula)
    """

end
# ╔═╡ 004ab021-15d7-40d8-ace7-41dd5f8b2237
cm"""

$(bbl("Remark",""))
- Area = ``y_{top}-y_{bottom}``.
$(ebl())

$(ex(1,"Finding the area of a region Between Two Curves"))

Find the area of the region bounded above by ``y=e^x``, bounded below by ``y=x``, bounded on the sides by ``x=0`` and ``x=1``.

"""
# ╔═╡ db08f294-cfcf-462a-8fb5-8d8a63563e61
p1Opt = (framestyle=:origin, aspectration=1)
# ╔═╡ 932e13f0-0949-4e77-b3a8-f344784b1f1d
begin

    ex1x = 0:0.01:1
    ex1y = exp.(ex1x)
    ex1plt = plot(ex1x, ex1y, label=nothing, fill=(0, 0.5, :red))
    plot!(ex1plt, ex1x, ex1x, fill=(0, 0, :white), label=nothing)
    plot!(; p1Opt..., xlims=(-0.4, 1.5), ylims=(-0.4, 3.5), label=nothing, xticks=[0, 0, 1])
    ex1Rect = Shape([(0.5, 0.55), (0.55, 0.55), (0.55, exp(0.55)), (0.5, exp(0.55))])
    plot!(ex1Rect, label=nothing)
    annotate!([(0.77, 0.6, L"y=x"), (0.7, exp(0.7) + 0.2, L"y=e^x"), (1.1, 1.7, L"x=1"), (-0.1, 0.5, L"x=0"), (0.54, 0.44, text(L"\Delta x", 10))
    ])
    md"""
    **Solution**
    
    $ex1plt
    """
end
# ╔═╡ ac6fde80-be6b-4292-911a-b51c43de3199
cm"""
$(ex(2,"a region Lying Between Two Intersecting Graphs"))
Find the area of the region enclosed by the parabolas ``y=x^2`` and ``y=2x-x^2``.

*Solution in class*

---
"""
# ╔═╡ d993fe50-4792-4f54-b4a6-23cb91718f00
let
    ex2f1(x) = x^2
    ex2f2(x) = 2x - x^2
    x = symbols("x", real=true)
    ex2poi = solve(ex2f1(x) - ex2f2(x)) .|> p -> p.n() .|> Float64
    ex2x = 0:0.01:1
    ex2widex = -1:0.01:2
    ex2y1 = ex2f1.(ex2x)
    ex2y1wide = ex2f1.(ex2widex)
    ex2y2 = ex2f2.(ex2x)
    ex2y2wide = ex2f2.(ex2widex)
    ex2plt = plot(ex2x, ex2y2, label=nothing, fill=(0, 0.5, :green))
    plot!(ex2plt, ex2x, ex2y1, fill=(0, 0, :white), label=nothing)
    plot!(ex2widex, ex2y1wide, c=:red, label=nothing)
    plot!(ex2widex, ex2y2wide, c=:blue, label=nothing)
    plot!(; p1Opt..., xlims=(-0.4, 1.5), ylims=(-0.4, 2), label=nothing, xticks=[0, 0, 1])
    ex2Rect = Shape([(0.5, ex2f2(0.55)), (0.55, ex2f2(0.55)), (0.55, ex2f1(0.55)), (0.5, ex2f1(0.55))
    ])
    plot!(ex2Rect, label=nothing)
    scatter!(ex2poi, ex2f1.(ex2poi), label=nothing)
    annotate!([(0.77, 0.4, L"y=x^2"), (0.7, 1.1, L"y=2x-x^2"), (0.54, 0.24, text(L"\Delta x", 10))
    ])
    md"""
    **Solution**
    
    $ex2plt
    """
end
# ╔═╡ 57d8a03b-71a0-46d9-b908-af7028195db2
cm"""
$(ex(3,"A Region Lying Between Two Intersecting Graphs"))

Find the area of the region bounded by the curves 

```math 
y=\cos(x), \;\; y=\sin(2x), \;\; x=0, \;\; x=\frac{\pi}{2}
```


---
"""
# ╔═╡ a2a2d894-7588-48a8-84fd-65e5ead80072
begin
    ex3f1(x) = cos(x)
    ex3f2(x) = sin(2x)
    ex3X = 0:0.01:(π+0.019)/2

    ex3Y1 = ex3f1.(ex3X)
    ex3Y2 = ex3f2.(ex3X)
    ex3P = plot(ex3X, ex3Y1, label=L"y=\cos(x)", c=:red)
    plot!(ex3P, ex3X, ex3Y1, fill=(ex3Y2, 0.25, :green), label=nothing, c=nothing)
    plot!(ex3P, ex3X, ex3Y2, label=L"y=\sin(2x)", c=:blue)
    plot!(ex3P; p1Opt..., xlims=(-1, π), ylims=(-1.1, 1.1))
    scatter!(ex3P, (π / 6, ex3f1(π / 6)), label=nothing, c=:black)

    md"""
    **Solution**
    
    $ex3P
    """
end
# ╔═╡ 6003b1ce-be7b-4ff1-ab92-fca307cb61a8
cm"""
$(ex(4,"Curves That Intersect at More than Two Points"))
Find the area of the region between the graphs of
```math
f(x)=3 x^3-x^2-10 x \quad \text { and } \quad g(x)=-x^2+2 x
```
"""
# ╔═╡ f03e35fd-ba04-4692-8e4a-b0880c703e8e
cm"""
### Integrating with Respect to ``y``

$(post_img("https://www.dropbox.com/s/r39ny15umqafmls/wrty.png?raw=1",300))

"""
# ╔═╡ 0b5e8985-ecf6-4e84-860b-0891c9638aeb
cm"""
$(ex(5,"Horizontal representative rectangles"))

 Find the area of the region bounded by the graphs of ``x=3−y^22`` and ``x=y+1``.

"""
# ╔═╡ 64ee7ca1-4feb-470a-900c-fbb8a413b3f5
let
    ex4FRight(y) = 3 - y^2
    ex4FLeft(y) = y + 1
    y, x = symbols("y,x", real=true)
    ex4p = plot(x -> -x^2 + 3, x -> x, -3, 6, c=:blue, label=L"y^2=3-x")
    ex4Rect = Shape([(ex4FRight(0.1), -0.2), (ex4FLeft(-0.2), -0.2), (ex4FLeft(-0.2), 0.1), (ex4FRight(0.1), 0.1)
    ])
    plot!(ex4Rect, label=nothing)
    plot!(ex4p, x -> x, x -> x - 1, -5, 6; p1Opt..., c=:red, label=L"y=x-1", xticks=-3:1:15)
    (ex4poi1, ex4poi2) = solve([x + y^2 - 3, x - y - 1], [x, y]) .|> p -> map(q -> Float64(q.n()), p)
    scatter!([ex4poi1, ex4poi2], xlims=(-3.5, 7), label=nothing, legend=:topleft)
    md"""
    **Solution:**
    $ex4p
    """
end
# ╔═╡ 358c0e61-da8c-4eba-9765-58760940c7c3
let
    x, y = symbols("x,y", real=true)
    integrate(y + 1 - (y^2 / 2 - 3), (y, -2, 4))
end
# ╔═╡ e0d5df0d-03bb-45f7-9f36-909830e6203f
md"""
**Exercise**

Find the area of the region enclosed by the curves ``y= {1\over x}``, ``y=x``, and ``y={1\over 4} x``, using
* ``x`` as the variable of integration and
* ``y`` as the variable of integration.


"""
# ╔═╡ f952efd6-736c-4895-9510-f1dbf8919942
# ╔═╡ 42053189-d0d4-4c70-9c4c-41fbacae9891
begin
    x5 = 0.1:0.1:10
    x51 = 0:0.1:1
    p5 = plot(x -> x / 4, xlims=(-1, 10), framestyle=:origin, aspectratio=1, label=nothing)
    plot!(x -> x, c=:red, label=nothing)
    # plot!(x51,1 ./ x51,fill=(x51/4,0.5,:blue),c=:white)
    plot!(x5, 1 ./ x5, c=:green, label=nothing)
    xlims!(-0.1, 3)
    ylims!(-0.1, 2)
end
# ╔═╡ 9050671d-cbb1-4d2c-9b7b-ba502655e238
md"""# 7.2 Volume: The Disk Method
> __Objectives__
> 1. Find the volume of a solid of revolution using the disk method.
> 2. Find the volume of a solid of revolution using the washer method.
> 3.  Find the volume of a solid with known cross sections.
"""
# ╔═╡ 9063db24-2541-4696-92b8-f9436b237b5c
md"##  The Disk Method"
# ╔═╡ fd39a8f1-60f5-46e7-8595-0ab20a5e3b4d
cm"""
**Solids of Revolution**

<div class="img-container">

$(Resource("https://www.dropbox.com/s/z2k777veuxiaorq/solids_of_revs.png?raw=1"))
</div>


<div class="img-container">

$(Resource("https://www.dropbox.com/s/ik73cokibh1fuj6/disk_volume.png?raw=1"))

__Volume of a disk__
```math
V = \pi R^2 w
```
</div>

<div class="img-container">

__Disk Method__

$(Resource("https://www.dropbox.com/s/odttq795nrpcznw/disk_method.png?raw=1"))
</div>

```math
\begin{array}{lcl}
\textrm{Volume of solid} & \approx &\displaystyle \sum_{i=1}^n\pi\bigl[R(x_i)\bigr]^2 \Delta x \\
	& = &\displaystyle \pi\sum_{i=1}^n\bigl[R(x_i)\bigr]^2 \Delta x
\end{array}
```
Taking the limit ``\|\Delta\|\to 0 (n\to \infty)``, we get


```math
\begin{array}{lcl}
\textrm{Volume of solid} & = &\displaystyle\lim_{\|\Delta\|\to 0}\pi \sum_{i=1}^n\bigl[R(x_i)\bigr]^2 \Delta x \end{array} = \pi \int_{a}^{b}\bigl[R(x)\bigr]^2 dx.
```

<div class="img-container">

__Disk Method__

__To find the volume of a solid of revolution with the disk method, use one of the formulas below__

$(Resource("https://www.dropbox.com/s/9kpj2dcrwj5y5h8/disk_volume_v_h.png?raw=1"))
</div>

"""

# **Volumes**

# Let's start with a simple solid **`cylinders`**

# $(Resource("https://www.dropbox.com/s/mofqdenjokjci44/img1.png?raw=1"))

# ### Cross-Section Method
# $(Resource("https://www.dropbox.com/s/xz80mrwj2fserd5/img2.png?raw=1"))

# Let's now try to find a formula for finding the volume of this solid

# $(Resource("https://www.dropbox.com/s/uvz7my3n08fgm6w/img3.png?raw=1"))
# ╔═╡ 3d609c61-d2a0-40ae-bbee-77e7b694d482
cm"""
$(ex(1,"Using the Disk Method"))
Find the volume of the solid formed by revolving the region bounded by the graph of
```math
f(x) = \sqrt{\sin x}
```
and the ``x``-axis (``0\leq x\leq \pi``) about the ``x``-axis

See [Visualization](https://www.geogebra.org/m/u8KtPdqf)
"""
# ╔═╡ 8889cb18-f44b-4dbd-9ff5-9535f250a8bf
cm"""
$(ex(2,"Using a Line That Is Not a Coordinate Axis"))
Find the volume of the solid formed by revolving the region bounded by the graphs of
```math
f(x)=2-x^2
```
and ``g(x)=1``  about the line ``y=1``.
"""
# ╔═╡ e86d6a94-a83c-4eaf-83b2-c86e065c6f6a
md"## The Washer Method"
# ╔═╡ d31b3e53-2c50-42ba-b60e-413468e022fe
cm"""

<div class="img-container">

$(Resource("https://www.dropbox.com/s/ajra8g5fr8ssewe/washer_volume.png?raw=1"))

```math
\textrm{Volume of washer} = \pi(R^2-r^2)w
```
</div>

__Washer Method__


<div class="img-container">

$(Resource("https://www.dropbox.com/s/hvwa3707bftjir0/washer_method.png?raw=1"))

```math
V = \pi\int_a^b \bigl[\left(R[x]\right)^2-\left(r[x]\right)^2) dx
```
</div>
"""
# ╔═╡ d4963c8b-769c-47f4-8d23-00de15ca049a
cm"""
$(ex(3,"Using the Washer Method")) 
Find the volume of the solid formed by revolving the region bounded by the graphs of
```math
y=\sqrt{x} \qquad \textrm{and}\qquad  y = x^2
```
about the ``x``-axis.

"""
# ╔═╡ 55be9c08-66aa-44bb-86c5-36e45450950b
cm"""
$(ex(4,"Integrating with Respect to y: Two-Integral Case")) 
Find the volume of the solid formed by revolving the region bounded by the graphs of
```math
y=x^2+1, \quad y=0, \quad x=0, \quad \textrm{and}\quad x=1
```
about the ``y``-axis
"""
# ╔═╡ de12a145-2680-4322-8921-606bc6a7ca42
md"## Solids with Known Cross Sections"
# ╔═╡ 29f9cc1b-7a08-4219-a31c-91a62a5b85b4
cm"""


[Example 1](https://www.geogebra.org/m/XFgMaKTy) | [Example 2](https://www.geogebra.org/m/XArpgR3A)

$(bth("VOLUMES OF SOLIDS WITH KNOWN CROSS SECTIONS"))
1. For cross sections of area ``A(x)`` taken perpendicular to the ``x``-axis,
```math
V = \int_a^b A(x) dx
```
2. For cross sections of area ``A(y)`` taken perpendicular to the ``y``-axis,
```math
V = \int_c^d A(y) dy
```
$(ebl())

$(ex(6,"Triangular Cross Sections"))
The base of a solid is the region bounded by the lines
```math
f(x)=1-\frac{x}{2},\quad g(x)=-1+\frac{x}{2}\quad \textrm{and}\quad x=0.
```
The cross sections perpendicular to the ``x``-axis are equilateral triangles.
"""
# ╔═╡ cac5724d-f926-4bda-9dac-0534d550e6ad
cm"""
$(ex(7,"An Application to Geometry"))

Prove that the volume of a pyramid with a square base is
```math
V=\frac{1}{3} h B
```
where ``h`` is the height of the pyramid and ``B`` is the area of the base.
"""
# ╔═╡ 0c507932-5cf6-48f0-84c4-b6ed06a54252
# md"""
# * Let’s divide ``S`` into ``n`` “slabs” of equal width ``\Delta x`` by using the planes``P_{x_1},P_{x_2},\cdots`` to slice the solid. (*Think of slicing a loaf of bread.*) 
# * If we choose sample points ``x_i^*`` in ``[x_{i-1},x_i]`` , we can approximate the ``i``th slab ``S_i`` by a cylinder with base area ``A(x_i^*)`` and height ``\Delta x``.

# ```math
# V(S_i) \approx A(x_i^*)\Delta x
# ```

# So, we have

# ```math
# V \approx \sum_{i=1}^{n} A(x_i^*)\Delta x
# ```
# #### Definition of Volume
# Let ``S`` be a solid that lies between ``x=a`` and ``x=b``. If the cross-sectional area of ``S`` in the plane ``P_x`` , through ``x`` and perpendicular to the ``x``-axis, is ``A(x)`` , where ``A`` is a continuous function, then the **volume** of ``S``  is 
# ```math
# V = \lim_{n\to\infty} \sum_{i=1}^{n} A(x_i^*)\Delta x = \int_{a}^{b}A(x) dx
# ```
# """
# ╔═╡ 8e780376-2df2-41df-8540-b37b64c93acc
# md"""
# ### Volumes of Solids of Revolution
# If we revolve a region about a line, we obtain a **solid of revolution**. In the following examples we see that for such a solid, cross-sections perpendicular to the axis of rotation are **circular**.

# **Example 1**
# Find the volume of the solid obtained by rotating about the ``x``-axis the region under the curve ``y=\sqrt{x}`` from ``0`` to ``1`` . Illustrate the definition of volume by sketching a typical approximating cylinder.
# """
# ╔═╡ 1525ccb4-2f4c-48f0-8e6c-73cc117f92f0
# begin
# 	fun(x)=sqrt(x)
# 	s6e1 = PlotData(0:0.01:1, fun)	
# 	tt=range(0.1,stop=1,length=100) |> collect
# 	ss=range(0.1,stop=1,length=100) |> collect
# 	y_grid = [x for x=ss for y=tt]
# 	z_grid = [y for x=ss for y=tt]
# 	f(x, z) = begin
#          x ^ 2 + z ^2
#     end
# 	p3 =plot(	
# 				plot(s6e1; customcolor = :black )
# 			,	plot_implicit((x,y,z)->y^2+z^2-x,xrng=(-2,2),yrng=(-1,1),zrng=(-1,2),
#    nlevels=200, slices=Dict(:x=>:red),aspect_ratio=1,frame_style=:origin)
# 			)
# 	md"""
# 	**Solution**

# 	$p3

# 	"""
# end
# ╔═╡ ebf77286-4f21-40a5-b13b-619ee9ed84a0
md"""
**Exercise**
Find the volume of the solid obtained by rotating the region bounded by ``y=x^3``, ``y=8`` , and ``x=0`` about the ``y``-axis.
"""
# ╔═╡ 46fce2ef-9358-4276-b013-00701bf6a691
md"""
**Exercise** The region ``\mathcal{R}`` enclosed by the curves ``y=x`` and ``y=x^2`` is rotated about the ``x``-axis. Find the volume of the resulting solid.

"""
# ╔═╡ d25798db-b0f3-46f3-b695-59a82f3d9a2c
md"""
**Exercise** Find the volume of the solid obtained by rotating the region in the previous Example about the line ``y=2``.
"""
# ╔═╡ c1be4636-d96e-42b4-82f6-98db3f7be7f3
md"""
**Exercise** Find the volume of the solid obtained by rotating the region in the previous Example about the line ``x=-1``.
"""
# ╔═╡ e18ee243-b49e-401f-bda2-2bb8b0ea3a66
md"""
**Example 6** Figure below shows a solid with a circular base of radius ``1``. Parallel cross-sections perpendicular to the base are equilateral triangles. Find the volume of the solid.
$(post_img("https://www.dropbox.com/s/bbxedang718jvvp/img4.png?dl=1"))
"""
# ╔═╡ e3700fb4-f895-4528-9ef5-0ba59c9703c7
md"""
# 7.3 Volume: The Shell Method
> __Objectives__
> 1. Find the volume of a solid of revolution using the shell method.
> 2. Compare the uses of the disk method and the shell method.

"""
# ╔═╡ 19358efb-0bb3-4781-be0c-c07b4bc963f7
cm"""
$(bbl("Problem",""))
Find the volume of the solid generated by rotating the region bounded by ``y=2x^2-x^3`` and ``y=0`` about the ``y-``axis.

"""
# ╔═╡ 1ab4d457-1c4e-4c8b-bd4d-bdeb233a6580
begin
    show_graph_s = @bind show_graph CheckBox()
    show_rect_s = @bind show_rect CheckBox()
    show_labels_s = @bind show_labels CheckBox()
    md"""
    Step 1: $show_graph_s
    Step 2: $show_rect_s
    Step 3: $show_labels_s
    """
end
# ╔═╡ e4699314-51be-4cda-b2d8-5005e72abc2a
let

    f30(x) = 2 * x^2 - x^3
    s3e0p0 = plot(0:0.01:2, f30)
    annotate!(s3e0p0, [(1, 1.2, L"y=2x^2-x^3")])
    recty = Shape([(0.75, f30(0.75)), (1.75, f30(0.75)), (1.75, f30(0.75) + 0.05), (0.75, f30(0.75) + 0.05)])
    ux, lx = Plots.unzip(Plots.partialcircle(0, π, 100, -0.1))
    plot!(ux, lx .+ 1.15, c=:red, frame_style=:origin)
    anns = [(0.65, f30(0.76), L"x_L=?", 10), (1.88, f30(0.76), L"x_R=?", 10)]
    s3e0p = if show_labels
        plot!(s3e0p0, recty, label=nothing)
        annotate!(anns)
    elseif show_rect
        plot!(s3e0p0, recty, label=nothing)
    elseif show_graph
        s3e0p0

    else
        ""
    end
end
# ╔═╡ 6f8a882b-d41c-41e5-b156-9be4112194c2
md"""
## The Shell Method
"""
# ╔═╡ cf309f63-2534-45f6-98b4-7bc90100493c
begin

    md"""
    A shell is a hallow circular cylinder
    
    $(post_img("https://www.dropbox.com/s/8a2njc50e2hptok/shell.png?dl=1"))
    """
end
# ╔═╡ dbe837f1-85da-4572-b8c3-738ba346d67f
md"""
```math
V = 2 \pi r h \Delta r = \text{[circumference][height][thickness]}

```
"""
# ╔═╡ cbb27812-b1ff-4deb-a9f5-c4d5428c3bdb
html"""
<div style="display: flex; justify-content:center; padding:20px; border: 2px solid rgba(125,125,125,0.2);">
<div>
<h5>Calculating Volume by Cylindrical Shells</h5>
<iframe width="560" height="315" src="https://www.youtube.com/embed/MNU5DT-CDrc?si=cXhu5K5u2KZCbNMV" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>
</div>
"""
# ╔═╡ a89799eb-01a8-4dd4-a2a3-3576c26f29ef
html"""
<div style="display: flex; justify-content:center; padding:20px; border: 2px solid rgba(125,125,125,0.2);">
<div>
<h5>Cylindrical Shells Illustration</h5>
<iframe width="560" height="315" src="https://www.youtube.com/embed/JrRniVSW9tg?si=qMTkfYTJ16xdw29r" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>
</div>
"""
# ╔═╡ 3b6613fa-523a-49ef-a68b-fab0763111e6
cm"""
<div style="display: flex;  justify-content: center;">
<div style="margin-right:12px;padding:4px;border: 2px solid white; border-radius: 10px;background: #eee;">
<span style="font-size:1.5M; font-weight: 800;">Horizontal Axis of Revolution</span>

```math
\text{Volume}=V = 2\pi \int_c^d p(y) h(y) dy
```
<div class="img-container">

$(Resource("https://www.dropbox.com/s/6qmijrhprht4kqj/shell_y.png?raw=1"))

</div>

</div>

<div style="margin-right:12px;padding:4px;border: 2px solid white; border-radius: 10px;background: #eee;"><span style="font-size:1.5M; font-weight: 800;">Vertical  Axis of Revolution</span>

```math
\text{Volume}=V = 2\pi \int_a^b p(x) h(x) dx
```

<div class="img-container">

$(Resource("https://www.dropbox.com/s/ivbwuge5ti8vrff/shell_x.png?raw=1"))

</div>

</div>
</div>

"""
# ╔═╡ 6b312eea-1ad6-414a-bfa1-2f8ba1498add
# begin
# 	s3e0p1 = plot(s3e0)
# 	annotate!(s3e0p1,[(1,1.2,L"y=2x^2-x^3")])
# 	plot!(s3e0p1, 
# 			Shape( 
# 				[ (1.2,0),(1.3,0),(1.3,f30(1.3)),(1.2,f30(1.3))
# 				]
# 				)
# 		, label=nothing
# 		)
# 	md"""
# **Example 1:**
# Find the volume of the solid generated by rotating the region bounded by ``y=2x^2-x^3`` and ``y=0`` about the ``y-``axis.

# Solution:

# $s3e0p1
# """
# end
# ╔═╡ eb56826a-2315-421a-aec8-1c0e17539b0d
cm"""
$(ex(1,"Problem Above"))
Find the volume of the solid generated by rotating the region bounded by ``y=2x^2-x^3`` and ``y=0`` about the ``y-``axis.

"""
# ╔═╡ 4e79e466-384f-40cc-81bc-40d3d0dda3bd
cm"""
$(ex(2,"Using the Shell Method to Find Volume"))
 Find the volume of the solid formed by revolving the region bounded by the graph of
```math
x =e^{−y^2}
```
 and the ``y``-axis (``0 ≤ y ≤ 1``) about the ``x``-axis.

"""
# ╔═╡ 3865e317-a19a-4a9a-a8c4-2813ec0a7f0a
let
    y = 00.0:0.1:1.0
    x = exp.(-y .^ 2)
    plot(x, y, aspect_ratio=:1, frame_style=:origin)

end
# ╔═╡ 6a3c2cd4-6c1f-4038-b0ac-d7992aee8d63
cm"""
$(ex(3,"Shell Method Preferable"))
Find the volume of the solid formed by revolving the region bounded by the graphs of 
```math
y=x^2+1, \quad y=0,\quad x=0, \quad \text{and}\quad x=1
```
 about the y-axis.

"""
# ╔═╡ 8bb93d52-7813-4ce1-a78c-7eccf4ff559f
cm"""
$(ex(4,"Volume of a Pontoon"))
The pontoon is designed by rotating the graph of
```math 
y=1 - \frac{x^2}{16}, \quad −4≤x≤4
```
 about the x-axis, where x and y are measured in feet. Find the volume of the pontoon.
"""
# ╔═╡ 7d2e7631-5d0f-45cd-baa5-c280963b7973
cm"""
$(ex(5,"Shell Method Necessary"))
Find the volume of the solid formed by revolving the region bounded by the graphs 
of ``y=x^3+x+1``, ``y=1``, and ``x=1`` about the line ``x=2``.
"""
# ╔═╡ a3c5f9a8-35b4-4daf-9314-5d4af3413770
md"""
# 7.4 Arc Length and Surfaces of Revolution
> __Objectives__
> 1. Find the arc length of a smooth curve.
> 2. Find the area of a surface of revolution.

"""
# ╔═╡ 86e264bb-9ecc-40b8-8382-fe28892d9b41
md"""
## Arc Length
"""
# ╔═╡ 85d4c1c6-8791-45b0-83a0-588fcb204233
cm"""
$(define("Arc Length"))

Let the function ``y=f(x)`` represents a smooth curve on the interval ``[a,b]``. The __arc length__ of ``f`` between ``a`` and ``b`` is
```math
s = \int_a^b\sqrt{1+[f'(x)]^2} dx.
```

Similarly, for a smooth curve ``x=g(y)``, the arc length of ``g`` between ``c`` and  ``d`` is
```math
s = \int_c^d\sqrt{1+[g'(y)]^2} dy.
```

"""
# ╔═╡ 41ec2ea8-904a-4181-a103-1d140d98d4ab
cm"""
$(ex(1,"The Length of a Line Segment"))
Find the arc length from ``\left(x_1, y_1\right)`` to ``\left(x_2, y_2\right)`` on the graph of
```math
f(x)=m x+b
```
"""
# ╔═╡ 142f33a6-1355-4095-80f2-6fa48572c64b
cm"""
$(ex(2,"Finding Arc Length"))
Find the arc length of the graph of ``y=\displaystyle \frac{x^3}{6}+\frac{1}{2x}`` on the interval ``[\frac{1}{2},2]``. 
"""
# ╔═╡ 8f7889c4-b786-465e-ba90-e448029399c1
cm"""
$(ex(3,"Finding Arc Length")) 
Find the arc length of the graph of ``(y−1)^3=x^2`` on the interval ``[0, 8]``.

"""
# ╔═╡ 786e488c-5c3b-449b-9e44-f7f1e8fcda67
cm"""
$(ex(4,"Finding Arc Length"))
Find the arc length of the graph of ``y=\ln(\cos x)`` from ``x=0`` to ``x=\pi/4``.
"""
# ╔═╡ eb27f45f-6be2-43df-bf62-1842bae6281b
md"## Area of a Surface of Revolution"
# ╔═╡ 6e673498-0b02-4a55-8a81-6b7358a3668e
cm"""

$(define("Surface of Revolution"))
When the graph of a continuous function is revolved about a line, the resulting surface is a __surface of revolution__.

"""
# ╔═╡ 5d946e8c-9256-473a-adac-7be3741aa2c0
cm"""


<div class="img-container">

$(Resource("https://www.dropbox.com/s/199tfveph8mi2kz/surface_rev.png?raw=1"))

__Surface Area of *frustum*__
```math
S=2\pi r L, \quad \text{where}\quad r=\frac{r_1+r_2}{2}
```
</div>

Consider a function ``f`` that has a continuous derivative on the interval ``[a,b]``. The graph of ``f`` is revolved about the ``x``-axis

<div class="img-container">

$(Resource("https://www.dropbox.com/s/f454ldbfk1z3o2z/surface_rev2.png?raw=1"))

__Surface Area Formula__
```math
S=2\pi \int_a^b x \sqrt{1+[f'(x)]^2} dx.
```
</div>

$(define("Area of a Surface of Revolution"))

Let ``y=f(x)`` have a continuous derivative on the interval ``[a,b]``. 

<div class="img-container">

$(Resource("https://www.dropbox.com/s/2fup4uwh5uclrmv/surface_rev3.png?raw=1"))
</div>

The area ``S`` of the surface of revolution formed by revolving the graph of ``f`` about a horizontal or vertical axis is

```math
S=2\pi \int_a^b r(x) \sqrt{1+[f'(x)]^2} dx, \quad {\color{red} y \text{ is a function of x }}.
```
where ``r(x)`` is the distance between the graph of ``f`` and the axis of revolution. 

If ``x=g(y)`` on the interval ``[c,d]`` , then the surface area is

```math
S=2\pi \int_a^b r(y) \sqrt{1+[g'(y)]^2} dy, \quad {\color{red} x \text{ is a function of y }}.
```
where ``r(y)`` is the distance between the graph of ``g`` and the axis of revolution.

"""
# ╔═╡ e7cef759-ccba-437b-a418-247d80704808
cm"""
__Remark__ 

The formulas can be written as

```math
S=2\pi \int_a^b r(x) ds, \quad {\color{red} y \text{ is a function of x }}.
```
and 
```math
S=2\pi \int_c^d r(y) ds, \quad {\color{red} x \text{ is a function of y }}.
```
where 
```math
ds = \sqrt{1+\big[f'(x)\big]^2}dx \quad \text{and}\quad ds = \sqrt{1+\big[g'(y)\big]^2}dy \quad \text{respectively}.
"""
# ╔═╡ 36f63f82-142f-4468-a6ed-7781472d94d7
cm"""
$(ex(6,"The Area of a Surface of Revolution")) Find the area of the surface formed by revolving the graph of ``f(x)=x^3`` on the interval ``[0,1]`` about the ``x``-axis.


$(ex(7,"The Area of a Surface of Revolution"))
Find the area of the surface formed by revolving the graph of ``f(x)=x^2`` on the interval ``[0,\sqrt{2}]`` about the ``y``-axis.
"""

# ╔═╡ Cell order:
# ╠═71bc54d5-d0ed-42d3-9bc1-48aa86e91d1d
# ╠═e414122f-b93a-4510-b8ae-026c303e0df9
# ╠═8408e369-40eb-4f9b-a7d7-26cde3e34a74
# ╠═cd269caf-ef81-43d7-a1a8-6668932b6363
# ╠═d6d85087-9ecc-4043-9002-e4a6442b829e
# ╠═1f1b3439-630e-4db6-9a01-321ed75bed84
# ╠═3df06d3d-7bd1-45fe-bd46-c1429b11ee14
# ╠═dda364fa-80e5-4d6c-8ed1-9b2bfccf4b18
# ╠═004ab021-15d7-40d8-ace7-41dd5f8b2237
# ╠═db08f294-cfcf-462a-8fb5-8d8a63563e61
# ╠═932e13f0-0949-4e77-b3a8-f344784b1f1d
# ╠═ac6fde80-be6b-4292-911a-b51c43de3199
# ╠═d993fe50-4792-4f54-b4a6-23cb91718f00
# ╠═57d8a03b-71a0-46d9-b908-af7028195db2
# ╠═a2a2d894-7588-48a8-84fd-65e5ead80072
# ╠═6003b1ce-be7b-4ff1-ab92-fca307cb61a8
# ╠═f03e35fd-ba04-4692-8e4a-b0880c703e8e
# ╠═0b5e8985-ecf6-4e84-860b-0891c9638aeb
# ╠═64ee7ca1-4feb-470a-900c-fbb8a413b3f5
# ╠═358c0e61-da8c-4eba-9765-58760940c7c3
# ╠═e0d5df0d-03bb-45f7-9f36-909830e6203f
# ╠═f952efd6-736c-4895-9510-f1dbf8919942
# ╠═42053189-d0d4-4c70-9c4c-41fbacae9891
# ╠═9050671d-cbb1-4d2c-9b7b-ba502655e238
# ╠═9063db24-2541-4696-92b8-f9436b237b5c
# ╠═fd39a8f1-60f5-46e7-8595-0ab20a5e3b4d
# ╠═3d609c61-d2a0-40ae-bbee-77e7b694d482
# ╠═8889cb18-f44b-4dbd-9ff5-9535f250a8bf
# ╠═e86d6a94-a83c-4eaf-83b2-c86e065c6f6a
# ╠═d31b3e53-2c50-42ba-b60e-413468e022fe
# ╠═d4963c8b-769c-47f4-8d23-00de15ca049a
# ╠═55be9c08-66aa-44bb-86c5-36e45450950b
# ╠═de12a145-2680-4322-8921-606bc6a7ca42
# ╠═29f9cc1b-7a08-4219-a31c-91a62a5b85b4
# ╠═cac5724d-f926-4bda-9dac-0534d550e6ad
# ╠═0c507932-5cf6-48f0-84c4-b6ed06a54252
# ╠═8e780376-2df2-41df-8540-b37b64c93acc
# ╠═1525ccb4-2f4c-48f0-8e6c-73cc117f92f0
# ╠═ebf77286-4f21-40a5-b13b-619ee9ed84a0
# ╠═46fce2ef-9358-4276-b013-00701bf6a691
# ╠═d25798db-b0f3-46f3-b695-59a82f3d9a2c
# ╠═c1be4636-d96e-42b4-82f6-98db3f7be7f3
# ╠═e18ee243-b49e-401f-bda2-2bb8b0ea3a66
# ╠═e3700fb4-f895-4528-9ef5-0ba59c9703c7
# ╠═19358efb-0bb3-4781-be0c-c07b4bc963f7
# ╠═1ab4d457-1c4e-4c8b-bd4d-bdeb233a6580
# ╠═e4699314-51be-4cda-b2d8-5005e72abc2a
# ╠═6f8a882b-d41c-41e5-b156-9be4112194c2
# ╠═cf309f63-2534-45f6-98b4-7bc90100493c
# ╠═dbe837f1-85da-4572-b8c3-738ba346d67f
# ╠═cbb27812-b1ff-4deb-a9f5-c4d5428c3bdb
# ╠═a89799eb-01a8-4dd4-a2a3-3576c26f29ef
# ╠═3b6613fa-523a-49ef-a68b-fab0763111e6
# ╠═6b312eea-1ad6-414a-bfa1-2f8ba1498add
# ╠═eb56826a-2315-421a-aec8-1c0e17539b0d
# ╠═4e79e466-384f-40cc-81bc-40d3d0dda3bd
# ╠═3865e317-a19a-4a9a-a8c4-2813ec0a7f0a
# ╠═6a3c2cd4-6c1f-4038-b0ac-d7992aee8d63
# ╠═8bb93d52-7813-4ce1-a78c-7eccf4ff559f
# ╠═7d2e7631-5d0f-45cd-baa5-c280963b7973
# ╠═a3c5f9a8-35b4-4daf-9314-5d4af3413770
# ╠═86e264bb-9ecc-40b8-8382-fe28892d9b41
# ╠═85d4c1c6-8791-45b0-83a0-588fcb204233
# ╠═41ec2ea8-904a-4181-a103-1d140d98d4ab
# ╠═142f33a6-1355-4095-80f2-6fa48572c64b
# ╠═8f7889c4-b786-465e-ba90-e448029399c1
# ╠═786e488c-5c3b-449b-9e44-f7f1e8fcda67
# ╠═eb27f45f-6be2-43df-bf62-1842bae6281b
# ╠═6e673498-0b02-4a55-8a81-6b7358a3668e
# ╠═5d946e8c-9256-473a-adac-7be3741aa2c0
# ╠═e7cef759-ccba-437b-a418-247d80704808
# ╠═36f63f82-142f-4468-a6ed-7781472d94d7
