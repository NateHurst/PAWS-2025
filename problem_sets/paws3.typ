// Example usage of the homework template
#import "homework-template.typ": *

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

A

#numbered_problem(2)[
Consider the elliptic curve $E: y^2 = x^3 - 3x + 1$ defined over $FF_(13)$ and let 
#align(center, $P_1 = (0,1)  in E(FF_(13))$)

(a) Compute $[2] dot P_1$. Is there any relation to the point $P_2$ of Example 3.8 in the lecture notes?

(b) Compute $[12] dot P_1$. Try to use as few elliptic curve additions as possible.
]

A

#numbered_problem(3)[
Given an elliptic curve $E$ over $K$, a point $P  in E(K)$ and an integer $N$. Show that Algorithm 4 computes $[N] dot P$ using at most $2 log_2 (N)$ elliptic curve additions (a doubling $[2] dot P$ is counted as one addition $P + P$).
]

A

#numbered_problem(4)[
Consider $E: y^2 = x^3 - 2x + 5$ over $FF_(19)$. Let $P = (2,3)$ and $Q = (10,4)$. 
(Note: See the SageMath documentation for how to construct elliptic curves and points on elliptic curves.)

(a) Check that $P$ and $Q$ are points on $E$.

(b) Calculate $P + Q$, without using SageMath.

(c) Calculate $[5] dot P$ using the double-and-add algorithm (Algorithm 4 of the lecture notes).

(d) Calculate $[7] dot Q$. What does this tell you about the order of $Q$?
]

A

#numbered_problem(5)[
Let $E: y^2 = x^3 + a x + b$ be an elliptic curve defined over a field of characteristic $eq.not 2,3$. In this exercise, you are asked to show that $\# E[3] = 9$ by describing how to compute the points.

(a) Use the description of the group law (in Theorem 3.7 of the lecture notes) to construct a polynomial $phi$ such that $phi(x) = 0$ if and only if $[3] dot P = oo$, where $P = (x,y)$ is a point on the (affine) curve.

(b) Show that $phi$ has no repeated roots. (Hint: Show that $phi$ and its derivative cannot share any roots.)

]

A

#numbered_problem(6)[
For each of the following elliptic curves and finite fields $FF_p$, list the points in $E(FF_p)$ and check that the number of points is within the Hasse bound:

(a) $E: y^2 = x^3 + 7x - 3$ over $FF_(13)$.

(b) $E: y^2 = x^3 + 11x + 2$ over $FF_(17)$.
]

A

#numbered_problem(7)[
Let $p > 3$ be a prime, and consider two elliptic curves:
#align(center, $E : y^2 = x^3 + a x + b space "and" space overline(E) : y^2 = x^3 + a x - b$)
 
defined over $FF_p$.

(a) Assume that $p equiv 1 space (mod 4)$. Show that

#align(center, $\# E(FF_p) =  \# overline(E)(FF_p)$)

(b)Assume that $p  equiv 3 space (mod 4)$. Show that
#align(center, $\#E(FF_p) +  \# overline(E)(FF_p) = 2p + 2.$)

Some hints: *1)* Check if $-1$ is a square in $FF_p$. *2)* Let $p = (x_0,y_0) in E(FF_p)$. Is there a point $overline(P)=(x_0, star) in overline(E)(FF_p)?$ What about $overline(P) = (-x_0, star) in overline(E)(FF_p)?$
]

A

#numbered_problem(8)[
Let $p > 2$ be a prime number and let $E: y^2 = x^3 + A x + B$ be an elliptic curve over $FF_p$, and denote with $E(FF_p)$ all points of $E$ with coordinates in $FF_p$. Further, let $(frac(a,b))$ be the Legendre symbol.

(a) Show that
#align(center, $|E(FF_p)| = p + 1 +  sum_(x in FF_p) ( frac(x^3 + A x + B, p) ).$)

(b) Let $d  in   FF_p$ be such that $( frac(d,p) ) = -1$ and $E': d y^2 = x^3 + A x + B$. Show that
#align(center, $|E(FF_p)| + |E'(FF_p)| = 2p + 2.$)

(c) Let $p$ be a prime such that $p equiv 3 space (mod 4)$ and $E: y^2 = x^3 + A x$. Show that $|E(FF_p)| = p + 1$.

]

A

#numbered_problem(9)[
Compute the group structure of $E(FF_p)$ for the given elliptic curves $E$ and primes $p$. (Can you also find generators?)

(a) $E: y^2 = x^3 + 1$ for $p = 5$

(b) $E: y^2 = x^3 + x$ for $p = 7$

(c) $E: y^2 = x^3 - 1$ for $p = 7$

(d) $E: y^2 = x^3 + 3x + 1$ for $p = 11$

(e) For $p = 13$, compute the group structures of $E(FF_p)$ for all elliptic curves over $FF_p$. (You can use the command $".abelian_group()"$ for this.)

]

A

#numbered_problem(10)[
In this exercise we will outline a proof of Hasse’s theorem (Theorem 3.16 of the lecture notes): Let $E$ be an elliptic curve over $FF_q$. Then:
#align(center, $q + 1 - 2 sqrt(q) <= \# E(FF_q) <= q + 1 + 2 sqrt(q).$)

We first introduce the $q$-power Frobenius endomorphism,
#align(center, $pi_q : E --> E, space space space (x,y) mapsto (x^q, y^q), space space space oo mapsto oo.$)

(Note: Endomorphisms have not been defined in the lecture! An endomorphism is a rational map from an elliptic curve to itself, which maps $oo$ to $oo$. Multiplication by $N$ for an integer $N$ is an example of an endomorphism. One can show that an endomorphism is a group homomorphism.)

(a) Show that $pi_q : E --> E$ is a group homomorphism.

(b) Show that $\# E(FF_q) = \# ker(1 -  pi_q)$, where $1$ is the identity map on $E$.

(c) A *binary quadratic form* on an abelian group $A$, $Q : A --> ZZ$, is a function satisfying the properties:

    1) $Q(x) = Q(-x)$ for all $x in A$,
     
    2) The pairing $(x, y) = Q(x + y) - Q(x) - Q(y)$ is bilinear.
    It is further called *positive definite* if $Q(x) >= 0$ for all $x in A$ and $Q(x) = 0$ if and only if $x = 0$.
    
        (i) Prove that for a positive definite quadratic form $Q$,
        #align(center, $|Q(x - y) - Q(x) - Q(y)| <= 2 sqrt(Q(x)Q(y))$)
        for all $x, y in A$.

(d) For an endomorphism $phi : E --> E$, when $p divides.not  \# ker(phi)$ (more generally, when $phi$ is separable), we define the degree of $phi$ to be the size of its kernel and denote it by $ deg(phi)$. It is a fact that $1 - pi_q$ is separable (see Silverman’s *The Arithmetic of Elliptic Curves*, III.5.5), so $\# ker(1 -  pi_q) =  deg(1 - pi_q)$. 
    
    Then the proof of Hasse’s Theorem reduces to proving that the degree map $deg : "End"(E) --> ZZ$ is a positive definite binary quadratic form and applying the preceding result in part (c).

        (i) (Practice with the definition.) Let $p divides.not N$. What is $ deg([N])$, where $[N]$ is the multiplication-by-$N$ map on $E$?
        
        (ii) Prove that the degree map is a positive definite binary quadratic form. (Hard part: bilinearity of the pairing.)
        
        (iii) Apply the result in part (c) to the degree map to show that
        #align(center, $|\# E(FF_q) - q - 1| <= 2 sqrt(q).$)
]

A

