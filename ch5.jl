### A Pluto.jl notebook ###
# v0.20.4

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    #! format: off
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
    #! format: on
end

# ╔═╡ e93c5882-1ef8-43f6-b1ee-ee23c813c91b
begin

    using CommonMark, ImageIO, FileIO, ImageShow
    using PlutoUI
    using Plots, PlotThemes, LaTeXStrings, Random
    using SymPy
    using HypertextLiteral
    using ImageTransformations
    using Dates
    using PrettyTables
end

# ╔═╡ 69d7b791-2e69-490c-8d10-10fa433f0a72
@htl("""
<script src="//unpkg.com/alpinejs" defer></script>
<style>
.img-container {
	display:flex;
	align-items:center;
	flex-direction: column;
}
blockquote {
  background: #0e08bf;
  border-left: 10px solid #0e08bf;
  margin: 1.5em 10px;
}
blockquote:before {
  color: #0e08bf;
  content: open-quote;
  font-size: 3em;
  line-height: 0.1em;
  margin-right: 0.25em;
  vertical-align: -0.4em;
}
blockquote p {
  display: inline;
}
blockquote > ol {
  list-style: none;
  counter-reset: steps;
}
blockquote > ol li {
  counter-increment: steps;
}
blockquote > ol li::before {
  content: counter(steps);
  margin-right: 0.5rem;
  margin-top: 0.5rem;
  background: #ff6f00;
  color: white;
  width: 1.2em;
  height: 1.2em;
  border-radius: 50%;
  display: inline-grid;
  place-items: center;
  line-height: 1.2em;
}
blockquote > ol ol li::before {
  background: darkorchid;
}
</style>
""")

# ╔═╡ ad045108-9dca-4a61-ac88-80a3417c95f2
TableOfContents(title="MATH102 - TERM 222")

# ╔═╡ 1e9f4829-1f50-47ae-8745-0daa90e7aa42
md""" # Chapter 5 

## Section 5.2

"""

# ╔═╡ 9ce352ac-f374-4eb1-9a76-524ffd8a7306
cm"""
> __Objectives__
> 1. Use sigma notation to write and evaluate a sum.
> 2. Use sigma notation to write and evaluate a sum.
> 3. Approximate the area of a plane region.
> 4. Approximate the area of a plane region.

"""

# ╔═╡ 254d027d-ab13-4928-89b5-916dbf5f0044
md"""
### Sigma Notation
The sum of ``n`` terms  ``a_1, a_2, \cdots, a_n`` is written as
```math
\sum_{i=1}^n a_i = a_1+ a_2+ \cdots+ a_n
```
where ``i`` is the __index of summation__, ``a_i`` is the th __``i``th term__ of the sum, and the upper and lower bounds of summation are ``n`` and ``1``.
"""

# ╔═╡ 0edc99ec-c39d-4a9e-af0d-c9778c6b4211
begin
    hline = html"<hr>"
    md"""
    ####  Summation Properties

    ```math

    \begin{array}{lcl}
     \displaystyle\sum_{i=1}^n c a_i &=& c\sum_{i=1}^n  a_i \\
    \\
     \displaystyle\sum_{i=1}^n (a_i+b_i) &=& \sum_{i=1}^n  a_i+\sum_{i=1}^n  b_i \\
    \\
    \displaystyle\sum_{i=1}^n (a_i-b_i) &=& \sum_{i=1}^n  a_i-\sum_{i=1}^n  b_i \\
    \\
    \end{array} 
    ```

    #### Summation Formulas

    ```math
    \displaystyle
    \begin{array}{ll}
    (1) & \displaystyle\sum_{i=1}^n c = cn, \quad c \text{ is a constant} \\
    \\
    (2) & \displaystyle\sum_{i=1}^n i = \frac{n(n+1)}{2} \\
    \\
    (3) &\displaystyle \sum_{i=1}^n i^2 =  \frac{n(n+1)(2n+1)}{6} \\
    \\
    (4) & \displaystyle\sum_{i=1}^n i^3 = \left[\frac{n(n+1)}{2}\right]^2 \\
    \\
    \end{array} 
    ```



    $hline

    """
end

# ╔═╡ 164b1c78-9f7b-4f9d-a6a6-fbe754cdb43e
md"""
__Example__

Evaluate ``\displaystyle \sum_{i=1}^n\frac{i+1}{n}`` for ``n=10, 100, 1000`` and ``10,000``.

"""

# ╔═╡ b048a772-05c3-4cd0-97ae-5cf825127584
md""" 
### Area 


In __Euclidean geometry__, the simplest type of plane region is a rectangle. Although people often say that the *formula* for the area of a rectangle is
```math
A = bh
```
it is actually more proper to say that this is the *definition* of the __area of a rectangle__.

For a triangle ``A=\frac{1}{2}bh``

$(Resource("https://www.dropbox.com/s/sfsg0d4ha1m2gc6/triangle_area.jpg?raw=1", :width=>300))
"""

# ╔═╡ f16cb891-26d7-41c9-9747-f7d6cd054bc7
md"""
### The Area of a Plane Region

__Example__

Use __five__ rectangles to find two approximations of the area of the region lying between the graph of
```math
f(x)=5-x^2
```
and the $x$-axis between $x=0$ and $x=2$.
"""

# ╔═╡ 8ad65bee-9135-11eb-166a-837031c4bc45
f(x) = 5 - x^2

# ╔═╡ e7a87684-49b0-428c-9fef-248cf868cf33
begin
    ns = @bind n Slider(2:4000, show_value=true, default=4)
    as = @bind a NumberField(0:1)
    bs = @bind b NumberField(a+2:10)
    lrs = @bind lr Select(["l" => "Left", "r" => "Right", "m" => "Midpoint", "rnd" => "Random"])

    md"""
    n = $ns  a = $as  b = $bs method = $lrs

    """
end

# ╔═╡ 74f6ac5d-f974-4ea6-801c-b88fe3346e55
@bind showPlot Radio(["show" => "✅", "hide" => "❌"], default="hide")

# ╔═╡ c894d994-a7fc-4e07-8941-e9f9aa89fef0
begin
    if showPlot == "show"
        Δx = (b - a) / n
        xx1 = a:0.1:b

        # plot(f;xlim=(-2π,2π), xticks=(-2π:(π/2):2π,["$c π" for c in -2:0.5:2]))

        # recs= [rect(sample(p,Δx),Δx,p,f) for p in partition]
        # pp1=plot(xx1,f.(xx1);legend=nothing)
        pp1 = plot(xx1, f.(xx1), fillrange=zero, fillalpha=0.35, c=:blue, framestyle=:origin, label=nothing)
        anck1 = (b - a) / 2
        anck2 = f(anck1) / 2
        annotate!(pp1, [(anck1, anck2, L"$S$", 12)])
        annotate!(pp1, [(anck1, f(anck1), L"$y=%$f(x)$", 12)])
    end
end

# ╔═╡ 2da325ba-48cc-44b3-be34-e0cb46e33068
@bind showConnc Radio(["show" => "✅", "hide" => "❌"], default="hide")

# ╔═╡ 8436d1b3-c03e-42e6-bbff-e785738e0f89
(showConnc == "show") ? md"""
  $$A=\lim_{n\to \infty} R_n =\lim_{n\to \infty} L_n =\frac{22}{3}$$
  """ : ""

# ╔═╡ d00038ba-98e9-45db-91df-dc75cb8ec101
begin
    findingAreaP = plot(0.2:0.1:4, x -> 0.6x^3 - (10 / 3) * x^2 + (13 / 3) * x + 1.4, fillrange=zero, fillalpha=0.35, c=:red, framestyle=:origin, label=nothing, ticks=nothing)
    plot!(findingAreaP, -0.1:0.1:4.1, x -> 0.6x^3 - (10 / 3) * x^2 + (13 / 3) * x + 1.4, c=:green, label=nothing)
    annotate!(findingAreaP, [
        (0.1, 4, text(L"y", 14)),
        (4.1, 0.1, text(L"x", 14)),
        (0.2, -0.1, text(L"a", 14)),
        (4, -0.1, text(L"b", 14)),
        (3.9, 4, text(L"f", 14))
    ])
    cm"""
    ### Finding Area by the Limit Definition

    __Find the area of the region is bounded below by the ``x``-axis, and the left and right boundaries of the region are the vertical lines ``x=a`` and ``x=b``.__

    $findingAreaP

    $(Resource("https://www.dropbox.com/s/hnspiptmyybneqn/area_with_lower_and_upper.jpg?raw=1",:width=>400))
    """
end

# ╔═╡ ef203912-b238-40a7-9d1b-4ed9b86ccbd2
cm"""
__Example__
Find the upper and lower sums for the region bounded by the graph of ``f(x)=x^2`` and the ``x``-axis between ``x=0`` and ``x=2``.
"""

# ╔═╡ 614c0f82-523a-40a6-9b57-d8b16d2b2860
cm"""
__Theorem__ *Limits of the Lower and Upper Sums*

Let ``f`` be continuous and nonnegative on the interval ``[a,b]``. The limits as ``n\to\infty`` of both the lower and upper sums exist and are equal to each other. That is,
```math
\displaystyle \lim_{n\to\infty}s(n)=
\displaystyle \lim_{n\to\infty}\sum_{i=1}^nf(m_i)\Delta x
=\displaystyle \lim_{n\to\infty}\sum_{i=1}^nf(M_i)\Delta x
=\displaystyle \lim_{n\to\infty}S(n)
```
‍
‍
where  
```math
\Delta x = \frac{b-a}{n}
```
and ``f(m_i)`` and ``f(M_i)`` are the minimum and maximum values of ``f`` on the ``i``th subinterval.

"""

# ╔═╡ abd37588-b86f-4e99-8728-5a362ce5f34f
cm"""
__Definition of the Area of a Region in the Plane__
Let ``f`` be continuous and nonnegative on the interval ``[a,b]``.  The area of the region bounded by the graph of ``f`` , the ``x``-axis, and the vertical lines ``x=a`` and ``y=b`` is 
```math
\textrm{Area} = \displaystyle \lim_{n\to\infty}\sum_{i=1}^nf(c_i)\Delta x
```
where 
```math
x_{i-1}\leq c_i\leq x_i\quad \textrm{and}\quad \Delta x =\frac{b-a}{n}.
```
See the grpah
<div class="img-container">

$(Resource("https://www.dropbox.com/s/a3sjz8m9vspp5ec/area_def.jpg?raw=1"))

</div>
"""

# ╔═╡ 1081bd99-7658-4c32-812c-14235bd82596
begin
    cm"""
    __Example__

    Find the area of the region bounded by the graph of ``f(x)=x^3`` , the ``x``-axis, and the vertical lines ``x=0`` and ``x=1``.

    """
end

# ╔═╡ c97d5915-7f1f-4fd6-80d3-aecb256ea0de
cm"""
__Example__

Find the area of the region bounded by the graph of ``f(y)=y^2`` and the ``y``-axis for ``0\leq y\leq 1``.

"""

# ╔═╡ 55084c2d-6f81-4e55-946c-703245a6bb86
cm"""
__Midpoint Rule__

```math
\textrm{Area} \approx \sum_{i=1}^n f\left(\frac{x_{i-1}+x_i}{2}\right)\Delta x.
```
__Example__

Use the Midpoint Rule with ``n=4`` to approximate the area of the region bounded by the graph of ``f(x)=\sin x`` and the ``x``-axis for ``0\leq x\leq \pi``, 
"""


# ╔═╡ 30b561dd-6e6b-4719-abc0-9938099d5487
md""" ## Section 5.3 
### Riemann Sums and Definite Integrals

> __Objectives__
> 1. Understand the definition of a Riemann sum.
> 2. Evaluate a definite integral using limits and geometric formulas.
> 3. Evaluate a definite integral using properties of definite integrals.

"""

# ╔═╡ d854d0ea-c5dd-4efa-9f46-83807339e163
g(x) = √x

# ╔═╡ bceda6d4-b93f-4282-8f03-fc44132ea1bb
begin
    ns2 = @bind n2 Slider(2:2000, show_value=true, default=4)
    as2 = @bind a2 NumberField(-10:10, default=0)
    bs2 = @bind b2 NumberField(a+1:10)
    lrs2 = @bind lr2 Select(["l" => "Left", "r" => "Right", "m" => "Midpoint", "rnd" => "Random"])
    md"""
    n = $ns2  a = $as2  b = $bs2 method = $lrs2


    """
end

# ╔═╡ 7a4f6354-3d0c-4814-8c4c-2d2200568545
md"__Use unequal Widths__"

# ╔═╡ 94b4f73a-ee55-405a-be50-bb92048f4eb2
md"""
__Definition of Riemann Sum__
Let ``f`` be defined on the closed interval ``[a,b]``, and let ``\Delta`` be a partition of ``[a,b]`` given by

```math
a=x_0 < x_1 <x_2<\cdots<x_{n-1}<x_n=b
```

where ``\Delta x_i`` is the width of the th subinterval

```math
[x_{i-1},x_i]\quad \color{red}i\textrm{{th subinterval}}
```

‍
‍
If ``c_i``  is any point in the th subinterval, then the sum

```math
\sum_{i=1}^n f(c_i)\Delta x_i, \quad x_{i-1}\leq c_i\leq x_i
```
is called a __Riemann sum__ of ``f`` for the partition ``\Delta``.
"""

