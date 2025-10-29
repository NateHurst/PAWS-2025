// Example usage of the homework template
#import "template.typ": *

// Page setup (MUST be at document level, not in function)
#set page(
  margin: (left: 1in, right: 1in),
  numbering: "1",
  footer: [
    #align(center)[#context [#counter(page).display()]]
  ],
)
#set par(first-line-indent: 0pt)
#set block(spacing: 2.5em)

// Create the homework title
#homework_title("Problem Set 2", "PAWS 2025", "Nathaniel Hurst")


// Numbered problems with yellow boxes and circled numbers
#numbered_problem(1)[
Let $a,b  in K$ and consider the (affine plane) curve $C$ (not elliptic curve since $4a^3 + 27b^2$ is not necessarily $0$ in this exercise), defined by $y^2 = x^3 + a x + b$.

(a) Show that $4a^3 + 27b^2 = 0$ if and only if the polynomial $f = x^3 + a x + b$ has a repeated root.

(b) A point $P$ on an affine plane curve is a singularity if and only if both partial derivatives $(partial f )/(  partial x)$ and $(partial f )/(  partial y)$ vanish at $P$; otherwise $P$ is called a smooth point. Use this definition and part (a) to show that all points $P$ on $C$ are smooth if and only if $4a^3 + 27b^2 eq.not 0$.

]

(a) First suppose that $4a^3 +27b^2 = 0$, or $a^3 = (-27b^2)/4$. Then observe that for $x_0$ such that $a = -3 x_0^2$ (note we can find one by taking the cube root of $(-27b^2)/4$ and some arithmetic) that #align(center, $(-3 x_0^2)^3=(-27b^2)/4 ==> b^2 = 4x_0^6 ==> b = 2x_0^3$) But then observe that #align(center,$f(x_0)= x_0^3+a x_0 +b = x_0^3+(-3x_0^2)x_0+2x_0^3=0$) and #align(center, $f'(x_0) = 3 x_0^2+a = 3 x_0^2 - 3 x_0 ^2 =0$) and so $x_0$ is a repeated root.

Now suppose that $f$ has a repeated root, i.e $f$ and $f'$ share a root. Let $x_0$ be such a root. Then $x_0^3+a x_0 + b = 0$ and $3 x_0^2+a = 0$, i.e. $-a/3 = x_0^2$. Substituting this back into our first relation we get #align(center, $0 = (-a/3)x_0+a x_0+ = ((2a)/3)x_0+b ==> x_0 = (-3b)/(2a)$)

i.e. $x_0^2 = (9b^2)/(4a^2)$. But we also found $x_0^2 = -a/3$. Thus we have #align(center, $0 = (9b^2)/(4a^2)+a/3 =27b^2+4a^3$)

#line(length: 15%)
(b) Observe that if we write $f = x^3+a x+b - y^2$ we have that $f_x = 3x^2+a$ and $f_y = -2y$. Suppose that both partial derivatives vanish at some $P = (x,y)$, then using that in our system above we get that $x^2 = -a/3$ and $y=0$. Plugging this back into $y^2= x^3 + a x +b$ we get #align(center, $0 = (-a/3)x+a x+ b = ((2a)/3)x+b ==> x = (-3b)/(2a)$) Thus we have $x^2 = (9b^2)/(4a^2)$. But we also found that $x^2 = -a/3$. Thus we have that #align(center,$0 = (9b^2)/(4a^2)+a/3 = 27b^2+4a^3$) Thus if the partial derivatives vanish at any point we must have $27b^2+4a^3 = 0$. Now observe that if $4a^3+27b^2 =0$ then by part $(a)$ we have that $x^3+a x+b$ has a repeated root, and so it must share a root with its derivative $3x^2+a$, i.e. the system $0= 3x^2+a = f_x$ and $0= -2y = f_y$ has a solution, or there is some $P$ such that the partials vanish, and so $C$ is not smooth.

#numbered_problem(2)[
Consider the elliptic curve $E: y^2 = x^3 - 3x + 1$ defined over $FF_(13)$ and let 
#align(center, $P_1 = (0,1)  in E(FF_(13))$)

(a) Compute $[2] dot P_1$. Is there any relation to the point $P_2$ of Example 3.8 in the lecture notes?

(b) Compute $[12] dot P_1$. Try to use as few elliptic curve additions as possible.
]

