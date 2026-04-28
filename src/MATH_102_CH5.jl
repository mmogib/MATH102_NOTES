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
# ╔═╡ 4da75997-9674-4775-b095-bcf0c0a64b93
# sum(2k^2 for k in 1:12), 2*12*(2*12+1)*(12+1)/6
# ╔═╡ d60ca33d-fa31-49a2-9a4a-dfc54aef46ae
cm"""
$(ex())

Evaluate ``\displaystyle \sum_{i=1}^n\frac{i+1}{n^2}`` for ``n=10, 100, 1000`` and ``10,000``.

"""
# ╔═╡ 6caae83a-3aa3-4f79-9f05-fb969f952286
md"## Area "
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
# ╔═╡ 73c7417c-a035-4202-83f1-45e9897e8871
md"## The Area of a Plane Region"
# ╔═╡ 9f50c8be-95e8-4c28-81b4-8ccd638505af
cm"""


$(ex())

Use __five__ rectangles to find two approximations of the area of the region lying between the graph of
```math
f(x)=5-x^2
```
and the ``x``-axis between ``x=0`` and ``x=2``.
"""
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
# ╔═╡ f80cc26d-120b-4f14-b31e-b50c9283c0b9
let
    if showPlot == "show"
        theme(:wong)
        anchor1 = 0.5
		# tks = map(i->Strint)
        (p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true)
		xticks!(p,round.([a:(b-a)/n:2.0]...,digits=2))	
        annotate!(p, [(anchor1, f(anchor1) - 2, text(L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$", 12, n > 500 ? :white : :black))])
        annotate!(p, [(anchor1 + 0.5, f(anchor1 + 0.1), text(L"$y=%$f(x)$", 12, :black))])

        md""" 	

        $p
        """
    end

end
# ╔═╡ 7086a5a8-d5ad-444b-8d14-056a3fdb99eb
@bind showConnc Radio(["show" => "✅", "hide" => "❌"], default="hide")
# ╔═╡ bb77f844-76c9-401f-8c2c-dcc5891b0a09
(showConnc == "show") ? md"""
  $$A=\lim_{n\to \infty} R_n =\lim_{n\to \infty} L_n =\frac{22}{3}$$
  """ : ""
# ╔═╡ 9463762b-50bb-49be-80be-5f67cb141d1c
md"## Finding Area by the Limit Definition"
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
# ╔═╡ 523d5a06-fafd-4d67-b8af-457b4d2f76e8
cm"""

```math
\begin{aligned}
& f\left(m_i\right)=\text { Minimum value of } f(x) \text { in } i \text { th subinterval } \\
& f\left(M_i\right)=\text { Maximum value of } f(x) \text { in } i \text { th subinterval }
\end{aligned}
```
```math
\binom{\text { Area of inscribed }}{\text { rectangle }}=f\left(m_i\right) \Delta x \leq f\left(M_i\right) \Delta x=\binom{\text { Area of circumscribed }}{\text { rectangle }}
```

```math
\begin{array}{ll}
\text { Lower sum }=s(n)=\displaystyle\sum_{i=1}^n f\left(m_i\right) \Delta x & \color{red}{\text { Area of inscribed rectangles }} \\
\text { Upper sum }=S(n)=\displaystyle\sum_{i=1}^n f\left(M_i\right) \Delta x & \textcolor{red}{ \text{Area of circumscribed rectangles} }
\end{array}
```
"""
# ╔═╡ 8f673110-65a1-4f6d-8de1-ebcfb49fb50d
cm"""
$(ex(4,"Finding Upper and Lower Sums for a Region"))
Find the upper and lower sums for the region bounded by the graph of ``f(x)=x^2`` and the ``x``-axis between ``x=0`` and ``x=2``.
"""
# ╔═╡ 8c2f85bb-9b81-4b70-b7e8-1a91e2738838
let
    n = 4
    lr = "r"
    f(x) = x^2
    a, b = 0, 2
    theme(:wong)
    anchor1 = 0.5
	(p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true)
    sum_text = if lr == "l"
        L"$\sum_{i=1}^{%$n} f (x_{i-1})\Delta x=%$s$"
    elseif lr == "r"
        L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$"
    else
        L"$\sum_{i=1}^{%$n} f (x^*_{i})\Delta x=%$s$"
    end
    annotate!(p, [(anchor1, f(anchor1) + 2, text(sum_text, 12, n > 500 ? :white : :black))])
    annotate!(p, [(1.2, f(1) + 0.1, text(L"$y=%$f(x)$", 12, :black))])

    md""" 	

    $p
    """

end
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
# ╔═╡ 208abdcc-dc12-4a08-a1f8-2177f95886f7
let
    n = 300
    lr = "r"
    f(x) = x^3
    a, b = 0, 1
    theme(:wong)
    anchor1 = 0.5
    (p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true)
    sum_text = if lr == "l"
        L"$\sum_{i=1}^{%$n} f (x_{i-1})\Delta x=%$s$"
    elseif lr == "r"
        L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$"
    else
        L"$\sum_{i=1}^{%$n} f (x^*_{i})\Delta x=%$s$"
    end

    annotate!(p, [(anchor1, f(anchor1) + 0.5, text(sum_text, 12, n > 500 ? :white : :black))])

    md""" 	

    $p
    """

end
# ╔═╡ 1615be4c-fb84-418f-8406-c274550cfb86
cm"""
$(ex(7,"A Region Bounded by the y-axis"))

Find the area of the region bounded by the graph of ``f(y)=y^2`` and the ``y``-axis for ``0\leq y\leq 1``.

"""
# ╔═╡ fd7161bc-1e1b-42e3-8758-c8e3e3ec0877
let
    n = 400
    lr = "l"
    f(y) = y^2
    a, b = 0, 1
    theme(:wong)
    anchor1 = 0.5
    (p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true, direction=:y)
    sum_text = if lr == "l"
        L"$\sum_{i=1}^{%$n} f (x_{i-1})\Delta x=%$s$"
    elseif lr == "r"
        L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$"
    else
        L"$\sum_{i=1}^{%$n} f (x^*_{i})\Delta x=%$s$"
    end

    annotate!(p, [(anchor1, f(anchor1) - 0.01, text(sum_text, 12, n > 500 ? :white : :black))])

    md""" 	

    $p
    """

end
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
# ╔═╡ 812de6c7-f5b3-4b93-bb44-ba147d6fc140
[sin(xi) for xi in (π/8):π/4:π]
# ╔═╡ 01008c60-bcfa-42a1-b5e8-fa67db2131ba
let
    n = 4
    lr = "m"
    f(x) = sin(x)
    a, b = 0, π
    theme(:wong)
    anchor1 = 0.5
    (p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true, direction=:x)
    sum_text = if lr == "l"
        L"$\sum_{i=1}^{%$n} f (x_{i-1})\Delta x=%$s$"
    elseif lr == "r"
        L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$"
    else
        L"$\sum_{i=1}^{%$n} f (x^*_{i})\Delta x=%$s$"
    end

    annotate!(p, [(anchor1 + 0.1, f(anchor1) + 0.4, text(sum_text, 12, n > 500 ? :white : :black))])

    md""" 	

    $p
    """

end
# ╔═╡ ee50e46d-6580-4a68-a061-6179c895a219
md"""#  5.3 Riemann Sums and Definite Integrals 

> __Objectives__
> 1. Understand the definition of a Riemann sum.
> 2. Evaluate a definite integral using limits and geometric formulas.
> 3. Evaluate a definite integral using properties of definite integrals.

"""
# ╔═╡ cff81ba7-fab6-4cd7-ba24-e4a9104177aa
cm"""
$(post_img("https://www.dropbox.com/scl/fi/wcig2f3t3ir3j26u5sdr4/info_5_2.png?rlkey=0pxq5ve3eegktvgtz6gk7hke8&dl=1"))
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
# ╔═╡ 1f0c53c0-611f-4b4e-9718-efac2f0b893d
begin
    ns2 = @bind n2 Slider(2:2000, show_value=true, default=4)
    as2 = @bind a2 NumberField(-10:10, default=0)
    bs2 = @bind b2 NumberField(a+1:10)
    lrs2 = @bind lr2 Select(["l" => "Left", "r" => "Right", "m" => "Midpoint", "rnd" => "Random","u"=>"User Defined"])
    md"""
    n = $ns2  a = $as2  b = $bs2 method = $lrs2


    """
end
# ╔═╡ a7c8710c-2256-425e-a946-0e2791773592
let
    n = n2
    lr = lr2
    f(x) = √x
    a, b = a2, b2
    theme(:wong)
    anchor1 = 0.15
	function parts()
		ci = [i^2/n^2 for i in 1:n]
		acib = vcat(a,ci)
		dxi =[acib[i+1]-acib[i] for i in 1:length(acib)-1]
		dxi, ci
	end
	parts()
    (p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true, direction=:x, partitioning=parts)
    sum_text = if lr == "l"
        L"$\sum_{i=1}^{%$n} f (x_{i-1})\Delta x=%$s$"
    elseif lr == "r"
        L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$"
    else
        L"$\sum_{i=1}^{%$n} f (x^*_{i})\Delta x=%$s$"
    end

    annotate!(p, [(anchor1 + 0.1, f(anchor1) + 0.4, text(sum_text, 12, n > 500 ? :white : :black))])

    md""" 	

    $p
    """

end
# ╔═╡ 6ecb0430-177c-4097-a94e-edbce61725d1
md"##  Riemann Sums"
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
# ╔═╡ 04922857-61ca-45a7-a3b4-cf35138e4847
md"## Definite Integral"
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
# ╔═╡ 7f7b1152-5dd0-4f97-b931-4fe74c51b3a3
cm"""
$(ex(3,"Kahoot it 😃"))
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
# ╔═╡ 5f37c3d1-449f-4a6d-9af5-55f9a4c8feec
begin
    s52q1Check = @bind s52q1chk Radio(["show", "hide"], default="hide")
    md"""$(s52q1Check)"""
end
# ╔═╡ 4aa43e57-d9a4-49da-b7d8-fe39d21df414
let
    val = s52q1chk == "show" ? 15 : ""
    cm" the nswer is = $val"
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
# ╔═╡ 229d9694-2751-479d-9872-218f7cea2261
md"## Properties of Definite Integrals"
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
	integrate(exp(x), (x,1,3))
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
__Kahoot 😃__

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
# ╔═╡ 17770e44-b45c-4505-bb61-213ff4eff007
cm"""
$(post_img("https://www.dropbox.com/scl/fi/8uc8l8b156oh01wwgrzh5/basic_integration_rules.png?rlkey=weir126wcflyahcs11ab7mknr&dl=1", 900))
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
    plot!(s54e3_p, [1, 1, NaN, exp(1), exp(1)], [0, 1.0, NaN, 0.0, exp(-1)], label=nothing, c=:black, lw=3)
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
# ╔═╡ fa78d2d3-afc7-40d8-9e06-4df6f65321ac
md"## The Mean Value Theorem for Integrals"
# ╔═╡ 269e3d73-0e11-4fcc-a291-031da9817541

cm"""


$(bth("Mean Value Theorem for Integrals"))

If ``f`` is continuous on the closed interval ``[a,b]``, then there exists a number ``c`` in the closed interval ``[a,b]`` such that
```math
\int_a^b f(x) dx =f(c)(b-a).
```
$(post_img("https://www.dropbox.com/s/7fnr2kfq082kq0y/mvt.jpg?raw=1",400))

"""
# ╔═╡ fa3f03ce-66a3-447b-ae37-47eef4f10aaa
md"## Average Value of a Function"
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
# ╔═╡ 56153ee8-aa22-40ba-bab3-235cc8b1fef6
let
    x = symbols("x", real=true)
    end_points = [0.0; 11.5; 22.0; 32.0; 50.0; 80.0]
    end_points_zipped = collect(zip(end_points[1:end-1], end_points[2:end]))
    As = map(((a, b,),) -> interval(a, b), end_points_zipped)
    piece_wise(x) = findlast(x -> x, map(t -> in_interval(x, t), As))
    fns = [x -> -4 * x + 341
        x -> 295.0 + x - x
        x -> (3 / 4) * x + 278.5
        x -> (3 / 2) * x + 254.5
        x -> -(3 / 2) * x + 404.5
    ]
    fns_sym = map(f -> f(x), fns)
    fns_int = [
        integrate(fns_sym[1], x)
        integrate(fns_sym[2], x)
        integrate(fns_sym[3], x)
        integrate(fns_sym[4], x)
        integrate(fns_sym[5], x)
    ]

    s(x) = fns[piece_wise(x)](x)

    n = 100
    xs = range(0.0, 80.0, length=n)
    plot(xs, s.(xs))
    distanse_0_80 = map(((i, (a, b),),) -> subs(fns_int[i], x, b) - subs(fns_int[i], x, a), enumerate(end_points_zipped)) |> sum

    Average_speed = (1 / 80) * distanse_0_80
end
# ╔═╡ b25051b6-8b33-4976-86b9-4db2166c291c
md"## The Second Fundamental Theorem of Calculus"
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
    ff(x) = 2 * x - x^2




    md"""
    
    A=$(integrate(ff(xx),(xx,0,2)))
    
    	
    """

end
# ╔═╡ df2dff93-465a-404a-9bf5-581907b99f42
md"## Net Change Theorem "
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
            xticks=(1:b1, map(i -> Symbol("$i"), 1:b1)),
            framestyle=:origin,
            label=nothing,
            xlabel="t",
            subplot=2,
            title="Velocity Graph"
        )
        annotate!(pp, [(xxx[i], 0.1, "t=$(t1[i])")], subplot=1)
        # annotate!(pp,[(5,8.2,("velocity graph",10))], subplot=2)
    end

    gif(anim, "net_change_ex10.gif", fps=15)
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
# ╔═╡ 22d44abf-34e3-496c-910a-5e51a7d90e10
md"""
## Change of Variables for Definite Integrals

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
# ╔═╡ 4bcc7833-6bfb-421f-b54f-3567aea00c1e

md"""
## Integration of Even and Odd Functions
"""
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
# ╔═╡ b2873160-bdc6-4883-b6a0-fe2b8295f97d

md"""
# 5.7 The Natural Logarithmic Function: Integration
> __Objectives__
> 1. Use the Log Rule for Integration to integrate a rational function.
> 2. Integrate trigonometric functions.
"""
# ╔═╡ 6406249d-f7ac-4ed7-a175-71e6dcdf55f2
md"## Log Rule for Integration"
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
# ╔═╡ efb4d714-dea7-428a-858c-70c9193ce150
md"## Completing the Square"
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
# ╔═╡ cad95270-ba9f-4821-87da-e457a00b9617
# begin
#     theme(:wong)
#     anchor1 = 0.5
#     (p, s) = reimannSum(f, n, a, b; method=lr, plot_it=true)

#     annotate!(p, [(anchor1, f(anchor1) - 2, text(L"$\sum_{i=1}^{%$n} f (x_{i})\Delta x=%$s$", 12, n > 500 ? :white : :black))])
#     annotate!(p, [(anchor1 + 0.5, f(anchor1 + 0.1), text(L"$y=%$f(x)$", 12, :black))])

#     md""" 	

#     $p
#     """

# end
# ╔═╡ 9b02faca-b5cb-442d-8a63-82f584b054fd




# begin
#     left_sum = reimannSum(f, n, a, b; method="l")
#     right_sum = reimannSum(f, n, a, b; method="r")
#     l_sum_txt = L"R_{%$n}= %$right_sum \leq A\leq %$left_sum =L_{%$n}"


#     l_sum_txt


# end

# ╔═╡ Cell order:
# ╠═71bc54d5-d0ed-42d3-9bc1-48aa86e91d1d
# ╠═e414122f-b93a-4510-b8ae-026c303e0df9
# ╠═8408e369-40eb-4f9b-a7d7-26cde3e34a74
# ╠═cd269caf-ef81-43d7-a1a8-6668932b6363
# ╠═d6d85087-9ecc-4043-9002-e4a6442b829e
# ╠═8b65d45c-ca7c-4e5d-9cfd-a7348547ebe0
# ╠═02c15fce-abf1-427e-b648-2554ee18ed5a
# ╠═38eabacb-a71a-448d-875d-7f7230dba49e
# ╠═bd6fff85-5fcc-4810-898d-d6f22b8e917d
# ╠═4da75997-9674-4775-b095-bcf0c0a64b93
# ╠═d60ca33d-fa31-49a2-9a4a-dfc54aef46ae
# ╠═6caae83a-3aa3-4f79-9f05-fb969f952286
# ╠═52333157-9913-489d-8784-dc3b542af1e9
# ╠═73c7417c-a035-4202-83f1-45e9897e8871
# ╠═9f50c8be-95e8-4c28-81b4-8ccd638505af
# ╠═0e340bfb-9807-4061-8901-62133ac44c5f
# ╠═ebd3dd41-7a3b-4d2b-9c1d-adca89f36af7
# ╠═19354aee-6de7-448f-8091-f6f68efdf84b
# ╠═f80cc26d-120b-4f14-b31e-b50c9283c0b9
# ╠═7086a5a8-d5ad-444b-8d14-056a3fdb99eb
# ╠═bb77f844-76c9-401f-8c2c-dcc5891b0a09
# ╠═9463762b-50bb-49be-80be-5f67cb141d1c
# ╠═15277097-7c11-4b03-8579-8f9c376361cd
# ╠═523d5a06-fafd-4d67-b8af-457b4d2f76e8
# ╠═8f673110-65a1-4f6d-8de1-ebcfb49fb50d
# ╠═8c2f85bb-9b81-4b70-b7e8-1a91e2738838
# ╠═f89bbb38-906b-45f3-9eff-617924e0b719
# ╠═a862aa36-d811-427d-bc1a-4502175b71f4
# ╠═b9434085-81d7-4a3d-bed5-deebea3cd48a
# ╠═208abdcc-dc12-4a08-a1f8-2177f95886f7
# ╠═1615be4c-fb84-418f-8406-c274550cfb86
# ╠═fd7161bc-1e1b-42e3-8758-c8e3e3ec0877
# ╠═38ab6c6d-c5e0-49f9-8c76-61e0b8dc13c6
# ╠═812de6c7-f5b3-4b93-bb44-ba147d6fc140
# ╠═01008c60-bcfa-42a1-b5e8-fa67db2131ba
# ╠═ee50e46d-6580-4a68-a061-6179c895a219
# ╠═cff81ba7-fab6-4cd7-ba24-e4a9104177aa
# ╠═845d8b0a-6550-49f4-9308-13ec2b2bd0c1
# ╠═1f0c53c0-611f-4b4e-9718-efac2f0b893d
# ╠═a7c8710c-2256-425e-a946-0e2791773592
# ╠═6ecb0430-177c-4097-a94e-edbce61725d1
# ╠═f98989fb-b59a-496f-be73-322b4dcb4960
# ╠═7e49b1d2-b6c5-4b84-ae6b-ac62d3f58d0c
# ╠═04922857-61ca-45a7-a3b4-cf35138e4847
# ╠═c19ba868-ca3b-4987-8e9b-eacffd6f9158
# ╠═982c228a-a8cd-42cd-a437-1b8c80c89cef
# ╠═3d54c0f4-3324-4bd6-adee-c343c5153392
# ╠═1937220c-4467-430b-a745-42294765b6a5
# ╠═1681a378-aea4-4e23-85a7-5c5731742ad8
# ╠═5156fbdc-002c-4222-aca0-b835061e3fb7
# ╠═7f7b1152-5dd0-4f97-b931-4fe74c51b3a3
# ╠═b5d1d68a-ad7e-4140-a818-addead342c53
# ╠═d7cb77c3-7875-43d8-bab6-7281455700b0
# ╠═5f37c3d1-449f-4a6d-9af5-55f9a4c8feec
# ╠═4aa43e57-d9a4-49da-b7d8-fe39d21df414
# ╠═a41fcefd-00dd-45c5-86a0-7fe076460674
# ╠═07f45116-ff8b-4d2c-a7e3-46a4581afc16
# ╠═229d9694-2751-479d-9872-218f7cea2261
# ╠═8b1d06a8-dbd0-4dc4-b12a-15425960ecc4
# ╠═5e23a09b-c96f-40e0-bd8f-af18041f2be9
# ╠═874e3ccf-4309-42d4-af8d-3921b025239e
# ╠═4ff28842-9307-4813-8791-197fd6ca5238
# ╠═1ffb0970-7422-4cb7-9f84-841f68565b80
# ╠═32b71cdc-e93b-4b05-b8f5-4b9d61a2eb62
# ╠═4e358ab2-9be7-4d7f-b295-1e85943da027
# ╠═81e4ac99-3388-49e0-a168-5d9961c80ddf
# ╠═02d61e1f-b630-443c-b1dd-1fe5d2c81b2f
# ╠═b51c5bc6-9065-4687-b6cb-e67a372a3b4e
# ╠═e13d39c8-ac62-460d-bf7e-9a994942731d
# ╠═9a9bff9d-98c3-4300-bc0b-a7b807a43f99
# ╠═124a0bb3-b89e-4ac5-9178-01cda06045ec
# ╠═56a7034f-d702-4877-ab5c-6916ac503043
# ╠═2b5289ee-8f10-4564-98e1-3a43e648d867
# ╠═9d6d8399-d063-42c4-af47-dbf5ab38d434
# ╠═2543320e-dd76-4edf-adb8-ceac71805337
# ╠═8cc0d5fd-c988-4f16-a07f-a6439fccbc8a
# ╠═17770e44-b45c-4505-bb61-213ff4eff007
# ╠═66b482d7-4c12-4f41-9d09-3eb723a1001b
# ╠═4a9a8e25-2db5-495a-bf55-94d589bdb699
# ╠═fa78d2d3-afc7-40d8-9e06-4df6f65321ac
# ╠═269e3d73-0e11-4fcc-a291-031da9817541
# ╠═fa3f03ce-66a3-447b-ae37-47eef4f10aaa
# ╠═e200bd3c-2636-4a91-83dd-de6b0e3d5a32
# ╠═1af2a723-f74f-47b1-a46f-a5452b7da7b1
# ╠═56153ee8-aa22-40ba-bab3-235cc8b1fef6
# ╠═b25051b6-8b33-4976-86b9-4db2166c291c
# ╠═f5c25849-0337-4dca-98cf-dbbc723499f8
# ╠═af619399-4655-45a0-847b-60357e53d2a5
# ╠═9cd59dc0-5971-45d0-b076-69df14c3f4cd
# ╠═71bca4ec-9d80-423c-bbac-16711deccce1
# ╠═f64e2917-76fc-4ba8-8a47-d8c4c3654880
# ╠═fb8b488f-f8b4-48e5-9d66-9f3df8919d5d
# ╠═d6b066d3-0049-4f3d-9acc-55fc16c40adc
# ╠═14f0a7a7-2264-4170-832e-837a54cd935c
# ╠═e8cdbe22-f7e1-47b2-bd3f-6130a6fc6207
# ╠═bb514175-fe2c-498d-8ae5-aa3e59167fa4
# ╠═e4f23df3-6b96-4333-99e0-1b9dfb7b8cba
# ╠═42f171ca-09e4-45ed-8910-427ab7dc3aee
# ╠═df2dff93-465a-404a-9bf5-581907b99f42
# ╠═e6ba3446-cdb3-41c0-8db7-56b63042ddbc
# ╠═df2a7927-878c-4d11-9e37-9c519672801e
# ╠═8458322d-c34a-475f-b11a-f9cb74a91a95
# ╠═5d0d0bd7-7a85-4b2f-8a39-c6a4ef7d6175
# ╠═0d547f78-1578-4c4a-9403-bd4ede9a62a7
# ╠═28d201df-5056-4429-b1ba-a4959e75bc51
# ╠═8a584c0c-3017-4958-b611-772b3a6e44c5
# ╠═a73db7b8-3464-4852-a9ef-5d0de43d4395
# ╠═2b68430f-08ac-4bfb-a484-e6fbe08738ba
# ╠═1beace3e-3a7e-411b-b6c0-3eca1fbf8536
# ╠═22d44abf-34e3-496c-910a-5e51a7d90e10
# ╠═b4279679-50fb-4dfd-9c4e-0e14788e2edd
# ╠═4bcc7833-6bfb-421f-b54f-3567aea00c1e
# ╠═655773ab-44a0-4f6e-95b9-353ea7f694ca
# ╠═b2873160-bdc6-4883-b6a0-fe2b8295f97d
# ╠═6406249d-f7ac-4ed7-a175-71e6dcdf55f2
# ╠═253a5368-72ca-4463-9b59-934f45d77a4e
# ╠═d55a4917-e885-42ee-a8db-24f951501c28
# ╠═e653c7dd-7359-448d-9690-5d4a9780fc70
# ╠═a5b5ae97-b4af-435e-a3fb-5a23edf8b0c9
# ╠═eccd97c8-15b5-47ff-92ef-7e87a054c4ef
# ╠═01c13365-f758-47c4-9b96-b9f2616b3824
# ╠═017d38da-5825-4966-8d89-c75ce0b2af11
# ╠═85c79ec8-6c95-4c76-9851-a4a0b7ec76d7
# ╠═c9a96c8c-94a5-4b5a-853e-60b35bc7621a
# ╠═9a998b24-6d36-4f47-b4db-9df9b3d138e2
# ╠═cd76f697-ce0b-4dba-b818-65ee5b6de23d
# ╠═238beb06-9d2e-4d15-8eb4-3660aced7ef7
# ╠═efb4d714-dea7-428a-858c-70c9193ce150
# ╠═463027a3-7319-43ef-85be-cb8abe5a1d28
# ╠═b0716945-c4e6-4d3d-a29d-864ff023b0fc
# ╠═49fe4d0b-124f-4dd8-a34d-9aaf80705175
# ╠═f608e3b8-4a16-40c9-8ffd-d02af53146e6
# ╠═fb1499e3-0a58-4b34-b452-3bdc31b82504
# ╠═c3de1903-845e-4779-b67b-817e703fd1ee
# ╠═daf5a008-b102-4557-8a18-d83839316eba
# ╠═13f007b1-b509-40b2-8ad4-ab50588957b0
# ╠═9c8d6eeb-9d3c-4525-87e3-c540c3a5d38d
# ╠═66a05cab-f595-43f8-843d-1f845c953868
# ╠═db150ea2-4895-415e-97a9-f7eff4180d63
# ╠═cf16ce47-f360-451b-afae-b1fe8b559fc3
# ╠═cad95270-ba9f-4821-87da-e457a00b9617
# ╠═9b02faca-b5cb-442d-8a63-82f584b054fd