# ╔═╡ 9f9345b8-a29a-41fe-a41b-3dcef2e1a366
cm"""
__Remark__

The width of the largest subinterval of a partition ``\Delta`` is the __norm__ of the partition and is denoted by ``\|\Delta\|``. 

- If every subinterval is of equal width, then the partition is __regular__ and the norm is denoted by
```math
\|\Delta\| = \Delta x =\frac{b-a}{n} \quad \color{red}{\textrm{Regular partition}}
```

- For a general partition, the norm is related to the number of subintervals of ``[a,b]`` in the following way.
```math
\frac{b-a}{\|\Delta\|}\leq n \quad \color{red}{\textrm{General partition}}
```

- Note that
```math
\|\Delta\|\to 0 \quad \textrm{implies that}\quad n\to \infty.
```

"""

# ╔═╡ ae6ea7e0-f6f3-4d82-a45d-2c5ed299b223
cm"""
### Definition of Definite Integral
If ``f`` is defined on the closed interval ``[a,b]`` and the limit of Riemann sums over partitions ``\Delta`` 
```math
\lim_{\|\Delta\|\to 0}\sum_{i=1}^nf(c_i)\Delta x_i
```
‍
exists, then ``f`` is said to be __integrable__ on ``[a,b]`` and the limit is denoted by
```math
\lim_{\|\Delta\|\to 0}\sum_{i=1}^nf(c_i)\Delta x_i = \int_a^b f(x) dx.
```
‍
‍The limit is called the __definite integral__ of ``f`` from ``a`` to ``b``. The number ``a`` is the __lower limit__ of integration, and the number ``b`` is the __upper limit__ of integration.
"""

# ╔═╡ fd726227-f911-4383-90a7-aaab504b68ef
cm"""
__Theorem__ *Continuity Implies Integrability*

If a function ``f`` is continuous on the closed interval ``[a,b]``, then ``f`` is integrable on ``[a,b]``. That is, 

```math
\int_a^b f(x) dx \quad \textrm{exists}.
```

"""

# ╔═╡ d76afcb0-4b38-463d-add1-a58dd6acbbc0
cm"""
__Theorem__ *The Definite Integral as the Area of a Region*

If ``f`` is continuous and nonnegative on the closed interval ``[a,b]``, then the area of the region bounded by the graph of ``f``, the ``x``-axis, and the vertical lines ``x=a`` and ``x=b`` is
```math
\textrm{Area} = \int_a^b f(x) dx
```
‍
‍
"""

# ╔═╡ e7ea2eb7-b394-4ce6-b0a9-31d229e69787
cm"""
__Example__

Evaluate each integral using a geometric formula.

- ``\int_1^3 4 dx``
- ``\int_0^3 (x+2) dx``
- ``\int_{-2}^2 \sqrt{4-x^2} dx``
```
"""

# ╔═╡ 0a344b61-a226-49ee-ba19-f618390db269
md"""
* The definite integral  is a **number**; it does not depend on ``x``. In fact, we could use any letter in place of ``x`` without changing the value of the integral:

```math
\int_a^b f(x) dx = \int_a^b f(y) dy =\int_a^b f(w) dw =\int_a^b f(😀) d😀 
```
"""

# ╔═╡ 4d72f4f3-1dbc-49b9-894f-a521a24e2531
md""" 
* The sum ``\sum_{i=1}^n f(x_i^*)\Delta x`` is called **Riemann Sum**.
"""

# ╔═╡ e427ab16-9d5a-4200-8d96-8e49ec0da312
begin
    f2(x) = sin(x) + 2
    theme(:wong)
    x = 1:0.1:5
    y = f2.(x)
    p3 = plot(x, y, label=nothing)
    plot!(p3, x, y / 2, ribbon=y / 2, linestyle=:dot, linealpha=0.1, framestyle=:origin, xticks=(1:5, [:a, "", "", "", :b]), label=nothing, ylims=(-1, 4))
    annotate!(p3, [(3.5, 2.5, L"y=f(x)"), (5.2, 0, L"x"), (0.2, 4, L"y")])
    # annotate!(p2,[(4,0.51,(L"$\sum_{i=1}^{%$n2} f (x^*_{i})\Delta x=%$s2$",12))])

    md""" * If ``f(x)\ge 0``, the integral ``\int_a^b f(x) dx`` is the area under the curve ``y=f(x)`` from ``a`` to ``b``.	

    $p3
    """

end

# ╔═╡ 4e0ef31d-05e7-4974-9282-fa4579e16328
md""" * ``\int_a^b f(x) dx`` is the net area

$(load(download("https://www.dropbox.com/s/ol9l38j2a53usei/note3.png?raw=1")))
"""

# ╔═╡ 2bef2339-7afe-427d-bdc5-19b9e9b43878
begin
    s52q1Check = @bind s52q1chk Radio(["show" => "show", "hide" => "hide"], default="hide")
    q1Img = download("https://www.dropbox.com/s/7esby3czioyzk26/q1.png?dl=0")
    md""" 
    **Question 1:** 

    $(load(q1Img))

    where each of the regions ``A, B`` and ``C`` has area equal to 5, then the area between the graph and the x-axis from ``x=-4`` to ``x=2`` is

    $(s52q1Check)
    	
    """

end

# ╔═╡ 0f3814d4-6ee7-4242-88ea-5ecc7bf752bf
md" the nswer is = **$((s52q1chk ==\"show\") ?  15 : \"\")**"

# ╔═╡ 05eb2a4e-2552-4bed-9523-d4f4c8760c94
begin
    s52q1Check1 = @bind s52q1chk1 Radio(["show" => "show", "hide" => "hide"], default="hide")

    md""" 
    **Question 2:** 

    $(load(q1Img))

    where each of the regions ``A, B`` and ``C`` has area equal to 5, then 
    	``\int_{-4}^2 f(x) dx = `` 

    $(s52q1Check1)
    	
    """

end

# ╔═╡ 311050cc-9f52-43e0-afca-66d225c837d2
md" the nswer is = **$((s52q1chk1 ==\"show\") ?  -5 : \"\")**"

# ╔═╡ f5f43417-abcd-4b20-a9ff-be06157b4a02
html"<hr>"

# ╔═╡ e6f0b66d-9efa-4d2d-93a7-0d0d82c7948a
md""" **Theorem**
If ``f`` is continuous on ``[a,b]``, or if ``f`` has only a finite number of jump discontinuities, then ``f`` is integrable on ``[a,b]``; that is, the definite integral ``\int_a^b f(x)dx`` exists.

"""

# ╔═╡ 784142ee-1416-4ccb-a341-0497422009b6
html"<hr>"

# ╔═╡ a42d6141-e2e3-4725-ab00-4183c16461e3
md""" **Theorem**

If ``f`` is integrable on ``[a,b]``, then
```math 
\int_a^b f(x) dx = \lim_{n\to \infty} \sum_{i=1}^n f(x_i)\Delta x 
```
where
```math
\Delta x = \frac{b-a}{n}
```
and
```math
x_i = a+i\Delta x
```
"""



# ╔═╡ 67a805bd-640d-4d88-8d61-8fef8bb23940
md"""
**Question**

What do we mean when we say that a function $f$ is _integrable_?
##### (A) $f$ is continuous.
##### (B) $f$ is differentiable.
##### (C) $f$ has area.
##### (D) $f$ is discotinuous.
##### (E) none of the above.
"""


# ╔═╡ 843fec4c-3a4a-4cb2-881c-9a4e3df6a5bb
cm"""
### Properties of Definite Integrals
- If ``f``  is defined at ``x=a``, then ``\displaystyle \int_a^a f(x) dx =0``.
- If ``f``  is integrable on ``[a,b]``, then ``\displaystyle \int_b^a f(x) dx =- \int_a^b f(x) dx``.
- If ``f`` is integrable on the three closed intervals determined by ``a, b`` and ``c``, then
```math
\int_a^b f(x) dx = \int_a^c f(x) dx + \int_c^b f(x) dx.
```
- If ``f``  and ``g`` are integrable on ``[a,b]`` and ``k`` is a constant, then the functions ``kf`` and ``f\pm g`` are integrable on ``[a,b]``, and
 	1. ``\displaystyle \int_a^b kf(x) dx = k \int_a^b f(x) dx``.
	2. ``\displaystyle \int_a^b \left[f(x)\pm g(x)\right] dx = \int_a^b f(x) dx\pm \int_a^b g(x) dx``.
- If ``f`` is integrable and nonnegative on the closed interval ``[a,b]``, then
```math
0\leq \int_a^b f(x) dx.
```
- If ``f`` and ``g`` are integrable on the closed interval ``[a,b]`` and ``f(x)\leq g(x)`` for every ``x`` in ``[a,b]`` , then
```math
\int_a^b f(x) dx \leq \int_a^b g(x) dx.
```
"""

# ╔═╡ 09383e0f-2b37-459e-aeb3-b8eb4f194ddd
md"""
### Evaluating Definite Integrals

1. Using the definition
2. Using a Computer Algebra System
3. Interpreting as areas
4. Approximating
5. Using integration techniques (tricks)

"""

# ╔═╡ 0cfb00ed-60fe-4ebb-b5e2-6182ace7a719
begin
    xx = symbols("xx", real=true)
    sol = integrate(exp(xx), (xx, 1, 3))
    md"""
    #### 2. Using a Computer Algebra System

    **Example:**

    1. Set up an expression for $\int_1^3 e^x dx$ as a limit of sums. 
    2. Use a computer algebra system to evaluate the expression
    	
    **Solution:**
    1. In class
    """

end

# ╔═╡ bfd46851-772d-43d4-8875-7d5c5dfb1155
integrate(exp(xx), (xx, 1, 3))

# ╔═╡ 19b11522-d11c-4fe1-8f74-5dc975d82bc0
md"""
#### 3. Interpreting as areas
**Example:**
Evaluate the following integrals by interpreting each in terms of areas

(i) $\int_0^3  \sqrt{9-x^2} dx$  

(ii) $\int_{-2}^1|x|dx$


(iii) $\int_{-2}^1 xdx$
"""

# ╔═╡ 44c9faca-efb6-493c-b751-9fd69e89ecb4
begin
    f1(x) = sqrt(9 - x^2)
    f3(x) = abs(x)
    theme(:wong)
    pp = plot(f1, xlims=[-4, 4], ylims=[-4, 4], framestyle=:origin, xtick=-4:1:4, yticks=-4:1:4)
    md"$pp"
end


# ╔═╡ 1ae29d9c-d055-46d8-9a46-0d35a48cc58a
md""" #### 4. Approximating (Midpoint Rule)

```math
\int_a^b f(x) dx \approx \sum_{i=1}^n f(\overline{x_i})\Delta x = \Delta x\left[
f(\overline{x_1})+\cdots+f(\overline{x_n})
\right]
```
```math 
\text{where} \qquad \Delta x = \frac{b-a}{n}
```
```math 
\text{and} \qquad \overline{x_i} = \frac{1}{2}\left(x_{i-1}+x_i\right) = \textrm{midpoint of } [x_{i-1},x_i].
```
**Example**: Use the Midpoint Rule to approximate 
$${\large \int_1^2\frac{1}{x}dx}$$
with $n=5$.

(SOLUTION IN CLASS)

"""

# ╔═╡ 8d474b8c-7f6f-4ee4-9282-5e8aa0a2f7b0
m5 = [0.2 * (1 / x) for x in 1.1:0.2:1.9] |> sum

# ╔═╡ f9e82107-07b9-4697-88fe-81b019640e6a
integrate(1 / xx, (xx, 1, 2)).n()

# ╔═╡ be9f84d5-3c65-4ceb-8767-3fdc41429e12
md""" **Example**

Estimate 
```math 
\int_0^1 e^{-x^2} dx
```

"""

# ╔═╡ cf3bce53-0260-403c-8910-b04b05b558fe
begin
    exact = integrate(exp(-xx^2), (xx, 0, 1)).n()
end

# ╔═╡ e3d540a3-7da5-4ef6-aa31-e629e752484e
md"""
**Exercises:**

1. Wrtie as definite integral 
$\lim_{n\to \infty}\sum_{i=1}^n\frac{1}{n}\cos\left(1+\frac{i}{n}\right)^2=$
2. If $\int_{-5}^7f(x)dx=-17, \int_{-5}^{11}f(x)dx=32$, and $\int_{8}^7f(x)dx=5$, then $\int_{11}^8f(x)dx=$

"""

# ╔═╡ 7fb16fd7-feac-4a75-bcf0-cf91ca7b3599
cm"""
## Section 5.4
__The Fundamental Theorem of Calculus__
> __Objectives__
> 1. Evaluate a definite integral using the Fundamental Theorem of Calculus.
> 2. Understand and use the Mean Value Theorem for Integrals.
> 3. Find the average value of a function over a closed interval.
> 4. Understand and use the Second Fundamental Theorem of Calculus.
> 5. Understand and use the Net Change Theorem.

"""

# ╔═╡ dd5ee5ee-b2a7-46d4-bc43-0b9778eefcc2
cm"""
### The Fundamental Theorem of Calculus

__Antidifferentiation and Definite Integration__

<div class="img-container">

$(Resource("https://www.dropbox.com/s/8f52dty2aywwr92/diff_vs_antidiff.jpg?raw=1",:width=>600))

</div>


* ✒ ``\displaystyle \int_a^b f(x) dx``
    * definite integral
    * number              
* ✒ ``\displaystyle \int f(x) dx``
    * indefinite integral 
    * function

__Theorem__ *The Fundamental Theorem of Calculus*

If a function ``f`` is continuous on the closed interval ``[a,b]`` and ``F`` is an antiderivative of ``f`` on the interval ``[a,b]``, then
```math
\int_a^b f(x) dx = F(b) - F(a).
```

__Remark:__

We use the notation 
```math
\int_a^b f(x) dx = \bigl. F(x)\Biggr|_a^b= F(b)-F(a) \quad \textrm{or}\quad 
\int_a^b f(x) dx =\Bigl[F(x)\Bigr]_a^b = F(b)-F(a)
```
"""