(a) We compute $[2]dot P_1=P_1 + P_1$ using the group law. Then we have #align(center, $[2] dot P_1 = (((3(x_1)^2+a)/(2 y_1))^2-2x_1, (3(x_1)^2+a)/(2 y_1)(x_1-x_3)-y_1)=$)#align(center, $=((-3 dot 2^(-1))^2,(-3 dot 2^(-1))^2(1-(-3 dot 2^(-1))^2)-1)=(12, 5(0-12)-1)=(12,4)$)

#line(length: 15%)
(b) Observe that #align(center, $[12] dot P_1 = [3]([2]([2] dot P_1))$) Now observe that when we do $[2] dot ([2] dot P_1) = [2]dot (12,4)$ we have that $m = (3x_1^2+a)/(2y_1)= (3-3)/(2y_1) = 0$. Thus #align(center, $[2] dot ([2] dot P_1) = [2]dot (12,4) = (2, 9)$) and finally we can compute #align(center, $[3]dot (2,9) = (2,9)+ [(2,9)+(2,9)] = (2,9)+ (6,2) = (1,1)$) giving us our answer $[12] dot P_1 = (1,1)$

#numbered_problem(3)[
Given an elliptic curve $E$ over $K$, a point $P  in E(K)$ and an integer $N$. Show that Algorithm 4 computes $[N] dot P$ using at most $2 log_2 (N)$ elliptic curve additions (a doubling $[2] dot P$ is counted as one addition $P + P$).
]

It is clear that when $N = (e_0 e_1 e_2 dots e_n)_2$ algorithm $4$ terminates in $n$ steps, and does at most $2$ additions per step (once with $R <- R+Q$ and another with $Q <- [2]Q$). Thus the maximum number of elliptic curve additions is $2N = 2⌈log_2(N)⌉$. To see that algorithm $4$ actually outputs $[N] dot P$ observe first that if $N = (e_1 e_0 e_2 dots e_n)$ then #align(center, $[N] dot P = [e_0+2e_1+2^2e_2+dots + 2^n e_n]=$) #align(center, $[e_0] dot P + [2 e_1] dot P + [2 e_2]([2] dot P)+ dots+[2 e_n]([2^(n-1)] dot P_n)$) Then observe that the double-and-add algorithm starts by computing $R <- [e_0] P$ and then doubling $Q$ to get $[2] dot Q = [2] dot P$, allowing us to compute $[e_1](Q) = [e_1]([2] dot P) = [2 e_1] dot P$ and then add it to $R$ in the next step (note if $e_1 = 0$ then $[e_1]Q = oo$, and so $R$ is unchanged). Continuing in this way we add $[2^k e_k] dot P$ to the total $R$ all the way up to $n$, giving us $[N] dot P$.

#numbered_problem(4)[
Consider $E: y^2 = x^3 - 2x + 5$ over $FF_(19)$. Let $P = (2,3)$ and $Q = (10,4)$. 
(Note: See the SageMath documentation for how to construct elliptic curves and points on elliptic curves.)

(a) Check that $P$ and $Q$ are points on $E$.

(b) Calculate $P + Q$, without using SageMath.

(c) Calculate $[5] dot P$ using the double-and-add algorithm (Algorithm 4 of the lecture notes).

(d) Calculate $[7] dot Q$. What does this tell you about the order of $Q$?
]

(a) To verify that $P$ and $Q$ are points on $E$, we can plug them into the elliptic curve equation and see if it is true. For $P = (2,3)$ we have #align(center, $9 = 8-4+5$) which is true. For $Q = (10,4)$ we have #align(center, $16=1000-20+5$) which is true modulo $19$. Thus $P$ and $Q$ are points on $E$.
#line(length: 15%)
(b) To calculate $P+Q$ we use the group law. Then #align(center, $P+Q= (2,3)+(10,4) = (m^2-x_1-x_2, m(x_1-x_3)-y_1) = (18,14)$) where $m = (y_2-y_1)/(x_2-x_1)$.
#line(length: 15%)
(c) First we let $Q <- P = (2,3)$ and $R <- oo$ and observe that $5 = (e_0e_1e_2)_2 = (101)_2$. Then since $e_0 = 1$ we do $R <- R+Q = oo+P = (2,3)$ and then $Q <- [2] Q = (3,8)$.

Then since $e_1 = 0$ we do $Q <- [2]Q = (17,1)$.

Then finally we get our answer by doing $[5]dot P = R+Q = (2,3)+(9,14)=(5,5)$.

