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

# ╔═╡ f2d4c2a5-f486-407b-b31b-d2efcc7476b3
begin
    using CommonMark
    using PlutoUI, PlutoExtras
    using Plots, PlotThemes, LaTeXStrings
    using Latexify
    using HypertextLiteral
    using Colors
    using LinearAlgebra, Random, Printf, SparseArrays
    # using Symbolics
    using SymPy
    using QRCoders
    using PrettyTables
	# using Primes
    # using LinearSolve
    # using NonlinearSolve
    # using ForwardDiff
    # using Integrals
    # using OrdinaryDiffEq
	using IntervalArithmetic
end

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


# ╔═╡ cd269caf-ef81-43d7-a1a8-6668932b6363
# exportqrcode("https://www.mathmatize.com/")
let 
	img = LocalImage("./qrcode.png")
end

# ╔═╡ 8b65d45c-ca7c-4e5d-9cfd-a7348547ebe0
md"# 5.2 Area"

# ╔═╡ 02c15fce-abf1-427e-b648-2554ee18ed5a
cm"""
> __Objectives__
> 1. Use sigma notation to write and evaluate a sum.
> 1. Understand the concept of area.
> 1. Approximate the area of a plane region.
> 1. Find the area of a plane region using limits.

"""

# ╔═╡ 38eabacb-a71a-448d-875d-7f7230dba49e
md"""
### Sigma Notation
The sum of ``n`` terms  ``a_1, a_2, \cdots, a_n`` is written as
```math
\sum_{i=1}^n a_i = a_1+ a_2+ \cdots+ a_n
```
where ``i`` is the __index of summation__, ``a_i`` is the th __``i``th term__ of the sum, and the upper and lower bounds of summation are ``n`` and ``1``.
"""

# ╔═╡ bd6fff85-5fcc-4810-898d-d6f22b8e917d
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

# ╔═╡ 6caae83a-3aa3-4f79-9f05-fb969f952286
md"## Area "

# ╔═╡ 73c7417c-a035-4202-83f1-45e9897e8871
md"## The Area of a Plane Region"

# ╔═╡ 0e340bfb-9807-4061-8901-62133ac44c5f
f(x) = 5 - x^2

# ╔═╡ ebd3dd41-7a3b-4d2b-9c1d-adca89f36af7
begin
    ns = @bind n NumberField(2:4000, default=4)
    as = @bind a NumberField(0:1)
    bs = @bind b NumberField(a+2:10)
    lrs = @bind lr Select(["l" => "Left", "r" => "Right", "m" => "Midpoint", "rnd" => "Random"])

    md"""
    n = $ns  a = $as  b = $bs method = $lrs

    """
end

# ╔═╡ 19354aee-6de7-448f-8091-f6f68efdf84b
@bind showPlot Radio(["show" => "✅", "hide" => "❌"], default="hide")

# ╔═╡ 7086a5a8-d5ad-444b-8d14-056a3fdb99eb
@bind showConnc Radio(["show" => "✅", "hide" => "❌"], default="hide")

# ╔═╡ bb77f844-76c9-401f-8c2c-dcc5891b0a09
(showConnc == "show") ? md"""
  $$A=\lim_{n\to \infty} R_n =\lim_{n\to \infty} L_n =\frac{22}{3}$$
  """ : ""

# ╔═╡ 9463762b-50bb-49be-80be-5f67cb141d1c
md"## Finding Area by the Limit Definition"

# ╔═╡ ee50e46d-6580-4a68-a061-6179c895a219
md"""#  5.3 Riemann Sums and Definite Integrals 

> __Objectives__
> 1. Understand the definition of a Riemann sum.
> 2. Evaluate a definite integral using limits and geometric formulas.
> 3. Evaluate a definite integral using properties of definite integrals.

"""

# ╔═╡ 1f0c53c0-611f-4b4e-9718-efac2f0b893d
begin
    ns2 = @bind n2 Slider(2:2000, show_value=true, default=4)
    as2 = @bind a2 NumberField(-10:10, default=0)
    bs2 = @bind b2 NumberField(a+1:10)
    lrs2 = @bind lr2 Select(["l" => "Left", "r" => "Right", "m" => "Midpoint", "rnd" => "Random"])
    md"""
    n = $ns2  a = $as2  b = $bs2 method = $lrs2


    """
end


# ╔═╡ 6ecb0430-177c-4097-a94e-edbce61725d1
md"##  Riemann Sums"

# ╔═╡ 04922857-61ca-45a7-a3b4-cf35138e4847
md"## Definite Integral"

# ╔═╡ 5156fbdc-002c-4222-aca0-b835061e3fb7

let
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





# ╔═╡ 5f37c3d1-449f-4a6d-9af5-55f9a4c8feec
begin
s52q1Check = @bind s52q1chk Radio(["show", "hide"],default="hide")
md"""$(s52q1Check)"""
end

# ╔═╡ 4aa43e57-d9a4-49da-b7d8-fe39d21df414
let 
	val = s52q1chk == "show" ? 15 : ""
	cm" the nswer is = $val"
end

# ╔═╡ 229d9694-2751-479d-9872-218f7cea2261
md"## Properties of Definite Integrals"

# ╔═╡ 1ffb0970-7422-4cb7-9f84-841f68565b80
md"""
## Summary Evaluating Definite Integrals

1. Using the definition
2. Using a Computer Algebra System
3. Interpreting as areas
4. Approximating
5. Using integration techniques (tricks)

"""


# ╔═╡ 32b71cdc-e93b-4b05-b8f5-4b9d61a2eb62
begin
    xx = symbols("xx", real=true)
    sol = integrate(exp(xx), (xx, 1, 3))
    md"""
    __2. Using a Computer Algebra System__

    **Example:**

    1. Set up an expression for $\int_1^3 e^x dx$ as a limit of sums. 
    2. Use a computer algebra system to evaluate the expression
    	
    **Solution:**
    1. In class
    """

end




# ╔═╡ 4e358ab2-9be7-4d7f-b295-1e85943da027
let 
	x = symbols("x", real=true)
	integrate(exp(x))
end


# ╔═╡ 81e4ac99-3388-49e0-a168-5d9961c80ddf
md"""
__3. Interpreting as areas__

**Example:**

Evaluate the following integrals by interpreting each in terms of areas

(i) $\int_0^3  \sqrt{9-x^2} dx$  

(ii) $\int_{-2}^1|x|dx$


(iii) $\int_{-2}^1 xdx$
"""



# ╔═╡ 02d61e1f-b630-443c-b1dd-1fe5d2c81b2f
begin
    f1(x) = sqrt(9 - x^2)
    f3(x) = abs(x)
    theme(:wong)
    pp = plot(f1, xlims=[-4, 4], ylims=[-4, 4], framestyle=:origin, xtick=-4:1:4, yticks=-4:1:4)
    md"$pp"
end





# ╔═╡ b51c5bc6-9065-4687-b6cb-e67a372a3b4e

md""" __4. Approximating (Midpoint Rule)__

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





# ╔═╡ e13d39c8-ac62-460d-bf7e-9a994942731d
m5 = [0.2 * (1 / x) for x in 1.1:0.2:1.9] |> sum

# ╔═╡ 9a9bff9d-98c3-4300-bc0b-a7b807a43f99
integrate(1 / xx, (xx, 1, 2)).n()

# ╔═╡ 124a0bb3-b89e-4ac5-9178-01cda06045ec
md""" **Example**
Estimate 
```math 
\int_0^1 e^{-x^2} dx
```

"""



# ╔═╡ 56a7034f-d702-4877-ab5c-6916ac503043
begin
    exact = integrate(exp(-xx^2), (xx, 0, 1)).n()
end


# ╔═╡ 2b5289ee-8f10-4564-98e1-3a43e648d867


md"""
**Exercises:**

1. Wrtie as definite integral 
$\lim_{n\to \infty}\sum_{i=1}^n\frac{1}{n}\cos\left(1+\frac{i}{n}\right)^2=$
2. If $\int_{-5}^7f(x)dx=-17, \int_{-5}^{11}f(x)dx=32$, and $\int_{8}^7f(x)dx=5$, then $\int_{11}^8f(x)dx=$

"""


# ╔═╡ 9d6d8399-d063-42c4-af47-dbf5ab38d434
md"""
#  5.4 The Fundamental Theorem of Calculus
> __Objectives__
> 1. Evaluate a definite integral using the Fundamental Theorem of Calculus.
> 2. Understand and use the Mean Value Theorem for Integrals.
> 3. Find the average value of a function over a closed interval.
> 4. Understand and use the Second Fundamental Theorem of Calculus.
> 5. Understand and use the Net Change Theorem.

"""







# ╔═╡ 2543320e-dd76-4edf-adb8-ceac71805337
md"## The Fundamental Theorem of Calculus"

# ╔═╡ fa78d2d3-afc7-40d8-9e06-4df6f65321ac
md"## The Mean Value Theorem for Integrals"

# ╔═╡ fa3f03ce-66a3-447b-ae37-47eef4f10aaa
md"## Average Value of a Function"

# ╔═╡ 56153ee8-aa22-40ba-bab3-235cc8b1fef6
let
	x = symbols("x", real=true)
	end_points = [0.0; 11.5;22.0;32.0;50.0;80.0]
	end_points_zipped = collect(zip(end_points[1:end-1],end_points[2:end]))
	As = map(((a,b,),)->interval(a,b), end_points_zipped)
	piece_wise(x) = findlast(x->x,map(t->in_interval(x,t),As))
	fns =[x->-4*x+341
		x-> 295.0 + x - x
		x-> (3/4)*x+278.5
		x-> (3/2)*x+254.5
		x-> -(3/2)*x+404.5
	]
	fns_sym = map(f->f(x),fns)
	fns_int = [
		integrate(fns_sym[1],x)
		integrate(fns_sym[2],x)
		integrate(fns_sym[3],x)
		integrate(fns_sym[4],x)
		integrate(fns_sym[5],x)
	]
	
	s(x) = fns[piece_wise(x)](x)
	
	n = 100
	xs =  range(0.0,80.0, length=n)
	plot(xs, s.(xs))
	distanse_0_80= map( ((i,(a,b),),)->subs(fns_int[i],x,b)-subs(fns_int[i],x,a), enumerate(end_points_zipped)) |> sum

	Average_speed = (1/80)*distanse_0_80
end

# ╔═╡ b25051b6-8b33-4976-86b9-4db2166c291c
md"## The Second Fundamental Theorem of Calculus"

# ╔═╡ 9cd59dc0-5971-45d0-b076-69df14c3f4cd

begin
    Slider4 = @bind slider4 Slider(1:0.1:5, show_value=false)
    md"x = $Slider4"
end

# ╔═╡ 71bca4ec-9d80-423c-bbac-16711deccce1

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


# ╔═╡ e8cdbe22-f7e1-47b2-bd3f-6130a6fc6207

md"""
💣 BE CAREFUL:

Evaluate ``\large \int_{-3}^6 \frac{1}{x}dx``
"""




# ╔═╡ bb514175-fe2c-498d-8ae5-aa3e59167fa4

md"""
**Example:**
Sketch the region enclosed by the given curves and calculuate its area
```math
y=2x-x^2, \quad y=0
```
Solution: In class
"""





# ╔═╡ e4f23df3-6b96-4333-99e0-1b9dfb7b8cba
begin
    pltExmpl = plot(x -> 2 * x - x^2, framestyle=:origin, xlims=(0, 2), ylims=(-1, 2), fill=(0, 0.5, :green), label=nothing)
    plot!(pltExmpl, x -> 2 * x - x^2, framestyle=:origin, xlims=(-1, 3), ylims=(-1, 2), label=nothing)
end


# ╔═╡ 42f171ca-09e4-45ed-8910-427ab7dc3aee
let
	ff(x) = 2 * x - x^2;




md"""

A=$(integrate(ff(xx),(xx,0,2)))

	
## Table of Indefinite Integrals

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


# ╔═╡ df2dff93-465a-404a-9bf5-581907b99f42
md"## Net Change Theorem "

# ╔═╡ 8458322d-c34a-475f-b11a-f9cb74a91a95

let
	v(t) = t^3 - 10 * t^2 + 29 * t - 20
    u = symbols("u", real=true)
    v1(t) = v(t)
    s1(t) = convert(Float64, integrate(v1(u), (u, 0, t)).n())

    theme(:default)
    a1, b1 = 1, 6
    t1 = a1:0.01:b1
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
            xticks=(1:b1, map(i->Symbol("$i"),1:b1)),
            framestyle=:origin,
            label=nothing,
            xlabel="x",
            subplot=2,
            title="Velocity Graph"
        )
        annotate!(pp, [(xxx[i], 0.1, "t=$(t1[i])")], subplot=1)
        # annotate!(pp,[(5,8.2,("velocity graph",10))], subplot=2)
    end

	gif(anim,"net_change_ex10.gif", fps=15)
end




# ╔═╡ 5d0d0bd7-7a85-4b2f-8a39-c6a4ef7d6175

md"""
# 5.5 Integration By Substitution
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





# ╔═╡ 0d547f78-1578-4c4a-9403-bd4ede9a62a7

cm"## Pattern Recognition"


# ╔═╡ 8a584c0c-3017-4958-b611-772b3a6e44c5
md"## Change of Variables for Indefinite Integrals"

# ╔═╡ a73db7b8-3464-4852-a9ef-5d0de43d4395


# ╔═╡ 2b68430f-08ac-4bfb-a484-e6fbe08738ba

cm"""

__Example__: Find
```math
	\begin{array}{ll}
	(i) & \int \sqrt{2x-1} dx \\ \\
	(ii) & \int x\sqrt{2x-1} dx \\ \\
	(iii) & \int \sin^23x\cos3x dx \\ \\
	\end{array}
```
	
"""

# ╔═╡ 22d44abf-34e3-496c-910a-5e51a7d90e10
md"""
## Change of Variables for Definite Integrals

"""




# ╔═╡ 4bcc7833-6bfb-421f-b54f-3567aea00c1e

md"""
## Integration of Even and Odd Functions
"""



# ╔═╡ b2873160-bdc6-4883-b6a0-fe2b8295f97d

md"""
# 5.7 The Natural Logarithmic Function: Integration
> __Objectives__
> 1. Use the Log Rule for Integration to integrate a rational function.
> 2. Integrate trigonometric functions.
"""



# ╔═╡ 6406249d-f7ac-4ed7-a175-71e6dcdf55f2
md"## Log Rule for Integration"

# ╔═╡ c9a96c8c-94a5-4b5a-853e-60b35bc7621a
md"#  5.8 Inverse Trigonometric functions: Integration"

# ╔═╡ 9a998b24-6d36-4f47-b4db-9df9b3d138e2
md"""
> __Objectives__
> 1. Integrate functions whose antiderivatives involve inverse trigonometric functions.
> 2. Use the method of completing the square to integrate a function.
> 3. Review the basic integration rules involving elementary functions.
"""





# ╔═╡ cd76f697-ce0b-4dba-b818-65ee5b6de23d
md"## Integrals Involving Inverse Trigonometric Functions"

# ╔═╡ efb4d714-dea7-428a-858c-70c9193ce150
md"## Completing the Square"

# ╔═╡ b0716945-c4e6-4d3d-a29d-864ff023b0fc
md"##  Review of Basic Integration Rules"

# ╔═╡ 49fe4d0b-124f-4dd8-a34d-9aaf80705175
cm"""
BASIC INTEGRATION RULES ``(a>0)``
1. ``\displaystyle\int k f(u) d u=k \int f(u) d u``
2. ``\displaystyle\int[f(u) \pm g(u)] d u=\int f(u) d u \pm \int g(u) d u``
3. ``\displaystyle\int d u=u+C``
4. ``\displaystyle\int u^n d u=\frac{u^{n+1}}{n+1}+C, \quad n \neq-1``
5. ``\displaystyle\int \frac{d u}{u}=\ln |u|+C``
6. ``\displaystyle\int e^u d u=e^u+C``
7. ``\displaystyle\int a^u d u=\left(\frac{1}{\ln a}\right) a^u+C``
8. ``\displaystyle\int \sin u d u=-\cos u+C``
9. ``\displaystyle\int \cos u d u=\sin u+C``
10. ``\displaystyle\int \tan u d u=-\ln |\cos u|+C``
11. ``\displaystyle\int \cot u d u=\ln |\sin u|+C``
12. ``\displaystyle\int \sec u d u=\ln |\sec u+\tan u|+C``
13. ``\displaystyle\int \csc u d u=-\ln |\csc u+\cot u|+C``
14. ``\displaystyle\int \sec ^2 u d u=\tan u+C``
15. ``\displaystyle\int \csc ^2 u d u=-\cot u+C``
16. ``\displaystyle\int \sec u \tan u d u=\sec u+C``
17. ``\displaystyle\int \csc u \cot u d u=-\csc u+C``
18. ``\displaystyle\int \frac{d u}{\sqrt{a^2-u^2}}=\arcsin \frac{u}{a}+C``
19. ``\displaystyle\int \frac{d u}{a^2+u^2}=\frac{1}{a} \arctan \frac{u}{a}+C``
20. ``\displaystyle\int \frac{d u}{u \sqrt{u^2-a^2}}=\frac{1}{a} \operatorname{arcsec} \frac{|u|}{a}+C``
"""

# ╔═╡ f608e3b8-4a16-40c9-8ffd-d02af53146e6
md"""
# 5.9 Hyperbolic Functions

> __Objectives__
> 1. Develop properties of hyperbolic functions.
> 2. Differentiate and integrate hyperbolic functions.
> 3. Develop properties of inverse hyperbolic functions.
> 4. Differentiate and integrate functions involving inverse hyperbolic functions.

## Hyperbolic Functions

"""

# ╔═╡ fb1499e3-0a58-4b34-b452-3bdc31b82504
cm"""

__Circle__: ``x^2+y^2=1``

<div class="img-container">

$(Resource("https://www.dropbox.com/s/c53yvdcyul4vvlz/circle.jpg?raw=1"))

</div>

__Hyperbola__: ``-x^2+y^2=1``

<div class="img-container">

$(Resource("https://www.dropbox.com/s/iy6fw024c6r50f8/hyperbola.jpg?raw=1"))

</div>


"""



# ╔═╡ c3de1903-845e-4779-b67b-817e703fd1ee

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




# ╔═╡ 66a05cab-f595-43f8-843d-1f845c953868
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

# ╔═╡ db150ea2-4895-415e-97a9-f7eff4180d63
md"## Inverse Hyperbolic Functions"

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
	n1Slider = @bind n1slider Slider(1:200, default=1,show_value=true)
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
	f1(x) = sin(x)+3+cnstslider
	f2(x) = cos(2x)+1+cnstslider
	f3(x) = cos(2x)+4+cnstslider
	x = symbols("x",real=true)
	poi1=solve(f1(x)-f3(x),x) .|> p -> real(p.n()) .|> Float64 
	theme(:wong)
	a1,b1 = 1, 5
	Δx1 = (b1-a1)/n1slider
	x1Rect =a1:Δx1:b1
	x1 = a1:0.1:b1
	y1 = f1.(collect(x1))
	y2 = f2.(x1)
	y3 = f3.(x1)
	
	p1=plot(x1,y1, fill=(y2,0.25,:green), label=nothing,c=:red)
	p2=plot(x1,y1, fill=(y3,0.25,:green), label=nothing,c=:red)
	
	plot!(p1,x1,y2,label=nothing)
	plot!(p2,x1,y3,label=nothing)
	annotate!(p1,[
				(3.5,3.5+cnstslider,L"y=f(x)",:red),
				(5.9,0,L"x"),
				(0.2,6,L"y"),
				(3.2,1+cnstslider,L"y=g(x)",:blue)
				]
			)
	annotate!(p2,[
				(1.2,4.5+cnstslider,L"y=f(x)",:red),
				(5.9,0,L"x"),
				(0.2,6,L"y"),
				(4,5+cnstslider,L"y=g(x)",:blue)
				]
			)
	
	plot!(p1; p1Opt...,ylims=(-3,6),xlims=(-1,6))
	recs =[
			Shape([(xi,f2(xi)),(xi+Δx1,f2(xi)),(xi+Δx1,f1(xi+Δx1)),(xi,f1(xi+Δx1))]) 			 for xi in x1Rect[1:end-1]
		  ]
	n1slider>2 && plot!(p1,recs, label=nothing,c=:green)
	plot!(p2; p1Opt...,ylims=(-3,6),xlims=(-1,6))
	
	scatter!(p2,(poi1[1],f3(poi1[1])), label="Point of instersection",legend=:bottomright)
	# save("./imgs/6.1/sec6.1p2.png",p2)
	# annotate!(p2,[(4,0.51,(L"$\sum_{i=1}^{%$n2} f (x^*_{i})\Delta x=%$s2$",12))])
	formula=sec71chbx ? cm"""```math
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

# ╔═╡ db08f294-cfcf-462a-8fb5-8d8a63563e61
p1Opt = (framestyle=:origin, aspectration=1)

# ╔═╡ 932e13f0-0949-4e77-b3a8-f344784b1f1d
begin
	
	ex1x=0:0.01:1
	ex1y=exp.(ex1x)
	ex1plt=plot(ex1x,ex1y,label=nothing,fill=(0,0.5,:red))
	plot!(ex1plt,ex1x,ex1x,fill=(0,0,:white),label=nothing)
	plot!(;p1Opt...,xlims=(-0.4,1.5),ylims=(-0.4,3.5),label=nothing,xticks=[0,0,1])
	ex1Rect = Shape([(0.5,0.55),(0.55,0.55),(0.55,exp(0.55)),(0.5,exp(0.55))])
	plot!(ex1Rect,label=nothing)
	annotate!([	(0.77,0.6,L"y=x")
			  ,	(0.7,exp(0.7)+0.2,L"y=e^x")
			  , (1.1,1.7,L"x=1")
			  , (-0.1,0.5,L"x=0")
			  , (0.54,0.44,text(L"\Delta x",10))
			  ])
	md"""
	**Solution**
	
	$ex1plt
	"""
end

# ╔═╡ d993fe50-4792-4f54-b4a6-23cb91718f00
let
	ex2f1(x)=x^2
	ex2f2(x)=2x-x^2
	x = symbols("x",real=true)
	ex2poi=solve(ex2f1(x)-ex2f2(x)) .|> p->p.n() .|> Float64
	ex2x=0:0.01:1
	ex2widex=-1:0.01:2
	ex2y1=ex2f1.(ex2x)
	ex2y1wide=ex2f1.(ex2widex)
	ex2y2=ex2f2.(ex2x)
	ex2y2wide=ex2f2.(ex2widex)
	ex2plt=plot(ex2x,ex2y2,label=nothing,fill=(0,0.5,:green))
	plot!(ex2plt,ex2x,ex2y1,fill=(0,0,:white),label=nothing)
	plot!(ex2widex,ex2y1wide, c=:red,label=nothing)
	plot!(ex2widex,ex2y2wide, c=:blue,label=nothing)
	plot!(;p1Opt...,xlims=(-0.4,1.5),ylims=(-0.4,2),label=nothing,xticks=[0,0,1])
	ex2Rect = Shape([ (0.5,ex2f2(0.55))
					, (0.55,ex2f2(0.55))
					, (0.55,ex2f1(0.55))
					, (0.5,ex2f1(0.55))
					])
	plot!(ex2Rect,label=nothing)
	scatter!(ex2poi,ex2f1.(ex2poi),label=nothing)
	annotate!([	(0.77,0.4,L"y=x^2")
			  ,	(0.7,1.1,L"y=2x-x^2")
			  , (0.54,0.24,text(L"\Delta x",10))
			  ])
	md"""
	**Solution**
	
	$ex2plt
	"""
end

# ╔═╡ a2a2d894-7588-48a8-84fd-65e5ead80072
begin
	ex3f1(x) = cos(x)
	ex3f2(x) = sin(2x)
	ex3X=0:0.01:(π+0.019)/2
	
	ex3Y1=ex3f1.(ex3X)
	ex3Y2=ex3f2.(ex3X)
	ex3P = plot(ex3X,ex3Y1,label=L"y=\cos(x)", c=:red)
	plot!(ex3P,ex3X,ex3Y1,fill=(ex3Y2,0.25,:green),label=nothing,c=nothing)
	plot!(ex3P,ex3X,ex3Y2,label=L"y=\sin(2x)",c=:blue)
	plot!(ex3P;p1Opt...,xlims=(-1,π),ylims=(-1.1,1.1))
	scatter!(ex3P,(π/6,ex3f1(π/6)),label=nothing,c=:black)
	
	md"""
	**Solution**
	
	$ex3P
	"""
end

# ╔═╡ 64ee7ca1-4feb-470a-900c-fbb8a413b3f5
let
	ex4FRight(y)=3-y^2
	ex4FLeft(y)=y+1
	y,x = symbols("y,x",real=true)
	ex4p = plot(x->-x^2 +3,x->x,-3,6,c=:blue,label=L"y^2=3-x")
	ex4Rect = Shape([ (ex4FRight(0.1),-0.2)
					, (ex4FLeft(-0.2),-0.2)
					, (ex4FLeft(-0.2),0.1)
					, (ex4FRight(0.1),0.1)
					])
	plot!(ex4Rect,label=nothing)
	plot!(ex4p,x->x,x->x-1,-5,6;p1Opt...,c=:red,label=L"y=x-1",xticks=-3:1:15)
	(ex4poi1,ex4poi2)=solve([x+y^2-3,x-y-1],[x,y]) .|> p -> map(q->Float64(q.n()),p)
	scatter!([ex4poi1,ex4poi2],xlims=(-3.5,7),label=nothing,legend=:topleft)
	md"""
	**Solution:**
	$ex4p
	"""
end

# ╔═╡ 358c0e61-da8c-4eba-9765-58760940c7c3
let
	x,y = symbols("x,y", real=true)
	integrate(y+1-(y^2/2-3),(y,-2,4))
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
	x5=0.1:0.1:10
	x51=0:0.1:1
	p5 = plot(x->x/4, xlims=(-1,10), framestyle=:origin, aspectratio=1,label=nothing)
	plot!(x->x,c=:red,label=nothing)
	# plot!(x51,1 ./ x51,fill=(x51/4,0.5,:blue),c=:white)
	plot!(x5,1 ./ x5,c=:green,label=nothing)
	xlims!(-0.1,3)
	ylims!(-0.1,2)
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

# ╔═╡ de12a145-2680-4322-8921-606bc6a7ca42
md"## Solids with Known Cross Sections"

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

# ╔═╡ e3700fb4-f895-4528-9ef5-0ba59c9703c7
md"""
# 7.3 Volume: The Shell Method
> __Objectives__
> 1. Find the volume of a solid of revolution using the shell method.
> 2. Compare the uses of the disk method and the shell method.

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
	
	f30(x)=2*x^2-x^3
	s3e0p0 = plot(0:0.01:2, f30)
	annotate!(s3e0p0,[(1,1.2,L"y=2x^2-x^3")])
	recty=Shape([ (0.75,f30(0.75))
			, (1.75,f30(0.75))
			, (1.75,f30(0.75)+0.05)
			, (0.75,f30(0.75)+0.05)])
	ux, lx = Plots.unzip(Plots.partialcircle(0,π,100,-0.1))
	plot!(ux,lx .+ 1.15,c=:red,frame_style=:origin)
	anns = [(0.65,f30(0.76),L"x_L=?",10),(1.88,f30(0.76),L"x_R=?",10)]
	s3e0p =	if show_labels 
		plot!(s3e0p0,recty,label=nothing)
		annotate!(anns)
	elseif show_rect
		plot!(s3e0p0,recty,label=nothing)
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

# ╔═╡ dbe837f1-85da-4572-b8c3-738ba346d67f
md"""
```math
V = 2 \pi r h \Delta r = \text{[circumference][height][thickness]}