# ╔═╡ 4db12c57-014f-4aa0-a5b1-4f12eb3bf834
cm"""
__Example__

Evaluate each definite integral.

- ``\displaystyle \int_1^2 (x^2-3) dx``

$("  ")
- ``\displaystyle \int_1^4 3\sqrt{x} dx``

$("  ")
- ``\displaystyle \int_{0}^{\pi/4} \sec^2 x dx``

$("  ")
- ``\displaystyle \int_{0}^{2} \Big|2x-1\Big| dx``
"""

# ╔═╡ b592499b-cf96-486e-9067-9c79b5894641
begin
    theme(:wong)
    s54e3_f(x) = 1 / x
    s54e3_x = 1:0.1:exp(1)
    s54e3_p = plot(s54e3_x, s54e3_f.(s54e3_x), label=nothing, c=:green)
    plot!(s54e3_p, s54e3_x, s54e3_f.(s54e3_x) / 2, ribbon=s54e3_f.(s54e3_x) / 2, linestyle=:dot, linealpha=0.1, framestyle=:origin, xticks=(1:4, [:1, :2, :3]), label=nothing, ylims=(-0.1, 1.5), xlims=(-0.1, 3))
    annotate!(s54e3_p, [(2, 1, L"y=\frac{1}{x}"), (exp(1), -0.1, L"e")])
    cm"""
    	
    __Example__

    Find the area of the region bounded by the graph of
    ```math
    y=\frac{1}{x}
    ```
    the ``x``-axis, and the vertical lines ``x=1`` and ``x=e``.


    $s54e3_p

    """
end

# ╔═╡ bfbb3b72-dedc-476d-a028-997e98b61ae4
begin
    cm"""
    ### The Mean Value Theorem for Integrals

    __Theorem__ *Mean Value Theorem for Integrals*

    If ``f`` is continuous on the closed interval ``[a,b]``, then there exists a number ``c`` in the closed interval ``[a,b]`` such that
    ```math
    \int_a^b f(x) dx =f(c)(b-a).
    ```

    <div class="img-container">

    $(Resource("https://www.dropbox.com/s/7fnr2kfq082kq0y/mvt.jpg?raw=1",
    :style=>"display:flex;align-items:center;flex-direction: column;"))
    </div>

    """
end

# ╔═╡ c3650a10-dff3-4fa2-bb56-3a19e1838766
cm"""
### Average Value of a Function

__Definition of the Average Value of a Function on an Interval__

If ``f`` is integrable on the closed interval ``[a.b``, then the __average value__ of ``f`` on the interval is
```math
\textbf{Avergae value} = \frac{1}{b-a}\int_a^b f(x) dx
```

__Example__

Find the average value of ``f(x)=3x^2-2x``  on the interval ``[1,4]``.

"""

# ╔═╡ 16053a54-d268-479b-bd2e-0634c4a1bb89
cm"""
### The Second Fundamental Theorem of Calculus

<div class="img-container">

$(Resource("https://www.dropbox.com/s/knjbngrqs2r2h1z/ftc2.jpg?raw=1",
:style=>"margin-top:20px;"
))

</div>

"""

# ╔═╡ 3b115e62-8040-4a2c-8d6e-3d03669e7cd8
md"""
Consider the following function 

```math 
F(x) = \int_a^x f(t) dt
```
where ``f`` is a continuous function on the interval ``[a,b]`` and ``x \in [a,b]``.

"""

# ╔═╡ 3c16772c-394d-4472-8749-f5990bb69013
begin
    Slider4 = @bind slider4 Slider(1:0.1:5, show_value=false)
    md"x = $Slider4"
end

# ╔═╡ 3644e2e8-9b59-433e-9761-58566f0e1329
begin
    f4(x) = sin(x) + 2
    theme(:wong)
    x4 = 1:0.1:5
    y4 = f4.(x4)
    xVar = 1:0.1:slider4
    yVar = f4.(xVar) / 2
    p4 = plot(x4, y4, label=nothing, grid=false)

    plot!(p4, xVar, yVar, ribbon=yVar, linestyle=:dot, linealpha=0.1, framestyle=:origin, xticks=(1:5, [:a, "", "", "", :b]), label=nothing, ylims=(-1, 4))
    plot!(p4, xticks=(x4, [:a, ["" for i in 2:length(xVar)-1]..., :x, ["" for i in length(xVar):length(x4)-2]..., :b]))
    annotate!(p4, [(3.5, 2.5, L"y=f(t)"), (5.2, 0, L"t"), (0.2, 4, L"y")])
    slider4 > 1 && annotate!(p4, [(slider4 * 0.7, 1, (L"$F(x)=\int_a^x f(t) dt$", 12))])

    md"""

    $p4
    """

end

# ╔═╡ b9d687cc-9c13-4285-85ac-90ef955f94f3
begin
    img = load("./imgs/5.3/ex1.png") |> im -> imresize(im, ratio=0.7)
    md"""
    **Example** 
    If ``g(x) = \int_0^x f(t) dt``

    $img

    Find ``g(2)`` 

    """
end

# ╔═╡ 0ca459b3-36ad-46f0-b49d-af921c57b9df
cm"""
__Theorem__ *The Second Fundamental Theorem of Calculus*

If ``f`` is continuous on an open interval ``I`` containing ``a``, then, for every ``x`` in the interval,

```math

\frac{d}{dx}\left[\int_a^x f(t) \right] = f(x).
```

"""

# ╔═╡ 02ff212e-937d-4e8e-96d2-5f982618b92d
begin
    md"""

    ##### Remarks
    * ``{\large \frac{d}{dx}\left( \int_a^x f(u) du\right) = f(x)}``
    * ``g(x)`` is an **antiderivative** of ``f``

    ##### Examples
    Find the derivative of 	
    	
    (1) ``g_1(x) = \int_0^x \sqrt{1+t} dt``.

    (2) ``g_2(x) = \int_x^0 \sqrt{1+t} dt``.
    	
    (3) ``g_3(x) = \int_0^{x^2} \sqrt{1+t} dt``.
    	
    (4) ``g_4(x) = \int_{\sin(x)}^{\cos(x)} \sqrt{1+t} dt``.
    """
end

# ╔═╡ c8d0298f-2336-41b8-a4f4-a5be5db751f3
md"""
💣 BE CAREFUL:

Evaluate ``\large \int_{-3}^6 \frac{1}{x}dx``
"""

# ╔═╡ 4d4b41dc-f02f-4404-96c1-bb78376f010b
md"""
**Example:**
Sketch the region enclosed by the given curves and calculuate its area
```math
y=2x-x^2, \quad y=0
```
Solution: In class
"""

# ╔═╡ 018998d3-5c21-468c-b3e8-f413a485eedd
begin
    pltExmpl = plot(x -> 2 * x - x^2, framestyle=:origin, xlims=(0, 2), ylims=(-1, 2), fill=(0, 0.5, :green), label=nothing)
    plot!(pltExmpl, x -> 2 * x - x^2, framestyle=:origin, xlims=(-1, 3), ylims=(-1, 2), label=nothing)
end

# ╔═╡ 638eef4b-d46c-453b-ac40-179ce70cc330
ff(x) = 2 * x - x^2;
md""" A=$(integrate(ff(xx),(xx,0,2)))""";

# ╔═╡ b0fb2fbb-0175-4cce-b90d-3f9fa9b4541e
begin

    md"""
    ### Table of Indefinite Integrals

    |  | |  |
    |--------------|--------------|------- |
    | $$\int c f(x) dx =c\int  f(x) dx$$ |    | $\int [f(x)+g(x)] dx =\int  f(x) dx+\int g(x) dx$|
    | | | |
    |$$\int k dx = kx + C$$ | | $$\int x^n dx = \frac{x^{n+1}}{n+1} + C, n\not=-1$$ 
    | | | |
    |$$\int \frac{1}{x} dx = \ln \|x\| + C$$  || $$\int e^x dx = e^x + C$$ 
    | | | |
    |$$\int a^x dx = \frac{a^x}{\ln a}+ C$$  || $$\int \sin x dx = -\cos x + C$$ 
    | | | |
    |$$\int \cos x dx = \sin x + C$$ || $$\int \sec^2 x dx = \tan x + C$$
    | | | |
    |$$\int \csc^2 x dx = -\cot x + C$$ || $$\int \sec x\tan x dx = \sec x + C$$
    | | | |
    |$$\int \frac{1}{x^2+1} dx = \tan^{-1} x + C$$ || $$\int \frac{1}{\sqrt{1-x^2}} dx = \sin^{-1} x + C$$
    | | | |
    |$$\int \sinh x dx = \cosh x + C$$ || $$\int \cosh x dx = \sinh x + C$$
    | | | |
    |$$\int \csc x\cot x dx = -\csc x + C$$ ||
    | | | |
    	


    """
end

# ╔═╡ 0fd76efb-6d98-43f8-b714-8cf54fd62e7d
md"""
__Applications__

**Question:** If $y=F(x)$, then what does $F'(x)$ represents?
### Net Change Theorem 

__Theorem__ *The Net Change Theorem*

If ``F'(x)`` is the rate of change of a quantity ``F(x)`` , then the definite integral of ``F'(x)`` from ``a`` to ``b`` gives the total change, or __net change__, of ``F(x)`` on the interval ``[a,b]``.

```math
\int_a^b F'(x) dx = F(b) - F(a) \qquad \color{red}{\textrm{Net change of } F(x)}
```
- There are many applications, we will focus on one

If an object moves along a straight line with position function ``s(t)``, then its velocity is ``v(t)=s'(t)``, so
```math
\int_{t_1}^{t_2}v(t) dt = s(t_2)-s(t_1) 
```

- **Remarks**
```math
\begin{array}{rcl}
\text{displacement} &=& \int_{t_1}^{t_2}v(t) dt\\
\\
\text{total distance traveled} &=& \int_{t_1}^{t_2}|v(t)| dt \\ \\
\end{array}
```
- The acceleration of the object is ``a(t)=v'(t)``, so
```math
\int_{t_1}^{t_2}a(t) dt = v(t_2)-v(t_1) \quad \text { is the change in velocity from time  to time .}
```

"""

# ╔═╡ 78d480bf-bc4d-48e3-b3aa-100a38d6b4bc
cm"""
**Example**
A particle is moving along aline. Its velocity function (in ``m/s^2``) is given by
```math
v(t)=t^3-10t^2+29t-20,
```
<ul style="list-style-type: lower-alpha;">

<li> What is the <b>displacement</b> of the particle on the time interval 1≤ t≤ 5?</li>
<li>What is the <b>total distance</b> traveled by the particle on the time interval 1≤ t≤ 5?</li>

</ul>
"""

# ╔═╡ bc42cf6d-44be-4244-85de-a10d03884dfd
v(t) = t^3 - 10 * t^2 + 29 * t - 20

# ╔═╡ 78d284e8-bd29-4ec3-9470-2141574787eb
begin

    u = symbols("u", real=true)
    v1(t) = v(t)
    s1(t) = convert(Float64, integrate(v1(u), (u, 0, t)).n())

    theme(:default)
    a1, b1 = 1, 5
    t1 = a1:0.1:b1
    timeLength = length(t1)
    xxx = s1.(t1)
    vvv = v1.(t1)
    myXlims = s1(a1) .+ (0, 20)
    myYlims = vvv |> ff -> (min(ff...) - 1, max(ff...) + 1)
    anim = @animate for i ∈ 1:timeLength
        pp = plot(; layout=(2, 1))
        scatter!(pp, (xxx[i], 0),
            markersize=5,
            grids=:none,
            framestyle=:origin,
            showaxis=:x,
            yticks=nothing,
            ylims=(-0.4, 0.4),
            xlims=myXlims,
            label=nothing,
            xticks=nothing,
            # xticks=(myXlims[1]:50:myXlims[2],[]),
            tickfontsize=8,
            subplot=1
        )
        plot!(pp,
            t1[1:i],
            vvv[1:i],
            xlims=(0, myXlims[2]),
            ylims=myYlims,
            xticks=(1:5, [:1, :2, :3, :4, :5]),
            framestyle=:origin,
            label=nothing,
            xlabel="x",
            subplot=2,
            title="Velocity Graph"
        )
        annotate!(pp, [(xxx[i], 0.2, "time=$(t1[i])")], subplot=1)
        # annotate!(pp,[(5,8.2,("velocity graph",10))], subplot=2)
    end

    html""
end

# ╔═╡ 9b822e05-ad44-4238-9bfe-4b54d6e42628
begin

    velFun = @bind velfun TextField()
    md"""
    Enter the velocity function

    ``v(t)`` = $velFun

    """
    html""
end


# ╔═╡ 08e5381c-4cf1-4c70-ba74-26a05b8046fa
md"""
## Section 5.5:
**The Substitution Rule**
> __Objectives__
> 1. Use pattern recognition to find an indefinite integral.
> 2. Use a change of variables to find an indefinite integral.
> 3. Use the General Power Rule for Integration to find an indefinite integral.
> 4. Use a change of variables to evaluate a definite integral.
> 5. Evaluate a definite integral involving an even or odd function.


||||
|------|------|-------|
||solve|||
|$$\int 2x \sqrt{1+x^2} \;\; dx$$|  | $$\int \sqrt{u} \;\; du$$|

"""

# ╔═╡ f3e2034d-e259-4d0b-bca4-95fd17f69d56
cm"### Pattern Recognition"