#line(length: 15%)
(d) We will again use the double and add algorithm: first we let $K <- Q= (10,4)$ and $R <- oo$. The observe that $7 = (e_0e_1e_2)_2 =(1 1 1)_2$.

Then since $e_0 =1$ we do $R <- R+K = (10,4)$ and $K <- [2]K =(15,14)$.

Then since $e_1 = 1$ we do $R <- R+K = (10,4)+(15,14) =(17,1)$ and $K <- [2]K = (17,18)$

Finally our answer is $[7]dot Q = R+K = (17,1)+(17,18)= oo$. Thus the order of $Q$ is seven (we know that the order divides seven, but seven is prime).

#numbered_problem(5)[
Let $E: y^2 = x^3 + a x + b$ be an elliptic curve defined over a field of characteristic $eq.not 2,3$. In this exercise, you are asked to show that $\# E[3] = 9$ by describing how to compute the points.

(a) Use the description of the group law (in Theorem 3.7 of the lecture notes) to construct a polynomial $phi$ such that $phi(x) = 0$ if and only if $[3] dot P = oo$, where $P = (x,y)$ is a point on the (affine) curve.

(b) Show that $phi$ has no repeated roots. (Hint: Show that $phi$ and its derivative cannot share any roots.)

]

(a) Observe that for $P = (x,y)$, where $y eq.not 0$ (since if $y=0$ we would already have by the group law that $[2] dot P = oo$) we must have that if $[3]dot P = oo$ then $(x,y_1)+(x,y_1) = (x,y_2)$, for then $P+(P+P)=(x,y_1)+(x,y_2) = oo$. Using the description of the group law we find that this is exactly when $x = m^2-2x$ where $m = (3x^2+a)/(2y_1)$, or #align(center, $3x = (9x^4+6x^2a+a^2)/(4y_1^2)$) Now using the fact that $y_1 = x^3+a x+b$ we can simplify this relation to #align(center, $3x^4+6x^2a+12x b+a^2=0$) Thus we have that for $phi(x)=3x^4+6x^2a+12x b+a^2$ that is $phi(x)=0$ then $[3] dot P = oo$. Observe that we need not check the condition on $y_1$ and $y_2$ ($y_1 = y_2 = 0$ or $y_1 eq.not y_2$) in the group law for $(x,y_1)+(x,y_2)= oo)$ as if $y_1 = y_2$ then $(x,y_1)+(x,y_1)=(x,y_2)= (x,y_1)$ would imply that $P+P= P$, or $P = oo$.  
#line(length: 15%)
(b) Observe that $phi '(x) = 12x^3+12x a+12b$, and so if $phi '(x)=0$ that would imply that $x^3+a x+b = 0$, and so any point $(x,y)$ which satisfied this would have to have $y=0$, and by the group law we know that $[2] dot (x,0) = oo$, so $x$ cannot be a root of $phi$, for $[3] dot P = oo+P = (x,0) eq.not oo$. Thus $phi$ and $phi'$ share no roots, or $phi$ has no repeated roots.

#numbered_problem(6)[
For each of the following elliptic curves and finite fields $FF_p$, list the points in $E(FF_p)$ and check that the number of points is within the Hasse bound:

(a) $E: y^2 = x^3 + 7x - 3$ over $FF_(13)$.

(b) $E: y^2 = x^3 + 11x + 2$ over $FF_(17)$.
]

(a) By plugging in every value $0<= x_0<= 12$ into the elliptic curve function we get an equation #align(center, $y^2 = x_0^3+7x_0-3$) Then if $x_0^3+7x-3$ is a quadratic residue there is a solution $y_0^2 = x_0^3+7x_0-3$, giving points on the elliptic curve $(x_0,y_0)$ and $(x_0,-y_0)$ and if not then no point on $E$ has $x$ coordinate $x_0$. Proceeding in this fashion and using an implementation of the Tonelli-Shanks algorithm (which can be found in the file Toneli-Shanks.ipynb) we find the following points on $E$: #align(center, $(0,7), space space space (0,-7), space space space (5,1), space space space (5,-1), space space space (7,8), space space space (7,-8), space space space (9,3), space space space (9,-3), space space space (10,1), space space space (10,-1)$) #align(center, $(11,1), space space space (11,-1), space space space oo$) 