```
"""

# ╔═╡ a89799eb-01a8-4dd4-a2a3-3576c26f29ef
html"""
<div style="display: flex; justify-content:center; padding:20px; border: 2px solid rgba(125,125,125,0.2);">
<div>
<h5>Cylindrical Shells Illustration</h5>
<iframe width="560" height="315" src="https://www.youtube.com/embed/JrRniVSW9tg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
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

# ╔═╡ 3865e317-a19a-4a9a-a8c4-2813ec0a7f0a
let
	y= 00.0:0.1:1.0
	x = exp.(-y.^2)
	plot(x,y,aspect_ratio=:1,frame_style=:origin)
	
end

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

# ╔═╡ eb27f45f-6be2-43df-bf62-1842bae6281b
md"## Area of a Surface of Revolution"

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

# ╔═╡ 8f8766fa-c168-4f09-8703-347a139b7069
md"""
# 8.1 Basic Integration Rules

> __Objectives__
> 1. Review procedures for fitting an integrand to one of the basic integration rules.
"""

# ╔═╡ 598055ab-2b36-481e-bb7d-65edfcfe183b
cm"""
<div style="background-color:#FF9733;color:white;font-weight:800;padding:2px 10px;width:350px;">

Review of Basic Integration Rules (``a>0``) 
</div>
<div class="img-container">

$(Resource("https://www.dropbox.com/s/56svdxjfgowjojk/int_table.png?raw=1"))



"""

# ╔═╡ 681e1450-4011-43c8-ab66-26e0c073ee3d


# ╔═╡ 6cc99632-805b-4fcd-98f0-96da071afdb9
md"""
# 8.2 Integration by Parts
> __Objectives__
> Find an antiderivative using integration by parts.
"""

# ╔═╡ e938f5a1-7037-47c7-9e96-ed0c7341c4f2
md"""
*The integration rule that corresponds to the Product Rule for differentiation is called __integration by parts__*

"""

# ╔═╡ 57037db4-318e-40df-af33-f2be564acf56
md"## Integration by Parts"

# ╔═╡ 9280e821-4518-4697-b55e-a3b806d748e1
md"""
__Indefinite Integrals__
```math
\int f(x)g'\,(x) dx = f(x) g(x) - \int g(x) f'\,(x) dx
```
"""

# ╔═╡ 7a19b897-5d02-4577-81a1-2a33ed5f8bb9
md"""
**Example**

```math 
\int x \cos(x) dx 
```


"""

# ╔═╡ d41e0530-1b75-412c-828c-d53a58523293
begin
	
	md"""
	**Solution:**
	
	```math
	\int x \cos(x) dx = \int \underbrace{x}_{f(x)} \overbrace{\cos(x)}^{g'(x)} dx = x \sin(x) - \int \sin(x) \overbrace{ \;\;\;\;dx}^{f'\,(x) dx} = x\sin(x) + \cos(x) +C  
	
	```
	"""
end

# ╔═╡ ca728595-e908-4839-a9be-04a6e884a3f4


# ╔═╡ 507bc0c8-ef40-4ef4-ac3f-b66ae162362f
md"""
# 8.3 Trigonometric Integrals
> __Objectives__
> - Solve trigonometric integrals involving powers of sine and cosine.
> * Solve trigonometric integrals involving powers of secant and tangent.
> * Solve trigonometric integrals involving sine-cosine products.

**RECALL**

```math



\displaystyle
\sin^2 x + \cos^2 x =1, \quad  \tan^2 x + 1 =\sec^2 x,  \quad  1+\cot^2 x  =\csc^2 x,

```

```math
\displaystyle
\cos^2 x = \frac{1 +\cos 2x }{2}, \quad \sin^2 x = \frac{1 -\cos 2x }{2}
```

```math
\displaystyle
\begin{array}{ccc}
\sin A\cos B & = & \frac{1}{2}\left[\sin(A-B)+\sin(A+B)\right], \\[0.2cm]
\sin A\sin B & = & \frac{1}{2}\left[\cos(A-B)-\cos(A+B)\right], \\[0.2cm]
\cos A\cos B & = & \frac{1}{2}\left[\cos(A-B)+\cos(A+B)\right], \\
\end{array}
```

```math
\int \tan x dx = \ln|\sec x| +C, \quad \int \sec x dx = \ln|\sec x+\tan x| +C
```


```math
\int \cot x dx = -\ln|\csc x| +C, \quad \int \csc x dx = \ln|\csc x-\cot x| +C
```
"""

# ╔═╡ 42dee241-13c6-4d89-bce0-bac4e846cf7d
md"## Integrals of Powers of Sine and Cosine"

# ╔═╡ 4ec721e0-f0e4-492b-8791-87b876c57e6b


# ╔═╡ 6158d974-6a19-4a84-bb10-a9488fca001b
md"## Integrals of Powers of Secant and Tangent"

# ╔═╡ 2c66e4aa-69f7-4bc1-8299-1902a557e21f
cm"""
$(bbl("GUIDELINES FOR EVALUATING INTEGRALS INVOLVING POWERS OF SECANT AND TANGENT","")
1. When the power of the secant is even and positive, save a secant-squared factor and convert the remaining factors to tangents. Then expand and integrate.
```math
\int \sec ^{2 k} x \tan ^n x d x=\int \overbrace{\left(\sec ^2 x\right)^{k-1}}^{\text {Even }} \tan ^n x \overbrace{\sec ^2 x d x}^{\text {Convert to tangents }}=\int\left(1+\tan ^2 x\right)^{k-1} \tan ^n x \sec ^2 x d x
```
2. When the power of the tangent is odd and positive, save a secant-tangent factor and convert the remaining factors to secants. Then expand and integrate.
```math
\int \sec ^m x \tan ^{2 k+1} x d x=\int\left(\sec ^{m-1} x\right) \overbrace{\left(\tan ^2 x\right)^k}^{\text {Odd }} \overbrace{\sec x \tan x d x}^{\text {Convert to secants }}=\int\left(\sec ^{m-1} x\right)\left(\sec ^2 x-1\right)^k \sec x \tan x d x
```
3. When there are no secant factors and the power of the tangent is even and positive, convert a tangent-squared factor to a secant-squared factor, then expand and repeat if necessary.
```math
\int \tan ^n x d x=\int\left(\tan ^{n-2} x\right) \overbrace{\left(\tan ^2 x\right)}^{\text {Convert to secants }} d x=\int\left(\tan ^{n-2} x\right)\left(\sec ^2 x-1\right) d x
```
4. When the integral is of the form
```math
\int \sec ^m x d x
```
where ``m`` is odd and positive, use integration by parts, as illustrated in Example 5 in Section 8.2.
5. When the first four guidelines do not apply, try converting to sines and cosines.
"""

# ╔═╡ b0938d8a-a9b4-4551-9731-7bc738b88e85


# ╔═╡ 76e4c36b-0cc8-4042-9c63-0610cb669ec9
md"## Integrals Involving Sine-Cosine Products"

# ╔═╡ dd402f3e-4580-41e6-89c5-d6e1eba01b63
md"""
__Using Product Identities__
```math 
\int \sin mx \cos n x dx, 
```
```math
\int \sin mx \sin n x dx, 
```
```math
\int \cos mx \cos n x dx.
```

Use


```math
\displaystyle
\begin{array}{ccc}
\sin mx\sin nx & = & \frac{1}{2}\left\{\cos[(m-n)x]-\cos[(m+n)x]\right\}, \\[0.2cm]
\sin mx\cos nx & = & \frac{1}{2}\left\{\sin[(m-n)x]+\sin[(m+n)x]\right\}, \\[0.2cm]
\cos mx\cos nx & = & \frac{1}{2}\left\{\cos[(m-n)x]+\cos[(m+n)x]\right\}, \\
\end{array}
```


"""

# ╔═╡ d1ea53cf-eb1e-4f7a-ad9d-f6f58f48d0b1
md"""
# 8.4 Trigonometric Substitution
> __Objectives__
> 1. Use trigonometric substitution to find an integral.
> 1. Use integrals to model and solve real-life applications.
"""

# ╔═╡ 14ea163c-854d-453d-8e00-67571751653d
md"## Trigonometric Substitution"

# ╔═╡ c2d68428-99c5-45fb-b056-a1c0ae5f06ad
md"""
# 8.5 Partial Fractions
> __Objectives__
> 1. Understand the concept of partial fraction decomposition.
> 2. Use partial fraction decomposition with linear factors to integrate rational functions.
> 3. Use partial fraction decomposition with quadratic factors to integrate rational functions.

**Integration of Rational Functions By Partial Fractions**

We learn how to integrate rational function: quotient of polunomial.
```math
 f(x) =\frac{P(x)}{Q(x)}, \qquad P, Q \text{ are polynomials}
```
 
**How?**

◾ __STEP 0__ : if degree of ``P`` is greater than or equal to degree of ``Q`` goto
__STEP 1__, else GOTO __STEP 2__.

◾ __STEP 1__ : Peform long division of ``P`` by ``Q`` to get 
```math
 \frac{P(x)}{Q(x)} = S(x) + \frac{R(x)}{Q(x)}
```
and apply __STEP 2__ on  ``\frac{R(x)}{Q(x)}``.

◾ __STEP 2__ : Write the __partial fractions decomposition__  

◾ __STEP 3__ : Integrate
 
"""

# ╔═╡ 5ad8d84d-9f32-4378-bd22-f6004023076c


# ╔═╡ 077175a1-b3e0-467b-b5bd-b52616e3936f
md"""
__Partial Fractions Decomposition__

We need to write ``\frac{R(x)}{Q(x)}`` as sum of __partial fractions__ by __factor__ ``Q(x)``. Based on the factors, we write the decomposition accoding to the following cases

__case 1__: ``Q(x)`` is a product of distinct linear factors.
we write 
```math
Q(x)=(a_1x+b_1)(a_2x+b_2)\cdots (a_kx+b_k)
```
then there exist constants ``A_1, A_2, \cdots, A_k`` such that
```math
\frac{R(x)}{Q(x)}= \frac{A_1}{a_1x+b_1}+\frac{A_2}{a_2x+b_2}+\cdots +\frac{A_k}{a_kx+b_k}
```

__case 2__: ``Q(x)`` is a product of linear factors, some of which are repeated.
say first one 
```math
Q(x)=(a_1x+b_1)^r(a_2x+b_2)\cdots (a_kx+b_k)
```
then there exist constants ``B_1, B_2, \cdots B_r, A_2, \cdots, A_k`` such that
```math
\frac{R(x)}{Q(x)}= \left[\frac{B_1}{a_1x+b_1}+\frac{B_2}{(a_1x+b_1)^2}+\cdots \frac{B_r}{(a_1x+b_1)^r}\right]+ \frac{A_2}{a_2x+b_2}+\cdots +\frac{A_k}{a_kx+b_k}
```


__case 3__: ``Q(x)`` contains irreducible quadratic factors, none of which is repeated.
say we have (Note: the quadratic factor ``ax^2+bx+c`` is irreducible if ``b^2-4ac<0``). For eaxmple if
```math
Q(x)=(ax^2+bx+c)(a_1x+b_1)
```
then there exist constants ``A, B,`` and ``C`` such that
```math
\frac{R(x)}{Q(x)}= \frac{Ax+B}{ax^2+bx+c}+\frac{C}{a_1x+b_1}
```

__case 4__: ``Q(x)`` contains irreducible quadratic factors, some of which are repeated. For example if
```math
Q(x)=(ax^2+bx+c)^r(a_1x+b_1)
```
then there exist constants ``A_1, B_1, A_2, B_2, \cdots A_r, B_r `` and ``C`` such that
```math
\frac{R(x)}{Q(x)}= \left[\frac{A_1x+B_1}{ax^2+bx+c}+\frac{A_2x+B_2}{(ax^2+bx+c)^2}+\cdots+\frac{A_rx+B_r}{(ax^2+bx+c)^r}\right]+\frac{C}{a_1x+b_1}
```



"""

# ╔═╡ f65d043c-24ab-4c73-8da9-653ec0f57298
md"""
**Example:** Write out the form of the partial fractions decomposition of the function
```math
\frac{x^3+x+1}{x(x-1)(x+1)^2(x^2+x+1)(x^2+4)^2}
```

"""

# ╔═╡ 4eee2e8b-85b3-4986-9e5d-bfea119302dc
md"## Linear Factors"

# ╔═╡ bc944bad-3868-4fca-af1d-0a6e6ffffbb7
md"## Quadratic Factors"

# ╔═╡ f8dc9ccf-df39-47a4-b80a-78cc262cfdeb
md"""
**More Examples**

Find
```math
\begin{array}{lll}
\text{(5)} &\displaystyle \int  \frac{x^3+x}{x-1}dx. \\
\text{(6)} &\displaystyle \int  \frac{x^2+2x-1}{2x^3+3x^2-2x}dx. \\
\text{(7)} &\displaystyle \int  \frac{dx}{x^2-a^2}, \text{  where } a\not = 0 \\
\text{(8)} &\displaystyle \int  \frac{x^4-2x^2+4x+1}{x^3-x^2-x+1}dx \\
\text{(9)} &\displaystyle \int  \frac{2x^2-x+4}{x^3+4x}dx \\
\text{(10)} &\displaystyle \int   \frac{4x^2-3x+2}{4x^2-4x+3}dx \\
\text{(11)} &\displaystyle \int   \frac{1-x+2x^2-x^3}{x(x^2+1)^2}dx \\
\end{array}
```

"""

# ╔═╡ 72974703-d483-4d3c-be80-b89c7d7c503f
# let
# 	@syms x::Real
# 	f(x) = (x^4-2x^2+4x+1)/(x^3-x^2-x+1)
# 	integrate(f(x),x)
# end

# ╔═╡ ff9221cc-70e3-4f14-9bf8-8340874c17c3
md"""
__Rationalizing Substitutions__
Find
```math
\begin{array}{lll}
\text{(1)} & \int \frac{\sqrt{x+4}}{x}dx. \\
\text{(2)} & \int \frac{dx}{2\sqrt{x+3}+\;x}. \\
\end{array}
```
"""

# ╔═╡ 318706d0-ad9a-4a1e-b3de-f02020b6ab52
md"""
**Remarks**
```math
\int \frac{dx}{x^2-a^2} = \frac{1}{2a}\ln\left|\frac{x-a}{x+a}\right|
```

```math
\int \frac{dx}{x^2+a^2} = \frac{1}{a}\tan^{-1}\left(\frac{x}{a}\right)
```
"""

# ╔═╡ dbd5a0da-cafb-4537-9410-215d87bdc60e
md"""
# 8.7 Rational Functions of Sine & Cosine 
> __Objectives__
> 1. Find an indefinite integral involving rational functions of sine and cosine

"""

# ╔═╡ 0a6c72ed-f6f0-4534-ba96-581e685a3d94
md"""
# 8.8 Improper Integrals
> __Objectives__
> 1. Evaluate an improper integral that has an infinite limit of integration.
> 2. Evaluate an improper integral that has an infinite discontinuity.
*__Do you know how to evaluate the following?__*
```math