# ╔═╡ 805cf044-8187-410e-833d-f4323ce07380
begin
    f155(x) = x / sqrt(1 - 4 * x^2)
    # ex1_55=plot(-0.49:0.01:0.49,f155.(-0.49:0.01:0.49), framestyle=:origin)
    cm"""
    __Theorem__ *Antidifferentiation of a Composite Function*
    Let ``g`` be a function whose range is an interval ``I``, and let ``f`` be a function that is continuous on ``I``. If ``g`` is differentiable on its domain and  ``F`` is an antiderivative of ``f`` on ``I``, then
    ```math
    \int f(g(x))g'(x)dx = F(g(x)) + C.
    ```
    Letting ``u=g(x)`` gives ``du=g'(x)dx`` and
    ```math
    \int f(u) du = F(u) + C.
    ```

    <div class="img-container">

    $(Resource("https://www.dropbox.com/s/uua8vuahfxnp48c/subs_th.jpg?raw=1"))

    </div>

    **Substitution Rule says:** It is permissible to operate with ``dx`` and ``du`` after integral signs as if they were differentials.

    **Example**
    Find 
    ```math
    \begin{array}{ll}
    (i) & \int \bigl(x^2+1 \bigr)^2 (2x) dx \\ \\
    (ii) & \int 5e^{5x} dx \\ \\
    (iii) & \int \frac{x}{\sqrt{1-4x^2}} dx \\ \\
    (iv) & \int \sqrt{1+x^2} \;\; x^5 dx \\ \\ 
    (v) & \int \tan x dx \\ \\
    \end{array}
    ```


    """
end

# ╔═╡ 7549863d-1e44-422f-9ddd-beec2ddcd48d
cm"""
### Change of Variables for Indefinite Integrals
__Example__: Find
```math
	\begin{array}{ll}
	(i) & \int \sqrt{2x-1} dx \\ \\
	(ii) & \int x\sqrt{2x-1} dx \\ \\
	(iii) & \int \sin^23x\cos3x dx \\ \\
	\end{array}
```
	
"""


# ╔═╡ 47d4a0d9-467b-4717-a621-9d37e3870018
cm"""
### The General Power Rule for Integration
__Theorem__ *The General Power Rule for Integration*
If ``g`` is a differentiable function of ``x``, then
```math
\int\bigl[g(x)\bigr]^ng'(x) dx = \frac{\bigl[g(x)\bigr]^{n+1}}{n+1} + C, \quad n\neq -1.
```
‍Equivalently, if ``u=g(x)``, then
```math
\int u^n du = \frac{u^{n+1}}{n+1} + C, \quad n\neq -1.
```
‍
__Example__: Find
```math
	\begin{array}{ll}
	(i) & \int 3(3x-1)^4 dx \\ \\
	(ii) & \int (e^x+1)(e^x+x) dx \\ \\
	(iii) & \int 3x^2\sqrt{x^3-2} \;dx \\ \\
	(iv) & \displaystyle \int \frac{-4x}{(1-2x^2)^2}\; dx \\ \\
	(v) & \int \cos^2 x\sin x \;dx \\ \\
	\end{array}
```
	

"""

# ╔═╡ afdac3e8-bc84-48fd-8a04-d838e038c16d
cm"""
### Change of Variables for Definite Integrals

"""

# ╔═╡ 497ff4cd-2705-49b3-bde6-671352e9b5a0
begin
    ex2fun1(x) = log(x) / x
    ex2fun2(x) = x
    ex2x1 = 1:0.1:exp(1)
    ex2x12 = 0:0.1:1
    ex2x2 = 0.6:0.1:4
    ex2x22 = log(0.6):0.1:log(4)

    ex2y1 = ex2fun1.(ex2x1)
    ex2y12 = ex2fun2.(ex2x12)
    ex2y2 = ex2fun1.(ex2x2)
    ex2y22 = ex2fun2.(ex2x22)
    theme(:wong)
    ex2plt1 = plot(ex2x1, ex2y1, framestyle=:origin, xlims=(0, exp(1)), ylims=(-1, 1), fillrange=0, fillalpha=0.5, c=:red, label=nothing)
    plot!(ex2plt1, ex2x2, ex2y2, c=:red, label=nothing)
    xlims!(ex2plt1, -1, 4)
    annotate!(ex2plt1, [(2, 0.5, L"y=\frac{\ln x}{x}"), (exp(1), -0.05, text(L"e", 12))])
    plot!(ex2plt1, [exp(1), exp(1)], [0, ex2fun1(exp(1))], c=:red, linewidth=3, label=nothing)

    ex2plt2 = plot(ex2x12, ex2y12, framestyle=:origin, xlims=(0, 1), ylims=(-1, 1), fillrange=0, fillalpha=0.5, c=:red, label=nothing)
    plot!(ex2plt2, ex2x22, ex2y22, c=:red, label=nothing)
    xlims!(ex2plt2, -1, 4)
    annotate!(ex2plt2, [(2, 0.5, L"v=u")])
    # ylims!()
    # plot!(ex2plt2,ex2x,ex2y, framestyle=:origin, xlims=(1,exp(1)), fillrange =0,fillalpha=0.5,c=:red)
    # xlims!(ex2plt1,-1,2)
    # plot!(ex2plt1, fill=(0, 0.5, :red), xlims=(1,2))
    md""" 
    ### Substitution: Definite Integrals
    **Example:**
    	Evaluate

    ```math
    \begin{array}{ll}
    (i) & \int_1^2 \frac{dx}{\left(3-5x\right)^2} \\ \\
    (ii) & \int_1^e \frac{\ln x}{x} dx \\ \\ 
    (iii) & \int_0^1 x(x^2+1)^3 \;dx \\ \\ 
    (iv) & \int_1^5 \frac{x}{\sqrt{2x-1}}\;dx \\ \\ 
    \end{array}
    ```
    $ex2plt1	

    $ex2plt2

    """
end

# ╔═╡ 3feca2ed-ff05-4c1a-a614-b1fd23674741
cm"""
### Integration of Even and Odd Functions
"""

# ╔═╡ 297d7fdb-0117-4bd1-adee-8ad640dbf025
md"""
**Integrals of Symmetric Functions**

Suppose ``f`` is continuous on **``[-a,a]``**.

* If ``f`` is **even** ``\left[f(-x)=f(x)\right]``, then 
```math
\int_{-a}^a f(x) dx = 2\int_0^a f(x) dx
```

* If ``f`` is **odd** ``\left[f(-x)=-f(x)\right]``, then 
```math
\int_{-a}^a f(x) dx = 0
```

**Example**
Find 
```math
\int_{-1}^1 \frac{\tan x}{1+x^2+x^4} dx 
```

"""

# ╔═╡ 5bca98c2-c6ef-4e95-a2c6-e99dd88b966b
cm"""
## Section 5.7
__The Natural Logarithmic Function: Integration__
> __Objectives__
> 1. Use the Log Rule for Integration to integrate a rational function.
> 2. Integrate trigonometric functions.
"""

# ╔═╡ 69dc2182-fb24-4db9-9fe6-dc6d9527facd
cm"""
### Log Rule for Integration

__Theorem__ *Log Rule for Integration*

Let ``u``  be a differentiable function of ``x``.
```math
	\begin{array}{llll}
	\textrm{(i) }& \displaystyle \int \frac{1}{x} dx &=& \ln|x| + C  \\ \\
	\textrm{(ii) }& \displaystyle \int \frac{1}{u} du &=& \ln|u| + C  \\ \\
	\end{array}
```

__Remark__
```math
 \displaystyle \int \frac{u'}{u} dx = \ln|u| + C
```
"""

# ╔═╡ 703db4e5-e64a-4b09-ba22-c2808719fd58
cm"""
__Example__

Find the area of the region bounded by the graph of
```math
y = \frac{x}{x^2+1}
```
the ``x``-axis, and the line ``x=3``.
"""

# ╔═╡ 47f63585-6b16-4545-bdf6-5cd7ed470a82
cm"""
__Examples__ Find
```math
	\begin{array}{llll}
	\textrm{(i) }& \displaystyle \int \frac{1}{4x-1} dx   \\ \\
	\textrm{(ii) }& \displaystyle \int \frac{3x^2+1}{x^3+x} dx   \\ \\
	\textrm{(iii) }& \displaystyle \int \frac{\sec^2x}{\tan x} dx   \\ \\
	\textrm{(iv) }& \displaystyle \int \frac{x^2+x+1}{x^2+1} dx   \\ \\
	\textrm{(v) }& \displaystyle \int \frac{2x}{(x+1)^2} dx   \\ \\
	\end{array}
```
"""

# ╔═╡ a1a49662-a13b-430b-b1d5-47f8f3e72f65
cm"""
__Example__ Solve the differential equation
```math
\frac{dy}{dx}=\frac{1}{x\ln x}
```
"""

# ╔═╡ 8ff69555-f7f8-4401-82c6-e27cdf65dff3
cm"""
### Integrals of Trigonometric Functions
__Example__
```math
\int \tan x dx, \quad \int \sec x dx
```

"""

# ╔═╡ 9f7d1862-b413-4292-84da-7c1d76530764
cm"""
__Remark__ Add the following to your table of antiderivatives
```math
	\begin{array}{llll}
	\displaystyle \int \sin u du &=& -\cos u + C &\qquad&  \displaystyle \int \cos u du &=& \sin u + C \\ \\

	\displaystyle \int \tan u du &=& -\ln|\cos u| + C &\qquad&  \displaystyle \int \cot u du &=& \ln|\sin u| + C \\ \\


	\displaystyle \int \sec u du &=& \ln|\sec u +\tan u| + C &\qquad&  \displaystyle \int \csc u du &=& -\ln|\csc u +\cot u| + C \\ \\
	\end{array}
```

"""

# ╔═╡ d6f0452c-cefa-49ee-87ec-a92811880ed4
cm"""
__Example__ 

Evaluate ``\displaystyle \int_{0}^{\pi/4}\sqrt{1+\tan^2 x}dx``

"""

# ╔═╡ da7c0cb8-1d2a-436a-bbb5-b53522dbd755
cm"""
## Section 5.8
### Inverse Trigonometric Functions: Integration
> __Objectives__
> 1. Integrate functions whose antiderivatives involve inverse trigonometric functions.
> 2. Use the method of completing the square to integrate a function.
> 3. Review the basic integration rules involving elementary functions.
"""

# ╔═╡ 04ce6f4c-1581-4ae1-9e9c-8d4dc75b01c7
cm"""
### Integrals Involving Inverse Trigonometric Functions
__Theorem__

Let ``u`` be a differential function of ``x``, and let ``a>0``.
```math
\begin{array}{lllll}
\textrm{1.} & \displaystyle \int\frac{du}{\sqrt{a^2-u^2}} &=&\arcsin\frac{u}{a} + C \\ \\

\textrm{2.} & \displaystyle \int\frac{du}{a^2+u^2} &=&\frac{1}{a}\arctan\frac{u}{a} + C \\ \\

\textrm{3.} & \displaystyle \int\frac{du}{u\sqrt{u^2-a^2}} &=&\frac{1}{a}\text{arcsec}\frac{|u|}{a} + C \\ \\
\end{array}
```

__Examples__
Find
```math
\begin{array}{lllll}
\textrm{➡} & \displaystyle \int\frac{dx}{\sqrt{4-x^2}}, \\ \\
\textrm{➡} & \displaystyle \int\frac{dx}{2+9x^2}, \\ \\
\textrm{➡} & \displaystyle \int\frac{dx}{x\sqrt{4x^2-9}}, \\ \\
\textrm{➡} & \displaystyle \int\frac{dx}{\sqrt{e^{2x}-1}}, \\ \\
\textrm{➡} & \displaystyle \int\frac{x+2}{\sqrt{4-x^2}}dx. \\ \\
\end{array}
```
"""

# ╔═╡ 97a73cbe-6874-4641-9ad8-66df1e8c58c1
cm"""
### Completing the Square
__Example__
Find
```math
\int\frac{dx}{x^2-4x+7}.
```
__Example__

Find the area of the region bounded by the graph of
```math
f(x) = \frac{1}{\sqrt{3x-x^2}}
```
the ``x``-axis, and the lines ``x=\frac{3}{2}`` and ``x=\frac{9}{4}``.
"""

# ╔═╡ a1439122-d0e6-4f02-9039-41edc141f64f
cm"""
## Section 5.9
__Hyperbolic Functions__

> __Objectives__
> 1. Develop properties of hyperbolic functions.
> 2. Differentiate and integrate hyperbolic functions.
> 3. Develop properties of inverse hyperbolic functions.
> 4. Differentiate and integrate functions involving inverse hyperbolic functions.

### Hyperbolic Functions

__Circle__: ``x^2+y^2=1``

<div class="img-container">

$(Resource("https://www.dropbox.com/s/c53yvdcyul4vvlz/circle.jpg?raw=1"))

</div>

__Hyperbola__: ``-x^2+y^2=1``

<div class="img-container">

$(Resource("https://www.dropbox.com/s/iy6fw024c6r50f8/hyperbola.jpg?raw=1"))

</div>


"""

# ╔═╡ e306b52c-0508-4314-9358-a12aca62ea9e
cm"""
__Definitions of the Hyperbolic Functions__
```math
\begin{array}{lllllll}
\sinh x &=& \displaystyle \frac{e^x-e^{-x}}{2} &\qquad& 
\text{csch}\; x &=& \displaystyle \frac{1}{\sinh x},\; x\neq 0\\ \\
\cosh x &=& \displaystyle \frac{e^x+e^{-x}}{2} &\qquad& 
\text{sech}\; x &=& \displaystyle \frac{1}{\cosh x}\\ \\
\tanh x &=& \displaystyle \frac{\sinh x}{\cosh x} &\qquad& 
\text{coth}\; x &=& \displaystyle \frac{1}{\tanh x},\; x\neq 0\\ \\
\end{array}
```

<div class="img-container">

$(Resource("https://www.dropbox.com/s/0q1vcqb77u0ft1t/hyper_graphs.jpg?raw=1"))

</div>
"""

