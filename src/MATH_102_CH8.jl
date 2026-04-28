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
# ╔═╡ 200f43c8-fd32-438e-9582-a995a4026086
cm"""
$(ex())
Find 
```math
\int \frac{1}{1+e^x} dx.
```
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
# ╔═╡ 7588b15a-3b1e-4232-96e6-45e254c10362
cm"""
$(bth("Integration by Parts"))
If ``u`` and ``v`` are functions of ``x`` and have continuous derivatives, then
```math
\int u d v=u v-\int v d u
```
"""
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
# ╔═╡ 4ec721e0-f0e4-492b-8791-87b876c57e6b
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
# ╔═╡ b0938d8a-a9b4-4551-9731-7bc738b88e85
# ╔═╡ db377636-d9b6-4742-bf42-050a31860ad2
cm"""
$(ex(7,"Converting to Sines and Cosines"))
Find 
```math
\int \frac{\sec x}{\tan ^2 x} d x.
```
"""
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
# ╔═╡ d808a001-48ea-4eaa-9501-27d486133480
cm"""
$(ex(8,"Using a Product-to-Sum Formula"))
Find 
```math
\int \sin 5 x \cos 4 x d x
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
# ╔═╡ f65d043c-24ab-4c73-8da9-653ec0f57298
md"""
**Example:** Write out the form of the partial fractions decomposition of the function
```math
\frac{x^3+x+1}{x(x-1)(x+1)^2(x^2+x+1)(x^2+4)^2}
```

"""
# ╔═╡ 4eee2e8b-85b3-4986-9e5d-bfea119302dc
md"## Linear Factors"
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
# ╔═╡ bc944bad-3868-4fca-af1d-0a6e6ffffbb7
md"## Quadratic Factors"
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
# ╔═╡ 3f727233-8150-4008-8fb5-2a83ba616e1e
md"## Improper Integrals with Infinite Discontinuities"
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

# ╔═╡ Cell order:
# ╠═71bc54d5-d0ed-42d3-9bc1-48aa86e91d1d
# ╠═e414122f-b93a-4510-b8ae-026c303e0df9
# ╠═8408e369-40eb-4f9b-a7d7-26cde3e34a74
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