\begin{array}{llr}
\text{(1)} & \int_1^{\infty} \frac{1}{x^2} dx & (\text{Type 1}) \\ \\
\text{(2)} & \int_0^{2} \frac{1}{x-1} dx & (\text{Type 2}) \\ \\
\end{array}
```

"""

# ╔═╡ dbd92a84-14c0-4510-9f9f-39e90f50c30e
md"## Improper Integrals with Infinite Limits of Integration"

# ╔═╡ 3f727233-8150-4008-8fb5-2a83ba616e1e
md"## Improper Integrals with Infinite Discontinuities"

# ╔═╡ 1e507853-e2e6-493d-9d62-f33da7a7caa8
md"""
# 9.1 Sequences
__Objectives__
> 1. Write the terms of a sequence.
> 1. Determine whether a sequence converges or diverges.
> 1. Write a formula for the nth term of a sequence.
> 1. Use properties of monotonic sequences and bounded sequences.
"""

# ╔═╡ 2eb6bb15-066f-4601-8a94-eb1ce880e7ac
md"## Sequences"

# ╔═╡ 8c345896-0123-40a5-8f00-c6ebefcee822
cm"""
__Sequence__: A sequence can be thought of as a list of numbers written in a definite order:
```math
a_1, a_2, a_3, \cdots, a_n, \cdots 
```

- ``a_1``: first term,
- ``a_2``: second term,
- ``a_3``: third term,
- ``\vdots``
- ``a_n``: ``\text{n}^\text{th}`` term,

"""

# ╔═╡ 1cc30502-ec6c-4aa9-b178-58b3e425dac9
let
	@syms n::Unsigned
	a(n) = 3+(-1)^n
	b(n) = n/(1-2n)
	c(n) = n^2/(2^n-1)
	d(n) = n==1 ? 25 : d(n-1) - 5 
	k=Unsigned(5)
	seq(an::Function,lastn::Int;kwargs...)=seq(an,lastn:lastn;kwargs...)
	seq(an::Function,lastn::AbstractUnitRange;as_list::Bool=true) = begin
		st = join(map(i-> "$(String(Symbol(an)))_{$i}=$(an(i))",lastn)," ,")
		stl = join(map(i-> "$(an(i))",lastn)," ,")
		final_str = if as_list==false 
			st 
		else 
			"\\{$stl, \\cdots\\}"
		end
		L"%$(final_str)"
	
	end
	seq(a,1:5)
	seq(b,10000)
	# seq(c,1:5)
	# seq(d,1:5)
	
	# cm""
	
end

# ╔═╡ 355007a5-91c8-454e-8463-31c6abc9f87f
md"## Limit of a Sequence"

# ╔═╡ eae5658b-a235-40de-84a3-00152a109e93
n91Slider = @bind n91slider  NumberField(1:1000,default=1);md"n = $n91Slider"

# ╔═╡ af5c9045-66ec-483a-a197-db544f30b1b6
let
	seqns = [
		(n ->  n/(n+1), L"a_n=\frac{n}{n+1}",-0.1,1.1),
		(n ->  (1+1/n)^n, L"a_n=\left(1+\frac{1}{n}\right)^n",-0.1,3.2),
	]
	a1,label,ymin,ymax =seqns[2]
	d1=1:n91slider
	plt1 = scatter(a1.(d1), zeros(10),
		frame_style=:origin, 
		ylimits=(ymin,ymax),
		xlimits=(-0.2,ymax+0.5),
		yaxis=nothing,
		label=label,
		showaxis=:x,
		legend=:outertopright,
		title_location=:left,
		grid=:none,
		title="Example 1"
	)
	annotate!(plt1,[(0.4,0.5,L"a_{%$n91slider}=\frac{%$n91slider}{%$(1+n91slider)}=%$(round(a1(n91slider),digits=6))")])
	
	d2=1:n91slider
	plt2 = scatter(d2, a1.(d2),
		frame_style=:origin, 
		ylimits=(ymin,ymax),
		xlimits=(-2,200),
		label=label,
		legend=:outerbottom,
		title_location=:left,
		title="Visualization (Graph)",
		marker=(1,2,:green,stroke(0.0, 0.0, :green, :dot))
	)
	annotate!(plt2,[(100,ymax/2,L"a_{%$n91slider}=\frac{%$n91slider}{%$(1+n91slider)}=%$(round(a1(n91slider),digits=6))")])
# 	if (n91slider>=10)
		
# 		lens!(plt2,[n91slider-20.1, n91slider+20.1], [0.9,1.01], 
# 			inset = (1, bbox(0.6, -0.1, 0.4, 0.4)),
# 			grid=:none,
			
# 		)
	# end
	# if (n91slider>=99)
		
	# 	lens!(plt1,[ymax-0.11, ymax], [ymin,ymax], inset = (1, bbox(0.6, 0.0, 0.4, 0.5)),
	# 			yaxis=nothing,
	# 			frame_style=:origin, 
	# 			showaxis=:x,
	# 		grid=:none,
	# 		annotations=[(ymax-0.11,0.3,"Zoom",7)]
	# 	)
	# 	lens!(plt2,[ymax-0.11, ymax], [ymin,ymax], inset = (1, bbox(0.6, 0.0, 0.4, 0.5)),
	# 			yaxis=nothing,
	# 			frame_style=:origin, 
	# 			showaxis=:x,
	# 		grid=:none,
	# 		annotations=[(ymax-0.11,0.3,"Zoom",7)]
	# 	)
	# end
	md"""
	$plt2
	"""
		
end

# ╔═╡ 4507039d-b5e0-4c22-a698-ccbfc7eeb6ed
md"## Pattern Recognition for Sequences"

# ╔═╡ b568193c-ba85-4f59-89e9-6d5b824d08cd
md"## Monotonic Sequences and Bounded Sequences"

# ╔═╡ f27fe033-30da-4174-9f1c-23910a036481


# ╔═╡ 7d460b80-8319-4129-862e-695ebb8cff28
md"""
# 9.2 Series and Convergence
> __Objectives__
> 1. Understand the definition of a convergent infinite series.
> 2. Use properties of infinite geometric series.
> 3. Use the nth-Term Test for Divergence of an infinite series.
"""

# ╔═╡ d8322419-3ebe-4718-ba84-9c435615d1ba
md"## Infinite Series"

# ╔═╡ 12ae12a8-c47b-4d15-af4d-d6bb92c8a026
let
	1/2 + 1/4 + 1/8 + 1/16 # 1/2^n
	sum([1/2^n for n in 1:30])
end


# ╔═╡ 02def290-7dcd-4c8f-9c41-228033cc3e7c
cm"""
Consider the sequence ``\left\{a_n\right\}_{n=1}^{\infty}``. The expression 
```math
a_1 + a_2 + a_3 +\cdots 
```
is called an __infinite series__ (or simply __series__) and we use the notation

```math
\sum_{n=1}^{\infty}a_n \qquad \text{or} \qquad \sum a_n
```

To make sense of this sum, we define a related __sequence__ called the sequence of __partial sums__ ``\left\{s_n\right\}_{n=1}^{\infty}`` as
```math
\begin{array}{lll}
s_1 & = & a_1 \\
s_2 & = & a_1 + a_2 \\
s_3 & = & a_1 + a_2 + a_3\\
\vdots \\
s_n & = & a_1 + a_2 + \cdots + a_n =\sum_{i=1}^n a_i \\
\vdots
\end{array}
```
and give the following definition
"""

# ╔═╡ 84942358-6f19-4d7f-b367-4dc5e81009f5
cm"""
__Questions we want to answer about `Series`__

```math
\sum_{n=1}^{\infty}a_n
```
1. does this converge?
2. if it does, what is its sum?

"""

# ╔═╡ 9fe2db35-a1d7-4af7-be2c-e34c1ce66929
begin
	n8Slider = @bind n8slider  Slider(1:1000,show_value=true)
	md"""
	
	----
	
	||
	|---|
	|n = $n8Slider |
	
	----
	"""
end

# ╔═╡ b73b6b29-6d18-4308-80dd-e0cc2aedd038
let
	@syms n
	s1(n) = 1/(2^n)
	s1exact = summation(s1(n),(n,1,n8slider))
	s2exact = summation(n,(n,1,n8slider))
	s1exactn=round(Float64(s1exact.n()),digits=8)
	s1exactsol= (n8slider<20) ? s1exact : s1exactn
	s2exactn=round(Float64(s2exact.n()),digits=8)
	# # gr(size = (500, 165))
	plot(;		yaxis=nothing,
				frame_style=:origin, 
				showaxis=false,
				ticks=[],
				ylims=(0,1),
		annotations=[
			(0.6,0.75,
				L"\sum_{i=1}^na_i=\sum_{n=1}^{%$n8slider}\frac{1}{2^n}=%$s1exactsol",10
			),
			(0.58,0.5,
				L"\sum_{i=1}^na_i=\sum_{n=1}^{%$n8slider}n=%$s2exact",10
			)
		],
			grid=:none,)
	
end

# ╔═╡ a1b22caf-ec34-4abd-9460-bce43203b742


# ╔═╡ 2abfc0da-1d95-49dd-837d-6718ce473c5d
md"""
# 9.3 The Integral Test and p-Series
> 1. Use the Integral Test to determine whether an infinite series converges or diverges.
> 2. Use properties of p-series and harmonic series.
"""

# ╔═╡ f08b1731-59dd-4d82-8b42-6824bc216d5a
md"## The Integral Test"

# ╔═╡ f8f72024-5ea6-474d-8123-dd9b19a03fa7
md"## p-Series and Harmonic Series"

# ╔═╡ 986e1b28-ad65-4d2e-ad70-9dc515c8a08c
md"""
# 9.4 Comparisons of Series
> 1. Use the Direct Comparison Test to determine whether a series converges or diverges.
> 2. Use the Limit Comparison Test to determine whether a series converges or diverges
"""

# ╔═╡ a749dce9-5f63-43f0-95e5-d36558cc6533
md"## Direct Comparison Test"


# ╔═╡ f65563e8-6eef-4526-be12-7051d3e8d437
md"## Limit Comparison Test"

# ╔═╡ 1a9ea230-6841-429e-bcca-f013d39514a9
md"""
# 9.5 Alternating Series
> 1. Use the Alternating Series Test to determine whether an infinite series converges.
> 2. Use the Alternating Series Remainder to approximate the sum of an alternating series.
> 3. Classify a convergent series as absolutely or conditionally convergent.
> 4. Rearrange an infinite series to obtain a different sum.
"""

# ╔═╡ 15f491d1-9436-44b1-a307-0ebd98cdf722
md"## Alternating Series"

# ╔═╡ 376852e6-9a1b-4f86-8681-d307c7fd610a
md"##  Alternating Series Remainder"

# ╔═╡ 4f407428-dd3b-4df4-9fdc-9cff3aaafb56
let
	# a(n) =(1/factorial(n))
	# b(n) = ((-1)^(n+1))*(a(n))
	# s(n) = sum(b(i) for i in 1:n)
	# s6=s(6)
	# s6-a(7), s6+a(7)
end

# ╔═╡ 10b81e79-03ff-46fb-8557-172b3f51dce3
let
	# a(n) =(1/n^4)
	# b(n) = ((-1)^(n+1))*(a(n))
	# s(n) = sum(b(i) for i in 1:n)
	# N = (1000)^(1/4)-1
	# N = 5
	# s(5)
end

# ╔═╡ 47754429-df92-4523-b459-5fb6d76bd67a
md"## Absolute and Conditional Convergence"

# ╔═╡ 0cfd9bcf-2545-4df2-a70f-3334b8454e31
md"## Rearrangement of Series"

# ╔═╡ c7201240-7f39-4904-8fd1-5cbbd87800ca
cm"""
1. If a series is __absolutely convergent__, then its terms can be rearranged in any order without changing the sum of the series.
2. If a series is __conditionally convergent__, then its terms can be rearranged to give a different sum.
"""

# ╔═╡ b4599a16-e7f7-4a2a-b349-2648ee45208f
function rect(x, Δx, xs, f;direction=:x) 
	if direction==:y
		Shape([(0,x), (0,x + Δx), (f(xs), x + Δx), (f(xs), x )])
	else
		Shape([(x, 0), (x + Δx, 0), (x + Δx, f(xs)), (x, f(xs))])
	end
		
end

# ╔═╡ 8315fb27-89e4-44a4-a51e-8e55fc3d58e5
function reimannSum(f, n, a, b; method="l", color=:green, plot_it=false,direction=:x)
    Δx = (b - a) / n
    x = a:0.01:b
    # plot(f;xlim=(-2π,2π), xticks=(-2π:(π/2):2π,["$c π" for c in -2:0.5:2]))

    (partition, recs) = if method == "r"
        parts = (a+Δx):Δx:b
        rcs = [rect(p - Δx, Δx, p, f;direction=direction) for p in parts]
        (parts, rcs)
    elseif method == "m"
        parts = (a+(Δx/2)):Δx:(b-(Δx/2))
        rcs = [rect(p - Δx / 2, Δx, p, f;direction=direction) for p in parts]
        (parts, rcs)
    elseif method == "l"
        parts = a:Δx:(b-Δx)
        rcs = [rect(p, Δx, p, f;direction=direction) for p in parts]
        (parts, rcs)
    else
        parts = a:Δx:(b-Δx)
        rcs = [rect(p, Δx, rand(p:0.1:p+Δx), f;direction=direction) for p in parts]
        (parts, rcs)
    end
    # recs= [rect(sample(p,Δx),Δx,p,f) for p in partition]
    p = direction == :y ? plot(f.(x), x; legend=nothing) : plot(x, f.(x); legend=nothing)
    plot!(p, recs, framestyle=:origin, opacity=0.4, color=color)
    s = round(sum(f.(partition) * Δx), sigdigits=6)
    return plot_it ? (p, s) : s
end


# ╔═╡ f80cc26d-120b-4f14-b31e-b50c9283c0b9
let
	if showPlot == "show"
    theme(:wong)
    anchor1 = 0.5
    (p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true)

    annotate!(p, [(anchor1, f(anchor1) - 2, text(L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$", 12, n > 500 ? :white : :black))])
    annotate!(p, [(anchor1 + 0.5, f(anchor1 + 0.1), text(L"$y=%$f(x)$", 12, :black))])

    md""" 	

    $p
    """
	end

end

# ╔═╡ 8c2f85bb-9b81-4b70-b7e8-1a91e2738838
let
	n = 4
	lr="r"
	f(x)= x^2
	a,b = 0, 2
	theme(:wong)
    anchor1 = 0.5
    (p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true)
	sum_text = if lr == "l"
			L"$\sum_{i=1}^{%$n} f (x_{i-1})\Delta x=%$s$"
		elseif lr=="r"
			L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$"
		else
			L"$\sum_{i=1}^{%$n} f (x^*_{i})\Delta x=%$s$"
		end
    annotate!(p, [(anchor1, f(anchor1) +2, text(sum_text, 12, n > 500 ? :white : :black))])
    annotate!(p, [(1.2, f(1)+0.1, text(L"$y=%$f(x)$", 12, :black))])

    md""" 	

    $p
    """
	
end

# ╔═╡ 208abdcc-dc12-4a08-a1f8-2177f95886f7
let
	n = 300
	lr="r"
	f(x)= x^3
	a,b = 0, 1
	theme(:wong)
    anchor1 = 0.5
	(p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true)
    sum_text = if lr == "l"
		L"$\sum_{i=1}^{%$n} f (x_{i-1})\Delta x=%$s$"
	elseif lr=="r"
		L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$"
	else
		L"$\sum_{i=1}^{%$n} f (x^*_{i})\Delta x=%$s$"
	end
	
    annotate!(p, [(anchor1, f(anchor1)+0.5, text(sum_text, 12, n > 500 ? :white : :black))])
    
    md""" 	

    $p
    """
	
end

# ╔═╡ fd7161bc-1e1b-42e3-8758-c8e3e3ec0877
let
	n = 400
	lr="l"
	f(y)= y^2
	a,b = 0, 1
	theme(:wong)
    anchor1 = 0.5
	(p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true,direction=:y)
    sum_text = if lr == "l"
		L"$\sum_{i=1}^{%$n} f (x_{i-1})\Delta x=%$s$"
	elseif lr=="r"
		L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$"
	else
		L"$\sum_{i=1}^{%$n} f (x^*_{i})\Delta x=%$s$"
	end
	
    annotate!(p, [(anchor1, f(anchor1)-0.01, text(sum_text, 12, n > 500 ? :white : :black))])
    
    md""" 	

    $p
    """
	
end

# ╔═╡ 01008c60-bcfa-42a1-b5e8-fa67db2131ba
let
	n = 4
	lr="m"
	f(x)= sin(x)
	a,b = 0, π
	theme(:wong)
    anchor1 = 0.5
	(p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true,direction=:x)
    sum_text = if lr == "l"
		L"$\sum_{i=1}^{%$n} f (x_{i-1})\Delta x=%$s$"
	elseif lr=="r"
		L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$"
	else
		L"$\sum_{i=1}^{%$n} f (x^*_{i})\Delta x=%$s$"
	end
	
    annotate!(p, [(anchor1+0.1, f(anchor1)+0.4, text(sum_text, 12, n > 500 ? :white : :black))])
    
    md""" 	

    $p
    """
	
end

# ╔═╡ a7c8710c-2256-425e-a946-0e2791773592
let
	n = n2
	lr=lr2
	f(x) = √x
	a,b = a2, b2
	theme(:wong)
    anchor1 = 0.15
	(p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true,direction=:x)
    sum_text = if lr == "l"
		L"$\sum_{i=1}^{%$n} f (x_{i-1})\Delta x=%$s$"
	elseif lr=="r"
		L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$"
	else
		L"$\sum_{i=1}^{%$n} f (x^*_{i})\Delta x=%$s$"
	end
	
    annotate!(p, [(anchor1+0.1, f(anchor1)+0.4, text(sum_text, 12, n > 500 ? :white : :black))])
    
    md""" 	

    $p
    """
	
end

# ╔═╡ cad95270-ba9f-4821-87da-e457a00b9617
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

# ╔═╡ 9b02faca-b5cb-442d-8a63-82f584b054fd




begin
    left_sum = reimannSum(f, n, a, b; method="l")
    right_sum = reimannSum(f, n, a, b; method="r")
    l_sum_txt = L"R_{%$n}= %$right_sum \leq A\leq %$left_sum =L_{%$n}"


    l_sum_txt


end


# ╔═╡ ef081dfa-b610-4c7a-a039-7258f4f6e80e
begin
    function add_space(n=1)
        repeat("&nbsp;", n)
    end
    function post_img(img::String, w=500)
        res = Resource(img, :width => w)
        cm"""
      <div class="img-container">

      $(res)

      </div>"""
    end
    function poolcode()
        cm"""
      <div class="img-container">

      $(Resource("https://www.dropbox.com/s/cat9ots4ausfzyc/qrcode_itempool.com_kfupm.png?raw=1",:width=>300))

      </div>"""
    end
    function define(t="")
        beginBlock("Definition", t)
    end
    function remark(t="")
        beginBlock("Remark", t)
    end
    function remarks(t="")
        beginBlock("Remarks", t)
    end
    function bbl(t)
        beginBlock(t, "")
    end
    function bbl(t, s)
        beginBlock(t, s)
    end
    ebl() = endBlock()
    function theorem(s)
        bth(s)
    end
    function bth(s)
        beginTheorem(s)
    end
    eth() = endTheorem()
    ex(n::Int; s::String="") = ex("Example $n", s)
    ex(t::Int, s::String) = example("Example $t", s)
    ex(t, s) = example(t, s)
    function beginBlock(title, subtitle)
        """<div style="box-sizing: border-box;">
       	<div style="display: flex;flex-direction: column;border: 6px solid rgba(200,200,200,0.5);box-sizing: border-box;">
       	<div style="display: flex;">
       	<div style="background-color: #FF9733;
       	    border-left: 10px solid #df7300;
       	    padding: 5px 10px;
       	    color: #fff!important;
       	    clear: left;
       	    margin-left: 0;font-size: 112%;
       	    line-height: 1.3;
       	    font-weight: 600;">$title</div>  <div style="olor: #000!important;
       	    margin: 0 0 20px 25px;
       	    float: none;
       	    clear: none;
       	    padding: 5px 0 0 0;
       	    margin: 0 0 0 20px;
       	    background-color: transparent;
       	    border: 0;
       	    overflow: hidden;
       	    min-width: 100px;font-weight: 600;
       	    line-height: 1.5;">$subtitle</div>
       	</div>
       	<p style="padding:5px;">
       """
    end
    function beginTheorem(subtitle)
        beginBlock("Theorem", subtitle)
    end
    function endBlock()
        """</p></div></div>"""
    end
    function endTheorem()
        endBlock()
    end
    ex() = example("Example", "")
    # function example(lable, desc)
    #     """<div style="display:flex;">
    #    <div style="
    #    font-size: 112%;
    #        line-height: 1.3;
    #        font-weight: 600;
    #        color: #f9ce4e;
    #        float: left;
    #        background-color: #5c5c5c;
    #        border-left: 10px solid #474546;
    #        padding: 5px 10px;
    #        margin: 0 12px 20px 0;
    #        border-radius: 0;
    #    ">$lable:</div>
    #    <div style="flex-grow:3;
    #    line-height: 1.3;
    #        font-weight: 600;
    #        float: left;
    #        padding: 5px 10px;
    #        margin: 0 12px 20px 0;
    #        border-radius: 0;
    #    ">$desc</div>
    #    </div>"""
    # end
	function example(lable, desc)
        """<div class="example-box">
    <div class="example-header">
      $lable
    </div>
    <div class="example-title">
      $desc
    </div>
    <div class="example-content">
      
  </div>
		"""
    end
	 
    @htl("")
end

# ╔═╡ 8408e369-40eb-4f9b-a7d7-26cde3e34a74
begin
    text_book = post_img("https://www.dropbox.com/scl/fi/upln00gqvnbdy7whr23pj/larson_book.jpg?rlkey=wlkgmzw2ernadd9b8v8qwu2jd&dl=1", 200)
    md""" # Syllabus
    ## Syallbus
    See here [Term 242 - MATH102 - Syllabus](https://www.dropbox.com/scl/fi/mhlakw1roc1vv0mytjm42/Math102-Syllabus-242.pdf?rlkey=cf4egj8p25d4yrusj28r8nxw5&raw=1)
    ## Textbook
    __Textbook: Edwards, C. H., Penney, D. E., and Calvis, D. T., Differential Equations and Linear Algebra, Fourth edition, Pearson, 2021__
    $text_book

    ## Office Hours
    I strongly encourage all students to make use of my office hours. These dedicated times are a valuable opportunity for you to ask questions, seek clarification on lecture material, discuss challenging problems, and get personalized feedback on your work. Engaging with me during office hours can greatly enhance your understanding of the course content and improve your performance. Whether you're struggling with a specific concept or simply want to delve deeper into the subject, I am here to support your learning journey. Don't hesitate to drop by; __your success is my priority__.

    | Day       | Time        |
    |-----------|-------------|
    | Sunday    | 02:00-02:50PM |
    | Tuesday    | 02:00-02:50PM |
    Also you can ask for an online meeting through __TEAMS__.
    """
end

# ╔═╡ d60ca33d-fa31-49a2-9a4a-dfc54aef46ae
cm"""
$(ex())

Evaluate ``\displaystyle \sum_{i=1}^n\frac{i+1}{n}`` for ``n=10, 100, 1000`` and ``10,000``.

"""

# ╔═╡ 52333157-9913-489d-8784-dc3b542af1e9
cm""" 



In __Euclidean geometry__, the simplest type of plane region is a rectangle. Although people often say that the *formula* for the area of a rectangle is
```math
A = bh
```
it is actually more proper to say that this is the *definition* of the __area of a rectangle__.

For a triangle ``A=\frac{1}{2}bh``

$(post_img("https://www.dropbox.com/s/sfsg0d4ha1m2gc6/triangle_area.jpg?raw=1", 300))
"""


# ╔═╡ 9f50c8be-95e8-4c28-81b4-8ccd638505af
cm"""


$(ex())

Use __five__ rectangles to find two approximations of the area of the region lying between the graph of
```math
f(x)=5-x^2
```
and the ``x``-axis between ``x=0`` and ``x=2``.
"""

# ╔═╡ 15277097-7c11-4b03-8579-8f9c376361cd
let
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
    
    __Find the area of the region is bounded below by the ``x``-axis, and the left and right boundaries of the region are the vertical lines ``x=a`` and ``x=b``.__

    $findingAreaP

    $(post_img("https://www.dropbox.com/s/hnspiptmyybneqn/area_with_lower_and_upper.jpg?raw=1",400))
    """
end

# ╔═╡ 8f673110-65a1-4f6d-8de1-ebcfb49fb50d
cm"""
$(ex(4,"Finding Upper and Lower Sums for a Region"))
Find the upper and lower sums for the region bounded by the graph of ``f(x)=x^2`` and the ``x``-axis between ``x=0`` and ``x=2``.
"""

# ╔═╡ f89bbb38-906b-45f3-9eff-617924e0b719
cm"""
$(bth("Limits of the Lower and Upper Sums"))

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

# ╔═╡ a862aa36-d811-427d-bc1a-4502175b71f4
cm"""
$(define("Area of a Region in the Plane"))
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

$(post_img("https://www.dropbox.com/s/a3sjz8m9vspp5ec/area_def.jpg?raw=1",300))

</div>
"""

# ╔═╡ b9434085-81d7-4a3d-bed5-deebea3cd48a
cm"""
    $(ex(5,"Finding Area by the Limit Definition"))

    Find the area of the region bounded by the graph of ``f(x)=x^3`` , the ``x``-axis, and the vertical lines ``x=0`` and ``x=1``.

    """


# ╔═╡ 1615be4c-fb84-418f-8406-c274550cfb86
cm"""
$(ex(7,"A Region Bounded by the y-axis"))

Find the area of the region bounded by the graph of ``f(y)=y^2`` and the ``y``-axis for ``0\leq y\leq 1``.

"""

# ╔═╡ 38ab6c6d-c5e0-49f9-8c76-61e0b8dc13c6
cm"""
$(bbl("Midpoint Rule",""))

```math
\textrm{Area} \approx \sum_{i=1}^n f\left(\frac{x_{i-1}+x_i}{2}\right)\Delta x.
```

$(ebl())

$(ex(8,"Approximating Area with the Midpoint Rule"))

Use the Midpoint Rule with ``n=4`` to approximate the area of the region bounded by the graph of ``f(x)=\sin x`` and the ``x``-axis for ``0\leq x\leq \pi``, 
"""

# ╔═╡ 845d8b0a-6550-49f4-9308-13ec2b2bd0c1
cm"""
$(ex(1,"A Partition with Subintervals of Unequal Widths"))
Consider the region bounded by the graph of ``f(x)=\sqrt{x}`` and the ``x``-axis for ``0 \leq x \leq 1``, as shown in Figure 5.18. Evaluate the limit
```math
\lim _{n \rightarrow \infty} \sum_{i=1}^n f\left(c_i\right) \Delta x_i
```
where ``c_i`` is the right endpoint of the partition given by ``c_i=i^2 / n^2`` and ``\Delta x_i`` is the width of the ``i`` th interval.
"""

# ╔═╡ f98989fb-b59a-496f-be73-322b4dcb4960
cm"""
$(define("Riemann Sum"))
Let ``f`` be defined on the closed interval ``[a,b]``, and let ``\Delta`` be a partition of ``[a,b]`` given by

```math
a=x_0 < x_1 < x_2< \cdots< x_{n-1}< x_n=b
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


# ╔═╡ 7e49b1d2-b6c5-4b84-ae6b-ac62d3f58d0c
cm"""
$(bbl("Remark",""))

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





# ╔═╡ c19ba868-ca3b-4987-8e9b-eacffd6f9158
cm"""
$(define("Definite Integral"))
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



# ╔═╡ 982c228a-a8cd-42cd-a437-1b8c80c89cef
cm"""
$(bbl("Remark",""))
The definite integral  is a **number**; it does not depend on ``x``. In fact, we could use any letter in place of ``x`` without changing the value of the integral:

```math
\int_a^b f(x) dx = \int_a^b f(y) dy =\int_a^b f(w) dw =\int_a^b f(😀) d😀 
```
"""

# ╔═╡ 3d54c0f4-3324-4bd6-adee-c343c5153392
cm"""
$(bth("Continuity Implies Integrability"))

If a function ``f`` is continuous on the closed interval ``[a,b]``, then ``f`` is integrable on ``[a,b]``. That is, 

```math
\int_a^b f(x) dx \quad \textrm{exists}.
```

"""


# ╔═╡ 1937220c-4467-430b-a745-42294765b6a5

cm"""

$(ex(2,"Evaluating a Definite Integral as a Limit"))
```math
\int_{-2}^1 2x dx
```



"""



# ╔═╡ 1681a378-aea4-4e23-85a7-5c5731742ad8
cm"""
$(bth("The Definite Integral as the Area of a Region"))

If ``f`` is continuous and nonnegative on the closed interval ``[a,b]``, then the area of the region bounded by the graph of ``f``, the ``x``-axis, and the vertical lines ``x=a`` and ``x=b`` is
```math
\textrm{Area} = \int_a^b f(x) dx
```
‍
‍
"""

# ╔═╡ 7f7b1152-5dd0-4f97-b931-4fe74c51b3a3
cm"""
$(ex(3))
 Sketch the region corresponding to each definite integral. Then evaluate each integral using a geometric formula.

- (a) ``\displaystyle \int_1^3 4 dx``
- (b) ``\displaystyle \int_0^3 (x+2) dx``
- (c) ``\displaystyle \int_{-2}^2 \sqrt{4-x^2} dx``

"""

# ╔═╡ b5d1d68a-ad7e-4140-a818-addead342c53
cm""" 

- ``\displaystyle \int_a^b f(x) dx`` is the net area

$(post_img("https://www.dropbox.com/s/ol9l38j2a53usei/note3.png?raw=1"))
"""





# ╔═╡ d7cb77c3-7875-43d8-bab6-7281455700b0
begin
    
    cm""" 
    **Question 1:** 

    $(post_img("https://www.dropbox.com/s/7esby3czioyzk26/q1.png?dl=1"))

    where each of the regions ``A, B`` and ``C`` has area equal to 5, then the area between the graph and the x-axis from ``x=-4`` to ``x=2`` is

   
    	
    """

