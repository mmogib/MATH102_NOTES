### A Pluto.jl notebook ###
# v0.20.24

using Markdown
using InteractiveUtils

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
# let
#     img = LocalImage("../qrcode.png")
# end

# ╔═╡ d6d85087-9ecc-4043-9002-e4a6442b829e
md"""

# [AI-STUDY RESOURCE](https://notebooklm.google.com/notebook/f9f5eb4d-5782-4586-9f7e-abdb60f1b694)
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
#     @syms x::Real
#     f(x) = (x^4-2x^2+4x+1)/(x^3-x^2-x+1)
#     integrate(f(x),x)
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

# ╔═╡ b4599a16-e7f7-4a2a-b349-2648ee45208f
function rect(x, Δx, xs, f; direction=:x)
    if direction == :y
        Shape([(0, x), (0, x + Δx), (f(xs), x + Δx), (f(xs), x)])
    else
        Shape([(x, 0), (x + Δx, 0), (x + Δx, f(xs)), (x, f(xs))])
    end

end

# ╔═╡ 8315fb27-89e4-44a4-a51e-8e55fc3d58e5
function reimannSum(f, n, a, b; method="l", color=:green,
                    plot_it=false,
                    direction=:x,
                    partitioning=nothing
                   )
    Δx = (b - a) / n
    x = a:0.01:b
    # plot(f;xlim=(-2π,2π), xticks=(-2π:(π/2):2π,["$c π" for c in -2:0.5:2]))

    (partition, recs, ss) = if method == "r"
        parts = (a+Δx):Δx:b
        rcs = [rect(p - Δx, Δx, p, f; direction=direction) for p in parts]
        (parts, rcs, nothing)
    elseif method == "m"
        parts = (a+(Δx/2)):Δx:(b-(Δx/2))
        rcs = [rect(p - Δx / 2, Δx, p, f; direction=direction) for p in parts]
        (parts, rcs, nothing)
    elseif method == "l"
        parts = a:Δx:(b-Δx)
        rcs = [rect(p, Δx, p, f; direction=direction) for p in parts]
        (parts, rcs, nothing)
    elseif method == "u" # for user
        @assert !isnothing(partitioning) "You must provide a partitioning function."
        Δxs, parts = partitioning()
        rcs = [rect(parts[i]-Δxs[i], Δxs[i], parts[i], f; direction=direction) for i in 1:length(parts)]
        ss = round(sum(f.(parts) .* Δxs), sigdigits=6)
        (parts, rcs, ss)
    else
        parts = a:Δx:(b-Δx)
        rcs = [rect(p, Δx, rand(p:0.1:p+Δx), f; direction=direction) for p in parts]
        (parts, rcs, nothing)
    end
    # recs= [rect(sample(p,Δx),Δx,p,f) for p in partition]
    p = direction == :y ? plot(f.(x), x; legend=nothing) : plot(x, f.(x); legend=nothing)
    plot!(p, recs, framestyle=:origin, opacity=0.4, color=color)
    s = isnothing(ss) ? round(sum(f.(partition) * Δx), sigdigits=6) : ss
    return plot_it ? (p, s) : s
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
    See here [Term 252 - MATH102 - Syllabus](https://math.kfupm.edu.sa/docs/default-source/css-library/math102-252.pdf)
    ## Textbook
    __Textbook:  Larson, R. & Edwards, B., Calculus: Early Transcendental Functions, Metric Version, 7th edition, Cengage Learning, Inc., 2019.__
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
Find ``\displaystyle\int_0^1 \sin^{-1}x d x``.
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

# ╔═╡ 16f26878-cbe0-4ac1-a593-691a2fe55aca
cm"""
$(ex(2,"Repeated Linear Factors"))
Find
```math
\int  \frac{5x^2+20x+6}{x^3+2x^2+x}dx.
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
CommonMark = "~1.0.1"
HypertextLiteral = "~0.9.5"
IntervalArithmetic = "~1.0.3"
LaTeXStrings = "~1.4.0"
Latexify = "~0.16.10"
PlotThemes = "~3.3.0"
Plots = "~1.41.6"
PlutoExtras = "~0.7.18"
PlutoUI = "~0.7.80"
PrettyTables = "~3.3.2"
QRCoders = "~1.4.5"
SymPy = "~2.3.3"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.6"
manifest_format = "2.0"
project_hash = "9c3b817ffa81ef60e907588fdc68f2644388e5b0"

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
git-tree-sha1 = "4126b08903b777c88edf1754288144a0492c05ad"
uuid = "39de3d68-74b9-583c-8d2d-e117c070f3a9"
version = "0.4.8"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.BitFlags]]
git-tree-sha1 = "0691e34b3bb8be9307330f88d1a3c3f25466c24d"
uuid = "d1d4a3ce-64b1-5f1a-9ba4-7e7e69966f35"
version = "0.1.9"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1b96ea4a01afe0ea4090c5c8039690672dd13f2e"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.9+0"

[[deps.CEnum]]
git-tree-sha1 = "389ad5c84de1ae7cf0e28e381131c98ea87d54fc"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.5.0"

[[deps.CRlibm]]
deps = ["CRlibm_jll"]
git-tree-sha1 = "66188d9d103b92b6cd705214242e27f5737a1e5e"
uuid = "96374032-68de-5a5b-8d9e-752f78720389"
version = "1.0.2"

[[deps.CRlibm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e329286945d0cfc04456972ea732551869af1cfc"
uuid = "4e9b3aee-d8a1-5a3d-ad8b-7d824db253f0"
version = "1.0.1+0"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "Libdl", "Pixman_jll", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "d0efe2c6fdcdaa1c161d206aa8b933788397ec71"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.18.6+0"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "962834c22b66e32aa10f7611c08c8ca4e20749a9"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.8"

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
deps = ["PrecompileTools"]
git-tree-sha1 = "019ad9e55bb3549403f2d5a9b314fbb29a806ecb"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "1.0.1"

    [deps.CommonMark.extensions]
    CommonMarkMarkdownASTExt = "MarkdownAST"
    CommonMarkMarkdownExt = "Markdown"

    [deps.CommonMark.weakdeps]
    Markdown = "d6f4376e-aef5-505a-96c1-9c027394607a"
    MarkdownAST = "d0879d2d-cac2-40c8-9cee-1863dc0c7391"

[[deps.CommonSolve]]
git-tree-sha1 = "78ea4ddbcf9c241827e7035c3a03e2e456711470"
uuid = "38540f10-b2f7-11e9-35d8-d573e4eb0ff2"
version = "0.2.6"

[[deps.Compat]]
deps = ["TOML", "UUIDs"]
git-tree-sha1 = "9d8a54ce4b17aa5bdce0ea5c34bc5e7c340d16ad"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.18.1"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.3.0+1"

[[deps.ConcurrentUtilities]]
deps = ["Serialization", "Sockets"]
git-tree-sha1 = "21d088c496ea22914fe80906eb5bce65755e5ec8"
uuid = "f0e56b4a-5159-44fe-b623-3e5288b988bb"
version = "2.5.1"

[[deps.Conda]]
deps = ["Downloads", "JSON", "VersionParsing"]
git-tree-sha1 = "8f06b0cfa4c514c7b9546756dbae91fcfbc92dc9"
uuid = "8f4d0f93-b110-5947-807f-2305c1781a2d"
version = "1.10.3"

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
git-tree-sha1 = "4e1fe97fdaed23e9dc21d4d664bea76b65fc50a0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.22"

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
git-tree-sha1 = "473e9afc9cf30814eb67ffa5f2db7df82c3ad9fd"
uuid = "ee1fde0b-3d02-5ea6-8484-8dfef6360eab"
version = "1.16.2+0"

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
git-tree-sha1 = "7442a5dfe1ebb773c29cc2962a8980f47221d76c"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.5"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.7.0"

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
git-tree-sha1 = "9cb7fe11da6adb8683cbacf8aa9b5237941e3a75"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.7.5+0"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "95ecf07c2eea562b5adbd0696af6db62c0f52560"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.5"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libva_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "cac41ca6b2d399adfc95e51240566f8a60a80806"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "8.1.0+0"

[[deps.FFTW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6d6219a004b8cf1e0b4dbe27a2860b8e04eba0be"
uuid = "f5851436-0d7a-5f13-b9de-f02708fd171a"
version = "3.3.11+0"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "6522cfb3b8fe97bec632252263057996cbd3de20"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.18.0"
weakdeps = ["HTTP"]

    [deps.FileIO.extensions]
    HTTPExt = "HTTP"

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
git-tree-sha1 = "f85dac9a96a01087df6e3a749840015a0ca3817d"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.17.1+0"

[[deps.Format]]
git-tree-sha1 = "9c68794ef81b08086aeb32eeaf33531668d5f5fc"
uuid = "1fa38f19-a742-5d3f-a2b9-30dd87b9d5f8"
version = "1.3.7"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "70329abc09b886fd2c5d94ad2d9527639c421e3e"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.14.3+1"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "7a214fdac5ed5f59a22c2d9a885a16da1c74bbc7"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.17+0"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll", "libdecor_jll", "xkbcommon_jll"]
git-tree-sha1 = "9e0fb9e54594c47f278d75063980e43066e26e20"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.4.1+1"

[[deps.GR]]
deps = ["Artifacts", "Base64", "DelimitedFiles", "Downloads", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Preferences", "Printf", "Qt6Wayland_jll", "Random", "Serialization", "Sockets", "TOML", "Tar", "Test", "p7zip_jll"]
git-tree-sha1 = "44716a1a667cb867ee0e9ec8edc31c3e4aa5afdc"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.73.24"

    [deps.GR.extensions]
    IJuliaExt = "IJulia"

    [deps.GR.weakdeps]
    IJulia = "7073ff75-c697-5162-941a-fcdaad2a7d2a"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "FreeType2_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Qt6Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "be8a1b8065959e24fdc1b51402f39f3b6f0f6653"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.73.24+0"

[[deps.GettextRuntime_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll"]
git-tree-sha1 = "45288942190db7c5f760f59c04495064eedf9340"
uuid = "b0724c58-0f36-5564-988d-3bb0596ebc4a"
version = "0.22.4+0"

[[deps.Ghostscript_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Zlib_jll"]
git-tree-sha1 = "38044a04637976140074d0b0621c1edf0eb531fd"
uuid = "61579ee1-b43e-5ca0-a5da-69d92c66a64b"
version = "9.55.1+0"

[[deps.Giflib_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6570366d757b50fabae9f4315ad74d2e40c0560a"
uuid = "59f7168a-df46-5410-90c8-f2779963d0ec"
version = "5.2.3+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "GettextRuntime_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Zlib_jll"]
git-tree-sha1 = "24f6def62397474a297bfcec22384101609142ed"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.86.3+0"

[[deps.Graphics]]
deps = ["Colors", "LinearAlgebra", "NaNMath"]
git-tree-sha1 = "a641238db938fff9b2f60d08ed9030387daf428c"
uuid = "a2bd30eb-e257-5431-a919-1863eab51364"
version = "1.1.3"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8a6dbda1fd736d60cc477d99f2e7a042acfa46e8"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.15+0"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "ConcurrentUtilities", "Dates", "ExceptionUnwrapping", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "PrecompileTools", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "51059d23c8bb67911a2e6fd5130229113735fc7e"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.11.0"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll"]
git-tree-sha1 = "f923f9a774fcf3f5cb761bfa43aeadd689714813"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "8.5.1+0"

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
git-tree-sha1 = "0ee181ec08df7d7c911901ea38baf16f755114dc"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "1.0.0"

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
deps = ["FileIO", "ImageCore", "ImageMagick_jll", "InteractiveUtils"]
git-tree-sha1 = "8e64ab2f0da7b928c8ae889c514a52741debc1c2"
uuid = "6218d12a-5da1-5696-b52f-db25d2ecc6d1"
version = "1.4.2"

[[deps.ImageMagick_jll]]
deps = ["Artifacts", "Bzip2_jll", "FFTW_jll", "Ghostscript_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "OpenJpeg_jll", "Zlib_jll", "Zstd_jll", "libpng_jll", "libwebp_jll", "libzip_jll"]
git-tree-sha1 = "2c232857f2eb9ecfa3ab534df7f060c9afbeb187"
uuid = "c73af94c-d91f-53ed-93a7-00f77d67a9d7"
version = "7.1.2011+0"

[[deps.ImageMetadata]]
deps = ["AxisArrays", "ImageAxes", "ImageBase", "ImageCore"]
git-tree-sha1 = "355e2b974f2e3212a75dfb60519de21361ad3cb7"
uuid = "bc367c6b-8a6b-528e-b4bd-a4b897500b49"
version = "0.9.9"

[[deps.Imath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "dcc8d0cd653e55213df9b75ebc6fe4a8d3254c65"
uuid = "905a6f67-0a94-5f89-b386-d35d92009cd1"
version = "3.2.2+0"

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
deps = ["CRlibm", "MacroTools", "OpenBLASConsistentFPCSR_jll", "Printf", "Random", "RoundingEmulator"]
git-tree-sha1 = "2cce1fed119ca7b6cc230c4a3b85202478af7924"
uuid = "d1acc4aa-44c8-5952-acd4-ba5d80a2a253"
version = "1.0.3"

    [deps.IntervalArithmetic.extensions]
    IntervalArithmeticArblibExt = "Arblib"
    IntervalArithmeticDiffRulesExt = "DiffRules"
    IntervalArithmeticForwardDiffExt = "ForwardDiff"
    IntervalArithmeticIntervalSetsExt = "IntervalSets"
    IntervalArithmeticLinearAlgebraExt = "LinearAlgebra"
    IntervalArithmeticRecipesBaseExt = "RecipesBase"
    IntervalArithmeticSparseArraysExt = "SparseArrays"

    [deps.IntervalArithmetic.weakdeps]
    Arblib = "fb37089c-8514-4489-9461-98f9c8763369"
    DiffRules = "b552c78f-8df3-52c6-915a-8e097449b14b"
    ForwardDiff = "f6369f11-7733-5829-9624-2563aa707210"
    IntervalSets = "8197267c-284f-5f27-9208-e0e47529a953"
    LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
    RecipesBase = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.IntervalSets]]
git-tree-sha1 = "d966f85b3b7a8e49d034d27a189e9a4874b4391a"
uuid = "8197267c-284f-5f27-9208-e0e47529a953"
version = "0.7.13"
weakdeps = ["Random", "RecipesBase", "Statistics"]

    [deps.IntervalSets.extensions]
    IntervalSetsRandomExt = "Random"
    IntervalSetsRecipesBaseExt = "RecipesBase"
    IntervalSetsStatisticsExt = "Statistics"

[[deps.IrrationalConstants]]
git-tree-sha1 = "b2d91fe939cae05960e760110b328288867b5758"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.6"

[[deps.IterTools]]
git-tree-sha1 = "42d5f897009e7ff2cf88db414a389e5ed1bdd023"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.10.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLFzf]]
deps = ["REPL", "Random", "fzf_jll"]
git-tree-sha1 = "82f7acdc599b65e0f8ccd270ffa1467c21cb647b"
uuid = "1019f520-868f-41f5-a6de-eb00f4b6a39c"
version = "0.1.11"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "0533e564aae234aff59ab625543145446d8b6ec2"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.7.1"

[[deps.JSON]]
deps = ["Dates", "Logging", "Parsers", "PrecompileTools", "StructUtils", "UUIDs", "Unicode"]
git-tree-sha1 = "67c6f1f085cb2671c93fe34244c9cccde30f7a26"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "1.5.0"

    [deps.JSON.extensions]
    JSONArrowExt = ["ArrowTypes"]

    [deps.JSON.weakdeps]
    ArrowTypes = "31f734f8-188a-4ce0-8406-c8a06bd891cd"

[[deps.JpegTurbo]]
deps = ["CEnum", "FileIO", "ImageCore", "JpegTurbo_jll", "TOML"]
git-tree-sha1 = "9496de8fb52c224a2e3f9ff403947674517317d9"
uuid = "b835a17e-a41a-41e7-81f0-2f016b05efe0"
version = "0.1.6"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "c0c9b76f3520863909825cbecdef58cd63de705a"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "3.1.5+0"

[[deps.JuliaSyntaxHighlighting]]
deps = ["StyledStrings"]
uuid = "ac6e5ff7-fb65-4e79-a425-ec3bc9c03011"
version = "1.12.0"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "059aabebaa7c82ccb853dd4a0ee9d17796f7e1bc"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.3+0"

[[deps.LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "17b94ecafcfa45e8360a4fc9ca6b583b049e4e37"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "4.1.0+0"

[[deps.LLVMOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "eb62a3deb62fc6d8822c0c4bef73e4412419c5d8"
uuid = "1d63c593-3942-5779-bab2-d838dc0a180e"
version = "18.1.8+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "dda21b8cbd6a6c40d9d02a73230f9d70fed6918c"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.4.0"

[[deps.Latexify]]
deps = ["Format", "Ghostscript_jll", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Requires"]
git-tree-sha1 = "44f93c47f9cd6c7e431f2f2091fcba8f01cd7e8f"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.10"

    [deps.Latexify.extensions]
    DataFramesExt = "DataFrames"
    SparseArraysExt = "SparseArrays"
    SymEngineExt = "SymEngine"
    TectonicExt = "tectonic_jll"

    [deps.Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"
    tectonic_jll = "d7dd28d6-a5e6-559c-9131-7eb760cdacc5"

[[deps.LazyModules]]
git-tree-sha1 = "a560dd966b386ac9ae60bdd3a3d3a326062d3c3e"
uuid = "8cdb02fc-e678-4876-92c5-9defec4f444e"
version = "0.3.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.15.0+0"

[[deps.LibGit2]]
deps = ["LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.9.0+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "OpenSSL_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.3+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "c8da7e6a91781c41a863611c7e966098d783c57a"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.4.7+0"

[[deps.Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "d36c21b9e7c172a44a10484125024495e2625ac0"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.7.1+1"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "be484f5c92fad0bd8acfef35fe017900b0b73809"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.18.0+0"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "cc3ad4faf30015a3e8094c9b5b7f19e85bdf2386"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.42.0+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "XZ_jll", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "f04133fe05eff1667d2054c53d59f9122383fe05"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.7.2+0"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "d620582b1f0cbe2c72dd1d5bd195a9ce73370ab1"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.42.0+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.12.0"

[[deps.LittleCMS_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll"]
git-tree-sha1 = "8e6a74641caf3b84800f2ccd55dc7ab83893c10b"
uuid = "d3a379c0-f9a3-5b72-a4c0-6bf4d2e8af0f"
version = "2.17.0+0"

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
git-tree-sha1 = "f00544d95982ea270145636c181ceda21c4e2575"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "1.2.0"

[[deps.MIMEs]]
git-tree-sha1 = "c64d943587f7187e751162b3b84445bbbd79f691"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "1.1.0"

[[deps.MacroTools]]
git-tree-sha1 = "1e0228a030642014fe5cfe68c2c0a818f9e3f522"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.16"

[[deps.MappedArrays]]
git-tree-sha1 = "0ee4497a4e80dbd29c058fcee6493f5219556f40"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.3"

[[deps.MarchingCubes]]
deps = ["PrecompileTools", "StaticArrays"]
git-tree-sha1 = "0e893025924b6becbae4109f8020ac0e12674b01"
uuid = "299715c1-40a9-479a-aaf9-4a633d36f717"
version = "0.1.11"

[[deps.Markdown]]
deps = ["Base64", "JuliaSyntaxHighlighting", "StyledStrings"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "NetworkOptions", "Random", "Sockets"]
git-tree-sha1 = "8785729fa736197687541f7053f6d8ab7fc44f92"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.10"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "ff69a2b1330bcb730b9ac1ab7dd680176f5896b8"
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.1010+0"

[[deps.Measures]]
git-tree-sha1 = "b513cedd20d9c914783d8ad83d08120702bf2c77"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.3"

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
version = "2025.11.4"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "9b8215b1ee9e78a293f99797cd31375471b2bcae"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.1.3"

[[deps.Netpbm]]
deps = ["FileIO", "ImageCore", "ImageMetadata"]
git-tree-sha1 = "d92b107dbb887293622df7697a2223f9f8176fcd"
uuid = "f09324ee-3d7c-5217-9330-fc30815ba969"
version = "1.1.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.3.0"

[[deps.OffsetArrays]]
git-tree-sha1 = "117432e406b5c023f665fa73dc26e79ec3630151"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.17.0"

    [deps.OffsetArrays.extensions]
    OffsetArraysAdaptExt = "Adapt"

    [deps.OffsetArrays.weakdeps]
    Adapt = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "b6aa4566bb7ae78498a5e68943863fa8b5231b59"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.6+0"

[[deps.OpenBLASConsistentFPCSR_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "f2b3b9e52a5eb6a3434c8cca67ad2dde011194f4"
uuid = "6cdc7f73-28fd-5e50-80fb-958a8875b1af"
version = "0.3.30+0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.29+0"

[[deps.OpenEXR]]
deps = ["Colors", "FileIO", "OpenEXR_jll"]
git-tree-sha1 = "97db9e07fe2091882c765380ef58ec553074e9c7"
uuid = "52e1d378-f018-4a11-a4be-720524705ac7"
version = "0.3.3"

[[deps.OpenEXR_jll]]
deps = ["Artifacts", "Imath_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "135492b7e97fc86d9b132b96a54d2d3dd3e0c6a8"
uuid = "18a262bb-aa17-5467-a713-aee519bc75cb"
version = "3.4.8+0"

[[deps.OpenJpeg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libtiff_jll", "LittleCMS_jll", "libpng_jll"]
git-tree-sha1 = "215a6666fee6d6b3a6e75f2cc22cb767e2dd393a"
uuid = "643b3616-a352-519d-856d-80112ee9badc"
version = "2.5.5+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.7+0"

[[deps.OpenSSL]]
deps = ["BitFlags", "Dates", "MozillaCACerts_jll", "NetworkOptions", "OpenSSL_jll", "Sockets"]
git-tree-sha1 = "1d1aaa7d449b58415f97d2839c318b70ffb525a0"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.6.1"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.5.4+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "1346c9208249809840c91b26703912dff463d335"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.6+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e2bb57a313a74b8104064b7efd01406c0a50d2ff"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.6.1+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "05868e21324cede2207c6f0f466b4bfef6d5e7ee"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.8.1"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.44.0+1"

[[deps.PNGFiles]]
deps = ["Base64", "CEnum", "ImageCore", "IndirectArrays", "OffsetArrays", "libpng_jll"]
git-tree-sha1 = "cf181f0b1e6a18dfeb0ee8acc4a9d1672499626c"
uuid = "f57f5aa1-a3ce-4bc8-8ab9-96f992907883"
version = "0.4.4"

[[deps.PaddedViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "0fac6313486baae819364c52b4f483450a9d793f"
uuid = "5432bcbf-9aad-5242-b902-cca2824c8663"
version = "0.5.12"

[[deps.Pango_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "FriBidi_jll", "Glib_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl"]
git-tree-sha1 = "58e5ed5e386e156bd93e86b305ebd21ac63d2d04"
uuid = "36c8627f-9965-5494-a995-c6b170f724f3"
version = "1.57.1+0"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "7d2f8f21da5db6a806faf7b9b292296da42b2810"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.3"

[[deps.Pixman_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "LLVMOpenMP_jll", "Libdl"]
git-tree-sha1 = "db76b1ecd5e9715f3d043cec13b2ec93ce015d53"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.44.2+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.12.1"
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
git-tree-sha1 = "41031ef3a1be6f5bbbf3e8073f210556daeae5ca"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "3.3.0"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "PrecompileTools", "Printf", "Random", "Reexport", "StableRNGs", "Statistics"]
git-tree-sha1 = "26ca162858917496748aad52bb5d3be4d26a228a"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.4.4"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "JLFzf", "JSON", "LaTeXStrings", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "PrecompileTools", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "RelocatableFolders", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "TOML", "UUIDs", "UnicodeFun", "Unzip"]
git-tree-sha1 = "cb20a4eacda080e517e4deb9cfb6c7c518131265"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.41.6"

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
git-tree-sha1 = "ba293b0d67584aa71badebdf8e5e572ba61d0246"
uuid = "ed5d0301-4775-4676-b788-cf71e66ff8ed"
version = "0.7.18"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Downloads", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "fbc875044d82c113a9dee6fc14e16cf01fd48872"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.80"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "07a921781cab75691315adc645096ed5e370cb77"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.3.3"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "8b770b60760d4451834fe79dd483e318eee709c4"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.5.2"

[[deps.PrettyTables]]
deps = ["Crayons", "LaTeXStrings", "Markdown", "PrecompileTools", "Printf", "REPL", "Reexport", "StringManipulation", "Tables"]
git-tree-sha1 = "624de6279ab7d94fc9f672f0068107eb6619732c"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "3.3.2"

    [deps.PrettyTables.extensions]
    PrettyTablesTypstryExt = "Typstry"

    [deps.PrettyTables.weakdeps]
    Typstry = "f0ed7684-a786-439e-b1e3-3b82803b501e"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "fbb92c6c56b34e1a2c4c36058f68f332bec840e7"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.11.0"

[[deps.PyCall]]
deps = ["Conda", "Dates", "Libdl", "LinearAlgebra", "MacroTools", "Serialization", "VersionParsing"]
git-tree-sha1 = "9816a3826b0ebf49ab4926e2b18842ad8b5c8f04"
uuid = "438e738f-606a-5dbb-bf0a-cddfbfd45ab0"
version = "1.96.4"

[[deps.QOI]]
deps = ["ColorTypes", "FileIO", "FixedPointNumbers"]
git-tree-sha1 = "472daaa816895cb7aee81658d4e7aec901fa1106"
uuid = "4b34888f-f399-49d4-9bb3-47ed5cae4e65"
version = "1.0.2"

[[deps.QRCoders]]
deps = ["FileIO", "ImageCore", "ImageIO", "ImageMagick", "StatsBase", "UnicodePlots"]
git-tree-sha1 = "b3e5fcc7a7ade2d43f0ffd178c299b7a264c268a"
uuid = "f42e9828-16f3-11ed-2883-9126170b272d"
version = "1.4.5"

[[deps.Qt6Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Vulkan_Loader_jll", "Xorg_libSM_jll", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_cursor_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "libinput_jll", "xkbcommon_jll"]
git-tree-sha1 = "d7a4bff94f42208ce3cf6bc8e4e7d1d663e7ee8b"
uuid = "c0090381-4147-56d7-9ebc-da0b1113ec56"
version = "6.10.2+1"

[[deps.Qt6Declarative_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Qt6Base_jll", "Qt6ShaderTools_jll", "Qt6Svg_jll"]
git-tree-sha1 = "d5b7dd0e226774cbd87e2790e34def09245c7eab"
uuid = "629bc702-f1f5-5709-abd5-49b8460ea067"
version = "6.10.2+1"

[[deps.Qt6ShaderTools_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Qt6Base_jll"]
git-tree-sha1 = "4d85eedf69d875982c46643f6b4f66919d7e157b"
uuid = "ce943373-25bb-56aa-8eca-768745ed7b5a"
version = "6.10.2+1"

[[deps.Qt6Svg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Qt6Base_jll"]
git-tree-sha1 = "81587ff5ff25a4e1115ce191e36285ede0334c9d"
uuid = "6de9746b-f93d-5813-b365-ba18ad4a9cf3"
version = "6.10.2+0"

[[deps.Qt6Wayland_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Qt6Base_jll", "Qt6Declarative_jll"]
git-tree-sha1 = "672c938b4b4e3e0169a07a5f227029d4905456f2"
uuid = "e99dba38-086e-5de3-a5b1-6e4c66e897c3"
version = "6.10.2+1"

[[deps.REPL]]
deps = ["InteractiveUtils", "JuliaSyntaxHighlighting", "Markdown", "Sockets", "StyledStrings", "Unicode"]
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
git-tree-sha1 = "62389eeff14780bfe55195b7204c0d8738436d64"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.1"

[[deps.RoundingEmulator]]
git-tree-sha1 = "40b9edad2e5287e05bd413a38f61a8ff55b9557b"
uuid = "5eaf0fd0-dfba-4ccb-bf02-d820a40db705"
version = "0.2.1"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.SIMD]]
deps = ["PrecompileTools"]
git-tree-sha1 = "e24dc23107d426a096d3eae6c165b921e74c18e4"
uuid = "fdea26ae-647d-5447-a871-4b548cad5224"
version = "3.7.2"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "9b81b8393e50b7d4e6d0a9f14e192294d3b7c109"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.3.0"

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
git-tree-sha1 = "be8eeac05ec97d379347584fa9fe2f5f76795bcb"
uuid = "699a6c99-e7fa-54fc-8d76-47d257e15c1d"
version = "0.9.5"

[[deps.Sixel]]
deps = ["Dates", "FileIO", "ImageCore", "IndirectArrays", "OffsetArrays", "REPL", "libsixel_jll"]
git-tree-sha1 = "0494aed9501e7fb65daba895fb7fd57cc38bc743"
uuid = "45858cf5-a6b0-47a3-bbea-62219f50df47"
version = "0.1.5"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"
version = "1.11.0"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "64d974c2e6fdf07f8155b5b2ca2ffa9069b608d9"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.2.2"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.12.0"

[[deps.SpecialFunctions]]
deps = ["IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "2700b235561b0335d5bef7097a111dc513b8655e"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.7.2"

    [deps.SpecialFunctions.extensions]
    SpecialFunctionsChainRulesCoreExt = "ChainRulesCore"

    [deps.SpecialFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"

[[deps.StableRNGs]]
deps = ["Random"]
git-tree-sha1 = "4f96c596b8c8258cc7d3b19797854d368f243ddc"
uuid = "860ef19b-820b-49d6-a774-d7a799459cd3"
version = "1.0.4"

[[deps.StackViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "be1cf4eb0ac528d96f5115b4ed80c26a8d8ae621"
uuid = "cae243ae-269e-4f55-b966-ac2d0dc13c15"
version = "0.1.2"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "PrecompileTools", "Random", "StaticArraysCore"]
git-tree-sha1 = "246a8bb2e6667f832eea063c3a56aef96429a3db"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.9.18"

    [deps.StaticArrays.extensions]
    StaticArraysChainRulesCoreExt = "ChainRulesCore"
    StaticArraysStatisticsExt = "Statistics"

    [deps.StaticArrays.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StaticArraysCore]]
git-tree-sha1 = "6ab403037779dae8c514bad259f32a447262455a"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.4"

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
git-tree-sha1 = "178ed29fd5b2a2cfc3bd31c13375ae925623ff36"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.8.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "d1bf48bfcc554a3761a133fe3a9bb01488e06916"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.21"

[[deps.StringManipulation]]
deps = ["PrecompileTools"]
git-tree-sha1 = "d05693d339e37d6ab134c5ab53c29fce5ee5d7d5"
uuid = "892a3eda-7b42-436c-8928-eab12a02cf0e"
version = "0.4.4"

[[deps.StructUtils]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "86f5831495301b2a1387476cb30f86af7ab99194"
uuid = "ec057cc2-7a8d-4b58-b3b3-92acb9f63b42"
version = "2.8.0"

    [deps.StructUtils.extensions]
    StructUtilsMeasurementsExt = ["Measurements"]
    StructUtilsStaticArraysCoreExt = ["StaticArraysCore"]
    StructUtilsTablesExt = ["Tables"]

    [deps.StructUtils.weakdeps]
    Measurements = "eff96d63-e80a-5855-80a2-b1b0885c5ab7"
    StaticArraysCore = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
    Tables = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.8.3+2"

[[deps.SymPy]]
deps = ["CommonEq", "CommonSolve", "LinearAlgebra", "PyCall", "SpecialFunctions", "SymPyCore"]
git-tree-sha1 = "d3c2de8adc6e36352d2a2dae3ae87099964fcbc0"
uuid = "24249f21-da20-56a4-8eb1-6a02cf4ae2e6"
version = "2.3.3"

[[deps.SymPyCore]]
deps = ["CommonEq", "CommonSolve", "Latexify", "LinearAlgebra", "Markdown", "RecipesBase", "SpecialFunctions", "TermInterface"]
git-tree-sha1 = "efca83098a5badccda86498fd692a88d26c12ade"
uuid = "458b697b-88f0-4a86-b56b-78b75cfb3531"
version = "0.3.3"

    [deps.SymPyCore.extensions]
    SymPyCoreSymbolicUtilsExt = "SymbolicUtils"

    [deps.SymPyCore.weakdeps]
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
git-tree-sha1 = "f2c1efbc8f3a609aadf318094f8fc5204bdaf344"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.12.1"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.TermInterface]]
git-tree-sha1 = "d673e0aca9e46a2f63720201f55cc7b3e7169b16"
uuid = "8ea1fca8-c5ef-4a55-8b96-4e9afe9c9a3c"
version = "2.0.0"

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
git-tree-sha1 = "311349fd1c93a31f783f977a71e8b062a57d4101"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.13"

[[deps.URIs]]
git-tree-sha1 = "bef26fb046d031353ef97a82e3fdb6afe7f21b1a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.6.1"

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
deps = ["Contour", "Crayons", "Dates", "LinearAlgebra", "MarchingCubes", "NaNMath", "SparseArrays", "StaticArrays", "StatsBase"]
git-tree-sha1 = "66f9127e995e4eab4041c5f01d644a7278ac8bc2"
uuid = "b8865327-cd53-5732-bb35-84acbb429228"
version = "2.8.1"

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
deps = ["Artifacts", "EpollShim_jll", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll"]
git-tree-sha1 = "96478df35bbc2f3e1e791bc7a3d0eeee559e60e9"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.24.0+0"

[[deps.XZ_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "b29c22e245d092b8b4e8d3c09ad7baa586d9f573"
uuid = "ffd25f8a-64ca-5728-b0f7-c24cf3aae800"
version = "5.8.3+0"

[[deps.Xorg_libICE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "a3ea76ee3f4facd7a64684f9af25310825ee3668"
uuid = "f67eecfb-183a-506d-b269-f58e52b52d7c"
version = "1.1.2+0"

[[deps.Xorg_libSM_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libICE_jll"]
git-tree-sha1 = "9c7ad99c629a44f81e7799eb05ec2746abb5d588"
uuid = "c834827a-8449-5923-a945-d239c165b7dd"
version = "1.2.6+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "808090ede1d41644447dd5cbafced4731c56bd2f"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.8.13+0"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "aa1261ebbac3ccc8d16558ae6799524c450ed16b"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.13+0"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "6c74ca84bbabc18c4547014765d194ff0b4dc9da"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.4+0"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "52858d64353db33a56e13c341d7bf44cd0d7b309"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.6+0"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "1a4a26870bf1e5d26cd585e38038d399d7e65706"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.8+0"

[[deps.Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "75e00946e43621e09d431d9b95818ee751e6b2ef"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "6.0.2+0"

[[deps.Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "a376af5c7ae60d29825164db40787f15c80c7c54"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.8.3+0"

[[deps.Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXext_jll"]
git-tree-sha1 = "0ba01bc7396896a4ace8aab67db31403c71628f4"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.7+0"

[[deps.Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "6c174ef70c96c76f4c3f4d3cfbe09d018bcd1b53"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.6+0"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "7ed9347888fac59a618302ee38216dd0379c480d"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.12+0"

[[deps.Xorg_libpciaccess_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "4909eb8f1cbf6bd4b1c30dd18b2ead9019ef2fad"
uuid = "a65dc6b1-eb27-53a1-bb3e-dea574b5389e"
version = "0.18.1+0"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libXau_jll", "Xorg_libXdmcp_jll"]
git-tree-sha1 = "bfcaf7ec088eaba362093393fe11aa141fa15422"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.17.1+0"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "ed756a03e95fff88d8f738ebc2849431bdd4fd1a"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.2.0+0"

[[deps.Xorg_xcb_util_cursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_jll", "Xorg_xcb_util_renderutil_jll"]
git-tree-sha1 = "9750dc53819eba4e9a20be42349a6d3b86c7cdf8"
uuid = "e920d4aa-a673-5f3a-b3d7-f755a4d47c43"
version = "0.1.6+0"

[[deps.Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xcb_util_jll"]
git-tree-sha1 = "f4fc02e384b74418679983a97385644b67e1263b"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.1+0"

[[deps.Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxcb_jll"]
git-tree-sha1 = "68da27247e7d8d8dafd1fcf0c3654ad6506f5f97"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.1+0"

[[deps.Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xcb_util_jll"]
git-tree-sha1 = "44ec54b0e2acd408b0fb361e1e9244c60c9c3dd4"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.1+0"

[[deps.Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xcb_util_jll"]
git-tree-sha1 = "5b0263b6d080716a02544c55fdff2c8d7f9a16a0"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.10+0"

[[deps.Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xcb_util_jll"]
git-tree-sha1 = "f233c83cad1fa0e70b7771e0e21b061a116f2763"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.2+0"

[[deps.Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "801a858fc9fb90c11ffddee1801bb06a738bda9b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.7+0"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "00af7ebdc563c9217ecc67776d1bbf037dbcebf4"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.44.0+0"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "a63799ff68005991f9d9491b6e95bd3478d783cb"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.6.0+0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.3.1+2"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "446b23e73536f84e8037f5dce465e92275f6a308"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.7+1"

[[deps.eudev_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "c3b0e6196d50eab0c5ed34021aaa0bb463489510"
uuid = "35ca27e7-8b34-5b7f-bca9-bdc33f59eb06"
version = "3.2.14+0"

[[deps.fzf_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "b6a34e0e0960190ac2a4363a1bd003504772d631"
uuid = "214eeab7-80f7-51ab-84ad-2988db7cef09"
version = "0.61.1+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "850b06095ee71f0135d644ffd8a52850699581ed"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.13.3+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "125eedcb0a4a0bba65b657251ce1d27c8714e9d6"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.17.4+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.15.0+0"

[[deps.libdecor_jll]]
deps = ["Artifacts", "Dbus_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pango_jll", "Wayland_jll", "xkbcommon_jll"]
git-tree-sha1 = "9bf7903af251d2050b467f76bdbe57ce541f7f4f"
uuid = "1183f4f0-6f2a-5f1a-908b-139f9cdfea6f"
version = "0.2.2+0"

[[deps.libdrm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libpciaccess_jll"]
git-tree-sha1 = "63aac0bcb0b582e11bad965cef4a689905456c03"
uuid = "8e53e030-5e6c-5a89-a30b-be5b7263a166"
version = "2.4.125+1"

[[deps.libevdev_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "56d643b57b188d30cccc25e331d416d3d358e557"
uuid = "2db6ffa8-e38f-5e21-84af-90c45d0032cc"
version = "1.13.4+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "646634dd19587a56ee2f1199563ec056c5f228df"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.4+0"

[[deps.libinput_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "eudev_jll", "libevdev_jll", "mtdev_jll"]
git-tree-sha1 = "91d05d7f4a9f67205bd6cf395e488009fe85b499"
uuid = "36db933b-70db-51c0-b978-0f229ee0e533"
version = "1.28.1+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "e51150d5ab85cee6fc36726850f0e627ad2e4aba"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.58+0"

[[deps.libsixel_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "libpng_jll"]
git-tree-sha1 = "c1733e347283df07689d71d61e14be986e49e47a"
uuid = "075b6546-f08a-558a-be8f-8157d0f608a5"
version = "1.10.5+0"

[[deps.libva_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll", "Xorg_libXext_jll", "Xorg_libXfixes_jll", "libdrm_jll"]
git-tree-sha1 = "7dbf96baae3310fe2fa0df0ccbb3c6288d5816c9"
uuid = "9a156e7d-b971-5f62-b2c9-67348b8fb97c"
version = "2.23.0+0"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll"]
git-tree-sha1 = "11e1772e7f3cc987e9d3de991dd4f6b2602663a5"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.8+0"

[[deps.libwebp_jll]]
deps = ["Artifacts", "Giflib_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libglvnd_jll", "Libtiff_jll", "libpng_jll"]
git-tree-sha1 = "4e4282c4d846e11dce56d74fa8040130b7a95cb3"
uuid = "c5f90fcd-3b7e-5836-afba-fc50a0988cb2"
version = "1.6.0+0"

[[deps.libzip_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "OpenSSL_jll", "XZ_jll", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "86addc139bca85fdf9e7741e10977c45785727b7"
uuid = "337d8026-41b4-5cde-a456-74a10e5b31d1"
version = "1.11.3+0"

[[deps.mtdev_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "b4d631fd51f2e9cdd93724ae25b2efc198b059b1"
uuid = "009596ad-96f7-51b1-9f1b-5ce2d5e8a71e"
version = "1.1.7+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.64.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.7.0+0"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "14cc7083fc6dff3cc44f2bc435ee96d06ed79aa7"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "10164.0.1+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e7b67590c14d487e734dcb925924c5dc43ec85f3"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "4.1.0+0"

[[deps.xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "a1fc6507a40bf504527d0d4067d718f8e179b2b8"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "1.13.0+0"
"""

# ╔═╡ Cell order:
# ╠═71bc54d5-d0ed-42d3-9bc1-48aa86e91d1d
# ╠═e414122f-b93a-4510-b8ae-026c303e0df9
# ╟─8408e369-40eb-4f9b-a7d7-26cde3e34a74
# ╠═cd269caf-ef81-43d7-a1a8-6668932b6363
# ╠═d6d85087-9ecc-4043-9002-e4a6442b829e
# ╠═8f8766fa-c168-4f09-8703-347a139b7069
# ╠═598055ab-2b36-481e-bb7d-65edfcfe183b
# ╠═200f43c8-fd32-438e-9582-a995a4026086
# ╠═681e1450-4011-43c8-ab66-26e0c073ee3d
# ╠═6cc99632-805b-4fcd-98f0-96da071afdb9
# ╠═e938f5a1-7037-47c7-9e96-ed0c7341c4f2
# ╠═57037db4-318e-40df-af33-f2be564acf56
# ╠═7588b15a-3b1e-4232-96e6-45e254c10362
# ╠═9280e821-4518-4697-b55e-a3b806d748e1
# ╠═7a19b897-5d02-4577-81a1-2a33ed5f8bb9
# ╠═d41e0530-1b75-412c-828c-d53a58523293
# ╠═3888f083-86e2-4edb-a700-62028ad295b4
# ╠═7d50c4c7-e6f0-43b7-8583-7b47cbcc2156
# ╠═9a0bbdd2-c9fe-4932-94f3-3727baa6b9a6
# ╠═5c4497e8-e02d-4265-ba7c-aa607231ee6d
# ╠═fa99131e-13b2-4f4a-a752-4afd26b6596c
# ╠═a856ee7d-a0d9-4d4b-aa13-449a827a954d
# ╠═507bc0c8-ef40-4ef4-ac3f-b66ae162362f
# ╠═42dee241-13c6-4d89-bce0-bac4e846cf7d
# ╠═2ada5eca-3ab9-444b-8350-153cf62abd3b
# ╠═c2941250-feac-4855-97d5-f88c35ed689a
# ╠═e40ba504-6b6c-4abc-81c8-67db621b90de
# ╠═4ec721e0-f0e4-492b-8791-87b876c57e6b
# ╠═cdd3a632-1020-4df5-b4cf-00a10b6fd255
# ╠═e5c79a58-bd0e-4490-bfee-9cf7938472ff
# ╠═6158d974-6a19-4a84-bb10-a9488fca001b
# ╠═2c66e4aa-69f7-4bc1-8299-1902a557e21f
# ╠═b7c18135-6b5a-4ca6-8169-9643f0815b3b
# ╠═b27f07f2-881c-42f0-8d9d-c49c4c54b780
# ╠═95099f5d-61ee-44ca-8d51-b01446f29649
# ╠═b0938d8a-a9b4-4551-9731-7bc738b88e85
# ╠═db377636-d9b6-4742-bf42-050a31860ad2
# ╠═76e4c36b-0cc8-4042-9c63-0610cb669ec9
# ╠═dd402f3e-4580-41e6-89c5-d6e1eba01b63
# ╠═d808a001-48ea-4eaa-9501-27d486133480
# ╠═d1ea53cf-eb1e-4f7a-ad9d-f6f58f48d0b1
# ╠═14ea163c-854d-453d-8e00-67571751653d
# ╠═a533908e-9bb0-4cf5-984f-51a5f099db8f
# ╠═22e8b5e8-8343-4e74-9f28-4b268e3157af
# ╠═11ebe671-ede6-438d-a896-45eca3beb94c
# ╠═c08feccc-e1aa-4a23-a42e-798dfe4278eb
# ╠═f943eff3-357b-4a33-a272-fdf3a7d80a5f
# ╠═da070497-1db3-4250-8d45-128daf2ff54f
# ╠═c2d68428-99c5-45fb-b056-a1c0ae5f06ad
# ╠═5ad8d84d-9f32-4378-bd22-f6004023076c
# ╠═077175a1-b3e0-467b-b5bd-b52616e3936f
# ╠═4ebfeece-3528-43e0-a70f-9e901b28b930
# ╠═f65d043c-24ab-4c73-8da9-653ec0f57298
# ╠═4eee2e8b-85b3-4986-9e5d-bfea119302dc
# ╠═3de417dd-e670-4e28-bb27-88abe5476f84
# ╠═16f26878-cbe0-4ac1-a593-691a2fe55aca
# ╠═bc944bad-3868-4fca-af1d-0a6e6ffffbb7
# ╠═7daad386-47a2-44d7-9af8-743d5712cec0
# ╠═98e43437-09c0-4b5d-b5b2-cb38d3d1ca20
# ╠═f8dc9ccf-df39-47a4-b80a-78cc262cfdeb
# ╠═72974703-d483-4d3c-be80-b89c7d7c503f
# ╠═ff9221cc-70e3-4f14-9bf8-8340874c17c3
# ╠═318706d0-ad9a-4a1e-b3de-f02020b6ab52
# ╠═dbd5a0da-cafb-4537-9410-215d87bdc60e
# ╠═0cef9fcd-3734-4694-ad23-ca1465d1f96e
# ╠═98f709cb-cccf-42a7-af35-e026f7369bb8
# ╠═0a6c72ed-f6f0-4534-ba96-581e685a3d94
# ╠═dbd92a84-14c0-4510-9f9f-39e90f50c30e
# ╠═c2ded1c8-a0a7-48cb-bf1d-7616796a5062
# ╠═963f8130-c7f7-4b57-8bac-64c92b46c53a
# ╠═4098c133-f9d4-4198-a39b-f8fa93bf0774
# ╠═71c6a056-c512-4f00-8195-a6de36bc98c8
# ╠═3f727233-8150-4008-8fb5-2a83ba616e1e
# ╠═f7b555c6-5844-4971-8693-a8ada5074b20
# ╠═dd990994-e154-4d4e-bca7-7fce46fb193b
# ╠═aa08f4c7-f3f3-4dc1-874f-e59e50d62e89
# ╠═724736c2-d020-444c-ac64-8c35fb5aed5a
# ╠═b7b3ab16-92e7-4e52-ae8f-42675eb8ade1
# ╠═c5e81c70-28ae-409b-bb4b-41418fc62fab
# ╠═d656cb73-ab16-4d06-80c3-2432fe752c59
# ╠═0183ce38-0911-49ff-a120-ed8ba21fdda3
# ╠═f2d4c2a5-f486-407b-b31b-d2efcc7476b3
# ╠═b4599a16-e7f7-4a2a-b349-2648ee45208f
# ╠═8315fb27-89e4-44a4-a51e-8e55fc3d58e5
# ╠═ef081dfa-b610-4c7a-a039-7258f4f6e80e
# ╠═da9230a6-088d-4735-b206-9514c12dd223
# ╠═107407c8-5da0-4833-9965-75a82d84a0fb
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