Then $\# E(FF_p) = 13$, and the Hasse bound is satified as #align(center, $p+1 - 2sqrt(p) approx 6.8 <=  13 <= 21.2 approx p+1 +2sqrt(p)$)
#line(length: 15%)
(b) We employ a similar method as part $(a)$, finding the points on $E$: #align(center, $(0,6), space space space (0,-6), space space space (2,7), space space space (2,-7), space space space (4,12), space space space (4,-12), space space space (11,14), space space space (11,-14), space space space (21,14), space space space (12,-14)$) #align(center, $(13,8), space space space (13,-8), space space space oo$)

Then $\# E(FF_p) = 13$, and the Hasse bound is satified as #align(center, $p+1 - 2sqrt(p) approx 9.5 <=  13 <= 26.5 approx p+1 +2sqrt(p)$)

#numbered_problem(7)[
Let $p > 3$ be a prime, and consider two elliptic curves:
#align(center, $E : y^2 = x^3 + a x + b space "and" space overline(E) : y^2 = x^3 + a x - b$)
 
defined over $FF_p$.

(a) Assume that $p equiv 1 space (mod 4)$. Show that

#align(center, $\# E(FF_p) =  \# overline(E)(FF_p)$)

(b) Assume that $p  equiv 3 space (mod 4)$. Show that
#align(center, $\#E(FF_p) +  \# overline(E)(FF_p) = 2p + 2.$)

Some hints: *1)* Check if $-1$ is a square in $FF_p$. *2)* Let $p = (x_0,y_0) in E(FF_p)$. Is there a point $overline(P)=(x_0, star) in overline(E)(FF_p)?$ What about $overline(P) = (-x_0, star) in overline(E)(FF_p)?$
]

(a) Observe that by problem $\# 8 $ below we have that #align(center, $|E(FF_p)| = p + 1 +  sum_(x in FF_p) ( frac(x^3 + A x + B, p) )$) and since $p equiv 1 space (mod 4)$ we have that $((-1)/p) =1$, and so #align(center, $sum_(x in FF_p) ( frac(x^3 + A x + B, p) ) = ((-1)/p)sum_(x in FF_p) ( frac(x^3 + A x + B, p) ) = sum_(x in FF_p) ( frac((-1)(x^3 + A x + B), p) )  =$) #align(center, $=sum_(x in FF_p) ( frac((-x)^3 + A (-x) - B, p) ) = sum_((-x) in FF_p) ( frac(x^3 + A x - B, p) )$) and since summing over all $x$ is the same as summing over all $-x$ in $FF_p$ we have that #align(center, $|E(FF_p)|= p+1 + sum_(x in FF_p) ( frac(x^3 + A x + B, p) ) = p+1 +sum_((-x) in FF_p) ( frac(x^3 + A x -B, p) ) = |overline(E)(FF_P)| $)
#line(length: 15%)
(b) Similarly since $p equiv 3 space (mod 4)$ we have that $((-1)/p) = -1$ and so by a similar reasoning as in part $(a)$ we have #align(center, $sum_(x in FF_p) ( frac(x^3 + A x + B, p) ) = -((-1)/p)sum_(x in FF_p) ( frac(x^3 + A x + B, p) ) = -sum_(x in FF_p) ( frac((-1)(x^3 + A x + B), p) )  =$) #align(center, $=-sum_(x in FF_p) ( frac((-x)^3 + A (-x) - B, p) ) = -sum_((-x) in FF_p) ( frac(x^3 + A x - B, p) )$) and so #align(center, $|E(FF_p)|+|overline(E)(FF_p)| = (p+1 + sum_(x in FF_p) ( frac(x^3 + A x + B, p) ))+(p+1 +sum_((-x) in FF_p) ( frac(x^3 + A x - B, p) ))=$) #align(center, $=2p+2 +(sum_(x in FF_p) ( frac(x^3 + A x + B, p) ) - sum_(x in FF_p) ( frac(x^3 + A x + B, p) )) = 2p+2$)

#numbered_problem(8)[
Let $p > 2$ be a prime number and let $E: y^2 = x^3 + A x + B$ be an elliptic curve over $FF_p$, and denote with $E(FF_p)$ all points of $E$ with coordinates in $FF_p$. Further, let $(frac(a,b))$ be the Legendre symbol.

(a) Show that
#align(center, $|E(FF_p)| = p + 1 +  sum_(x in FF_p) ( frac(x^3 + A x + B, p) ).$)

(b) Let $d  in   FF_p$ be such that $( frac(d,p) ) = -1$ and $E': d y^2 = x^3 + A x + B$. Show that
#align(center, $|E(FF_p)| + |E'(FF_p)| = 2p + 2.$)