end






# ╔═╡ a41fcefd-00dd-45c5-86a0-7fe076460674
begin
    s52q1Check1 = @bind s52q1chk1 Radio(["show" => "show", "hide" => "hide"], default="hide")

    md""" 
    **Question 2:** 

    $(post_img("https://www.dropbox.com/s/7esby3czioyzk26/q1.png?dl=1"))

    where each of the regions ``A, B`` and ``C`` has area equal to 5, then 
    	``\int_{-4}^2 f(x) dx = `` 

    $(s52q1Check1)
    	
    """

end





# ╔═╡ 07f45116-ff8b-4d2c-a7e3-46a4581afc16
md" the nswer is = **$((s52q1chk1 ==\"show\") ?  -5 : \"\")**"

# ╔═╡ 8b1d06a8-dbd0-4dc4-b12a-15425960ecc4
cm"""
$(define("Two Special Definite Integrals"))
1. If ``f``  is defined at ``x=a``, then ``\displaystyle \int_a^a f(x) dx =0``.
2. If ``f``  is integrable on ``[a,b]``, then ``\displaystyle \int_b^a f(x) dx =- \int_a^b f(x) dx``.
$(ebl())

"""



# ╔═╡ 5e23a09b-c96f-40e0-bd8f-af18041f2be9
cm"""
$(ex(4," Evaluating Definite Integrals"))
Evaluate each definite integral.

1. ``\displaystyle\int_\pi^\pi \sin x d x``

2. ``\displaystyle\int_3^0(x+2) d x``
"""

# ╔═╡ 874e3ccf-4309-42d4-af8d-3921b025239e
cm"""
$(bth("Additive Interval Property"))
If ``f`` is integrable on the three closed intervals determined by ``a, b`` and ``c``, then
```math
\int_a^b f(x) dx = \int_a^c f(x) dx + \int_c^b f(x) dx.
```
$(ebl())

$(bth("Properties of Definite Integrals"))
If ``f``  and ``g`` are integrable on ``[a,b]`` and ``k`` is a constant, then the functions ``kf`` and ``f\pm g`` are integrable on ``[a,b]``, and
1. ``\displaystyle \int_a^b kf(x) dx = k \int_a^b f(x) dx``.
2. ``\displaystyle \int_a^b \left[f(x)\pm g(x)\right] dx = \int_a^b f(x) dx\pm \int_a^b g(x) dx``.
$(ebl())

$(bth("Preservation of Inequality"))
- If ``f`` is integrable and nonnegative on the closed interval ``[a,b]``, then
```math
0\leq \int_a^b f(x) dx.
```
- If ``f`` and ``g`` are integrable on the closed interval ``[a,b]`` and ``f(x)\leq g(x)`` for every ``x`` in ``[a,b]`` , then
```math
\int_a^b f(x) dx \leq \int_a^b g(x) dx.
```
$(ebl())
"""

# ╔═╡ 4ff28842-9307-4813-8791-197fd6ca5238
cm"""
$(ex(6,"Evaluation of a Definite Integral"))
Evaluate ``\int_1^3\left(-x^2+4 x-3\right) d x`` using each of the following values.
```math
\int_1^3 x^2 d x=\frac{26}{3}, \quad \int_1^3 x d x=4, \quad \int_1^3 d x=2
```
"""

# ╔═╡ 8cc0d5fd-c988-4f16-a07f-a6439fccbc8a

cm"""

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

$(bth("The Fundamental Theorem of Calculus"))

If a function ``f`` is continuous on the closed interval ``[a,b]`` and ``F`` is an antiderivative of ``f`` on the interval ``[a,b]``, then
```math
\int_a^b f(x) dx = F(b) - F(a).
```
$(ebl())

$(bbl("Remark",""))

We use the notation 
```math
\int_a^b f(x) dx = \bigl. F(x)\Biggr|_a^b= F(b)-F(a) \quad \textrm{or}\quad 
\int_a^b f(x) dx =\Bigl[F(x)\Bigr]_a^b = F(b)-F(a)
```
"""






# ╔═╡ 66b482d7-4c12-4f41-9d09-3eb723a1001b

cm"""
$(ex(1))

Evaluate each definite integral.

- __(a)__ ``\displaystyle \int_1^2 (x^2-3) dx``

$("  ")
- __(b)__ ``\displaystyle \int_1^4 3\sqrt{x} dx``

$("  ")
- __(c)__ ``\displaystyle \int_{0}^{\pi/4} \sec^2 x dx``

$(ex(2))
Evaluate
$("  ")
- ``\displaystyle \int_{0}^{2} \Big|2x-1\Big| dx``
"""


# ╔═╡ 4a9a8e25-2db5-495a-bf55-94d589bdb699
begin
    theme(:wong)
    s54e3_f(x) = 1 / x
    s54e3_x = 1:0.1:exp(1)
    s54e3_p = plot(s54e3_x, s54e3_f.(s54e3_x), label=nothing, c=:green)
    plot!(s54e3_p, s54e3_x, s54e3_f.(s54e3_x) / 2, ribbon=s54e3_f.(s54e3_x) / 2, linestyle=:dot, linealpha=0.1, framestyle=:origin, xticks=(1:4, [:1, :2, :3]), label=nothing, ylims=(-0.1, 1.5), xlims=(-0.1, 3))
    annotate!(s54e3_p, [(2, 1, L"y=\frac{1}{x}"), (exp(1), -0.1, L"e")])
	plot!(s54e3_p,[1,1,NaN,exp(1),exp(1)],[0,1.0,NaN,0.0,exp(-1)],label=nothing, c=:black,lw=3)
cm"""
$(ex(3))
Find the area of the region bounded by the graph of
```math
y=\frac{1}{x}
```
the ``x``-axis, and the vertical lines ``x=1`` and ``x=e``.
$(ebl())

$s54e3_p

"""
end


# ╔═╡ 269e3d73-0e11-4fcc-a291-031da9817541

cm"""


$(bth("Mean Value Theorem for Integrals"))

If ``f`` is continuous on the closed interval ``[a,b]``, then there exists a number ``c`` in the closed interval ``[a,b]`` such that
```math
\int_a^b f(x) dx =f(c)(b-a).
```
$(post_img("https://www.dropbox.com/s/7fnr2kfq082kq0y/mvt.jpg?raw=1",400))

"""

# ╔═╡ e200bd3c-2636-4a91-83dd-de6b0e3d5a32
cm"""

$(define("the Average Value of a Function on an Interval"))

If ``f`` is integrable on the closed interval ``[a.b``, then the __average value__ of ``f`` on the interval is
```math
\textbf{Avergae value} = \frac{1}{b-a}\int_a^b f(x) dx
```
$(ebl())

$(ex(4))

Find the average value of ``f(x)=3x^2-2x``  on the interval ``[1,4]``.

"""



# ╔═╡ 1af2a723-f74f-47b1-a46f-a5452b7da7b1
cm"""
$(ex(5,"The Speed of Sound"))
At different altitudes in Earth's atmosphere, sound travels at different speeds. The speed of sound ``s(x)``, in meters per second, can be modeled by
```math
s(x)= \begin{cases}-4 x+341, & 0 \leq x<11.5 \\ 295, & 11.5 \leq x<22 \\ \frac{3}{4} x+278.5, & 22 \leq x<32 \\ \frac{3}{2} x+254.5, & 32 \leq x<50 \\ -\frac{3}{2} x+404.5, & 50 \leq x \leq 80\end{cases}
```
where ``x`` is the altitude in kilometers . What is the average speed of sound over the interval ``[0,80]`` ?
"""

# ╔═╡ f5c25849-0337-4dca-98cf-dbbc723499f8

cm"""
$(post_img("https://www.dropbox.com/s/knjbngrqs2r2h1z/ftc2.jpg?raw=1",600))
"""






# ╔═╡ af619399-4655-45a0-847b-60357e53d2a5
cm"""
$(bbl("Exploration",""))
Consider the following function 

```math 
F(x) = \int_a^x f(t) dt
```
where ``f`` is a continuous function on the interval ``[a,b]`` and ``x \in [a,b]``.

"""



# ╔═╡ f64e2917-76fc-4ba8-8a47-d8c4c3654880
cm"""
**Example** 
If ``g(x) = \int_0^x f(t) dt``

$(post_img("https://www.dropbox.com/scl/fi/ozabhnwfju0zskug7quzl/ex_5_3.png?rlkey=zcdt9bn7p9s6dsuvep7y547vk&dl=1"))

Find ``g(2)`` 

"""



# ╔═╡ fb8b488f-f8b4-48e5-9d66-9f3df8919d5d
cm"""
$(bth("The Second Fundamental Theorem of Calculus"))

If ``f`` is continuous on an open interval ``I`` containing ``a``, then, for every ``x`` in the interval,

```math

\frac{d}{dx}\left[\int_a^x f(t) \right] = f(x).
```
"""

# ╔═╡ d6b066d3-0049-4f3d-9acc-55fc16c40adc
cm"""

$(bbl("Remarks",""))
* ``{\large \frac{d}{dx}\left( \int_a^x f(u) du\right) = f(x)}``
* ``g(x)`` is an **antiderivative** of ``f``

"""




# ╔═╡ 14f0a7a7-2264-4170-832e-837a54cd935c
cm"""
$(ex(7))
Evaluate
```math
\frac{d}{dx}\left[\int_0^x \sqrt{1+t} dt\right].
```

$(ex(8))
Evaluate
```math
\frac{d}{dx}\left[\int_{\pi/2}^{x^3} \cos{t} dt\right].
```

$(ex(-8))
Evaluate
```math
\frac{d}{dx}\left[\int_{\sin(x)}^{\cos(x)} \sqrt{1+t} dt\right].
```

"""

# ╔═╡ e6ba3446-cdb3-41c0-8db7-56b63042ddbc
cm"""
__Applications__

**Question:** If ``y=F(x)``, then what does ``F'(x)`` represents?


$(bth("The Net Change Theorem*"))

If ``F'(x)`` is the rate of change of a quantity ``F(x)`` , then the definite integral of ``F'(x)`` from ``a`` to ``b`` gives the total change, or __net change__, of ``F(x)`` on the interval ``[a,b]``.

```math
\int_a^b F'(x) dx = F(b) - F(a) \qquad \color{red}{\textrm{Net change of } F(x)}
```

$(ebl())

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


# ╔═╡ df2a7927-878c-4d11-9e37-9c519672801e

cm"""
$(ex(10,"Solving a Particle Motion Problem"))
A particle is moving along aline. Its velocity function (in ``m/s^2``) is given by
```math
v(t)=t^3-10t^2+29t-20,
```
<ul style="list-style-type: lower-alpha;">

<li> What is the <b>displacement</b> of the particle on the time interval 1≤ t≤ 5?</li>
<li>What is the <b>total distance</b> traveled by the particle on the time interval 1≤ t≤ 5?</li>

</ul>
"""

# ╔═╡ 28d201df-5056-4429-b1ba-a4959e75bc51
begin
    f155(x) = x / sqrt(1 - 4 * x^2)
    # ex1_55=plot(-0.49:0.01:0.49,f155.(-0.49:0.01:0.49), framestyle=:origin)
cm"""
$(bth("Antidifferentiation of a Composite Function"))
Let ``g`` be a function whose range is an interval ``I``, and let ``f`` be a function that is continuous on ``I``. If ``g`` is differentiable on its domain and  ``F`` is an antiderivative of ``f`` on ``I``, then
```math
\int f(g(x))g'(x)dx = F(g(x)) + C.
```
Letting ``u=g(x)`` gives ``du=g'(x)dx`` and
```math
\int f(u) du = F(u) + C.
```
$(ebl())
<div class="img-container">

$(Resource("https://www.dropbox.com/s/uua8vuahfxnp48c/subs_th.jpg?raw=1"))

</div>

$(bbl("Remark","Substitution Rule says:"))
It is permissible to operate with ``dx`` and ``du`` after integral signs as if they were differentials.
$(ebl())

$(ex())
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




# ╔═╡ 1beace3e-3a7e-411b-b6c0-3eca1fbf8536
cm"""
$(bth("The General Power Rule for Integration"))
__Theorem__ *The General Power Rule for Integration*
If ``g`` is a differentiable function of ``x``, then
```math
\int\bigl[g(x)\bigr]^ng'(x) dx = \frac{\bigl[g(x)\bigr]^{n+1}}{n+1} + C, \quad n\neq -1.
```
‍Equivalently, if ``u=g(x)``, then
```math
\int u^n du = \frac{u^{n+1}}{n+1} + C, \quad n\neq -1.
```
‍$(ebl())

$(ex()) Find
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

# ╔═╡ b4279679-50fb-4dfd-9c4e-0e14788e2edd
let
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
    cm""" 
    $(ex())
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




# ╔═╡ 655773ab-44a0-4f6e-95b9-353ea7f694ca
cm"""
$(bth("Integration of even and Odd Function"))

Suppose ``f`` is continuous on **``[-a,a]``**.

* If ``f`` is **even** ``\left[f(-x)=f(x)\right]``, then 
```math
\int_{-a}^a f(x) dx = 2\int_0^a f(x) dx
```

* If ``f`` is **odd** ``\left[f(-x)=-f(x)\right]``, then 
```math
\int_{-a}^a f(x) dx = 0
```
$(ebl())

$(ex())
Find 
```math
\int_{-1}^1 \frac{\tan x}{1+x^2+x^4} dx 
```

"""


# ╔═╡ 253a5368-72ca-4463-9b59-934f45d77a4e
cm"""
$(bth("Log Rule for Integration"))

Let ``u``  be a differentiable function of ``x``.
```math
	\begin{array}{llll}
	\textrm{(i) }& \displaystyle \int \frac{1}{x} dx &=& \ln|x| + C  \\ \\
	\textrm{(ii) }& \displaystyle \int \frac{1}{u} du &=& \ln|u| + C  \\ \\
	\end{array}
```
$(ebl())

$(bbl("Remark",""))
```math
 \displaystyle \int \frac{u'}{u} dx = \ln|u| + C
```
"""


# ╔═╡ d55a4917-e885-42ee-a8db-24f951501c28
cm"""
$(ex(1,"Using the Log Rule for Integration"))
Evaluate ``\displaystyle \int\frac{2}{x}dx``.

$(ex(2,"Using the Log Rule with a Change of Variables"))
Evaluate ``\displaystyle \int\frac{1}{4x-1}dx``.

$(ex(3,"Finding Area with the Log Rule"))
Find the area of the region bounded by the graph of
```math
y = \frac{x}{x^2+1}
```
the ``x``-axis, and the line ``x=3``.
"""



# ╔═╡ e653c7dd-7359-448d-9690-5d4a9780fc70
cm"""
$(ex(4,"Recognizing Quotient Forms of the Log Rule"))
```math
	\begin{array}{llll}
	\textrm{(a) }& \displaystyle \int \frac{3x^2+1}{x^3+x} dx   \\ \\
	\textrm{(b) }& \displaystyle \int \frac{\sec^2x}{\tan x} dx   \\ \\
	\textrm{(c) }& \displaystyle \int \frac{x+1}{x^2+2x} dx   \\ \\
	\textrm{(d) }& \displaystyle \int \frac{1}{3x+2} dx   \\ \\
	\end{array}
```
"""

# ╔═╡ a5b5ae97-b4af-435e-a3fb-5a23edf8b0c9
cm"""
$(ex(5,"Using Long Division Before Integrating"))
Find the indefinite integral.
```math
\displaystyle \int \frac{x^2+x+1}{x^2+1} dx  
```
$(ex(6,"Change of Variables with the Log Rule"))
Find the indefinite integral.
```math
\displaystyle \int \frac{2x}{(x+1)^2} dx  
```

"""

# ╔═╡ eccd97c8-15b5-47ff-92ef-7e87a054c4ef
cm"""
$(ex(7,"u-Substitution and the Log Rule"))
Solve the differential equation
```math
\frac{dy}{dx}=\frac{1}{x\ln x}
```
"""

# ╔═╡ 01c13365-f758-47c4-9b96-b9f2616b3824
let 
	t = md"## Integrals of Trigonometric Functions"



cm"""
$(t)

$(ex(8,"Using a trigonometric Identity"))
```math
\int \tan x dx, \quad \int \sec x dx
```

"""
end


# ╔═╡ 017d38da-5825-4966-8d89-c75ce0b2af11
cm"""
$(bbl("INTEGRALS OF THE SIX BASIC TRIGONOMETRIC FUNCTIONS",""))

```math
	\begin{array}{llll}
	\displaystyle \int \sin u du &=& -\cos u + C &\qquad&  \displaystyle \int \cos u du &=& \sin u + C \\ \\

	\displaystyle \int \tan u du &=& -\ln|\cos u| + C &\qquad&  \displaystyle \int \cot u du &=& \ln|\sin u| + C \\ \\


	\displaystyle \int \sec u du &=& \ln|\sec u +\tan u| + C &\qquad&  \displaystyle \int \csc u du &=& -\ln|\csc u +\cot u| + C \\ \\
	\end{array}
```

"""

# ╔═╡ 85c79ec8-6c95-4c76-9851-a4a0b7ec76d7
cm"""
$(ex(10,"Integrating trigonometric Functions"))
Evaluate ``\displaystyle \int_{0}^{\pi/4}\sqrt{1+\tan^2 x}dx``

$(ex(11,"Finding an Average Value"))
Find the average value of
```math
f(x)=\tan x
```
on the interval ``[0, \frac{\pi}{4}]``.



"""

# ╔═╡ 238beb06-9d2e-4d15-8eb4-3660aced7ef7
cm"""
$(bth(" Integrals Involving Inverse Trigonometric functions"))

Let ``u`` be a differential function of ``x``, and let ``a>0``.
```math
\begin{array}{lllll}
\textrm{1.} & \displaystyle \int\frac{du}{\sqrt{a^2-u^2}} &=&\arcsin\frac{u}{a} + C \\ \\

\textrm{2.} & \displaystyle \int\frac{du}{a^2+u^2} &=&\frac{1}{a}\arctan\frac{u}{a} + C \\ \\

\textrm{3.} & \displaystyle \int\frac{du}{u\sqrt{u^2-a^2}} &=&\frac{1}{a}\text{arcsec}\frac{|u|}{a} + C \\ \\
\end{array}
```
$(ebl())

$(ex("Examples","Integration with Inverse Trigonometric functions"))
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



# ╔═╡ 463027a3-7319-43ef-85be-cb8abe5a1d28
cm"""
#
$(ex(4,"Completing the Square"))
Find
```math
\int\frac{dx}{x^2-4x+7}.
```

$(ex(5,"Completing the Square"))
Find the area of the region bounded by the graph of
```math
f(x) = \frac{1}{\sqrt{3x-x^2}}
```
the ``x``-axis, and the lines ``x=\frac{3}{2}`` and ``x=\frac{9}{4}``.
"""






# ╔═╡ daf5a008-b102-4557-8a18-d83839316eba

cm"""
$(bbl("Hyperbolic Identities",""))
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



# ╔═╡ 13f007b1-b509-40b2-8ad4-ab50588957b0

cm"""
$(bth("Differentiation and Integration of Hyperbolic Functions"))
Let ``u`` be a differentiable function of ``x``.
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

# ╔═╡ 9c8d6eeb-9d3c-4525-87e3-c540c3a5d38d
cm"""
$(ex(1,"Differentiation of Hyperbolic Functions"))
- (a.) ``\frac{d}{d x}\left[\sinh \left(x^2-3\right)\right]=2 x \cosh \left(x^2-3\right)``
- (b.) ``\frac{d}{d x}[\ln (\cosh x)]=\frac{\sinh x}{\cosh x}=\tanh x``
- (c.) ``\frac{d}{d x}[x \sinh x-\cosh x]=x \cosh x+\sinh x-\sinh x=x \cosh x``
- (d.) ``\frac{d}{d x}[(x-1) \cosh x-\sinh x]=(x-1) \sinh x+\cosh x-\cosh x=(x-1) \sinh x``

$(ex(2,"Finding Relative Extrema"))
Find the relative extrema of
```math
f(x) = (x-1)\cosh x \; -\; \sinh x.
```

$(ex(4,"Integrating a Hyperbolic Function"))
Find
```math
\displaystyle \int_{5/3}^2 \text{csch}(3x-4)\coth(3x-4) dx
```
"""

# ╔═╡ cf16ce47-f360-451b-afae-b1fe8b559fc3
cm"""
$(bth("Inverse Hyperbolic Functions"))
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

# ╔═╡ 004ab021-15d7-40d8-ace7-41dd5f8b2237
cm"""

$(bbl("Remark",""))
- Area = ``y_{top}-y_{bottom}``.
$(ebl())

$(ex(1,"Finding the area of a region Between Two Curves"))

Find the area of the region bounded above by ``y=e^x``, bounded below by ``y=x``, bounded on the sides by ``x=0`` and ``x=1``.

"""

# ╔═╡ ac6fde80-be6b-4292-911a-b51c43de3199
cm"""
$(ex(2,"a region Lying Between Two Intersecting Graphs"))
Find the area of the region enclosed by the parabolas ``y=x^2`` and ``y=2x-x^2``.

*Solution in class*

---
"""

# ╔═╡ 57d8a03b-71a0-46d9-b908-af7028195db2
cm"""
$(ex(3,"A Region Lying Between Two Intersecting Graphs"))

Find the area of the region bounded by the curves 

```math 
y=\cos(x), \;\; y=\sin(2x), \;\; x=0, \;\; x=\frac{\pi}{2}
```


---
"""

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

# ╔═╡ e18ee243-b49e-401f-bda2-2bb8b0ea3a66
md"""
**Example 6** Figure below shows a solid with a circular base of radius ``1``. Parallel cross-sections perpendicular to the base are equilateral triangles. Find the volume of the solid.
$(post_img("https://www.dropbox.com/s/bbxedang718jvvp/img4.png?dl=1"))
"""

# ╔═╡ 19358efb-0bb3-4781-be0c-c07b4bc963f7
cm"""
$(bbl("Problem",""))
Find the volume of the solid generated by rotating the region bounded by ``y=2x^2-x^3`` and ``y=0`` about the ``y-``axis.

"""

# ╔═╡ cf309f63-2534-45f6-98b4-7bc90100493c
begin 
	
	md"""
	A shell is a hallow circular cylinder
	
	$(post_img("https://www.dropbox.com/s/8a2njc50e2hptok/shell.png?dl=1"))
	"""
end

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

# ╔═╡ 36f63f82-142f-4468-a6ed-7781472d94d7
cm"""
$(ex(6,"The Area of a Surface of Revolution")) Find the area of the surface formed by revolving the graph of ``f(x)=x^3`` on the interval ``[0,1]`` about the ``x``-axis.


$(ex(7,"The Area of a Surface of Revolution"))
Find the area of the surface formed by revolving the graph of ``f(x)=x^2`` on the interval ``[0,\sqrt{2}]`` about the ``y``-axis.
"""

# ╔═╡ 200f43c8-fd32-438e-9582-a995a4026086
cm"""
$(ex())
Find 
```math
\int \frac{1}{1+e^x} dx.
```
"""

# ╔═╡ 7588b15a-3b1e-4232-96e6-45e254c10362
cm"""
$(bth("Integration by Parts"))
If ``u`` and ``v`` are functions of ``x`` and have continuous derivatives, then
```math
\int u d v=u v-\int v d u
```
"""

# ╔═╡ 3888f083-86e2-4edb-a700-62028ad295b4
cm"""
$(ex(1,"Integration by Parts"))
Find ``\int x e^x d x``.
"""

# ╔═╡ 7d50c4c7-e6f0-43b7-8583-7b47cbcc2156
cm"""
$(ex(2,"Integration by Parts"))
Find ``\displaystyle\int x^2 \ln x d x``.
"""

# ╔═╡ 9a0bbdd2-c9fe-4932-94f3-3727baa6b9a6
cm"""
$(ex(3,"An Integrand with a Single Term"))
Find ``\displaystyle\int \sin^{-1}x d x``.
"""

# ╔═╡ 5c4497e8-e02d-4265-ba7c-aa607231ee6d
cm"""
$(ex(4,"Repeated Use of Integration by Parts"))
Find ``\displaystyle\int x^2\sin x d x``.
"""