# ╔═╡ 47e805e5-8558-4522-a10c-c3c9ae52b17e
cm"""
__Hyperbolic Identities__
```math
\begin{array}{rllllll}
\cosh^2 x - \sinh^2 x &=& 1, &\qquad& 
\sinh (x+y)\;  &=& \sinh x\cosh y +\cosh x\sinh y\\ \\

\tanh^2 x + \text{sech}^2 x &=& 1, &\qquad& 
\sinh (x-y)\;  &=& \sinh x\cosh y -\cosh x\sinh y\\ \\


\coth^2 x - \text{csch}^2 x &=& 1, &\qquad& 
\cosh (x+y)\;  &=& \cosh x\cosh y +\sinh x\sinh y\\ \\

 &&  &\qquad& 
\cosh (x-y)\;  &=& \cosh x\cosh y -\sinh x\sinh y\\ \\

\sinh^2 x &=& \displaystyle\frac{\cosh 2x -1}{2}, &\qquad& 
\cosh^2 x\;  &=& \displaystyle\frac{\cosh 2x +1}{2}\\ \\


\sin 2x &=& 2\sinh x\cosh x, &\qquad& 
\cosh 2x\;  &=& \cosh^2 x +\sinh^2 x\\ \\


\end{array}
```
"""

# ╔═╡ 21b53a25-5fef-4ac5-aab0-59232566c5d2
cm"""
### Differentiation and Integration of Hyperbolic Functions

__Theorem__ Let ``u`` be a differentiable function of ``x``.
```math
\begin{array}{rllllll}
\displaystyle \frac{d}{dx}\left(\sinh u\right) &=& \left(\cosh u\right)u', &\qquad& 
\displaystyle \int \cosh u du  &=& \sinh u \; +\; C\\ \\

\displaystyle \frac{d}{dx}\left(\cosh u\right) &=& \left(\sinh u\right)u', &\qquad& 
\displaystyle \int \sinh u du  &=& \cosh u \; +\; C\\ \\

\displaystyle \frac{d}{dx}\left(\tanh u\right) &=& \left(\text{sech}^2 u\right)u', &\qquad& 
\displaystyle \int \text{sech}^2 u du  &=& \tanh u \; +\; C\\ \\

\displaystyle \frac{d}{dx}\left(\coth u\right) &=& -\left(\text{csch}^2 u\right)u', &\qquad& 
\displaystyle \int \text{csch}^2 u du  &=& -\coth u \; +\; C\\ \\

\displaystyle \frac{d}{dx}\left(\text{sech} u\right) &=& -\left(\text{sech }u \tanh u\right)u', &\qquad& 
\displaystyle \int \text{sech } u\tanh u du  &=& -\text{sech } u \; +\; C\\ \\


\displaystyle \frac{d}{dx}\left(\text{csch} u\right) &=& -\left(\text{csch }u \coth u\right)u', &\qquad& 
\displaystyle \int \text{csch } u\coth u du  &=& -\text{csch } u \; +\; C\\ \\

\end{array}
```

"""

# ╔═╡ 23f24ea9-b33b-4aac-b17d-1f749360bfe7
cm"""
__Examples__

Find
```math
\begin{array}{llll}
\text{(a)} & \displaystyle \frac{d}{dx}\left[\sinh(x^2-3)\right]\\\\
\text{(b)} & \displaystyle \frac{d}{dx}\bigl[\ln\left(\cosh x\right)\bigr]\\\\
\end{array}
```

__Example__

Find the relative extrema of
```math
f(x) = (x-1)\cosh x \; -\; \sinh x.
```

__Example__ Find
```math
\displaystyle \int_{5/3}^2 \csch(3x-4)\coth(3x-4) dx
```
"""

# ╔═╡ 5a3b6e5c-5e6f-4fcd-be83-325974e42008
cm"""
__Remark__

Power cables are suspended between two towers form a curve with equation
```math
y=a\cosh\frac{x}{a}.
```

<div class="img-container">

$(Resource("https://www.dropbox.com/s/24biyozrcl7mk2q/wire.jpg?raw=1"))

</div>

"""

# ╔═╡ 894378b1-811d-43ac-a700-71350e88ee40
cm"""
### Inverse Hyperbolic Functions

__Theorem__ Inverse Hyperbolic Functions
```math
\begin{array}{llllll}
\textbf{Function} &  & &\qquad& \textbf{Domain}\\ \\

\sinh^{-1}x & = & \ln\left(x+\sqrt{x^2+1}\right) &\qquad& \left(-\infty,\infty\right)\\ \\

\cosh^{-1}x & = & \ln\left(x+\sqrt{x^2-1}\right) &\qquad& \left[1,\infty\right)\\ \\

\tanh^{-1}x & = & \displaystyle\frac{1}{2}\ln\left(\frac{1+x}{1-x}\right) &\qquad& \left(-1,1\right)\\ \\


\coth^{-1}x & = & \displaystyle\frac{1}{2}\ln\left(\frac{x+1}{x-1}\right) &\qquad& \left(-\infty,-1\right)\cup \left(1,\infty\right)\\ \\


\text{sech}^{-1}x & = & \displaystyle\ln\left(\frac{1+\sqrt{1-x^2}}{x}\right) &\qquad& \left(0,1\right]\\ \\

\text{csch}^{-1}x & = & \displaystyle\ln\left(\frac{1}{x}+\frac{\sqrt{1+x^2}}{|x|}\right) &\qquad& \left(-\infty,0\right)\cup \left(0,\infty\right)\\ \\

\end{array}
```

<div class="img-container">

$(Resource("https://www.dropbox.com/s/yc0305sd3i8yr44/inverse_hyper_graphs.jpg?raw=1"))

</div>

"""

# ╔═╡ 2460d407-0fff-44c4-90ec-639f32414f49
embedYouTube(id; title) = """
 <div style="display: flex; justify-content: center; flex-direction: column; align-items: center;">

 <h5>$title </h5>

 <div  notthestyle="position: relative; right: 0; top: 0; z-index: 300;">
 	<iframe width="400" height="250" src="https://www.youtube.com/embed/$id" 	title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
 </div>
 </div>"""

# ╔═╡ ad3dd437-7cfc-4cdc-a951-15949d39cf15
rect(x, Δx, xs, f) = Shape([(x, 0), (x + Δx, 0), (x + Δx, f(xs)), (x, f(xs))])
#Shape(x .+ [0,Δx,Δx,0], [0,0,f(xs),f(xs)])

# ╔═╡ a9d0c669-f6d7-4e5f-8f57-b6bffe1710ba
function reimannSum(f, n, a, b; method="l", color=:green, plot_it=false)
    Δx = (b - a) / n
    x = a:0.1:b
    # plot(f;xlim=(-2π,2π), xticks=(-2π:(π/2):2π,["$c π" for c in -2:0.5:2]))

    (partition, recs) = if method == "r"
        parts = (a+Δx):Δx:b
        rcs = [rect(p - Δx, Δx, p, f) for p in parts]
        (parts, rcs)
    elseif method == "m"
        parts = (a+(Δx/2)):Δx:(b-(Δx/2))
        rcs = [rect(p - Δx / 2, Δx, p, f) for p in parts]
        (parts, rcs)
    elseif method == "l"
        parts = a:Δx:(b-Δx)
        rcs = [rect(p, Δx, p, f) for p in parts]
        (parts, rcs)
    else
        parts = a:Δx:(b-Δx)
        rcs = [rect(p, Δx, rand(p:0.1:p+Δx), f) for p in parts]
        (parts, rcs)
    end
    # recs= [rect(sample(p,Δx),Δx,p,f) for p in partition]
    p = plot(x, f.(x); legend=nothing)
    plot!(p, recs, framestyle=:origin, opacity=0.4, color=color)
    s = round(sum(f.(partition) * Δx), sigdigits=6)
    return plot_it ? (p, s) : s
end

# ╔═╡ d34b4862-9135-11eb-120f-6f82295f0759
begin
    theme(:wong)
    anchor1 = 0.5
    (p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true)

    annotate!(p, [(anchor1, f(anchor1) - 2, text(L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$", 12, n > 500 ? :white : :black))])
    annotate!(p, [(anchor1 + 0.5, f(anchor1 + 0.1), text(L"$y=%$f(x)$", 12, :black))])

    md""" 	

    $p
    """

end

# ╔═╡ 27e1d120-c3e1-4f3d-a263-d63204034814
begin
    left_sum = reimannSum(f, n, a, b; method="l")
    right_sum = reimannSum(f, n, a, b; method="r")
    l_sum_txt = L"R_{%$n}= %$right_sum \leq A\leq %$left_sum =L_{%$n}"


    l_sum_txt


end

# ╔═╡ cbf534bd-a329-4bc2-9940-f53a22e6d17e
begin
    theme(:wong)

    (p2, s2) = reimannSum(g, n2, a2, b2; method=lr2, color=:blue, plot_it=true)

    annotate!(p2, [(0.25, 0.8, (L"$\sum_{i=1}^{%$n2} f (x^*_{i})\Delta x=%$s2$", 12))])

    md""" 	

    $p2
    """

end

# ╔═╡ 6a5d1a86-4b9e-4d65-9bd7-f39ef8b6d9b4
StartPause() = @htl("""
<div>
<button>Start</button>

<script>

	// Select elements relative to `currentScript`
	var div = currentScript.parentElement
	var button = div.querySelector("button")

	// we wrapped the button in a `div` to hide its default behaviour from Pluto

	var count = false

	button.addEventListener("click", (e) => {
		count = !count

		// we dispatch the input event on the div, not the button, because 
		// Pluto's `@bind` mechanism listens for events on the **first element** in the
		// HTML output. In our case, that's the div.

		div.value = count
		div.dispatchEvent(new CustomEvent("input"))
		e.preventDefault()
		button.innerHTML = count? "Pause" : "Start"
	})
	// Set the initial value
	div.value = count

</script>
</div>
""")

# ╔═╡ 5f0d5f9c-f0c4-43cd-8f2a-5d4c18955717
@bind start_animation StartPause()

# ╔═╡ 7d30f1de-0225-4a1e-a76e-3c305615cbe2
if (start_animation)
    gif(anim, "anim_fps125.gif", fps=10)
end

# ╔═╡ 7f819c41-370f-49b2-9e9b-e3233ac560fd
begin
    velfunTr = replace(velfun, "t" => "tttt")
    velFun1 = Meta.parse(velfunTr)
    ex = eval(:velFun1)
    isValidVel = Meta.isexpr(ex, :call)
    function myVel(i)
        global tttt = i

        if isValidVel
            return eval(ex)
        end
    end
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CommonMark = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
Dates = "ade2ca70-3891-5945-98fb-dc099432e06a"
FileIO = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
ImageIO = "82e4d734-157c-48bb-816b-45c225c6df19"
ImageShow = "4e3cecfd-b093-5904-9786-8bbb286a6a31"
ImageTransformations = "02fcd773-0e25-5acc-982a-7f6622650795"
LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
PlotThemes = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
PrettyTables = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
Random = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
SymPy = "24249f21-da20-56a4-8eb1-6a02cf4ae2e6"

[compat]
CommonMark = "~0.8.6"
FileIO = "~1.15.0"
HypertextLiteral = "~0.9.4"
ImageIO = "~0.6.6"
ImageShow = "~0.3.6"
ImageTransformations = "~0.9.5"
LaTeXStrings = "~1.3.0"
PlotThemes = "~3.0.0"
Plots = "~1.31.7"
PlutoUI = "~0.7.39"
PrettyTables = "~1.3.1"
SymPy = "~1.1.7"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.2"
manifest_format = "2.0"
project_hash = "3a6158af984a471f9e7686ba6ca4a4e720a7bcf0"

[[deps.AbstractFFTs]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "d92ad398961a3ed262d8bf04a1a2b8340f915fef"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.5.0"
weakdeps = ["ChainRulesCore", "Test"]

    [deps.AbstractFFTs.extensions]
    AbstractFFTsChainRulesCoreExt = "ChainRulesCore"
    AbstractFFTsTestExt = "Test"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.AxisAlgorithms]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "WoodburyMatrices"]
git-tree-sha1 = "66771c8d21c8ff5e3a93379480a2307ac36863f7"
uuid = "13072b0f-2c55-5437-9ae7-d433b7a33950"
version = "1.0.1"

[[deps.AxisArrays]]
deps = ["Dates", "IntervalSets", "IterTools", "RangeArrays"]
git-tree-sha1 = "16351be62963a67ac4083f748fdb3cca58bfd52f"
uuid = "39de3d68-74b9-583c-8d2d-e117c070f3a9"
version = "0.4.7"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.BitFlags]]
git-tree-sha1 = "0691e34b3bb8be9307330f88d1a3c3f25466c24d"
uuid = "d1d4a3ce-64b1-5f1a-9ba4-7e7e69966f35"
version = "0.1.9"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "8873e196c2eb87962a2048b3b8e08946535864a1"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+4"

[[deps.CEnum]]
git-tree-sha1 = "389ad5c84de1ae7cf0e28e381131c98ea87d54fc"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.5.0"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "009060c9a6168704143100f36ab08f06c2af4642"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.18.2+1"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra"]
git-tree-sha1 = "1713c74e00545bfe14605d2a2be1712de8fbcb58"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.25.1"
weakdeps = ["SparseArrays"]

    [deps.ChainRulesCore.extensions]
    ChainRulesCoreSparseArraysExt = "SparseArrays"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "bce6804e5e6044c6daab27bb533d1295e4a2e759"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.6"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "ColorVectorSpace", "Colors", "FixedPointNumbers", "PrecompileTools", "Random"]
git-tree-sha1 = "b5278586822443594ff615963b0c09755771b3e0"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.26.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b10d0b65641d57b8b4d5e234446582de5047050d"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.5"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "SpecialFunctions", "Statistics", "TensorCore"]
git-tree-sha1 = "600cc5508d66b78aae350f7accdb58763ac18589"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.9.10"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "362a287c3aa50601b0bc359053d5c2468f0e7ce0"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.11"