(c) Let $p$ be a prime such that $p equiv 3 space (mod 4)$ and $E: y^2 = x^3 + A x$. Show that $|E(FF_p)| = p + 1$.

]

(a) We can determine the number of points on an elliptic curve $E(FF_p)$ by taking every point $x in FF_p$ and seeing if $x^3+A x+B$ is a quadratic residue modulo $p$, for if it is then there exists $y in FF_p$ such that $y^2=x^3+A x+B$, giving the two points on the elliptic curve $(x,y), (x,-y) in E(FF_P)$. If $x^3 + A x +B$ is not a quadratic residue then the equation $y^2= x^3 +A x+B$ has no solutions for $y$, and so no point with first coordinate $x$ is on the elliptic curve. 

In order to determine the number of points which satisfy the equation $y^2=x^3+a x+b$ we proceed by the following algorithm:

Let count = $p$. For $x in {0,dots, p-1}$, if $( frac(x^3 + A x + B, p) )=1$ we increase count by $1$ (this corresponds to finding two points $(x,y)$ and $(x,-y)$). If $( frac(x^3 + A x + B, p) ) =-1$ we subtract one from count (this corresponds to finding no points for that $x$ value). If $( frac(x^3 + A x + B, p) ) = 0$ we leave count unchanged, as in this case the only solution to $y^2 = x^3+a x+b$ is $(x,0)$ and we already accounted for this point by letting count be $p$ at the start. Finally we add the point at infinity to count, increasing it by one. This search exhausts all values $x in FF_p$, and since square roots of quadratic residues are unique up to sign we see that this algorithm actually gives the number of points on the curve. Notice that in the way the algorithm was described, it will always yield exactly #align(center, $|E(FF_p)| = p + 1 +  sum_(x in FF_p) ( frac(x^3 + A x + B, p) )$)
#line(length: 15%)
(b) Observe that since $(d/p) = -1$ we also have that $(d^(-1)/p)=-1$ (for if there was $a$ such that $a^2 = d^(-1)$ then $(a^(-1))^2 = (a^2)^(-1)= (d^(-1))^(-1)=d$, and so no such $a$ can exist). Then if $(x,y) in E(FF_p)$ we have that #align(center, $( frac(x^3 + A x + B, p) ) = 1$) and so #align(center,$( frac(d^(-1)(x^3 + A x + B), p) ) = (d^(-1)/p)( frac(x^3 + A x + B, p) )=-1 dot 1 = -1$) (using properties of the Legendre symobl) and hence the equation $y^2 = d^(-1)(x^3+A x +B)$ has no solutions for $y$. Then we observe that #align(center, $sum_(x in FF_p) ( frac(x^3 + A x + B, p) ) = - sum_(x in FF_p) ( frac(d^(-1)(x^3 + A x + B), p) )$) or #align(center, $|E(FF_p)| + |E'(FF_p)| = (p+1+ sum_(x in FF_p) ( frac(x^3 + A x + B, p) ))+(p+1+sum_(x in FF_p) ( frac(d^(-1)(x^3 + A x + B), p) ))$) #align(center, $=(p+1+ sum_(x in FF_p) ( frac(x^3 + A x + B, p) ))+(p+1- sum_(x in FF_p) ( frac(x^3 + A x + B, p) ))=p+1+p+1 = 2p+2$)
#line(length: 15%)
(c) Since $p equiv 3 space (mod 4)$ we have that $((-1)/p)= -1$, and so $a$ is a quadratic residue if and only if $-a$ is not. Thus we can conlude that #align(center, $sum_(x in FF_p) ( frac(x^3 + A x, p) ) =0$) (since for every $x$ such that the Legendre symbol of $x^3+A x$ is one there is another of $(-x)^3+(-x)A=  (-1)(x^3+ A x)$ which is negative one). Hence #align(center, $|E(FF_p)| = p + 1 +  sum_(x in FF_p) ( frac(x^3 + A x, p) )= p+1$)

#numbered_problem(9)[
Compute the group structure of $E(FF_p)$ for the given elliptic curves $E$ and primes $p$. (Can you also find generators?)

(a) $E: y^2 = x^3 + 1$ for $p = 5$

(b) $E: y^2 = x^3 + x$ for $p = 7$

(c) $E: y^2 = x^3 - 1$ for $p = 7$

(d) $E: y^2 = x^3 + 3x + 1$ for $p = 11$

(e) For $p = 13$, compute the group structures of $E(FF_p)$ for all elliptic curves over $FF_p$. (You can use the command $".abelian_group()"$ for this.)

]