# ╔═╡ fa99131e-13b2-4f4a-a752-4afd26b6596c
cm"""
$(ex(5,"Integration by Parts"))
Find ``\displaystyle\int \sec^3 x d x``.
"""

# ╔═╡ a856ee7d-a0d9-4d4b-aa13-449a827a954d
cm"""
$(ex(7,"Using the tabular method"))
Find ``\displaystyle\int x^2\sin4 x d x``.
"""

# ╔═╡ 2ada5eca-3ab9-444b-8350-153cf62abd3b
cm"""
$(bbl("GUIDELINES FOR EVALUATING INTEGRALS INVOLVING POWERS OF SINE AND COSINE"))
1. When the power of the sine is odd and positive, save one sine factor and convert the remaining factors to cosines. Then expand and integrate.
```math
\int \sin ^{2 k+1} x \cos ^n x d x=\int \overbrace{\left(\sin ^2 x\right)^k}^{\text {Odd }} \cos ^n x \overbrace{\sin x d x}^{\text {Convert to cosines }}=\int\left(1-\cos ^2 x\right)^k \cos ^n x \sin x d x
```
2. When the power of the cosine is odd and positive, save one cosine factor and convert the remaining factors to sines. Then expand and integrate.
```math
\int \sin ^m x \cos ^{2 k+1} x d x=\int\left(\sin ^m x\right) \overbrace{\left(\cos ^2 x\right)^k}^{\text {Odd }} \overbrace{\cos x d x}^{\text {Convert to sines }}=\int\left(\sin ^m x\right)\left(1-\sin ^2 x\right)^k \cos x d x
```
3. When the powers of both the sine and cosine are even and nonnegative, make repeated use of the formulas
```math
\sin ^2 x=\frac{1-\cos 2 x}{2} \text { and } \cos ^2 x=\frac{1+\cos 2 x}{2}
```
to convert the integrand to odd powers of the cosine. Then proceed as in the second guideline.
"""

# ╔═╡ c2941250-feac-4855-97d5-f88c35ed689a
cm"""
$(ex(1,"Power of Sine Is Odd and Positive"))
Find ``\int \sin ^3 x \cos ^4 x d x``.
"""

# ╔═╡ e40ba504-6b6c-4abc-81c8-67db621b90de
cm"""
$(ex(2,"Power of Cosine Is Odd and Positive"))
Evaluate 
```math
\int_{\pi / 6}^{\pi / 3} \frac{\cos ^3 x}{\sqrt{\sin x}} d x.
```
"""

# ╔═╡ cdd3a632-1020-4df5-b4cf-00a10b6fd255
cm"""
$(ex(3,"Power of Cosine Is Even and Nonnegative"))
Find ``\displaystyle \int \cos ^4 x d x``.
"""

# ╔═╡ e5c79a58-bd0e-4490-bfee-9cf7938472ff
cm"""
$(bbl("Wallis's Formulas",""))
1. If ``n`` is odd ( ``n \geq 3`` ), then
```math
\int_0^{\pi / 2} \cos ^n x d x=\left(\frac{2}{3}\right)\left(\frac{4}{5}\right)\left(\frac{6}{7}\right) \cdots\left(\frac{n-1}{n}\right)
```
2. If ``n`` is even ( ``n \geq 2`` ), then
```math
\int_0^{\pi / 2} \cos ^n x d x=\left(\frac{1}{2}\right)\left(\frac{3}{4}\right)\left(\frac{5}{6}\right) \cdots\left(\frac{n-1}{n}\right)\left(\frac{\pi}{2}\right)
```
"""

# ╔═╡ b7c18135-6b5a-4ca6-8169-9643f0815b3b
cm"""
$(ex(4,"Power of Tangent Is Odd and Positive"))
Find ``\int \frac{\tan ^3 x}{\sqrt{\sec x}} d x``.

"""

# ╔═╡ b27f07f2-881c-42f0-8d9d-c49c4c54b780
cm"""
$(ex(5,"Power of Secant Is Even and Positive"))
Find 
```math
\int \sec ^4 3 x \tan ^3 3 x d x
```
"""

# ╔═╡ 95099f5d-61ee-44ca-8d51-b01446f29649
cm"""
$(ex(6,"Power of Tangent Is Even"))
Evaluate 
```math
\int_0^{\pi / 4} \tan ^4 x d x
```
"""

# ╔═╡ db377636-d9b6-4742-bf42-050a31860ad2
cm"""
$(ex(7,"Converting to Sines and Cosines"))
Find 
```math
\int \frac{\sec x}{\tan ^2 x} d x.
```
"""

# ╔═╡ d808a001-48ea-4eaa-9501-27d486133480
cm"""
$(ex(8,"Using a Product-to-Sum Formula"))
Find 
```math
\int \sin 5 x \cos 4 x d x
```
"""

# ╔═╡ a533908e-9bb0-4cf5-984f-51a5f099db8f
cm"""
$(bbl("Trigonometric Substitution"," (``a>0``) "))
1. For integrals involving ``\sqrt{a^2-u^2}``, let
```math
u=a \sin \theta
```

Then ``\sqrt{a^2-u^2}=a \cos \theta``, where
```math
-\pi / 2 \leq \theta \leq \pi / 2
```
2. For integrals involving ``\sqrt{a^2+u^2}``, let
```math
u=a \tan \theta
```

Then ``\sqrt{a^2+u^2}=a \sec \theta``, where
```math
-\pi / 2<\theta<\pi / 2
```
3. For integrals involving ``\sqrt{u^2-a^2}``, let ``u=a \sec \theta``.
```math
\sqrt{u^2-a^2}=\left\{\begin{array}{l}
a \tan \theta \text { for } u>a, \text { where } 0 \leq \theta<\pi / 2 \\
-a \tan \theta \text { for } u<-a, \text { where } \pi / 2<\theta \leq \pi .
\end{array}\right.
```
"""

# ╔═╡ 22e8b5e8-8343-4e74-9f28-4b268e3157af
cm"""
$(ex(1,"Trigonometric Substitution: u=a sinθ "))
Find 
```math
\int \frac{d x}{x^2 \sqrt{9-x^2}}.
```
"""

# ╔═╡ 11ebe671-ede6-438d-a896-45eca3beb94c
cm"""
$(ex(2,"Trigonometric Substitution: u=a tanθ "))
Find 
```math
\int \frac{d x}{\sqrt{4x^2+1}}.
```
"""

# ╔═╡ c08feccc-e1aa-4a23-a42e-798dfe4278eb
cm"""
$(ex(3,"Trigonometric Substitution: Rational Powers"))
Find 
```math
\int \frac{d x}{\left(x^2+1\right)^{3 / 2}}.
```
"""

# ╔═╡ f943eff3-357b-4a33-a272-fdf3a7d80a5f
cm"""
$(ex(4,"Converting the Limits of Integration"))
Evaluate 
```math
\int_{\sqrt{3}}^2 \frac{\sqrt{x^2-3}}{x} d x
```
"""

# ╔═╡ da070497-1db3-4250-8d45-128daf2ff54f
cm"""
$(ex(5,"Finding Arc Length"))
Find the arc length of the graph of ``f(x)=\frac{1}{2} x^2`` from ``x=0`` to ``x=1`` 
"""

# ╔═╡ 4ebfeece-3528-43e0-a70f-9e901b28b930
cm"""

$(bbl("Decomposition of 𝐍(x)/ 𝐃(x) into Partial Fractions"))
1. Divide when improper: When ``N(x) / D(x)`` is an improper fraction (that is, when the degree of the numerator is greater than or equal to the degree of the denominator), divide the denominator into the numerator to obtain
```math
\frac{N(x)}{D(x)}=(\text { a polynomial })+\frac{N_1(x)}{D(x)}
```
where the degree of ``N_1(x)`` is less than the degree of ``D(x)``. Then apply Steps 2, 3, and 4 to the proper rational expression ``N_1(x) / D(x)``.
2. Factor denominator: Completely factor the denominator into factors of the form
```math
(p x+q)^m \text { and }\left(a x^2+b x+c\right)^n
```
where ``a x^2+b x+c`` is irreducible.
3. Linear factors: For each factor of the form ``(p x+q)^m``, the partial fraction decomposition must include the following sum of ``m`` fractions.
```math
\frac{A_1}{(p x+q)}+\frac{A_2}{(p x+q)^2}+\cdots+\frac{A_m}{(p x+q)^m}
```
4. Quadratic factors: For each factor of the form ``\left(a x^2+b x+c\right)^n``, the partial fraction decomposition must include the following sum of ``n`` fractions.
```math
\frac{B_1 x+C_1}{a x^2+b x+c}+\frac{B_2 x+C_2}{\left(a x^2+b x+c\right)^2}+\cdots+\frac{B_n x+C_n}{\left(a x^2+b x+c\right)^n}
```
"""

# ╔═╡ 3de417dd-e670-4e28-bb27-88abe5476f84
cm"""
$(ex(1,"Distinct Linear Factors"))
Write the partial fraction decomposition for 
```math
 \frac{1}{x^2-5x+6}
```
"""

# ╔═╡ 7daad386-47a2-44d7-9af8-743d5712cec0
cm"""
$(ex(3,"Distinct Linear and Quadratic Factors"))

Find
```math
\int  \frac{2x^3-4x-8}{(x^2-x)(x^2+4)}dx.

```
"""

# ╔═╡ 98e43437-09c0-4b5d-b5b2-cb38d3d1ca20
cm"""
$(ex(4," Repeated Quadratic Factors"))
```math
\int  \frac{8x^3+13x}{(x^2+2)^2}dx. 
```

"""

# ╔═╡ 16f26878-cbe0-4ac1-a593-691a2fe55aca
cm"""
$(ex(2,"Repeated Linear Factors"))
Find
```math
\int  \frac{5x^2+20x+6}{x^3+2x^2+x}dx.
```
"""

# ╔═╡ 0cef9fcd-3734-4694-ad23-ca1465d1f96e
cm"""
$(bbl("Substitution for Rational Functions of Sine and Cosine",""))

For integrals involving rational functions of sine and cosine, the substitution
```math
u=\frac{\sin x}{1+\cos x}=\tan \frac{x}{2}
```
yields
```math
\cos x=\frac{1-u^2}{1+u^2}, \quad \sin x=\frac{2 u}{1+u^2}, \quad \text { and } \quad d x=\frac{2 d u}{1+u^2}
```

"""

# ╔═╡ 98f709cb-cccf-42a7-af35-e026f7369bb8
cm"""
$(ex())
Find
```math
\begin{array}{lll}
\text{(1)} & \displaystyle\int \frac{dx}{3\sin x - 4 \cos x}. \\
\text{(2)} & \displaystyle\int_0^{\pi\over 2} \frac{\sin 2x \;dx}{2+\cos x}. \\
\end{array}
```

"""

# ╔═╡ c2ded1c8-a0a7-48cb-bf1d-7616796a5062
cm"""
$(define("Improper Integrals with Infinite Integration Limits"))

**(a)** If ``\int_a^t f(x) dx`` exists for every number ``t\ge a``, then
```math
\int_a^{\infty} f(x) dx = \lim_{t\to \infty} \int_a^t f(x) dx
```
provided this limit exists (as a finite number).


**(b)** If ``\int_t^b f(x) dx`` exists for every number ``t\le b``, then
```math
\int_{-\infty}^b f(x) dx = \lim_{t\to -\infty} \int_t^b f(x) dx
```
provided this limit exists (as a finite number).

The improper integrals ``\int_a^{\infty} f(x) dx`` and ``\int_{-\infty}^b f(x) dx`` are called *__convergent__* if the corresponding limit exists and *__divergent__* if the limit does not exist.

**(c)** If both ``\int_a^{\infty} f(x) dx`` and ``\int_{-\infty}^b f(x) dx`` are convergent, then we define
```math
\int_{-\infty}^{\infty} f(x) dx =  \int_{-\infty}^a f(x) dx +\int_a^{\infty} f(x) dx
```

In part (c) any real number  can be used
"""

# ╔═╡ 963f8130-c7f7-4b57-8bac-64c92b46c53a
cm"""
$(ex(1,"An Improper Integral That Diverge"))

Evaluate ``\displaystyle \int_1^{\infty} \frac{1}{x} dx``.

$(ex(2,"An Improper Integrals That Converge"))

Evaluate each improper integral
- (a) ``\displaystyle\int_{0}^{\infty} e^{-x} dx.``
- (b) ``\displaystyle\int_{0}^{\infty} \frac{1}{1+x^2} dx``.


"""

# ╔═╡ 4098c133-f9d4-4198-a39b-f8fa93bf0774
cm"""
$(ex(3,"Using L’Hôpital’s Rule with an Improper Integra"))

Evaluate
```math
\int_1^{\infty} (1 − x)e^{−x} dx.
"""

# ╔═╡ 71c6a056-c512-4f00-8195-a6de36bc98c8
cm"""
$(ex(4,"Infinite Upper and Lower Limits of Integration"))

Evaluate
```math
\int_{-\infty}^{\infty} \frac{e^x}{1+e^{2x}} dx
```
"""

# ╔═╡ f7b555c6-5844-4971-8693-a8ada5074b20
cm"""
$(define("Improper Integrals with Infinite Discontinuities"))
1. If ``f`` is continuous on the interval ``[a, b)`` and has an infinite discontinuity at ``b``, then
```math
\int_a^b f(x) d x=\lim _{c \rightarrow b^{-}} \int_a^c f(x) d x
```
2. If ``f`` is continuous on the interval ``(a, b]`` and has an infinite discontinuity at ``a``, then
```math
\int_a^b f(x) d x=\lim _{c \rightarrow a^{+}} \int_c^b f(x) d x
```
3. If ``f`` is continuous on the interval ``[a, b]``, except for some ``c`` in ``(a, b)`` at which ``f`` has an infinite discontinuity, then
```math
\int_a^b f(x) d x=\int_a^c f(x) d x+\int_c^b f(x) d x
```

In the first two cases, the improper integral __converges__ when the limit existsotherwise, the improper integral __diverges__. In the third case, the improper integral on the left diverges when either of the improper integrals on the right diverges.
"""

# ╔═╡ dd990994-e154-4d4e-bca7-7fce46fb193b
cm"""
$(ex(6,"An Improper Integral with an Infinite Discontinuity"))

Evaluate 
```math
\int_0^1 \frac{d x}{\sqrt[3]{x}}
```
"""

# ╔═╡ aa08f4c7-f3f3-4dc1-874f-e59e50d62e89
cm"""
$(ex(8,"An Improper Integral with an Interior Discontinuity"))

Evaluate 
```math
\int_{-1}^2 \frac{d x}{x^3}
```
"""

# ╔═╡ 724736c2-d020-444c-ac64-8c35fb5aed5a
cm"""
$(ex(9,"A Doubly Improper Integral"))

Evaluate 
```math
\int_0^{\infty} \frac{d x}{\sqrt{x}(x+1)}
```
"""

# ╔═╡ b7b3ab16-92e7-4e52-ae8f-42675eb8ade1
cm"""
$(ex(7,"An Improper Integral That Diverges"))

Evaluate 
```math
\int_0^2 \frac{d x}{x^3}
```
"""

# ╔═╡ c5e81c70-28ae-409b-bb4b-41418fc62fab
cm"""
$(ex(10,"An Application Involving Arc Length"))

Use the formula for arc length to show that the circumference of the circle ``x^2+y^2=1`` is ``2 \pi``.
"""

# ╔═╡ d656cb73-ab16-4d06-80c3-2432fe752c59
cm"""
$(bth("A Special Type of Improper Integral"))
```math
\int_1^{\infty} \frac{1}{x^p}dx \quad =\begin{cases}\frac{1}{p-1},&\quad & p>1\\
\text{diverses,}&\quad&p<=1\end{cases}.
```

"""

# ╔═╡ 0183ce38-0911-49ff-a120-ed8ba21fdda3
cm"""
$(ex(11,"An Application Involving a Solid of Revolution"))
The solid formed by revolving (about the ``x``-axis) the unbounded region lying between the graph of ``f(x)=1 / x`` and the ``x``-axis ``(x \geq 1)`` is called Gabriel's Horn. Show that this solid has a finite volume and an infinite surface area.
"""

# ╔═╡ 25157d2c-d719-438e-b4c4-6fa7d9787820
cm"""
$(ex(1,"Writing the Terms of a Sequence"))
1.  ``\{a_n\}=\{3+(−1)^n\}_{n\geq 1}`` 
2.  ``\{b_n\}=\displaystyle\left\{\frac{n}{1-2n}\right\}`` 
3.  ``\{c_n\}=\displaystyle\left\{\frac{n^2}{2^n-1}\right\}`` 
4.  The terms of the __recursively defined__ sequence ``\{d_n\}``, where ``d_1=25`` and ``d_{n+1}=d_n−5``.

"""

# ╔═╡ 5c65c8e6-f08f-42ce-81dd-f80638cbf7b4
cm"""
$(define("the Limit of a Sequence"))
Let ``L`` be a real number. The limit of a sequence ``\left\{a_n\right\}`` is ``L``, written as
```math
\lim _{n \rightarrow \infty} a_n=L
```
if for each ``\varepsilon>0``, there exists ``M>0`` such that ``\left|a_n-L\right|<\varepsilon`` whenever ``n>M``. If the limit ``L`` of a sequence exists, then the sequence converges to ``L``. If the limit of a sequence does not exist, then the sequence diverges.
$(ebl())

$(post_img("https://www.dropbox.com/scl/fi/c536ibwk7eycy0v2lb0rj/fig_9_1.png?rlkey=22y9oi2iy52z82iehh59pf0gs&dl=1",500))
"""

# ╔═╡ 9b9a82cc-a3c1-448f-9cb8-375e8dbd59ea
cm"""
$(bth("Limit of a Sequence"))
Let ``L`` be a real number. Let ``f`` be a function of a real variable such that
```math
\lim _{x \rightarrow \infty} f(x)=L
```

If ``\left\{a_n\right\}`` is a sequence such that ``f(n)=a_n`` for every positive integer ``n``, then
```math
\lim _{n \rightarrow \infty} a_n=L
```
"""

# ╔═╡ 3c9ab8ae-dda1-45eb-a635-92acf6e2f10b
cm"""
$(ex(2,"Finding the Limit of a Sequence"))
Find the limit of the sequence whose ``n``th term is ``a_n=\left(1+\frac{1}{n}\right)^n``.
"""

# ╔═╡ ff84cfbf-d387-4bde-b9d3-407b88e1bf30
cm"""
$(bth("Properties of Limits of Sequences"))
Let ``\lim _{n \rightarrow \infty} a_n=L`` and ``\lim _{n \rightarrow \infty} b_n=K``.
1. Scalar multiple: ``\lim _{n \rightarrow \infty}\left(c a_n\right)=c L, c`` is any real number.
2. Sum or difference: ``\lim _{n \rightarrow \infty}\left(a_n \pm b_n\right)=L \pm K``
3. Product: ``\lim _{n \rightarrow \infty}\left(a_n b_n\right)=L K``
4. Quotient: ``\lim _{n \rightarrow \infty} \frac{a_n}{b_n}=\frac{L}{K}, b_n \neq 0`` and ``K \neq 0``

"""

# ╔═╡ 9a594bd8-68f7-4f6a-8dd6-3c70780f098d
cm"""
$(ex(3,"Determining Convergence or Divergence"))
1.  ``\{a_n\}=\{3+(−1)^n\}`` 
2.  ``\{b_n\}=\displaystyle\left\{\frac{n}{1-2n}\right\}``
"""

# ╔═╡ ef95cecf-00fe-429b-b94e-50f2de8a16bb
cm"""
$(ex(4,"Using L'Hôpital's Rule to Determine Convergence"))
Show that the sequence whose ``n``th term is ``a_n=\frac{n^2}{2^n-1}`` converges.
"""

# ╔═╡ e62d5f92-8ad6-4317-ab62-771b96f0c3f9
cm"""
$(bth("Squeeze Theorem for Sequences"))
If ``\lim _{n \rightarrow \infty} a_n=L=\lim _{n \rightarrow \infty} b_n`` and there exists an integer ``N`` such that ``a_n \leq c_n \leq b_n`` for all ``n>N``, then ``\lim _{n \rightarrow \infty} c_n=L``.

"""

# ╔═╡ 63dbebd7-85d2-42fd-b09a-f0d9c1ce640f
cm"""
$(ex(5,"Using the Squeeze Theorem"))
Show that the sequence ``\left\{c_n\right\}=\left\{(-1)^n \frac{1}{n!}\right\}`` converges, and find its limit.
"""

# ╔═╡ 664c41b1-6459-4dfc-9999-5b2acad3301c
cm"""
$(bbl("Remark",""))
In fact, it can be shown that for any fixed number ``k``, 
```math
\lim _{n \rightarrow \infty}\left(k^n / n!\right)=0.
```
- This means that the factorial function grows faster than any exponential function.
"""

# ╔═╡ aa6664e3-5081-4c48-8754-e65ba7263f46
cm"""
$(bth("Absolute Value Theorem"))
For the sequence ``\left\{a_n\right\}``, if
```math
\lim _{n \rightarrow \infty}\left|a_n\right|=0 \text { then } \lim _{n \rightarrow \infty} a_n=0
```
"""

# ╔═╡ 7bafde52-30ed-41f9-9522-02b3c9b7316a
cm"""
$(ex(6,"Finding the <i>nth</i> Term of a Sequence"))
Find a sequence ``\left\{a_n\right\}`` whose first five terms are
```math
\frac{2}{1}, \frac{4}{3}, \frac{8}{5}, \frac{16}{7}, \frac{32}{9}, \ldots
```
and then determine whether the sequence you have chosen converges or diverges.
"""

# ╔═╡ d3729415-161a-41f0-ad07-120944323d9f
cm"""
$(ex(7,"Finding the nth Term of a Sequence"))
Determine the ``n``th term for a sequence whose first five terms are
```math
-\frac{2}{1}, \frac{8}{2},-\frac{26}{6}, \frac{80}{24},-\frac{242}{120}, \ldots
```
and then decide whether the sequence converges or diverges.
"""

# ╔═╡ 471eba70-40bf-42f9-a476-b13f37ccf823
cm"""
$(define("Monotonic Sequence"))
A sequence ``\left\{a_n\right\}`` is monotonic when its terms are nondecreasing
```math
a_1 \leq a_2 \leq a_3 \leq \cdots \leq a_n \leq \cdots
```
or when its terms are nonincreasing
```math
a_1 \geq a_2 \geq a_3 \geq \cdots \geq a_n \geq \cdots
```

"""

# ╔═╡ 6c261c5d-d478-4750-ac04-bb36734a6fe1
cm"""
$(ex(8,"
Determining Whether a Sequence Is Monotonic"))
Determine whether each sequence having the given ``n``th term is monotonic.
- a. ``a_n=3+(-1)^n``
- b. ``b_n=\frac{2 n}{1+n}``
- c. ``c_n=\frac{n^2}{2^n-1}``
"""

# ╔═╡ 18d5f404-685e-4781-8edf-ac7374c55526
cm"""
$(define("Bounded Sequence"))
1. A sequence ``\left\{a_n\right\}`` is bounded above when there is a real number ``M`` such that ``a_n \leq M`` for all ``n``. The number ``M`` is called an upper bound of the sequence.
2. A sequence ``\left\{a_n\right\}`` is bounded below when there is a real number ``N`` such that ``N \leq a_n`` for all ``n``. The number ``N`` is called a lower bound of the sequence.
3. A sequence ``\left\{a_n\right\}`` is bounded when it is bounded above and bounded below.
"""

# ╔═╡ 7c50563b-0f12-4974-9acf-598247793200
cm"""
$(bth("Bounded Monotonic Sequences"))
If a sequence ``\left\{a_n\right\}`` is bounded and monotonic, then it converges.
"""


# ╔═╡ dbc02f9a-5bc9-478e-8de1-767fd64faaec
cm"""
$(ex(9,"
Bounded and Monotonic Sequences"))
- a. The sequence ``\left\{a_n\right\}=\{1 / n\}`` is both bounded and monotonic. So, by Theorem above , it must converge.
- b. The divergent sequence ``\left\{b_n\right\}=\left\{n^2 /(n+1)\right\}`` is monotonic but not bounded. (It is bounded below.)
- c. The divergent sequence ``\left\{c_n\right\}=\left\{(-1)^n\right\}`` is bounded but not monotonic.
"""