[[deps.CommonEq]]
git-tree-sha1 = "6b0f0354b8eb954cdba708fb262ef00ee7274468"
uuid = "3709ef60-1bee-4518-9f2f-acd86f176c50"
version = "0.2.1"

[[deps.CommonMark]]
deps = ["Crayons", "PrecompileTools"]
git-tree-sha1 = "3faae67b8899797592335832fccf4b3c80bb04fa"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.15"

[[deps.CommonSolve]]
git-tree-sha1 = "0eee5eb66b1cf62cd6ad1b460238e60e4b09400c"
uuid = "38540f10-b2f7-11e9-35d8-d573e4eb0ff2"
version = "0.2.4"

[[deps.Compat]]
deps = ["TOML", "UUIDs"]
git-tree-sha1 = "8ae8d32e09f0dcf42a36b90d4e17f5dd2e4c4215"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.16.0"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.ConcurrentUtilities]]
deps = ["Serialization", "Sockets"]
git-tree-sha1 = "f36e5e8fdffcb5646ea5da81495a5a7566005127"
uuid = "f0e56b4a-5159-44fe-b623-3e5288b988bb"
version = "2.4.3"

[[deps.Conda]]
deps = ["Downloads", "JSON", "VersionParsing"]
git-tree-sha1 = "b19db3927f0db4151cb86d073689f2428e524576"
uuid = "8f4d0f93-b110-5947-807f-2305c1781a2d"
version = "1.10.2"

[[deps.ConstructionBase]]
git-tree-sha1 = "76219f1ed5771adbb096743bff43fb5fdd4c1157"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.5.8"
weakdeps = ["IntervalSets", "LinearAlgebra", "StaticArrays"]

    [deps.ConstructionBase.extensions]
    ConstructionBaseIntervalSetsExt = "IntervalSets"
    ConstructionBaseLinearAlgebraExt = "LinearAlgebra"
    ConstructionBaseStaticArraysExt = "StaticArrays"

[[deps.Contour]]
git-tree-sha1 = "439e35b0b36e2e5881738abc8857bd92ad6ff9a8"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.6.3"

[[deps.CoordinateTransformations]]
deps = ["LinearAlgebra", "StaticArrays"]
git-tree-sha1 = "f9d7112bfff8a19a3a4ea4e03a8e6a91fe8456bf"
uuid = "150eb455-5306-5404-9cee-2592286d6298"
version = "0.6.3"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "abe83f3a2f1b857aac70ef8b269080af17764bbe"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.16.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "1d0a14036acb104d9e89698bd408f63ab58cdc82"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.20"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Dbus_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "fc173b380865f70627d7dd1190dc2fce6cc105af"
uuid = "ee1fde0b-3d02-5ea6-8484-8dfef6360eab"
version = "1.14.10+0"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
git-tree-sha1 = "9e2f36d3c96a820c678f2f1f1782582fcf685bae"
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"
version = "1.9.1"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"
version = "1.11.0"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e3290f2d49e661fbd94046d7e3726ffcb2d41053"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.4+0"

[[deps.EpollShim_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8a4be429317c42cfae6a7fc03c31bad1970c310d"
uuid = "2702e6a9-849d-5ed8-8c21-79e8b8f9ee43"
version = "0.0.20230411+1"

[[deps.ExceptionUnwrapping]]
deps = ["Test"]
git-tree-sha1 = "d36f682e590a83d63d1c7dbd287573764682d12a"
uuid = "460bff9d-24e4-43bc-9d9f-a8973cb893f4"
version = "0.1.11"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e51db81749b0777b2147fbe7b783ee79045b8e99"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.6.4+3"

[[deps.Extents]]
git-tree-sha1 = "063512a13dbe9c40d999c439268539aa552d1ae6"
uuid = "411431e0-e8b7-467b-b5e0-f676ba4f2910"
version = "0.1.5"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "53ebe7511fa11d33bec688a9178fac4e49eeee00"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.2"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Pkg", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "74faea50c1d007c85837327f6775bea60b5492dd"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.2+2"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "94f5101b96d2d968ace56f7f2db19d0a5f592e28"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.15.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Zlib_jll"]
git-tree-sha1 = "21fac3c77d7b5a9fc03b0ec503aa1a6392c34d2b"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.15.0+0"

[[deps.Formatting]]
deps = ["Logging", "Printf"]
git-tree-sha1 = "fb409abab2caf118986fc597ba84b50cbaf00b87"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.3"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "786e968a8d2fb167f2e4880baba62e0e26bd8e4e"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.13.3+1"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "846f7026a9decf3679419122b49f8a1fdb48d2d5"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.16+0"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll", "libdecor_jll", "xkbcommon_jll"]
git-tree-sha1 = "fcb0584ff34e25155876418979d4c8971243bb89"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.4.0+2"