(a) We will employ the following process in this problem: we will find a point $P_1 in E(FF_p)$, compute its order (and thus the subgroup generated by it), and then check if the number of elements (the order of all subgroups that are not the same found by the previous method) is enough such that adding any more subgroups would violate the Hasse bound.

Then observe that $(0,1) in E(FF_5)$. Some computation yields that $"ord"((0,1))=3$. Then we find another point $P_2 = (2,3) in E(FF_5)$ such that $(2,3) in.not angle.l (0,1) angle.r$. Then again we see that $"ord"((2,3))=6$, but also through this computation we see that $(0,1) in angle.l (2,3) angle.r$ and so $angle.l(0,1) angle.r subset angle.l (2,3) angle.r$. 

Now observe that the Hasse Bound for this elliptic curve is #align(center, $2 <= \# E(FF_p) <= 11 $) and since we know that $E(FF_p)$ contains a subgroup of order $6$ we know that $6 divides \# E(FF_p)$, and the only possible number of elements within the Hasse bound is $6$. Thus we can conclude that #align(center, $angle.l (2,3) angle.r = E(FF_p) tilde.equiv ZZ slash 6 ZZ$)
#line(length: 15%)
(b) We begin by finding $(1,4) in E(FF_p)$ and computing $"ord"((1,4)) = 4$. Then we find $(3,4) in E(FF_p)$ such that $(3,4) in.not angle.l (1,4) angle.r$. Then we compute $"ord"((3,4))=8$, and in doing so see that $(1,4) in angle.l (3,4) angle.r$. 

Now observe that the Hasse Bound for this elliptic curve is #align(center, $3 <= \# E(FF_p) <= 13 $) and since we know that $E(FF_p)$ contains a subgroup of order $8$ generated by $(3,4)$ we can conclude that $8 divides \#E(FF_p)$. Now since the only possible option for the number of elements of $E(FF_p)$ within the Hasse bound but still divisible by $8$ is $8$ we can conclude that #align(center, $angle.l (3,4) angle.r = \# E(FF_p) tilde.equiv ZZ slash 8 ZZ$)
#line(length:15%)
(c) First we find $(1,0) in E(FF_p)$ and compute $"ord"(1,0) = 2$. Then we find $(2,0) in E(FF_p)$ such that and compute $"ord"(2,0) = 2$. Thus we have two subgroups of order $2$ in $E(FF_p)$, or one subgroup of order $4$. Thus we know that $4 divides \# E(FF_p)$.

Note however that the Hasse Bound for this elliptic curve is #align(center, $3 <= \# E(FF_p) <= 13 $) and so we can only conclude that $\# E(FF_p) in {4,8,12}$. However a manual search shows that the equation $y^2 = x^3-1$ has no solutions moduluo $7$ when $x eq.not 1,0$. Thus we can conclude that #align(center, $angle.l (1,0) angle.r times angle.l (2,0) angle.r = E(FF_P) tilde.equiv ZZ slash 2 ZZ times ZZ slash 2 ZZ$)
#line(length:15%)
(d) First we find $(0,1)in E(FF_p)$ and compute $"ord"((0,1))=6$. Then we find $(1,4) in E(FF_p)$ such that $(1,4) in.not angle.l (0,1) angle.r$. Then we find that $"ord"(1,4)= 18$ and $(0,1) in angle.l (1,4) angle.r$. Thus $E(FF_p)$ contains a subgroup of order $18$ and since the Hasse Bound for this elliptic curve is #align(center, $6 <= \# E(FF_p) <= 18 $) we can conlude that $\# E(FF_p) = 18$, and so #align(center, $angle.l (1,4) angle.r = E(FF_p) tilde.equiv ZZ slash 18 ZZ$)
#line(length:15%)
(e) There are 22 possible group structures for an elliptic curve of the form $y^2 = x^3+a x+ b$ over $FF_(13)$. (computed with SageMath) They are: #align(center, $ZZ slash N_1 ZZ times ZZ slash N_2 ZZ$) 
with #align(center, $(N_1,N_2) in {(2, 8), (7,0), (3, 3), (10,0), (16,), (3, 6), (13,0), (19,0), (2, 4), $) #align(center, $(2, 10), (9,0), (4, 4), (12,0), (18,0), (15,0), (21,0), (2, 6)}$)


Note that problem 10 is ommitted, see Silverman's The Arithmetic of Elliptic Curves page 138 for a proof of the Hasse bound.