# ╔═╡ 137be6c2-5b86-4e1d-b457-b4f71646e633
cm"""
$(define("Convergent and Divergent Series"))
For the infinite series ``\sum_{n=1}^{\infty} a_n``, the ``\boldsymbol{n}`` th partial sum is
```math
S_n=a_1+a_2+\cdots+a_n .
```

If the sequence of partial sums ``\left\{S_n\right\}`` converges to ``S``, then the series ``\sum_{n=1}^{\infty} a_n`` converges. The limit ``S`` is called the sum of the series.
```math
S=a_1+a_2+\cdots+a_n+\cdots \quad \color{red}{S=\sum_{n=1}^{\infty} a_n}
```

If ``\left\{S_n\right\}`` diverges, then the series diverges.
"""

# ╔═╡ 7eeff659-9f83-47eb-8f96-6fac093f0e64
cm"""
$(ex(1,"Convergent and Divergent Series"))
1. ``\displaystyle \sum_{n=1}^{\infty}\frac{1}{2^n}``
1. ``\displaystyle \sum_{n=1}^{\infty}\left(\frac{1}{n}-\frac{1}{n+1}\right)`` ``\qquad \quad \color{red}{\text{telescoping series}}``
1. ``\displaystyle \sum_{n=1}^{\infty} 1``

"""

# ╔═╡ 71e4523b-b68c-49cb-8877-ff819c4a13e9
cm"""
$(ex(2,"Writing a Series in telescoping Form"))
 Find the sum of the series  ``\displaystyle \sum_{n=1}^{\infty} \frac{2}{4n^2-1}``
"""

# ╔═╡ 125169d6-bfd0-443f-87aa-a7117f481088
cm"""
Geometric Series
The series in Example 1(a) is a __geometric series__. In general, the series
```math
\sum_{n=0}^{\infty} a r^n=a+a r+a r^2+\cdots+a r^n+\cdots, a \neq 0
```

is a __geometric series__ with ratio ``r, r \neq 0``.

$(bth("Convergence of a Geometric Series"))
A geometric series with ratio ``r`` diverges when ``|r| \geq 1``. If ``|r|<1``, then the series converges to the sum
```math
\sum_{n=0}^{\infty} a r^n=\frac{a}{1-r}, \quad|r|<1
```
"""

# ╔═╡ 4202e249-ca1c-4b00-a482-8fe15a6064ed
cm"""
$(ex(3,"Convergent and Divergent Geometric Series"))
- (a) ``\displaystyle \sum_{n=0}^{\infty}\frac{3}{2^n}``
- (b) ``\displaystyle \sum_{n=0}^{\infty}\left(\frac{3}{2}\right)^n``
"""

# ╔═╡ d5965014-2e70-4023-80ef-526f28a0334f
cm"""
$(ex(4,"A Geometric Series for a Repeating Decimal"))
Use a geometric series to write ``0.08`` as the ratio of two integers.
"""

# ╔═╡ 27a7a6b4-6462-410d-a26a-ffd384efe461
cm"""
$(bth("Properties of Infinite Series"))
Let ``\sum a_n`` and ``\sum b_n`` be convergent series, and let ``A, B``, and ``c`` be real numbers. If ``\sum a_n=A`` and ``\sum b_n=B``, then the following series converge to the indicated sums.
1. ``\displaystyle\sum_{n=1}^{\infty} c a_n=c A``
2. ``\displaystyle\sum_{n=1}^{\infty}\left(a_n+b_n\right)=A+B``
3. ``\displaystyle\sum_{n=1}^{\infty}\left(a_n-b_n\right)=A-B``
$(ebl())
## nth-Term Test for Divergence

$(bth("Limit of the nth Term of a Convergent Series"))
If ``\sum_{n=1}^{\infty} a_n`` converges, then ``\lim _{n \rightarrow \infty} a_n=0``.
"""

# ╔═╡ 7b3cf490-87d4-4294-95af-f6e6deee043d
cm"""
$(bth("nth-Term Test for Divergence"))
If ``\lim _{n \rightarrow \infty} a_n \neq 0`` then ``\sum_{n=1}^{\infty} a_n`` diverges.
"""

# ╔═╡ c69ecdb4-a312-45bc-874d-85d4d3747f77
cm"""
$(ex(5,"Using the nth-term test for Divergence"))
1. ``\displaystyle\sum_{n=0}^{\infty} 2^n``
1. ``\displaystyle\sum_{n=0}^{\infty} \frac{n!}{2n!+1}``
1. ``\displaystyle\sum_{n=0}^{\infty} \frac{1}{n}``

"""

# ╔═╡ 8c2447b3-c26e-47e1-8701-7e4a18ae92a8
cm"""
$(ex(6," Bouncing Ball Problem"))
A ball is dropped from a height of 6 feet and begins bouncing
The height of each bounce is three-fourths the height of the previous bounce. Find the  total vertical distance traveled by the ball.
"""

# ╔═╡ 3a4b2178-47ee-474e-bbaf-72c00b3d3c2d
cm"""
$(bth("The Integral Test"))
If ``f`` is positive, continuous, and decreasing for ``x \geq 1`` and ``a_n=f(n)``, then
```math
\sum_{n=1}^{\infty} a_n \text { and } \int_1^{\infty} f(x) d x
```
either both converge or both diverge.
"""

# ╔═╡ 69abc9da-4596-4268-9dea-95baaf687f67
cm"""
$(ex(1,"Using the Integral Test"))
Apply the Integral Test to the series ``\sum_{n=1}^{\infty} \frac{n}{n^2+1}``.
"""

# ╔═╡ ced2268b-d0c8-4cb0-9e0d-083d6db388c8
cm"""
$(ex(2,"Using the Integral Test"))
Apply the Integral Test to the series ``\sum_{n=1}^{\infty} \frac{1}{n^2+1}``.
"""

# ╔═╡ 7df6433b-0c5b-4bd8-a96a-eb70d0efa0e3
cm"""
$(bth("Convergence of p-Series"))
The ``p``-series
```math
\sum_{n=1}^{\infty} \frac{1}{n^p}=\frac{1}{1^p}+\frac{1}{2^p}+\frac{1}{3^p}+\frac{1}{4^p}+\cdots
```
converges for ``p >1`` and diverges for ``0 < p \leq 1``.
"""

# ╔═╡ 976a8ef5-fd7f-45a4-8f1d-2a99318ad33a
cm"""
$(ex(3,"Convergent and Divergent p-Series"))

Discuss the convergence or divergence of (a) the harmonic series and (b) the ``p``-series with ``p=2``.
"""

# ╔═╡ db5771f6-1bf6-4996-a515-5e7ad37d1404
cm"""
$(ex(4,"Testing a Series for Convergence"))
Determine whether the series
```math
\sum_{n=2}^{\infty} \frac{1}{n \ln n}
```
converges or diverges.
"""

# ╔═╡ 22fd0b92-cfad-450e-b855-1ce7648fb93b
cm"""
$(bth("Direct Comparison Test"))
Let ``0 < a_n \leq b_n`` for all ``n``.
1. If ``\displaystyle\sum_{n=1}^{\infty} b_n`` converges, then ``\displaystyle\sum_{n=1}^{\infty} a_n`` converges.
2. If ``\displaystyle\sum_{n=1}^{\infty} a_n`` diverges, then ``\displaystyle\sum_{n=1}^{\infty} b_n`` diverges.
"""

# ╔═╡ be156c4f-af26-4e6e-907d-99e73b68c4aa
cm"""
$(ex(1,"Using the Direct Comparison Test"))
Determine the convergence or divergence of
```math
\sum_{n=1}^{\infty} \frac{1}{2+3^n}
```
"""

# ╔═╡ 07aa2d3e-0387-4e41-bcbc-d24d5f572497
cm"""
$(ex(2,"Using the Direct Comparison Test"))
Determine the convergence or divergence of
```math
\sum_{n=1}^{\infty} \frac{1}{2+\sqrt{n}}
```
"""

# ╔═╡ 080f38b7-8cc3-497a-badf-5748c617f56b
cm"""
$(bth("Limit Comparison Test"))
If ``a_n>0, b_n>0``, and
```math
\lim _{n \rightarrow \infty} \frac{a_n}{b_n}=L
```
where ``L`` is finite and positive, then
```math
\sum_{n=1}^{\infty} a_n \text { and } \sum_{n=1}^{\infty} b_n
```
either both converge or both diverge.
"""

# ╔═╡ 8c6ba535-e37f-4210-8d59-5a28afcff45f
cm"""
$(ex(3,"Using the Limit Comparison Test"))

Show that the general harmonic series below diverges.
```math
\sum_{n=1}^{\infty} \frac{1}{a n+b}, \quad a>0, \quad b>0
```
"""

# ╔═╡ d8b8ec7c-fee3-4475-8552-6b33b091a728
cm"""
$(ex(4,"Using the Limit Comparison Test"))
Determine the convergence or divergence of
```math
\sum_{n=1}^{\infty} \frac{\sqrt{n}}{n^2+1}
```
"""

# ╔═╡ 61ebbc9f-8bc3-4712-9bd5-d1bad2bc6640
cm"""
$(ex(5,"Using the Limit Comparison Test"))
Determine the convergence or divergence of
```math
\sum_{n=1}^{\infty} \frac{n 2^n}{4 n^3+1}
```
"""

# ╔═╡ 222d45a6-60f2-49c1-a10e-ae2688bd6734
cm"""
$(bth("Alternating Series Test"))
Let ``a_n>0``. The alternating series
```math
\sum_{n=1}^{\infty}(-1)^n a_n \text { and } \sum_{n=1}^{\infty}(-1)^{n+1} a_n
```
converge when these two conditions are met.
1. ``\lim _{n \rightarrow \infty} a_n=0``
2. ``a_{n+1} \leq a_n``, for all ``n``
"""

# ╔═╡ 3cdf3d2b-81e7-4b91-ae61-f7cc214d5154
cm"""
$(ex(1,"Using the Alternating Series Test"))

Determine the convergence or divergence of
```math
\sum_{n=1}^{\infty}(-1)^{n+1} \frac{1}{n} .
```
"""

# ╔═╡ c4a55daf-8b5f-48e2-90e8-1c215deeb804
cm"""
$(ex(2,"Using the Alternating Series Test"))

Determine the convergence or divergence of
```math
\sum_{n=1}^{\infty} \frac{n}{(-2)^{n-1}} .
```
"""

# ╔═╡ a946547f-8507-49ec-b5fc-007dc89d0e92
cm"""
$(ex(3,"When the Alternating Series Test Does Not Apply"))
a. 
```math
\sum_{n=1}^{\infty} \frac{(-1)^{n+1}(n+1)}{n}=\frac{2}{1}-\frac{3}{2}+\frac{4}{3}-\frac{5}{4}+\frac{6}{5}-\cdots
```
b.
```math
\frac{2}{1}-\frac{1}{1}+\frac{2}{2}-\frac{1}{2}+\frac{2}{3}-\frac{1}{3}+\frac{2}{4}-\frac{1}{4}+\cdots
```
"""

# ╔═╡ 218c723f-8921-475b-b9be-9e88a3522829
cm"""
$(bth("Alternating Series Remainder"))
If a convergent alternating series satisfies the condition ``a_{n+1} \leq a_n``, then the absolute value of the remainder ``R_N`` involved in approximating the sum ``S`` by ``S_N`` is less than (or equal to) the first neglected term. That is,
```math
\left|S-S_N\right|=\left|R_N\right| \leq a_{N+1} .
```

"""

# ╔═╡ b4e85b19-989f-4caf-85f7-519d95178a4d
cm"""
$(ex(4,"Approximating the Sum of an Alternating Series"))
Approximate the sum of the series by its first six terms.
```math
\sum_{n=1}^{\infty}(-1)^{n+1}\left(\frac{1}{n!}\right)=\frac{1}{1!}-\frac{1}{2!}+\frac{1}{3!}-\frac{1}{4!}+\frac{1}{5!}-\frac{1}{6!}+\cdots
```
"""

# ╔═╡ f6330660-6de9-454a-b23a-3b64e763b17a
cm"""
$(ex(5,"Finding the Number of Terms"))
Determine the number of terms required to approximate the sum of the series with an error of less than 0.001 .
```math
\sum_{n=1}^{\infty} \frac{(-1)^{n+1}}{n^4}
```
"""

# ╔═╡ bc81fb58-4060-41d3-bc7c-fc96e2627c77
cm"""
$(bth("Absolute Convergence"))
If the series ``\Sigma\left|a_n\right|`` converges, then the series ``\Sigma a_n`` also converges.
"""

# ╔═╡ 93e8dfc5-8bbe-4642-bef0-e5fcd0c9b781
cm"""
$(define("Absolute and Conditional Convergence"))
1. The series ``\sum a_n`` is __absolutely convergent__ when ``\Sigma\left|a_n\right|`` converges.
2. The series ``\sum a_n`` is __conditionally convergent__ when ``\sum a_n`` converges but ``\Sigma\left|a_n\right|`` diverges.
"""

# ╔═╡ 22b0134b-6a5c-4a5c-8daa-966c8c636eeb
cm"""
$(ex(6,"Absolute and Conditional Convergence"))
Determine whether each of the series is convergent or divergent. Classify any convergent series as absolutely or conditionally convergent.

a. ``\sum_{n=0}^{\infty} \frac{(-1)^n n!}{2^n}=\frac{0!}{2^0}-\frac{1!}{2^1}+\frac{2!}{2^2}-\frac{3!}{2^3}+\cdots``

b. ``\sum_{n=1}^{\infty} \frac{(-1)^n}{\sqrt{n}}=-\frac{1}{\sqrt{1}}+\frac{1}{\sqrt{2}}-\frac{1}{\sqrt{3}}+\frac{1}{\sqrt{4}}-\cdots``

"""

# ╔═╡ 485e0d4f-ba2d-4493-bf66-5b4c39eee8c8
cm"""
$(ex(7,"Absolute and Conditional Convergence"))
Determine whether each of the series is convergent or divergent. Classify any convergent series as absolutely or conditionally convergent.

a. ``\sum_{n=1}^{\infty} \frac{(-1)^{n(n+1) / 2}}{3^n}=-\frac{1}{3}-\frac{1}{9}+\frac{1}{27}+\frac{1}{81}-\cdots``

b. ``\sum_{n=1}^{\infty} \frac{(-1)^n}{\ln (n+1)}=-\frac{1}{\ln 2}+\frac{1}{\ln 3}-\frac{1}{\ln 4}+\frac{1}{\ln 5}-\cdots``
"""

# ╔═╡ 54f2a8e1-03c2-4cd9-8159-9b8fbdda29bb
cm"""
$(ex(8,"Rearrangement of a Series"))

The alternating harmonic series converges to ``\ln 2``. That is,
```math
\sum_{n=1}^{\infty}(-1)^{n+1} \frac{1}{n}=\frac{1}{1}-\frac{1}{2}+\frac{1}{3}-\frac{1}{4}+\cdots=\ln 2 .
```

Rearrange the terms of the series to produce a different sum.
"""

# ╔═╡ da9230a6-088d-4735-b206-9514c12dd223
initialize_eqref()

# ╔═╡ 107407c8-5da0-4833-9965-75a82d84a0fb
@htl("""
<style>
@import url("https://mmogib.github.io/math102/custom.css");

ul {
  list-style: none;
}

ul li:before {
  content: '💡 ';
}

.p40 {
	padding-left: 40px;
}
    example-box {
      max-width: 600px;           /* Limits the box width */
      margin: 2rem auto;          /* Centers the box and adds vertical spacing */
      border: 1px solid #ccc;     /* Light border */
      border-radius: 4px;         /* Slightly rounded corners */
      overflow: hidden;           /* Ensures the box boundary clips its children */
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow */
      font-family: Arial, sans-serif;
    }

    /* Header area for "EXAMPLE 1" */
    .example-header {
      background: linear-gradient(90deg, #cc0000, #990000);
      color: #fff;
      font-weight: bold;
      font-size: 1.1rem;
      padding: 0.75rem 1rem;
      border-bottom: 1px solid #990000;
    }

    /* Sub-header area for the title or subtitle */
    .example-title {
      background-color: #f9f9f9;
      font-weight: 600;
      font-size: 1rem;
      padding: 0.75rem 1rem;
      margin: 0;                  /* Remove default heading margins */
      border-bottom: 1px solid #eee;
    }

    /* Main content area for the mathematical statement or instructions */
    .example-content {
      padding: 1rem;
      line-height: 1.5;
    }

    /* Optional styling for inline math or emphasis */
    em {
      font-style: italic;
      color: #333;
    }
</style>
""")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Colors = "5ae59095-9a9b-59fe-a467-6f913c188581"
CommonMark = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
IntervalArithmetic = "d1acc4aa-44c8-5952-acd4-ba5d80a2a253"
LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
Latexify = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
PlotThemes = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoExtras = "ed5d0301-4775-4676-b788-cf71e66ff8ed"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
PrettyTables = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
Printf = "de0858da-6303-5e67-8744-51eddeeeb8d7"
QRCoders = "f42e9828-16f3-11ed-2883-9126170b272d"
Random = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
SymPy = "24249f21-da20-56a4-8eb1-6a02cf4ae2e6"

[compat]
Colors = "~0.12.11"
CommonMark = "~0.8.15"
HypertextLiteral = "~0.9.5"
IntervalArithmetic = "~0.22.21"
LaTeXStrings = "~1.3.1"
Latexify = "~0.16.5"
PlotThemes = "~3.2.0"
Plots = "~1.40.8"
PlutoExtras = "~0.7.13"
PlutoUI = "~0.7.60"
PrettyTables = "~2.4.0"
QRCoders = "~1.4.5"
SymPy = "~2.2.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.4"
manifest_format = "2.0"
project_hash = "81a86a43942ca0d9cd7492fade0513388f9b8155"