[[deps.GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "RelocatableFolders", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "cf0a9940f250dc3cb6cc6c6821b4bf8a4286cf9c"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.66.2"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "bc9f7725571ddb4ab2c4bc74fa397c1c5ad08943"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.69.1+0"

[[deps.GeoFormatTypes]]
git-tree-sha1 = "ce573eab15760315756de2c82df7406c870c7187"
uuid = "68eda718-8dee-11e9-39e7-89f7f65f511f"
version = "0.4.3"

[[deps.GeoInterface]]
deps = ["DataAPI", "Extents", "GeoFormatTypes"]
git-tree-sha1 = "f4ee66b6b1872a4ca53303fbb51d158af1bf88d4"
uuid = "cf35fbd7-0cd7-5166-be24-54bfbe79505f"
version = "1.4.0"

[[deps.GeometryBasics]]
deps = ["EarCut_jll", "Extents", "GeoInterface", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "b62f2b2d76cee0d61a2ef2b3118cd2a3215d3134"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.11"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Zlib_jll"]
git-tree-sha1 = "b0036b392358c80d2d2124746c2bf3d48d457938"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.82.4+0"

[[deps.Graphics]]
deps = ["Colors", "LinearAlgebra", "NaNMath"]
git-tree-sha1 = "a641238db938fff9b2f60d08ed9030387daf428c"
uuid = "a2bd30eb-e257-5431-a919-1863eab51364"
version = "1.1.3"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "01979f9b37367603e2848ea225918a3b3861b606"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+1"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "ConcurrentUtilities", "Dates", "ExceptionUnwrapping", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "PrecompileTools", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "c67b33b085f6e2faf8bf79a61962e7339a81129c"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.10.15"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll"]
git-tree-sha1 = "55c53be97790242c29031e5cd45e8ac296dadda3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "8.5.0+0"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "b6d6bfdd7ce25b0f9b2f6b3dd56b2673a66c8770"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.5"

[[deps.ImageAxes]]
deps = ["AxisArrays", "ImageBase", "ImageCore", "Reexport", "SimpleTraits"]
git-tree-sha1 = "2e4520d67b0cef90865b3ef727594d2a58e0e1f8"
uuid = "2803e5a7-5153-5ecf-9a86-9b4c37f5f5ac"
version = "0.6.11"

[[deps.ImageBase]]
deps = ["ImageCore", "Reexport"]
git-tree-sha1 = "b51bb8cae22c66d0f6357e3bcb6363145ef20835"
uuid = "c817782e-172a-44cc-b673-b171935fbb9e"
version = "0.1.5"

[[deps.ImageCore]]
deps = ["AbstractFFTs", "ColorVectorSpace", "Colors", "FixedPointNumbers", "Graphics", "MappedArrays", "MosaicViews", "OffsetArrays", "PaddedViews", "Reexport"]
git-tree-sha1 = "acf614720ef026d38400b3817614c45882d75500"
uuid = "a09fc81d-aa75-5fe9-8630-4744c3626534"
version = "0.9.4"

[[deps.ImageIO]]
deps = ["FileIO", "IndirectArrays", "JpegTurbo", "LazyModules", "Netpbm", "OpenEXR", "PNGFiles", "QOI", "Sixel", "TiffImages", "UUIDs"]
git-tree-sha1 = "437abb322a41d527c197fa800455f79d414f0a3c"
uuid = "82e4d734-157c-48bb-816b-45c225c6df19"
version = "0.6.8"

[[deps.ImageMetadata]]
deps = ["AxisArrays", "ImageAxes", "ImageBase", "ImageCore"]
git-tree-sha1 = "355e2b974f2e3212a75dfb60519de21361ad3cb7"
uuid = "bc367c6b-8a6b-528e-b4bd-a4b897500b49"
version = "0.9.9"

[[deps.ImageShow]]
deps = ["Base64", "ColorSchemes", "FileIO", "ImageBase", "ImageCore", "OffsetArrays", "StackViews"]
git-tree-sha1 = "3b5344bcdbdc11ad58f3b1956709b5b9345355de"
uuid = "4e3cecfd-b093-5904-9786-8bbb286a6a31"
version = "0.3.8"

[[deps.ImageTransformations]]
deps = ["AxisAlgorithms", "ColorVectorSpace", "CoordinateTransformations", "ImageBase", "ImageCore", "Interpolations", "OffsetArrays", "Rotations", "StaticArrays"]
git-tree-sha1 = "8717482f4a2108c9358e5c3ca903d3a6113badc9"
uuid = "02fcd773-0e25-5acc-982a-7f6622650795"
version = "0.9.5"

[[deps.Imath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "0936ba688c6d201805a83da835b55c61a180db52"
uuid = "905a6f67-0a94-5f89-b386-d35d92009cd1"
version = "3.1.11+0"

[[deps.IndirectArrays]]
git-tree-sha1 = "012e604e1c7458645cb8b436f8fba789a51b257f"
uuid = "9b13fd28-a010-5f03-acff-a1bbcff69959"
version = "1.0.0"

[[deps.Inflate]]
git-tree-sha1 = "d1b1b796e47d94588b3757fe84fbf65a5ec4a80d"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.5"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.Interpolations]]
deps = ["AxisAlgorithms", "ChainRulesCore", "LinearAlgebra", "OffsetArrays", "Random", "Ratios", "Requires", "SharedArrays", "SparseArrays", "StaticArrays", "WoodburyMatrices"]
git-tree-sha1 = "00a19d6ab0cbdea2978fc23c5a6482e02c192501"
uuid = "a98d9a8b-a2ab-59e6-89dd-64a1c18fca59"
version = "0.14.0"

[[deps.IntervalSets]]
git-tree-sha1 = "dba9ddf07f77f60450fe5d2e2beb9854d9a49bd0"
uuid = "8197267c-284f-5f27-9208-e0e47529a953"
version = "0.7.10"
weakdeps = ["Random", "RecipesBase", "Statistics"]

    [deps.IntervalSets.extensions]
    IntervalSetsRandomExt = "Random"
    IntervalSetsRecipesBaseExt = "RecipesBase"
    IntervalSetsStatisticsExt = "Statistics"

[[deps.IrrationalConstants]]
git-tree-sha1 = "630b497eafcc20001bba38a4651b327dcfc491d2"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.2"

[[deps.IterTools]]
git-tree-sha1 = "42d5f897009e7ff2cf88db414a389e5ed1bdd023"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.10.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "a007feb38b422fbdab534406aeca1b86823cb4d6"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.7.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JpegTurbo]]
deps = ["CEnum", "FileIO", "ImageCore", "JpegTurbo_jll", "TOML"]
git-tree-sha1 = "fa6d0bcff8583bac20f1ffa708c3913ca605c611"
uuid = "b835a17e-a41a-41e7-81f0-2f016b05efe0"
version = "0.1.5"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "eac1206917768cb54957c65a615460d87b455fc1"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "3.1.1+0"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "170b660facf5df5de098d866564877e119141cbd"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.2+0"

[[deps.LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bf36f528eec6634efc60d7ec062008f171071434"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "3.0.0+1"

[[deps.LLVMOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "78211fb6cbc872f77cad3fc0b6cf647d923f4929"
uuid = "1d63c593-3942-5779-bab2-d838dc0a180e"
version = "18.1.7+0"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1c602b1127f4751facb671441ca72715cc95938a"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.3+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "50901ebc375ed41dbf8058da26f9de442febbbec"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.1"

[[deps.Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Printf", "Requires"]
git-tree-sha1 = "8c57307b5d9bb3be1ff2da469063628631d4d51e"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.21"

    [deps.Latexify.extensions]
    DataFramesExt = "DataFrames"
    DiffEqBiologicalExt = "DiffEqBiological"
    ParameterizedFunctionsExt = "DiffEqBase"
    SymEngineExt = "SymEngine"

    [deps.Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    DiffEqBase = "2b5f629d-d688-5b77-993f-72d75c75574e"
    DiffEqBiological = "eb300fae-53e8-50a0-950c-e21f52c2b7e0"
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"

[[deps.LazyModules]]
git-tree-sha1 = "a560dd966b386ac9ae60bdd3a3d3a326062d3c3e"
uuid = "8cdb02fc-e678-4876-92c5-9defec4f444e"
version = "0.3.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.6.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.7.2+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "27ecae93dd25ee0909666e6835051dd684cc035e"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+2"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll"]
git-tree-sha1 = "8be878062e0ffa2c3f67bb58a595375eda5de80b"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.11.0+0"

[[deps.Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "ff3b4b9d35de638936a525ecd36e86a8bb919d11"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.7.0+0"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "df37206100d39f79b3376afb6b9cee4970041c61"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.51.1+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "be484f5c92fad0bd8acfef35fe017900b0b73809"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.18.0+0"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "89211ea35d9df5831fca5d33552c02bd33878419"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.40.3+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "3eb79b0ca5764d4799c06699573fd8f533259713"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.4.0+0"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e888ad02ce716b319e6bdb985d2ef300e7089889"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.40.3+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.LogExpFunctions]]
deps = ["DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "13ca9e2586b89836fd20cccf56e57e2b9ae7f38f"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.29"

    [deps.LogExpFunctions.extensions]
    LogExpFunctionsChainRulesCoreExt = "ChainRulesCore"
    LogExpFunctionsChangesOfVariablesExt = "ChangesOfVariables"
    LogExpFunctionsInverseFunctionsExt = "InverseFunctions"

    [deps.LogExpFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    ChangesOfVariables = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "f02b56007b064fbfddb4c9cd60161b6dd0f40df3"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "1.1.0"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
git-tree-sha1 = "72aebe0b5051e5143a079a4685a46da330a40472"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.15"

[[deps.MappedArrays]]
git-tree-sha1 = "2dab0221fe2b0f2cb6754eaa743cc266339f527e"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.2"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "NetworkOptions", "Random", "Sockets"]
git-tree-sha1 = "c067a280ddc25f196b5e7df3877c6b226d390aaf"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.9"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.6+0"

[[deps.Measures]]
git-tree-sha1 = "c13304c81eec1ed3af7fc20e75fb6b26092a1102"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.2"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "ec4f7fbeab05d7747bdf98eb74d130a2a2ed298d"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.2.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.MosaicViews]]
deps = ["MappedArrays", "OffsetArrays", "PaddedViews", "StackViews"]
git-tree-sha1 = "7b86a5d4d70a9f5cdf2dacb3cbe6d251d1a61dbe"
uuid = "e94cdb99-869f-56ef-bcf0-1ae2bcbe0389"
version = "0.3.4"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.12.12"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "030ea22804ef91648f29b7ad3fc15fa49d0e6e71"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.3"

[[deps.Netpbm]]
deps = ["FileIO", "ImageCore", "ImageMetadata"]
git-tree-sha1 = "d92b107dbb887293622df7697a2223f9f8176fcd"
uuid = "f09324ee-3d7c-5217-9330-fc30815ba969"
version = "1.1.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OffsetArrays]]
git-tree-sha1 = "5e1897147d1ff8d98883cda2be2187dcf57d8f0c"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.15.0"

    [deps.OffsetArrays.extensions]
    OffsetArraysAdaptExt = "Adapt"

    [deps.OffsetArrays.weakdeps]
    Adapt = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.27+1"

[[deps.OpenEXR]]
deps = ["Colors", "FileIO", "OpenEXR_jll"]
git-tree-sha1 = "97db9e07fe2091882c765380ef58ec553074e9c7"
uuid = "52e1d378-f018-4a11-a4be-720524705ac7"
version = "0.3.3"

[[deps.OpenEXR_jll]]
deps = ["Artifacts", "Imath_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "8292dd5c8a38257111ada2174000a33745b06d4e"
uuid = "18a262bb-aa17-5467-a713-aee519bc75cb"
version = "3.2.4+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+2"

[[deps.OpenSSL]]
deps = ["BitFlags", "Dates", "MozillaCACerts_jll", "OpenSSL_jll", "Sockets"]
git-tree-sha1 = "38cb508d080d21dc1128f7fb04f20387ed4c0af4"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.4.3"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "ad31332567b189f508a3ea8957a2640b1147ab00"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.23+1"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1346c9208249809840c91b26703912dff463d335"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.6+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6703a85cb3781bd5909d48730a67205f3f31a575"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.3+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "12f1439c4f986bb868acda6ea33ebc78e19b95ad"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.7.0"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.42.0+1"

[[deps.PNGFiles]]
deps = ["Base64", "CEnum", "ImageCore", "IndirectArrays", "OffsetArrays", "libpng_jll"]
git-tree-sha1 = "67186a2bc9a90f9f85ff3cc8277868961fb57cbd"
uuid = "f57f5aa1-a3ce-4bc8-8ab9-96f992907883"
version = "0.4.3"

[[deps.PaddedViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "0fac6313486baae819364c52b4f483450a9d793f"
uuid = "5432bcbf-9aad-5242-b902-cca2824c8663"
version = "0.5.12"

[[deps.Pango_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "FriBidi_jll", "Glib_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "ed6834e95bd326c52d5675b4181386dfbe885afb"
uuid = "36c8627f-9965-5494-a995-c6b170f724f3"
version = "1.55.5+0"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.Pixman_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "LLVMOpenMP_jll", "Libdl"]
git-tree-sha1 = "35621f10a7531bc8fa58f74610b1bfb70a3cfc6b"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.43.4+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.11.0"
weakdeps = ["REPL"]

    [deps.Pkg.extensions]
    REPLExt = "REPL"

[[deps.PkgVersion]]
deps = ["Pkg"]
git-tree-sha1 = "f9501cc0430a26bc3d156ae1b5b0c1b47af4d6da"
uuid = "eebad327-c553-4316-9ea0-9fa01ccd7688"
version = "0.3.3"

[[deps.PlotThemes]]
deps = ["PlotUtils", "Statistics"]
git-tree-sha1 = "8162b2f8547bc23876edd0c5181b27702ae58dce"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "3.0.0"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "PrecompileTools", "Printf", "Random", "Reexport", "StableRNGs", "Statistics"]
git-tree-sha1 = "3ca9a356cd2e113c420f2c13bea19f8d3fb1cb18"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.4.3"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "LaTeXStrings", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "Unzip"]
git-tree-sha1 = "a19652399f43938413340b2068e11e55caa46b65"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.31.7"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "eba4810d5e6a01f612b948c9fa94f905b49087b0"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.60"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[deps.PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "dfb54c4e414caa595a1f2ed759b160f5a3ddcba5"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.3.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "8f6bc219586aef8baf0ff9a5fe16ee9c70cb65e4"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.10.2"

[[deps.PyCall]]
deps = ["Conda", "Dates", "Libdl", "LinearAlgebra", "MacroTools", "Serialization", "VersionParsing"]
git-tree-sha1 = "9816a3826b0ebf49ab4926e2b18842ad8b5c8f04"
uuid = "438e738f-606a-5dbb-bf0a-cddfbfd45ab0"
version = "1.96.4"

[[deps.QOI]]
deps = ["ColorTypes", "FileIO", "FixedPointNumbers"]
git-tree-sha1 = "8b3fc30bc0390abdce15f8822c889f669baed73d"
uuid = "4b34888f-f399-49d4-9bb3-47ed5cae4e65"
version = "1.0.1"

[[deps.Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "0c03844e2231e12fda4d0086fd7cbe4098ee8dc5"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+2"

[[deps.Quaternions]]
deps = ["LinearAlgebra", "Random", "RealDot"]
git-tree-sha1 = "994cc27cdacca10e68feb291673ec3a76aa2fae9"
uuid = "94ee1d12-ae83-5a48-8b1c-48b8ff168ae0"
version = "0.7.6"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "StyledStrings", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.RangeArrays]]
git-tree-sha1 = "b9039e93773ddcfc828f12aadf7115b4b4d225f5"
uuid = "b3c3ace0-ae52-54e7-9d0b-2c1406fd6b9d"
version = "0.3.2"

[[deps.Ratios]]
deps = ["Requires"]
git-tree-sha1 = "1342a47bf3260ee108163042310d26f2be5ec90b"
uuid = "c84ed2f1-dad5-54f0-aa8e-dbefe2724439"
version = "0.4.5"
weakdeps = ["FixedPointNumbers"]

    [deps.Ratios.extensions]
    RatiosFixedPointNumbersExt = "FixedPointNumbers"

[[deps.RealDot]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "9f0a1b71baaf7650f4fa8a1d168c7fb6ee41f0c9"
uuid = "c1ae055f-0cd5-4b69-90a6-9a35b1a98df9"
version = "0.1.0"

[[deps.RecipesBase]]
deps = ["PrecompileTools"]
git-tree-sha1 = "5c3d09cc4f31f5fc6af001c250bf1278733100ff"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.3.4"

[[deps.RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "PrecompileTools", "RecipesBase"]
git-tree-sha1 = "45cf9fd0ca5839d06ef333c8201714e888486342"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.6.12"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "22c5201127d7b243b9ee1de3b43c408879dff60f"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "0.3.0"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Rotations]]
deps = ["LinearAlgebra", "Quaternions", "Random", "StaticArrays"]
git-tree-sha1 = "5680a9276685d392c87407df00d57c9924d9f11e"
uuid = "6038ab10-8711-5258-84ad-4b1120ba62dc"
version = "1.7.1"
weakdeps = ["RecipesBase"]

    [deps.Rotations.extensions]
    RotationsRecipesBaseExt = "RecipesBase"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.SIMD]]
deps = ["PrecompileTools"]
git-tree-sha1 = "fea870727142270bdf7624ad675901a1ee3b4c87"
uuid = "fdea26ae-647d-5447-a871-4b548cad5224"
version = "3.7.1"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "3bac05bc7e74a75fd9cba4295cde4045d9fe2386"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.2.1"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"
version = "1.11.0"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SimpleBufferStream]]
git-tree-sha1 = "f305871d2f381d21527c770d4788c06c097c9bc1"
uuid = "777ac1f9-54b0-4bf8-805c-2214025038e7"
version = "1.2.0"

[[deps.SimpleTraits]]
deps = ["InteractiveUtils", "MacroTools"]
git-tree-sha1 = "5d7e3f4e11935503d3ecaf7186eac40602e7d231"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.4"

[[deps.Sixel]]
deps = ["Dates", "FileIO", "ImageCore", "IndirectArrays", "OffsetArrays", "REPL", "libsixel_jll"]
git-tree-sha1 = "2da10356e31327c7096832eb9cd86307a50b1eb6"
uuid = "45858cf5-a6b0-47a3-bbea-62219f50df47"
version = "0.1.3"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"
version = "1.11.0"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "66e0a8e672a0bdfca2c3f5937efb8538b9ddc085"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.2.1"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.11.0"

[[deps.SpecialFunctions]]
deps = ["IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "64cca0c26b4f31ba18f13f6c12af7c85f478cfde"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.5.0"
weakdeps = ["ChainRulesCore"]

    [deps.SpecialFunctions.extensions]
    SpecialFunctionsChainRulesCoreExt = "ChainRulesCore"

[[deps.StableRNGs]]
deps = ["Random"]
git-tree-sha1 = "83e6cce8324d49dfaf9ef059227f91ed4441a8e5"
uuid = "860ef19b-820b-49d6-a774-d7a799459cd3"
version = "1.0.2"

[[deps.StackViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "46e589465204cd0c08b4bd97385e4fa79a0c770c"
uuid = "cae243ae-269e-4f55-b966-ac2d0dc13c15"
version = "0.1.1"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "PrecompileTools", "Random", "StaticArraysCore"]
git-tree-sha1 = "47091a0340a675c738b1304b58161f3b0839d454"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.9.10"
weakdeps = ["ChainRulesCore", "Statistics"]

    [deps.StaticArrays.extensions]
    StaticArraysChainRulesCoreExt = "ChainRulesCore"
    StaticArraysStatisticsExt = "Statistics"

[[deps.StaticArraysCore]]
git-tree-sha1 = "192954ef1208c7019899fbf8049e717f92959682"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.3"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"
weakdeps = ["SparseArrays"]

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1ff449ad350c9c4cbc756624d6f8a8c3ef56d3ed"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.7.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "d1bf48bfcc554a3761a133fe3a9bb01488e06916"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.21"

[[deps.StructArrays]]
deps = ["ConstructionBase", "DataAPI", "Tables"]
git-tree-sha1 = "9537ef82c42cdd8c5d443cbc359110cbb36bae10"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.21"

    [deps.StructArrays.extensions]
    StructArraysAdaptExt = "Adapt"
    StructArraysGPUArraysCoreExt = ["GPUArraysCore", "KernelAbstractions"]
    StructArraysLinearAlgebraExt = "LinearAlgebra"
    StructArraysSparseArraysExt = "SparseArrays"
    StructArraysStaticArraysExt = "StaticArrays"

    [deps.StructArrays.weakdeps]
    Adapt = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
    GPUArraysCore = "46192b85-c4d5-4398-a991-12ede77f4527"
    KernelAbstractions = "63c18a36-062a-441e-b654-da1e3ab1ce7c"
    LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.7.0+0"

[[deps.SymPy]]
deps = ["CommonEq", "CommonSolve", "Latexify", "LinearAlgebra", "Markdown", "PyCall", "RecipesBase", "SpecialFunctions"]
git-tree-sha1 = "04f5a3cf4e9f451c81bcac8ea9b57bfda7f22e34"
uuid = "24249f21-da20-56a4-8eb1-6a02cf4ae2e6"
version = "1.1.14"

    [deps.SymPy.extensions]
    SymPySymbolicUtilsExt = "SymbolicUtils"

    [deps.SymPy.weakdeps]
    SymbolicUtils = "d1185830-fcd6-423d-90d6-eec64667417b"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "OrderedCollections", "TableTraits"]
git-tree-sha1 = "598cd7c1f68d1e205689b1c2fe65a9f85846f297"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.12.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.TiffImages]]
deps = ["ColorTypes", "DataStructures", "DocStringExtensions", "FileIO", "FixedPointNumbers", "IndirectArrays", "Inflate", "Mmap", "OffsetArrays", "PkgVersion", "ProgressMeter", "SIMD", "UUIDs"]
git-tree-sha1 = "38f139cc4abf345dd4f22286ec000728d5e8e097"
uuid = "731e570b-9d59-4bfa-96dc-6df516fadf69"
version = "0.10.2"

[[deps.TranscodingStreams]]
git-tree-sha1 = "0c45878dcfdcfa8480052b6ab162cdd138781742"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.11.3"

[[deps.Tricks]]
git-tree-sha1 = "7822b97e99a1672bfb1b49b668a6d46d58d8cbcb"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.9"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[deps.Unzip]]
git-tree-sha1 = "34db80951901073501137bdbc3d5a8e7bbd06670"
uuid = "41fe7b60-77ed-43a1-b4f0-825fd5a5650d"
version = "0.1.2"

[[deps.VersionParsing]]
git-tree-sha1 = "58d6e80b4ee071f5efd07fda82cb9fbe17200868"
uuid = "81def892-9a0e-5fdd-b105-ffc91e053289"
version = "1.3.0"

[[deps.Wayland_jll]]
deps = ["Artifacts", "EpollShim_jll", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "85c7811eddec9e7f22615371c3cc81a504c508ee"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.21.0+2"

[[deps.Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "5db3e9d307d32baba7067b13fc7b5aa6edd4a19a"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.36.0+0"

[[deps.WoodburyMatrices]]
deps = ["LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "5f24e158cf4cee437052371455fe361f526da062"
uuid = "efce3f68-66dc-5838-9240-27a6d6f5f9b6"
version = "0.5.6"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Zlib_jll"]
git-tree-sha1 = "a2fccc6559132927d4c5dc183e3e01048c6dcbd6"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.13.5+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "7d1671acbe47ac88e981868a078bd6b4e27c5191"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.42+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "9dafcee1d24c4f024e7edc92603cedba72118283"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.8.6+3"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e9216fdcd8514b7072b43653874fd688e4c6c003"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.12+0"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "807c226eaf3651e7b2c468f687ac788291f9a89b"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.3+0"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "89799ae67c17caa5b3b5a19b8469eeee474377db"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.5+0"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "d7155fea91a4123ef59f42c4afb5ab3b4ca95058"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.6+3"

[[deps.Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "6fcc21d5aea1a0b7cce6cab3e62246abd1949b86"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "6.0.0+0"

[[deps.Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "984b313b049c89739075b8e2a94407076de17449"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.8.2+0"

[[deps.Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXext_jll"]
git-tree-sha1 = "a1a7eaf6c3b5b05cb903e35e8372049b107ac729"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.5+0"

[[deps.Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "b6f664b7b2f6a39689d822a6300b14df4668f0f4"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.4+0"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "a490c6212a0e90d2d55111ac956f7c4fa9c277a6"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.11+1"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "c57201109a9e4c0585b208bb408bc41d205ac4e9"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.2+0"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "1a74296303b6524a0472a8cb12d3d87a78eb3612"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.17.0+3"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "dbc53e4cf7701c6c7047c51e17d6e64df55dca94"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.2+1"

[[deps.Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[deps.Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[deps.Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "ab2221d309eda71020cdda67a973aa582aa85d69"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.6+1"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "691634e5453ad362044e2ad653e79f3ee3bb98c3"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.39.0+0"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6dba04dbfb72ae3ebe5418ba33d087ba8aa8cb00"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.5.1+0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "622cf78670d067c738667aaa96c553430b65e269"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.7+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "522c1df09d05a71785765d19c9524661234738e9"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.11.0+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "e17c115d55c5fbb7e52ebedb427a0dca79d4484e"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.2+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.11.0+0"

[[deps.libdecor_jll]]
deps = ["Artifacts", "Dbus_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pango_jll", "Wayland_jll", "xkbcommon_jll"]
git-tree-sha1 = "9bf7903af251d2050b467f76bdbe57ce541f7f4f"
uuid = "1183f4f0-6f2a-5f1a-908b-139f9cdfea6f"
version = "0.2.2+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8a22cf860a7d27e4f3498a0fe0811a7957badb38"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.3+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "d7b5bbf1efbafb5eca466700949625e07533aff2"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.45+1"

[[deps.libsixel_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "libpng_jll"]
git-tree-sha1 = "bf6bb896bd59692d1074fd69af0e5a1b64e64d5e"
uuid = "075b6546-f08a-558a-be8f-8157d0f608a5"
version = "1.10.4+1"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "490376214c4721cdaca654041f635213c6165cb3"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+2"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.59.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[deps.xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "63406453ed9b33a0df95d570816d5366c92b7809"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "1.4.1+2"
"""

# ╔═╡ Cell order:
# ╟─69d7b791-2e69-490c-8d10-10fa433f0a72
# ╟─ad045108-9dca-4a61-ac88-80a3417c95f2
# ╟─1e9f4829-1f50-47ae-8745-0daa90e7aa42
# ╟─9ce352ac-f374-4eb1-9a76-524ffd8a7306
# ╟─254d027d-ab13-4928-89b5-916dbf5f0044
# ╟─0edc99ec-c39d-4a9e-af0d-c9778c6b4211
# ╟─164b1c78-9f7b-4f9d-a6a6-fbe754cdb43e
# ╟─b048a772-05c3-4cd0-97ae-5cf825127584
# ╟─f16cb891-26d7-41c9-9747-f7d6cd054bc7
# ╠═8ad65bee-9135-11eb-166a-837031c4bc45
# ╠═e7a87684-49b0-428c-9fef-248cf868cf33
# ╠═74f6ac5d-f974-4ea6-801c-b88fe3346e55
# ╠═c894d994-a7fc-4e07-8941-e9f9aa89fef0
# ╠═d34b4862-9135-11eb-120f-6f82295f0759
# ╟─27e1d120-c3e1-4f3d-a263-d63204034814
# ╟─2da325ba-48cc-44b3-be34-e0cb46e33068
# ╟─8436d1b3-c03e-42e6-bbff-e785738e0f89
# ╟─d00038ba-98e9-45db-91df-dc75cb8ec101
# ╟─ef203912-b238-40a7-9d1b-4ed9b86ccbd2
# ╟─614c0f82-523a-40a6-9b57-d8b16d2b2860
# ╟─abd37588-b86f-4e99-8728-5a362ce5f34f
# ╟─1081bd99-7658-4c32-812c-14235bd82596
# ╟─c97d5915-7f1f-4fd6-80d3-aecb256ea0de
# ╟─55084c2d-6f81-4e55-946c-703245a6bb86
# ╟─30b561dd-6e6b-4719-abc0-9938099d5487
# ╠═d854d0ea-c5dd-4efa-9f46-83807339e163
# ╟─bceda6d4-b93f-4282-8f03-fc44132ea1bb
# ╟─cbf534bd-a329-4bc2-9940-f53a22e6d17e
# ╟─7a4f6354-3d0c-4814-8c4c-2d2200568545
# ╟─94b4f73a-ee55-405a-be50-bb92048f4eb2
# ╟─9f9345b8-a29a-41fe-a41b-3dcef2e1a366
# ╟─ae6ea7e0-f6f3-4d82-a45d-2c5ed299b223
# ╟─fd726227-f911-4383-90a7-aaab504b68ef
# ╟─d76afcb0-4b38-463d-add1-a58dd6acbbc0
# ╟─e7ea2eb7-b394-4ce6-b0a9-31d229e69787
# ╟─0a344b61-a226-49ee-ba19-f618390db269
# ╟─4d72f4f3-1dbc-49b9-894f-a521a24e2531
# ╟─e427ab16-9d5a-4200-8d96-8e49ec0da312
# ╟─4e0ef31d-05e7-4974-9282-fa4579e16328
# ╟─2bef2339-7afe-427d-bdc5-19b9e9b43878
# ╟─0f3814d4-6ee7-4242-88ea-5ecc7bf752bf
# ╟─05eb2a4e-2552-4bed-9523-d4f4c8760c94
# ╟─311050cc-9f52-43e0-afca-66d225c837d2
# ╟─f5f43417-abcd-4b20-a9ff-be06157b4a02
# ╟─e6f0b66d-9efa-4d2d-93a7-0d0d82c7948a
# ╟─784142ee-1416-4ccb-a341-0497422009b6
# ╟─a42d6141-e2e3-4725-ab00-4183c16461e3
# ╟─67a805bd-640d-4d88-8d61-8fef8bb23940
# ╟─843fec4c-3a4a-4cb2-881c-9a4e3df6a5bb
# ╟─09383e0f-2b37-459e-aeb3-b8eb4f194ddd
# ╟─0cfb00ed-60fe-4ebb-b5e2-6182ace7a719
# ╟─bfd46851-772d-43d4-8875-7d5c5dfb1155
# ╟─19b11522-d11c-4fe1-8f74-5dc975d82bc0
# ╟─44c9faca-efb6-493c-b751-9fd69e89ecb4
# ╟─1ae29d9c-d055-46d8-9a46-0d35a48cc58a
# ╠═8d474b8c-7f6f-4ee4-9282-5e8aa0a2f7b0
# ╠═f9e82107-07b9-4697-88fe-81b019640e6a
# ╟─be9f84d5-3c65-4ceb-8767-3fdc41429e12
# ╠═cf3bce53-0260-403c-8910-b04b05b558fe
# ╟─e3d540a3-7da5-4ef6-aa31-e629e752484e
# ╟─7fb16fd7-feac-4a75-bcf0-cf91ca7b3599
# ╟─dd5ee5ee-b2a7-46d4-bc43-0b9778eefcc2
# ╟─4db12c57-014f-4aa0-a5b1-4f12eb3bf834
# ╟─b592499b-cf96-486e-9067-9c79b5894641
# ╟─bfbb3b72-dedc-476d-a028-997e98b61ae4
# ╟─c3650a10-dff3-4fa2-bb56-3a19e1838766
# ╟─16053a54-d268-479b-bd2e-0634c4a1bb89
# ╟─3b115e62-8040-4a2c-8d6e-3d03669e7cd8
# ╟─3c16772c-394d-4472-8749-f5990bb69013
# ╟─3644e2e8-9b59-433e-9761-58566f0e1329
# ╟─b9d687cc-9c13-4285-85ac-90ef955f94f3
# ╟─0ca459b3-36ad-46f0-b49d-af921c57b9df
# ╟─02ff212e-937d-4e8e-96d2-5f982618b92d
# ╟─c8d0298f-2336-41b8-a4f4-a5be5db751f3
# ╟─4d4b41dc-f02f-4404-96c1-bb78376f010b
# ╟─018998d3-5c21-468c-b3e8-f413a485eedd
# ╟─638eef4b-d46c-453b-ac40-179ce70cc330
# ╟─b0fb2fbb-0175-4cce-b90d-3f9fa9b4541e
# ╟─0fd76efb-6d98-43f8-b714-8cf54fd62e7d
# ╟─78d480bf-bc4d-48e3-b3aa-100a38d6b4bc
# ╠═bc42cf6d-44be-4244-85de-a10d03884dfd
# ╟─5f0d5f9c-f0c4-43cd-8f2a-5d4c18955717
# ╟─7d30f1de-0225-4a1e-a76e-3c305615cbe2
# ╟─78d284e8-bd29-4ec3-9470-2141574787eb
# ╟─9b822e05-ad44-4238-9bfe-4b54d6e42628
# ╟─08e5381c-4cf1-4c70-ba74-26a05b8046fa
# ╟─f3e2034d-e259-4d0b-bca4-95fd17f69d56
# ╟─805cf044-8187-410e-833d-f4323ce07380
# ╟─7549863d-1e44-422f-9ddd-beec2ddcd48d
# ╟─47d4a0d9-467b-4717-a621-9d37e3870018
# ╟─afdac3e8-bc84-48fd-8a04-d838e038c16d
# ╟─497ff4cd-2705-49b3-bde6-671352e9b5a0
# ╟─3feca2ed-ff05-4c1a-a614-b1fd23674741
# ╟─297d7fdb-0117-4bd1-adee-8ad640dbf025
# ╟─5bca98c2-c6ef-4e95-a2c6-e99dd88b966b
# ╟─69dc2182-fb24-4db9-9fe6-dc6d9527facd
# ╟─703db4e5-e64a-4b09-ba22-c2808719fd58
# ╟─47f63585-6b16-4545-bdf6-5cd7ed470a82
# ╟─a1a49662-a13b-430b-b1d5-47f8f3e72f65
# ╟─8ff69555-f7f8-4401-82c6-e27cdf65dff3
# ╟─9f7d1862-b413-4292-84da-7c1d76530764
# ╟─d6f0452c-cefa-49ee-87ec-a92811880ed4
# ╟─da7c0cb8-1d2a-436a-bbb5-b53522dbd755
# ╟─04ce6f4c-1581-4ae1-9e9c-8d4dc75b01c7
# ╟─97a73cbe-6874-4641-9ad8-66df1e8c58c1
# ╟─a1439122-d0e6-4f02-9039-41edc141f64f
# ╟─e306b52c-0508-4314-9358-a12aca62ea9e
# ╟─47e805e5-8558-4522-a10c-c3c9ae52b17e
# ╟─21b53a25-5fef-4ac5-aab0-59232566c5d2
# ╟─23f24ea9-b33b-4aac-b17d-1f749360bfe7
# ╟─5a3b6e5c-5e6f-4fcd-be83-325974e42008
# ╟─894378b1-811d-43ac-a700-71350e88ee40
# ╟─2460d407-0fff-44c4-90ec-639f32414f49
# ╠═a9d0c669-f6d7-4e5f-8f57-b6bffe1710ba
# ╠═ad3dd437-7cfc-4cdc-a951-15949d39cf15
# ╠═6a5d1a86-4b9e-4d65-9bd7-f39ef8b6d9b4
# ╠═7f819c41-370f-49b2-9e9b-e3233ac560fd
# ╠═e93c5882-1ef8-43f6-b1ee-ee23c813c91b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