[[deps.AbstractFFTs]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "d92ad398961a3ed262d8bf04a1a2b8340f915fef"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.5.0"

    [deps.AbstractFFTs.extensions]
    AbstractFFTsChainRulesCoreExt = "ChainRulesCore"
    AbstractFFTsTestExt = "Test"

    [deps.AbstractFFTs.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    Test = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

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
git-tree-sha1 = "9e2a6b69137e6969bab0152632dcb3bc108c8bdd"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+1"

[[deps.CEnum]]
git-tree-sha1 = "389ad5c84de1ae7cf0e28e381131c98ea87d54fc"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.5.0"

[[deps.CRlibm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e329286945d0cfc04456972ea732551869af1cfc"
uuid = "4e9b3aee-d8a1-5a3d-ad8b-7d824db253f0"
version = "1.0.1+0"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "009060c9a6168704143100f36ab08f06c2af4642"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.18.2+1"

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
git-tree-sha1 = "ea32b83ca4fefa1768dc84e504cc0a94fb1ab8d1"
uuid = "f0e56b4a-5159-44fe-b623-3e5288b988bb"
version = "2.4.2"

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
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

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
git-tree-sha1 = "8e9441ee83492030ace98f9789a654a6d0b1f643"
uuid = "2702e6a9-849d-5ed8-8c21-79e8b8f9ee43"
version = "0.0.20230411+0"

[[deps.ExceptionUnwrapping]]
deps = ["Test"]
git-tree-sha1 = "dcb08a0d93ec0b1cdc4af184b26b591e9695423a"
uuid = "460bff9d-24e4-43bc-9d9f-a8973cb893f4"
version = "0.1.10"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1c6317308b9dc757616f0b5cb379db10494443a7"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.6.2+0"

[[deps.Extents]]
git-tree-sha1 = "81023caa0021a41712685887db1fc03db26f41f5"
uuid = "411431e0-e8b7-467b-b5e0-f676ba4f2910"
version = "0.1.4"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "53ebe7511fa11d33bec688a9178fac4e49eeee00"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.2"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "466d45dc38e15794ec7d5d63ec03d776a9aff36e"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.4+1"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "82d8afa92ecf4b52d78d869f038ebfb881267322"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.16.3"

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
git-tree-sha1 = "db16beca600632c95fc8aca29890d83788dd8b23"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.96+0"

[[deps.Format]]
git-tree-sha1 = "9c68794ef81b08086aeb32eeaf33531668d5f5fc"
uuid = "1fa38f19-a742-5d3f-a2b9-30dd87b9d5f8"
version = "1.3.7"

[[deps.FreeType]]
deps = ["CEnum", "FreeType2_jll"]
git-tree-sha1 = "907369da0f8e80728ab49c1c7e09327bf0d6d999"
uuid = "b38be410-82b0-50bf-ab77-7b57e271db43"
version = "4.1.1"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "5c1d8ae0efc6c2e7b1fc502cbe25def8f661b7bc"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.13.2+0"

[[deps.FreeTypeAbstraction]]
deps = ["ColorVectorSpace", "Colors", "FreeType", "GeometryBasics"]
git-tree-sha1 = "b5c7fe9cea653443736d264b85466bad8c574f4a"
uuid = "663a7486-cb36-511b-a19d-713bb74d65c9"
version = "0.9.9"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1ed150b39aebcc805c26b93a8d0122c940f64ce2"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.14+0"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll", "libdecor_jll", "xkbcommon_jll"]
git-tree-sha1 = "532f9126ad901533af1d4f5c198867227a7bb077"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.4.0+1"

[[deps.GR]]
deps = ["Artifacts", "Base64", "DelimitedFiles", "Downloads", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Preferences", "Printf", "Qt6Wayland_jll", "Random", "Serialization", "Sockets", "TOML", "Tar", "Test", "p7zip_jll"]
git-tree-sha1 = "629693584cef594c3f6f99e76e7a7ad17e60e8d5"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.73.7"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "FreeType2_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Qt6Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "a8863b69c2a0859f2c2c87ebdc4c6712e88bdf0d"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.73.7+0"

[[deps.GeoFormatTypes]]
git-tree-sha1 = "59107c179a586f0fe667024c5eb7033e81333271"
uuid = "68eda718-8dee-11e9-39e7-89f7f65f511f"
version = "0.4.2"

[[deps.GeoInterface]]
deps = ["Extents", "GeoFormatTypes"]
git-tree-sha1 = "2f6fce56cdb8373637a6614e14a5768a88450de2"
uuid = "cf35fbd7-0cd7-5166-be24-54bfbe79505f"
version = "1.3.7"

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

[[deps.Ghostscript_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "43ba3d3c82c18d88471cfd2924931658838c9d8f"
uuid = "61579ee1-b43e-5ca0-a5da-69d92c66a64b"
version = "9.55.0+4"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Zlib_jll"]
git-tree-sha1 = "674ff0db93fffcd11a3573986e550d66cd4fd71f"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.80.5+0"

[[deps.Graphics]]
deps = ["Colors", "LinearAlgebra", "NaNMath"]
git-tree-sha1 = "d61890399bc535850c4bf08e4e0d3a7ad0f21cbd"
uuid = "a2bd30eb-e257-5431-a919-1863eab51364"
version = "1.1.2"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "ConcurrentUtilities", "Dates", "ExceptionUnwrapping", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "d1d712be3164d61d1fb98e7ce9bcbc6cc06b45ed"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.10.8"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll"]
git-tree-sha1 = "401e4f3f30f43af2c8478fc008da50096ea5240f"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "8.3.1+0"

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

[[deps.ImageMagick]]
deps = ["FileIO", "ImageCore", "ImageMagick_jll", "InteractiveUtils", "Libdl", "Pkg", "Random"]
git-tree-sha1 = "5bc1cb62e0c5f1005868358db0692c994c3a13c6"
uuid = "6218d12a-5da1-5696-b52f-db25d2ecc6d1"
version = "1.2.1"

[[deps.ImageMagick_jll]]
deps = ["Artifacts", "Ghostscript_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "OpenJpeg_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "d65554bad8b16d9562050c67e7223abf91eaba2f"
uuid = "c73af94c-d91f-53ed-93a7-00f77d67a9d7"
version = "6.9.13+0"

[[deps.ImageMetadata]]
deps = ["AxisArrays", "ImageAxes", "ImageBase", "ImageCore"]
git-tree-sha1 = "355e2b974f2e3212a75dfb60519de21361ad3cb7"
uuid = "bc367c6b-8a6b-528e-b4bd-a4b897500b49"
version = "0.9.9"

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

[[deps.IntervalArithmetic]]
deps = ["CRlibm_jll", "LinearAlgebra", "MacroTools", "RoundingEmulator"]
git-tree-sha1 = "ffb76d09ab0dc9f5a27edac2acec13c74a876cc6"
uuid = "d1acc4aa-44c8-5952-acd4-ba5d80a2a253"
version = "0.22.21"

    [deps.IntervalArithmetic.extensions]
    IntervalArithmeticDiffRulesExt = "DiffRules"
    IntervalArithmeticForwardDiffExt = "ForwardDiff"
    IntervalArithmeticIntervalSetsExt = "IntervalSets"
    IntervalArithmeticRecipesBaseExt = "RecipesBase"

    [deps.IntervalArithmetic.weakdeps]
    DiffRules = "b552c78f-8df3-52c6-915a-8e097449b14b"
    ForwardDiff = "f6369f11-7733-5829-9624-2563aa707210"
    IntervalSets = "8197267c-284f-5f27-9208-e0e47529a953"
    RecipesBase = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"

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

[[deps.JLFzf]]
deps = ["Pipe", "REPL", "Random", "fzf_jll"]
git-tree-sha1 = "39d64b09147620f5ffbf6b2d3255be3c901bec63"
uuid = "1019f520-868f-41f5-a6de-eb00f4b6a39c"
version = "0.1.8"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "f389674c99bfcde17dc57454011aa44d5a260a40"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.6.0"

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
git-tree-sha1 = "25ee0be4d43d0269027024d75a24c24d6c6e590c"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "3.0.4+0"

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
git-tree-sha1 = "854a9c268c43b77b0a27f22d7fab8d33cdb3a731"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.2+1"

[[deps.LaTeXStrings]]
git-tree-sha1 = "50901ebc375ed41dbf8058da26f9de442febbbec"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.1"

[[deps.Latexify]]
deps = ["Format", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Requires"]
git-tree-sha1 = "ce5f5621cac23a86011836badfedf664a612cee4"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.5"

    [deps.Latexify.extensions]
    DataFramesExt = "DataFrames"
    SparseArraysExt = "SparseArrays"
    SymEngineExt = "SymEngine"

    [deps.Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
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
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll"]
git-tree-sha1 = "9fd170c4bbfd8b935fdc5f8b7aa33532c991a673"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.11+0"

[[deps.Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "6f73d1dd803986947b2c750138528a999a6c7733"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.6.0+0"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "fbb1f2bef882392312feb1ede3615ddc1e9b99ed"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.49.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "f9557a255370125b405568f9767d6d195822a175"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.17.0+0"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "0c4f9c4f1a50d8f35048fa0532dabbadf702f81e"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.40.1+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "XZ_jll", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "2da088d113af58221c52828a80378e16be7d037a"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.5.1+1"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "5ee6203157c120d79034c748a2acba45b82b8807"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.40.1+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.11.0"

[[deps.LittleCMS_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll"]
git-tree-sha1 = "fa7fd067dca76cadd880f1ca937b4f387975a9f5"
uuid = "d3a379c0-f9a3-5b72-a4c0-6bf4d2e8af0f"
version = "2.16.0+0"

[[deps.LogExpFunctions]]
deps = ["DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "a2d09619db4e765091ee5c6ffe8872849de0feea"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.28"

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
git-tree-sha1 = "c1dd6d7978c12545b4179fb6153b9250c96b0075"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "1.0.3"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "2fa9ee3e63fd3a4f7a9a4f4744a52f4856de82df"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.13"

[[deps.MappedArrays]]
git-tree-sha1 = "2dab0221fe2b0f2cb6754eaa743cc266339f527e"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.2"

[[deps.MarchingCubes]]
deps = ["PrecompileTools", "StaticArrays"]
git-tree-sha1 = "27d162f37cc29de047b527dab11a826dd3a650ad"
uuid = "299715c1-40a9-479a-aaf9-4a633d36f717"
version = "0.1.9"

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
git-tree-sha1 = "0877504529a3e5c3343c6f8b4c0381e57e4387e4"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.2"

[[deps.Netpbm]]
deps = ["FileIO", "ImageCore", "ImageMetadata"]
git-tree-sha1 = "d92b107dbb887293622df7697a2223f9f8176fcd"
uuid = "f09324ee-3d7c-5217-9330-fc30815ba969"
version = "1.1.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OffsetArrays]]
git-tree-sha1 = "1a27764e945a152f7ca7efa04de513d473e9542e"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.14.1"

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
git-tree-sha1 = "327f53360fdb54df7ecd01e96ef1983536d1e633"
uuid = "52e1d378-f018-4a11-a4be-720524705ac7"
version = "0.3.2"

[[deps.OpenEXR_jll]]
deps = ["Artifacts", "Imath_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "8292dd5c8a38257111ada2174000a33745b06d4e"
uuid = "18a262bb-aa17-5467-a713-aee519bc75cb"
version = "3.2.4+0"

[[deps.OpenJpeg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libtiff_jll", "LittleCMS_jll", "libpng_jll"]
git-tree-sha1 = "f4cb457ffac5f5cf695699f82c537073958a6a6c"
uuid = "643b3616-a352-519d-856d-80112ee9badc"
version = "2.5.2+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+4"

[[deps.OpenSSL]]
deps = ["BitFlags", "Dates", "MozillaCACerts_jll", "OpenSSL_jll", "Sockets"]
git-tree-sha1 = "38cb508d080d21dc1128f7fb04f20387ed4c0af4"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.4.3"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "7493f61f55a6cce7325f197443aa80d32554ba10"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.0.15+1"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6703a85cb3781bd5909d48730a67205f3f31a575"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.3+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "dfdf5519f235516220579f949664f1bf44e741c5"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.3"

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
git-tree-sha1 = "e127b609fb9ecba6f201ba7ab753d5a605d53801"
uuid = "36c8627f-9965-5494-a995-c6b170f724f3"
version = "1.54.1+0"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.Pipe]]
git-tree-sha1 = "6842804e7867b115ca9de748a0cf6b364523c16d"
uuid = "b98c9c47-44ae-5843-9183-064241ee97a0"
version = "1.3.0"

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
git-tree-sha1 = "6e55c6841ce3411ccb3457ee52fc48cb698d6fb0"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "3.2.0"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "PrecompileTools", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "7b1a9df27f072ac4c9c7cbe5efb198489258d1f5"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.4.1"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "JLFzf", "JSON", "LaTeXStrings", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "PrecompileTools", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "RelocatableFolders", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "TOML", "UUIDs", "UnicodeFun", "UnitfulLatexify", "Unzip"]
git-tree-sha1 = "45470145863035bb124ca51b320ed35d071cc6c2"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.40.8"

    [deps.Plots.extensions]
    FileIOExt = "FileIO"
    GeometryBasicsExt = "GeometryBasics"
    IJuliaExt = "IJulia"
    ImageInTerminalExt = "ImageInTerminal"
    UnitfulExt = "Unitful"

    [deps.Plots.weakdeps]
    FileIO = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
    GeometryBasics = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
    IJulia = "7073ff75-c697-5162-941a-fcdaad2a7d2a"
    ImageInTerminal = "d8c32880-2388-543b-8c61-d9f865259254"
    Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

[[deps.PlutoExtras]]
deps = ["AbstractPlutoDingetjes", "DocStringExtensions", "HypertextLiteral", "InteractiveUtils", "Markdown", "PlutoUI", "REPL", "Random"]
git-tree-sha1 = "681f89bdd5c1da76b31a524af798efb5eb332ee9"
uuid = "ed5d0301-4775-4676-b788-cf71e66ff8ed"
version = "0.7.13"

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
deps = ["Crayons", "LaTeXStrings", "Markdown", "PrecompileTools", "Printf", "Reexport", "StringManipulation", "Tables"]
git-tree-sha1 = "1101cd475833706e4d0e7b122218257178f48f34"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "2.4.0"

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
git-tree-sha1 = "18e8f4d1426e965c7b532ddd260599e1510d26ce"
uuid = "4b34888f-f399-49d4-9bb3-47ed5cae4e65"
version = "1.0.0"

[[deps.QRCoders]]
deps = ["FileIO", "ImageCore", "ImageIO", "ImageMagick", "StatsBase", "UnicodePlots"]
git-tree-sha1 = "b3e5fcc7a7ade2d43f0ffd178c299b7a264c268a"
uuid = "f42e9828-16f3-11ed-2883-9126170b272d"
version = "1.4.5"

[[deps.Qt6Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Vulkan_Loader_jll", "Xorg_libSM_jll", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_cursor_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "libinput_jll", "xkbcommon_jll"]
git-tree-sha1 = "492601870742dcd38f233b23c3ec629628c1d724"
uuid = "c0090381-4147-56d7-9ebc-da0b1113ec56"
version = "6.7.1+1"

[[deps.Qt6Declarative_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Qt6Base_jll", "Qt6ShaderTools_jll"]
git-tree-sha1 = "e5dd466bf2569fe08c91a2cc29c1003f4797ac3b"
uuid = "629bc702-f1f5-5709-abd5-49b8460ea067"
version = "6.7.1+2"

[[deps.Qt6ShaderTools_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Qt6Base_jll"]
git-tree-sha1 = "1a180aeced866700d4bebc3120ea1451201f16bc"
uuid = "ce943373-25bb-56aa-8eca-768745ed7b5a"
version = "6.7.1+1"

[[deps.Qt6Wayland_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Qt6Base_jll", "Qt6Declarative_jll"]
git-tree-sha1 = "729927532d48cf79f49070341e1d918a65aba6b0"
uuid = "e99dba38-086e-5de3-a5b1-6e4c66e897c3"
version = "6.7.1+1"

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
git-tree-sha1 = "ffdaf70d81cf6ff22c2b6e733c900c3321cab864"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "1.0.1"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.RoundingEmulator]]
git-tree-sha1 = "40b9edad2e5287e05bd413a38f61a8ff55b9557b"
uuid = "5eaf0fd0-dfba-4ccb-bf02-d820a40db705"
version = "0.2.1"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.SIMD]]
deps = ["PrecompileTools"]
git-tree-sha1 = "98ca7c29edd6fc79cd74c61accb7010a4e7aee33"
uuid = "fdea26ae-647d-5447-a871-4b548cad5224"
version = "3.6.0"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "3bac05bc7e74a75fd9cba4295cde4045d9fe2386"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.2.1"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
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
git-tree-sha1 = "2f5d4697f21388cbe1ff299430dd169ef97d7e14"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.4.0"

    [deps.SpecialFunctions.extensions]
    SpecialFunctionsChainRulesCoreExt = "ChainRulesCore"

    [deps.SpecialFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"

[[deps.StackViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "46e589465204cd0c08b4bd97385e4fa79a0c770c"
uuid = "cae243ae-269e-4f55-b966-ac2d0dc13c15"
version = "0.1.1"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "PrecompileTools", "Random", "StaticArraysCore"]
git-tree-sha1 = "eeafab08ae20c62c44c8399ccb9354a04b80db50"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.9.7"

    [deps.StaticArrays.extensions]
    StaticArraysChainRulesCoreExt = "ChainRulesCore"
    StaticArraysStatisticsExt = "Statistics"

    [deps.StaticArrays.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

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

[[deps.StringManipulation]]
deps = ["PrecompileTools"]
git-tree-sha1 = "a6b1675a536c5ad1a60e5a5153e1fee12eb146e3"
uuid = "892a3eda-7b42-436c-8928-eab12a02cf0e"
version = "0.4.0"

[[deps.StructArrays]]
deps = ["ConstructionBase", "DataAPI", "Tables"]
git-tree-sha1 = "f4dc295e983502292c4c3f951dbb4e985e35b3be"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.18"

    [deps.StructArrays.extensions]
    StructArraysAdaptExt = "Adapt"
    StructArraysGPUArraysCoreExt = "GPUArraysCore"
    StructArraysSparseArraysExt = "SparseArrays"
    StructArraysStaticArraysExt = "StaticArrays"

    [deps.StructArrays.weakdeps]
    Adapt = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
    GPUArraysCore = "46192b85-c4d5-4398-a991-12ede77f4527"
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
deps = ["CommonEq", "CommonSolve", "LinearAlgebra", "PyCall", "SpecialFunctions", "SymPyCore"]
git-tree-sha1 = "d35b297be048dfac05bcff29e55d6106808e3c5a"
uuid = "24249f21-da20-56a4-8eb1-6a02cf4ae2e6"
version = "2.2.0"

[[deps.SymPyCore]]
deps = ["CommonEq", "CommonSolve", "Latexify", "LinearAlgebra", "Markdown", "RecipesBase", "SpecialFunctions"]
git-tree-sha1 = "bef92ec4c31804bdc9c44cb00eaf0348eac383fb"
uuid = "458b697b-88f0-4a86-b56b-78b75cfb3531"
version = "0.2.5"

    [deps.SymPyCore.extensions]
    SymPyCoreTermInterfaceExt = "TermInterface"

    [deps.SymPyCore.weakdeps]
    TermInterface = "8ea1fca8-c5ef-4a55-8b96-4e9afe9c9a3c"

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
git-tree-sha1 = "657f0a3fdc8ff4a1802b984872468ae1649aebb3"
uuid = "731e570b-9d59-4bfa-96dc-6df516fadf69"
version = "0.10.1"

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

[[deps.UnicodePlots]]
deps = ["ColorTypes", "Contour", "Crayons", "Dates", "FileIO", "FreeTypeAbstraction", "LazyModules", "LinearAlgebra", "MarchingCubes", "NaNMath", "Printf", "SparseArrays", "StaticArrays", "StatsBase", "Unitful"]
git-tree-sha1 = "ae67ab0505b9453655f7d5ea65183a1cd1b3cfa0"
uuid = "b8865327-cd53-5732-bb35-84acbb429228"
version = "2.12.4"

[[deps.Unitful]]
deps = ["Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "d95fe458f26209c66a187b1114df96fd70839efd"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.21.0"

    [deps.Unitful.extensions]
    ConstructionBaseUnitfulExt = "ConstructionBase"
    InverseFunctionsUnitfulExt = "InverseFunctions"

    [deps.Unitful.weakdeps]
    ConstructionBase = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.UnitfulLatexify]]
deps = ["LaTeXStrings", "Latexify", "Unitful"]
git-tree-sha1 = "975c354fcd5f7e1ddcc1f1a23e6e091d99e99bc8"
uuid = "45397f5d-5981-4c77-b2b3-fc36d6e9b728"
version = "1.6.4"

[[deps.Unzip]]
git-tree-sha1 = "ca0969166a028236229f63514992fc073799bb78"
uuid = "41fe7b60-77ed-43a1-b4f0-825fd5a5650d"
version = "0.2.0"

[[deps.VersionParsing]]
git-tree-sha1 = "58d6e80b4ee071f5efd07fda82cb9fbe17200868"
uuid = "81def892-9a0e-5fdd-b105-ffc91e053289"
version = "1.3.0"

[[deps.Vulkan_Loader_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Wayland_jll", "Xorg_libX11_jll", "Xorg_libXrandr_jll", "xkbcommon_jll"]
git-tree-sha1 = "2f0486047a07670caad3a81a075d2e518acc5c59"
uuid = "a44049a8-05dd-5a78-86c9-5fde0876e88c"
version = "1.3.243+0"

[[deps.Wayland_jll]]
deps = ["Artifacts", "EpollShim_jll", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "7558e29847e99bc3f04d6569e82d0f5c54460703"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.21.0+1"

[[deps.Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "93f43ab61b16ddfb2fd3bb13b3ce241cafb0e6c9"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.31.0+0"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Zlib_jll"]
git-tree-sha1 = "1165b0443d0eca63ac1e32b8c0eb69ed2f4f8127"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.13.3+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "a54ee957f4c86b526460a720dbc882fa5edcbefc"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.41+0"

[[deps.XZ_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "ac88fb95ae6447c8dda6a5503f3bafd496ae8632"
uuid = "ffd25f8a-64ca-5728-b0f7-c24cf3aae800"
version = "5.4.6+0"

[[deps.Xorg_libICE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "326b4fea307b0b39892b3e85fa451692eda8d46c"
uuid = "f67eecfb-183a-506d-b269-f58e52b52d7c"
version = "1.1.1+0"

[[deps.Xorg_libSM_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libICE_jll"]
git-tree-sha1 = "3796722887072218eabafb494a13c963209754ce"
uuid = "c834827a-8449-5923-a945-d239c165b7dd"
version = "1.2.4+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "afead5aba5aa507ad5a3bf01f58f82c8d1403495"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.8.6+0"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6035850dcc70518ca32f012e46015b9beeda49d8"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.11+0"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "34d526d318358a859d7de23da945578e8e8727b7"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.4+0"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "d2d1a5c49fae4ba39983f63de6afcbea47194e85"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.6+0"

[[deps.Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[deps.Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[deps.Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[deps.Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "47e45cd78224c53109495b3e324df0c37bb61fbe"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.11+0"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8fdda4c692503d44d04a0603d9ac0982054635f9"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.1+0"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "bcd466676fef0878338c61e655629fa7bbc69d8e"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.17.0+0"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "730eeca102434283c50ccf7d1ecdadf521a765a4"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.2+0"

[[deps.Xorg_xcb_util_cursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_jll", "Xorg_xcb_util_renderutil_jll"]
git-tree-sha1 = "04341cb870f29dcd5e39055f895c39d016e18ccd"
uuid = "e920d4aa-a673-5f3a-b3d7-f755a4d47c43"
version = "0.1.4+0"

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
git-tree-sha1 = "330f955bc41bb8f5270a369c473fc4a5a4e4d3cb"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.6+0"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "691634e5453ad362044e2ad653e79f3ee3bb98c3"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.39.0+0"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e92a1a012a10506618f10b7047e478403a046c77"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.5.0+0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "555d1076590a6cc2fdee2ef1469451f872d8b41b"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.6+1"

[[deps.eudev_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "gperf_jll"]
git-tree-sha1 = "431b678a28ebb559d224c0b6b6d01afce87c51ba"
uuid = "35ca27e7-8b34-5b7f-bca9-bdc33f59eb06"
version = "3.2.9+0"

[[deps.fzf_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "936081b536ae4aa65415d869287d43ef3cb576b2"
uuid = "214eeab7-80f7-51ab-84ad-2988db7cef09"
version = "0.53.0+0"

[[deps.gperf_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3516a5630f741c9eecb3720b1ec9d8edc3ecc033"
uuid = "1a1c6b14-54f6-533d-8383-74cd7377aa70"
version = "3.1.1+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1827acba325fdcdf1d2647fc8d5301dd9ba43a9d"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.9.0+0"

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

[[deps.libevdev_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "141fe65dc3efabb0b1d5ba74e91f6ad26f84cc22"
uuid = "2db6ffa8-e38f-5e21-84af-90c45d0032cc"
version = "1.11.0+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8a22cf860a7d27e4f3498a0fe0811a7957badb38"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.3+0"

[[deps.libinput_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "eudev_jll", "libevdev_jll", "mtdev_jll"]
git-tree-sha1 = "ad50e5b90f222cfe78aa3d5183a20a12de1322ce"
uuid = "36db933b-70db-51c0-b978-0f229ee0e533"
version = "1.18.0+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "b70c870239dc3d7bc094eb2d6be9b73d27bef280"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.44+0"

[[deps.libsixel_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "libpng_jll"]
git-tree-sha1 = "7dfa0fd9c783d3d0cc43ea1af53d69ba45c447df"
uuid = "075b6546-f08a-558a-be8f-8157d0f608a5"
version = "1.10.3+1"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "490376214c4721cdaca654041f635213c6165cb3"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+2"

[[deps.mtdev_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "814e154bdb7be91d78b6802843f76b6ece642f11"
uuid = "009596ad-96f7-51b1-9f1b-5ce2d5e8a71e"
version = "1.1.6+0"

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
git-tree-sha1 = "9c304562909ab2bab0262639bd4f444d7bc2be37"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "1.4.1+1"
"""

# ╔═╡ Cell order:
# ╟─71bc54d5-d0ed-42d3-9bc1-48aa86e91d1d
# ╟─e414122f-b93a-4510-b8ae-026c303e0df9
# ╟─8408e369-40eb-4f9b-a7d7-26cde3e34a74
# ╟─cd269caf-ef81-43d7-a1a8-6668932b6363
# ╟─8b65d45c-ca7c-4e5d-9cfd-a7348547ebe0
# ╟─02c15fce-abf1-427e-b648-2554ee18ed5a
# ╟─38eabacb-a71a-448d-875d-7f7230dba49e
# ╟─bd6fff85-5fcc-4810-898d-d6f22b8e917d
# ╟─d60ca33d-fa31-49a2-9a4a-dfc54aef46ae
# ╟─6caae83a-3aa3-4f79-9f05-fb969f952286
# ╟─52333157-9913-489d-8784-dc3b542af1e9
# ╟─73c7417c-a035-4202-83f1-45e9897e8871
# ╟─9f50c8be-95e8-4c28-81b4-8ccd638505af
# ╠═0e340bfb-9807-4061-8901-62133ac44c5f
# ╟─ebd3dd41-7a3b-4d2b-9c1d-adca89f36af7
# ╟─19354aee-6de7-448f-8091-f6f68efdf84b
# ╟─f80cc26d-120b-4f14-b31e-b50c9283c0b9
# ╟─7086a5a8-d5ad-444b-8d14-056a3fdb99eb
# ╟─bb77f844-76c9-401f-8c2c-dcc5891b0a09
# ╟─9463762b-50bb-49be-80be-5f67cb141d1c
# ╟─15277097-7c11-4b03-8579-8f9c376361cd
# ╟─8f673110-65a1-4f6d-8de1-ebcfb49fb50d
# ╠═8c2f85bb-9b81-4b70-b7e8-1a91e2738838
# ╟─f89bbb38-906b-45f3-9eff-617924e0b719
# ╟─a862aa36-d811-427d-bc1a-4502175b71f4
# ╟─b9434085-81d7-4a3d-bed5-deebea3cd48a
# ╠═208abdcc-dc12-4a08-a1f8-2177f95886f7
# ╟─1615be4c-fb84-418f-8406-c274550cfb86
# ╠═fd7161bc-1e1b-42e3-8758-c8e3e3ec0877
# ╟─38ab6c6d-c5e0-49f9-8c76-61e0b8dc13c6
# ╟─01008c60-bcfa-42a1-b5e8-fa67db2131ba
# ╟─ee50e46d-6580-4a68-a061-6179c895a219
# ╟─845d8b0a-6550-49f4-9308-13ec2b2bd0c1
# ╟─1f0c53c0-611f-4b4e-9718-efac2f0b893d
# ╟─a7c8710c-2256-425e-a946-0e2791773592
# ╟─6ecb0430-177c-4097-a94e-edbce61725d1
# ╟─f98989fb-b59a-496f-be73-322b4dcb4960
# ╟─7e49b1d2-b6c5-4b84-ae6b-ac62d3f58d0c
# ╟─04922857-61ca-45a7-a3b4-cf35138e4847
# ╟─c19ba868-ca3b-4987-8e9b-eacffd6f9158
# ╟─982c228a-a8cd-42cd-a437-1b8c80c89cef
# ╟─3d54c0f4-3324-4bd6-adee-c343c5153392
# ╟─1937220c-4467-430b-a745-42294765b6a5
# ╟─1681a378-aea4-4e23-85a7-5c5731742ad8
# ╟─5156fbdc-002c-4222-aca0-b835061e3fb7
# ╟─7f7b1152-5dd0-4f97-b931-4fe74c51b3a3
# ╟─b5d1d68a-ad7e-4140-a818-addead342c53
# ╟─d7cb77c3-7875-43d8-bab6-7281455700b0
# ╟─5f37c3d1-449f-4a6d-9af5-55f9a4c8feec
# ╟─4aa43e57-d9a4-49da-b7d8-fe39d21df414
# ╟─a41fcefd-00dd-45c5-86a0-7fe076460674
# ╟─07f45116-ff8b-4d2c-a7e3-46a4581afc16
# ╟─229d9694-2751-479d-9872-218f7cea2261
# ╟─8b1d06a8-dbd0-4dc4-b12a-15425960ecc4
# ╟─5e23a09b-c96f-40e0-bd8f-af18041f2be9
# ╟─874e3ccf-4309-42d4-af8d-3921b025239e
# ╟─4ff28842-9307-4813-8791-197fd6ca5238
# ╟─1ffb0970-7422-4cb7-9f84-841f68565b80
# ╟─32b71cdc-e93b-4b05-b8f5-4b9d61a2eb62
# ╠═4e358ab2-9be7-4d7f-b295-1e85943da027
# ╟─81e4ac99-3388-49e0-a168-5d9961c80ddf
# ╟─02d61e1f-b630-443c-b1dd-1fe5d2c81b2f
# ╟─b51c5bc6-9065-4687-b6cb-e67a372a3b4e
# ╠═e13d39c8-ac62-460d-bf7e-9a994942731d
# ╟─9a9bff9d-98c3-4300-bc0b-a7b807a43f99
# ╟─124a0bb3-b89e-4ac5-9178-01cda06045ec
# ╟─56a7034f-d702-4877-ab5c-6916ac503043
# ╟─2b5289ee-8f10-4564-98e1-3a43e648d867
# ╟─9d6d8399-d063-42c4-af47-dbf5ab38d434
# ╟─2543320e-dd76-4edf-adb8-ceac71805337
# ╟─8cc0d5fd-c988-4f16-a07f-a6439fccbc8a
# ╟─66b482d7-4c12-4f41-9d09-3eb723a1001b
# ╟─4a9a8e25-2db5-495a-bf55-94d589bdb699
# ╟─fa78d2d3-afc7-40d8-9e06-4df6f65321ac
# ╟─269e3d73-0e11-4fcc-a291-031da9817541
# ╟─fa3f03ce-66a3-447b-ae37-47eef4f10aaa
# ╟─e200bd3c-2636-4a91-83dd-de6b0e3d5a32
# ╟─1af2a723-f74f-47b1-a46f-a5452b7da7b1
# ╠═56153ee8-aa22-40ba-bab3-235cc8b1fef6
# ╟─b25051b6-8b33-4976-86b9-4db2166c291c
# ╟─f5c25849-0337-4dca-98cf-dbbc723499f8
# ╟─af619399-4655-45a0-847b-60357e53d2a5
# ╟─9cd59dc0-5971-45d0-b076-69df14c3f4cd
# ╟─71bca4ec-9d80-423c-bbac-16711deccce1
# ╟─f64e2917-76fc-4ba8-8a47-d8c4c3654880
# ╟─fb8b488f-f8b4-48e5-9d66-9f3df8919d5d
# ╟─d6b066d3-0049-4f3d-9acc-55fc16c40adc
# ╟─14f0a7a7-2264-4170-832e-837a54cd935c
# ╟─e8cdbe22-f7e1-47b2-bd3f-6130a6fc6207
# ╟─bb514175-fe2c-498d-8ae5-aa3e59167fa4
# ╟─e4f23df3-6b96-4333-99e0-1b9dfb7b8cba
# ╟─42f171ca-09e4-45ed-8910-427ab7dc3aee
# ╟─df2dff93-465a-404a-9bf5-581907b99f42
# ╟─e6ba3446-cdb3-41c0-8db7-56b63042ddbc
# ╟─df2a7927-878c-4d11-9e37-9c519672801e
# ╟─8458322d-c34a-475f-b11a-f9cb74a91a95
# ╟─5d0d0bd7-7a85-4b2f-8a39-c6a4ef7d6175
# ╟─0d547f78-1578-4c4a-9403-bd4ede9a62a7
# ╟─28d201df-5056-4429-b1ba-a4959e75bc51
# ╟─8a584c0c-3017-4958-b611-772b3a6e44c5
# ╠═a73db7b8-3464-4852-a9ef-5d0de43d4395
# ╟─2b68430f-08ac-4bfb-a484-e6fbe08738ba
# ╟─1beace3e-3a7e-411b-b6c0-3eca1fbf8536
# ╟─22d44abf-34e3-496c-910a-5e51a7d90e10
# ╟─b4279679-50fb-4dfd-9c4e-0e14788e2edd
# ╟─4bcc7833-6bfb-421f-b54f-3567aea00c1e
# ╟─655773ab-44a0-4f6e-95b9-353ea7f694ca
# ╟─b2873160-bdc6-4883-b6a0-fe2b8295f97d
# ╟─6406249d-f7ac-4ed7-a175-71e6dcdf55f2
# ╟─253a5368-72ca-4463-9b59-934f45d77a4e
# ╟─d55a4917-e885-42ee-a8db-24f951501c28
# ╟─e653c7dd-7359-448d-9690-5d4a9780fc70
# ╟─a5b5ae97-b4af-435e-a3fb-5a23edf8b0c9
# ╟─eccd97c8-15b5-47ff-92ef-7e87a054c4ef
# ╟─01c13365-f758-47c4-9b96-b9f2616b3824
# ╟─017d38da-5825-4966-8d89-c75ce0b2af11
# ╟─85c79ec8-6c95-4c76-9851-a4a0b7ec76d7
# ╟─c9a96c8c-94a5-4b5a-853e-60b35bc7621a
# ╟─9a998b24-6d36-4f47-b4db-9df9b3d138e2
# ╟─cd76f697-ce0b-4dba-b818-65ee5b6de23d
# ╟─238beb06-9d2e-4d15-8eb4-3660aced7ef7
# ╟─efb4d714-dea7-428a-858c-70c9193ce150
# ╟─463027a3-7319-43ef-85be-cb8abe5a1d28
# ╟─b0716945-c4e6-4d3d-a29d-864ff023b0fc
# ╟─49fe4d0b-124f-4dd8-a34d-9aaf80705175
# ╟─f608e3b8-4a16-40c9-8ffd-d02af53146e6
# ╟─fb1499e3-0a58-4b34-b452-3bdc31b82504
# ╟─c3de1903-845e-4779-b67b-817e703fd1ee
# ╟─daf5a008-b102-4557-8a18-d83839316eba
# ╟─13f007b1-b509-40b2-8ad4-ab50588957b0
# ╟─9c8d6eeb-9d3c-4525-87e3-c540c3a5d38d
# ╟─66a05cab-f595-43f8-843d-1f845c953868
# ╟─db150ea2-4895-415e-97a9-f7eff4180d63
# ╟─cf16ce47-f360-451b-afae-b1fe8b559fc3
# ╟─cad95270-ba9f-4821-87da-e457a00b9617
# ╟─9b02faca-b5cb-442d-8a63-82f584b054fd
# ╟─1f1b3439-630e-4db6-9a01-321ed75bed84
# ╟─3df06d3d-7bd1-45fe-bd46-c1429b11ee14
# ╟─dda364fa-80e5-4d6c-8ed1-9b2bfccf4b18
# ╟─004ab021-15d7-40d8-ace7-41dd5f8b2237
# ╟─db08f294-cfcf-462a-8fb5-8d8a63563e61
# ╟─932e13f0-0949-4e77-b3a8-f344784b1f1d
# ╟─ac6fde80-be6b-4292-911a-b51c43de3199
# ╟─d993fe50-4792-4f54-b4a6-23cb91718f00
# ╟─57d8a03b-71a0-46d9-b908-af7028195db2
# ╟─a2a2d894-7588-48a8-84fd-65e5ead80072
# ╟─6003b1ce-be7b-4ff1-ab92-fca307cb61a8
# ╟─f03e35fd-ba04-4692-8e4a-b0880c703e8e
# ╟─0b5e8985-ecf6-4e84-860b-0891c9638aeb
# ╟─64ee7ca1-4feb-470a-900c-fbb8a413b3f5
# ╟─358c0e61-da8c-4eba-9765-58760940c7c3
# ╟─e0d5df0d-03bb-45f7-9f36-909830e6203f
# ╠═f952efd6-736c-4895-9510-f1dbf8919942
# ╟─42053189-d0d4-4c70-9c4c-41fbacae9891
# ╟─9050671d-cbb1-4d2c-9b7b-ba502655e238
# ╟─9063db24-2541-4696-92b8-f9436b237b5c
# ╟─fd39a8f1-60f5-46e7-8595-0ab20a5e3b4d
# ╟─3d609c61-d2a0-40ae-bbee-77e7b694d482
# ╟─8889cb18-f44b-4dbd-9ff5-9535f250a8bf
# ╟─e86d6a94-a83c-4eaf-83b2-c86e065c6f6a
# ╟─d31b3e53-2c50-42ba-b60e-413468e022fe
# ╟─d4963c8b-769c-47f4-8d23-00de15ca049a
# ╟─55be9c08-66aa-44bb-86c5-36e45450950b
# ╟─de12a145-2680-4322-8921-606bc6a7ca42
# ╟─29f9cc1b-7a08-4219-a31c-91a62a5b85b4
# ╟─cac5724d-f926-4bda-9dac-0534d550e6ad
# ╟─0c507932-5cf6-48f0-84c4-b6ed06a54252
# ╟─8e780376-2df2-41df-8540-b37b64c93acc
# ╟─1525ccb4-2f4c-48f0-8e6c-73cc117f92f0
# ╟─ebf77286-4f21-40a5-b13b-619ee9ed84a0
# ╟─46fce2ef-9358-4276-b013-00701bf6a691
# ╟─d25798db-b0f3-46f3-b695-59a82f3d9a2c
# ╟─c1be4636-d96e-42b4-82f6-98db3f7be7f3
# ╟─e18ee243-b49e-401f-bda2-2bb8b0ea3a66
# ╟─e3700fb4-f895-4528-9ef5-0ba59c9703c7
# ╟─19358efb-0bb3-4781-be0c-c07b4bc963f7
# ╟─1ab4d457-1c4e-4c8b-bd4d-bdeb233a6580
# ╟─e4699314-51be-4cda-b2d8-5005e72abc2a
# ╟─6f8a882b-d41c-41e5-b156-9be4112194c2
# ╟─cf309f63-2534-45f6-98b4-7bc90100493c
# ╟─dbe837f1-85da-4572-b8c3-738ba346d67f
# ╟─a89799eb-01a8-4dd4-a2a3-3576c26f29ef
# ╟─3b6613fa-523a-49ef-a68b-fab0763111e6
# ╟─6b312eea-1ad6-414a-bfa1-2f8ba1498add
# ╟─eb56826a-2315-421a-aec8-1c0e17539b0d
# ╟─4e79e466-384f-40cc-81bc-40d3d0dda3bd
# ╠═3865e317-a19a-4a9a-a8c4-2813ec0a7f0a
# ╟─6a3c2cd4-6c1f-4038-b0ac-d7992aee8d63
# ╟─8bb93d52-7813-4ce1-a78c-7eccf4ff559f
# ╟─7d2e7631-5d0f-45cd-baa5-c280963b7973
# ╟─a3c5f9a8-35b4-4daf-9314-5d4af3413770
# ╟─86e264bb-9ecc-40b8-8382-fe28892d9b41
# ╟─85d4c1c6-8791-45b0-83a0-588fcb204233
# ╟─41ec2ea8-904a-4181-a103-1d140d98d4ab
# ╟─142f33a6-1355-4095-80f2-6fa48572c64b
# ╟─8f7889c4-b786-465e-ba90-e448029399c1
# ╟─786e488c-5c3b-449b-9e44-f7f1e8fcda67
# ╟─eb27f45f-6be2-43df-bf62-1842bae6281b
# ╟─6e673498-0b02-4a55-8a81-6b7358a3668e
# ╟─5d946e8c-9256-473a-adac-7be3741aa2c0
# ╟─e7cef759-ccba-437b-a418-247d80704808
# ╟─36f63f82-142f-4468-a6ed-7781472d94d7
# ╟─8f8766fa-c168-4f09-8703-347a139b7069
# ╟─598055ab-2b36-481e-bb7d-65edfcfe183b
# ╟─200f43c8-fd32-438e-9582-a995a4026086
# ╠═681e1450-4011-43c8-ab66-26e0c073ee3d
# ╟─6cc99632-805b-4fcd-98f0-96da071afdb9
# ╟─e938f5a1-7037-47c7-9e96-ed0c7341c4f2
# ╟─57037db4-318e-40df-af33-f2be564acf56
# ╟─7588b15a-3b1e-4232-96e6-45e254c10362
# ╟─9280e821-4518-4697-b55e-a3b806d748e1
# ╟─7a19b897-5d02-4577-81a1-2a33ed5f8bb9
# ╟─d41e0530-1b75-412c-828c-d53a58523293
# ╟─3888f083-86e2-4edb-a700-62028ad295b4
# ╟─7d50c4c7-e6f0-43b7-8583-7b47cbcc2156
# ╟─9a0bbdd2-c9fe-4932-94f3-3727baa6b9a6
# ╠═ca728595-e908-4839-a9be-04a6e884a3f4
# ╟─5c4497e8-e02d-4265-ba7c-aa607231ee6d
# ╟─fa99131e-13b2-4f4a-a752-4afd26b6596c
# ╟─a856ee7d-a0d9-4d4b-aa13-449a827a954d
# ╟─507bc0c8-ef40-4ef4-ac3f-b66ae162362f
# ╟─42dee241-13c6-4d89-bce0-bac4e846cf7d
# ╟─2ada5eca-3ab9-444b-8350-153cf62abd3b
# ╟─c2941250-feac-4855-97d5-f88c35ed689a
# ╟─e40ba504-6b6c-4abc-81c8-67db621b90de
# ╠═4ec721e0-f0e4-492b-8791-87b876c57e6b
# ╟─cdd3a632-1020-4df5-b4cf-00a10b6fd255
# ╟─e5c79a58-bd0e-4490-bfee-9cf7938472ff
# ╟─6158d974-6a19-4a84-bb10-a9488fca001b
# ╟─2c66e4aa-69f7-4bc1-8299-1902a557e21f
# ╟─b7c18135-6b5a-4ca6-8169-9643f0815b3b
# ╟─b27f07f2-881c-42f0-8d9d-c49c4c54b780
# ╟─95099f5d-61ee-44ca-8d51-b01446f29649
# ╠═b0938d8a-a9b4-4551-9731-7bc738b88e85
# ╟─db377636-d9b6-4742-bf42-050a31860ad2
# ╟─76e4c36b-0cc8-4042-9c63-0610cb669ec9
# ╟─dd402f3e-4580-41e6-89c5-d6e1eba01b63
# ╟─d808a001-48ea-4eaa-9501-27d486133480
# ╟─d1ea53cf-eb1e-4f7a-ad9d-f6f58f48d0b1
# ╟─14ea163c-854d-453d-8e00-67571751653d
# ╟─a533908e-9bb0-4cf5-984f-51a5f099db8f
# ╟─22e8b5e8-8343-4e74-9f28-4b268e3157af
# ╟─11ebe671-ede6-438d-a896-45eca3beb94c
# ╟─c08feccc-e1aa-4a23-a42e-798dfe4278eb
# ╟─f943eff3-357b-4a33-a272-fdf3a7d80a5f
# ╟─da070497-1db3-4250-8d45-128daf2ff54f
# ╟─c2d68428-99c5-45fb-b056-a1c0ae5f06ad
# ╠═5ad8d84d-9f32-4378-bd22-f6004023076c
# ╟─077175a1-b3e0-467b-b5bd-b52616e3936f
# ╟─4ebfeece-3528-43e0-a70f-9e901b28b930
# ╟─f65d043c-24ab-4c73-8da9-653ec0f57298
# ╟─4eee2e8b-85b3-4986-9e5d-bfea119302dc
# ╟─3de417dd-e670-4e28-bb27-88abe5476f84
# ╟─bc944bad-3868-4fca-af1d-0a6e6ffffbb7
# ╟─7daad386-47a2-44d7-9af8-743d5712cec0
# ╟─98e43437-09c0-4b5d-b5b2-cb38d3d1ca20
# ╟─16f26878-cbe0-4ac1-a593-691a2fe55aca
# ╟─f8dc9ccf-df39-47a4-b80a-78cc262cfdeb
# ╠═72974703-d483-4d3c-be80-b89c7d7c503f
# ╟─ff9221cc-70e3-4f14-9bf8-8340874c17c3
# ╟─318706d0-ad9a-4a1e-b3de-f02020b6ab52
# ╟─dbd5a0da-cafb-4537-9410-215d87bdc60e
# ╟─0cef9fcd-3734-4694-ad23-ca1465d1f96e
# ╟─98f709cb-cccf-42a7-af35-e026f7369bb8
# ╟─0a6c72ed-f6f0-4534-ba96-581e685a3d94
# ╟─dbd92a84-14c0-4510-9f9f-39e90f50c30e
# ╟─c2ded1c8-a0a7-48cb-bf1d-7616796a5062
# ╟─963f8130-c7f7-4b57-8bac-64c92b46c53a
# ╟─4098c133-f9d4-4198-a39b-f8fa93bf0774
# ╟─71c6a056-c512-4f00-8195-a6de36bc98c8
# ╟─3f727233-8150-4008-8fb5-2a83ba616e1e
# ╟─f7b555c6-5844-4971-8693-a8ada5074b20
# ╟─dd990994-e154-4d4e-bca7-7fce46fb193b
# ╟─aa08f4c7-f3f3-4dc1-874f-e59e50d62e89
# ╟─724736c2-d020-444c-ac64-8c35fb5aed5a
# ╟─b7b3ab16-92e7-4e52-ae8f-42675eb8ade1
# ╟─c5e81c70-28ae-409b-bb4b-41418fc62fab
# ╟─d656cb73-ab16-4d06-80c3-2432fe752c59
# ╟─0183ce38-0911-49ff-a120-ed8ba21fdda3
# ╟─1e507853-e2e6-493d-9d62-f33da7a7caa8
# ╟─2eb6bb15-066f-4601-8a94-eb1ce880e7ac
# ╟─8c345896-0123-40a5-8f00-c6ebefcee822
# ╟─25157d2c-d719-438e-b4c4-6fa7d9787820
# ╟─1cc30502-ec6c-4aa9-b178-58b3e425dac9
# ╟─355007a5-91c8-454e-8463-31c6abc9f87f
# ╟─5c65c8e6-f08f-42ce-81dd-f80638cbf7b4
# ╟─eae5658b-a235-40de-84a3-00152a109e93
# ╟─af5c9045-66ec-483a-a197-db544f30b1b6
# ╟─9b9a82cc-a3c1-448f-9cb8-375e8dbd59ea
# ╟─3c9ab8ae-dda1-45eb-a635-92acf6e2f10b
# ╟─ff84cfbf-d387-4bde-b9d3-407b88e1bf30
# ╟─9a594bd8-68f7-4f6a-8dd6-3c70780f098d
# ╟─ef95cecf-00fe-429b-b94e-50f2de8a16bb
# ╟─e62d5f92-8ad6-4317-ab62-771b96f0c3f9
# ╟─63dbebd7-85d2-42fd-b09a-f0d9c1ce640f
# ╟─664c41b1-6459-4dfc-9999-5b2acad3301c
# ╟─aa6664e3-5081-4c48-8754-e65ba7263f46
# ╟─4507039d-b5e0-4c22-a698-ccbfc7eeb6ed
# ╟─7bafde52-30ed-41f9-9522-02b3c9b7316a
# ╟─d3729415-161a-41f0-ad07-120944323d9f
# ╟─b568193c-ba85-4f59-89e9-6d5b824d08cd
# ╟─471eba70-40bf-42f9-a476-b13f37ccf823
# ╟─6c261c5d-d478-4750-ac04-bb36734a6fe1
# ╠═f27fe033-30da-4174-9f1c-23910a036481
# ╟─18d5f404-685e-4781-8edf-ac7374c55526
# ╟─7c50563b-0f12-4974-9acf-598247793200
# ╟─dbc02f9a-5bc9-478e-8de1-767fd64faaec
# ╟─7d460b80-8319-4129-862e-695ebb8cff28
# ╟─d8322419-3ebe-4718-ba84-9c435615d1ba
# ╠═12ae12a8-c47b-4d15-af4d-d6bb92c8a026
# ╟─02def290-7dcd-4c8f-9c41-228033cc3e7c
# ╟─137be6c2-5b86-4e1d-b457-b4f71646e633
# ╟─84942358-6f19-4d7f-b367-4dc5e81009f5
# ╟─9fe2db35-a1d7-4af7-be2c-e34c1ce66929
# ╟─b73b6b29-6d18-4308-80dd-e0cc2aedd038
# ╟─7eeff659-9f83-47eb-8f96-6fac093f0e64
# ╟─71e4523b-b68c-49cb-8877-ff819c4a13e9
# ╟─125169d6-bfd0-443f-87aa-a7117f481088
# ╟─4202e249-ca1c-4b00-a482-8fe15a6064ed
# ╟─d5965014-2e70-4023-80ef-526f28a0334f
# ╟─27a7a6b4-6462-410d-a26a-ffd384efe461
# ╟─7b3cf490-87d4-4294-95af-f6e6deee043d
# ╟─c69ecdb4-a312-45bc-874d-85d4d3747f77
# ╠═a1b22caf-ec34-4abd-9460-bce43203b742
# ╟─8c2447b3-c26e-47e1-8701-7e4a18ae92a8
# ╟─2abfc0da-1d95-49dd-837d-6718ce473c5d
# ╟─f08b1731-59dd-4d82-8b42-6824bc216d5a
# ╟─3a4b2178-47ee-474e-bbaf-72c00b3d3c2d
# ╟─69abc9da-4596-4268-9dea-95baaf687f67
# ╟─ced2268b-d0c8-4cb0-9e0d-083d6db388c8
# ╟─f8f72024-5ea6-474d-8123-dd9b19a03fa7
# ╟─7df6433b-0c5b-4bd8-a96a-eb70d0efa0e3
# ╟─976a8ef5-fd7f-45a4-8f1d-2a99318ad33a
# ╟─db5771f6-1bf6-4996-a515-5e7ad37d1404
# ╟─986e1b28-ad65-4d2e-ad70-9dc515c8a08c
# ╟─a749dce9-5f63-43f0-95e5-d36558cc6533
# ╟─22fd0b92-cfad-450e-b855-1ce7648fb93b
# ╟─be156c4f-af26-4e6e-907d-99e73b68c4aa
# ╟─07aa2d3e-0387-4e41-bcbc-d24d5f572497
# ╟─f65563e8-6eef-4526-be12-7051d3e8d437
# ╟─080f38b7-8cc3-497a-badf-5748c617f56b
# ╟─8c6ba535-e37f-4210-8d59-5a28afcff45f
# ╟─d8b8ec7c-fee3-4475-8552-6b33b091a728
# ╟─61ebbc9f-8bc3-4712-9bd5-d1bad2bc6640
# ╟─1a9ea230-6841-429e-bcca-f013d39514a9
# ╟─15f491d1-9436-44b1-a307-0ebd98cdf722
# ╟─222d45a6-60f2-49c1-a10e-ae2688bd6734
# ╟─3cdf3d2b-81e7-4b91-ae61-f7cc214d5154
# ╟─c4a55daf-8b5f-48e2-90e8-1c215deeb804
# ╟─a946547f-8507-49ec-b5fc-007dc89d0e92
# ╟─376852e6-9a1b-4f86-8681-d307c7fd610a
# ╟─218c723f-8921-475b-b9be-9e88a3522829
# ╟─b4e85b19-989f-4caf-85f7-519d95178a4d
# ╠═4f407428-dd3b-4df4-9fdc-9cff3aaafb56
# ╟─f6330660-6de9-454a-b23a-3b64e763b17a
# ╠═10b81e79-03ff-46fb-8557-172b3f51dce3
# ╟─47754429-df92-4523-b459-5fb6d76bd67a
# ╟─bc81fb58-4060-41d3-bc7c-fc96e2627c77
# ╟─93e8dfc5-8bbe-4642-bef0-e5fcd0c9b781
# ╟─22b0134b-6a5c-4a5c-8daa-966c8c636eeb
# ╟─485e0d4f-ba2d-4493-bf66-5b4c39eee8c8
# ╟─0cfd9bcf-2545-4df2-a70f-3334b8454e31
# ╟─c7201240-7f39-4904-8fd1-5cbbd87800ca
# ╟─54f2a8e1-03c2-4cd9-8159-9b8fbdda29bb
# ╠═f2d4c2a5-f486-407b-b31b-d2efcc7476b3
# ╟─b4599a16-e7f7-4a2a-b349-2648ee45208f
# ╟─8315fb27-89e4-44a4-a51e-8e55fc3d58e5
# ╟─ef081dfa-b610-4c7a-a039-7258f4f6e80e
# ╟─da9230a6-088d-4735-b206-9514c12dd223
# ╟─107407c8-5da0-4833-9965-75a82d84a0fb
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
