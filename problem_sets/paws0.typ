// Example usage of the homework template
#import "homework-template.typ": *
#import "@preview/algo:0.3.6": algo, i, d, comment, code

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
#homework_title("Problem Set 0", "PAWS 2025", "Nathaniel Hurst")


// Numbered problems with yellow boxes and circled numbers
#numbered_problem(1)[
The Euclidean algorithm computes the greatest common divisor of two positive integers $a > b$ by the following procedure: Use division with remainder to write

#align(center, $ a = q_1 b + r_1,$)

where the remainder $r_1$ satisfies $0 <= r_1 < b$ and $q_1$ is the quotient. If $r_1 = 0$, then $b | a$ and $gcd(a,b) = b$. Otherwise, we can continue, using $b$ as the new dividend and $r_1$ as the new divisor, and obtain a new remainder $0 <= r_2 < r_1$. We continue until $r_(k+1) = 0$, in which case $r_k = gcd(a,b)$. 

#align(center, $ 
a &= q_1 dot b + r_1 \
b &= q_2 dot r_1 + r_2 \
r_1 &= q_3 dot r_2 + r_3 \
 & dots.v \
r_(k-1)&= q_k dot r_k
$)


(a) Use the Euclidean algorithm to compute $gcd(30030, 257)$. Use your result and the fact that 

#align(center, $30030 = 2 dot 3 dot 5 dot 7 dot 11 dot 13$)

to prove that $257$ is prime.  

(b) Use the Euclidean algorithm to compute $gcd(4883, 4369)$. Use your work to factor $4883$ and $4369$ into a product of primes.  
]

(a) #align(center, $30030 = 257(116)+218 \
257 = 218(1)+39 \
218=39(5)+23 \
39=23(1)+16 \
23=16(1)+7 \
16=7(2)+2 \
7=2(3)+1$)
#align(center, $2 = 2(1)+0$)

Thus $gcd(30030,257)=1$, or they are coprime. Now observe that since $30030 = 2 dot 3 dot 5 dot 7 dot 11 dot 13$ we have that $257$ is coprime to all of these factors. Now if $257$ was not prime it would have at least two prime factors, but the next prime number after $13$ is $17$, and $17^2=289>257$, and since any prime factorization of $257$ contains only prime numbers greater than or equal to $17$, we must have that $257$ is prime.
#line(length: 15%)
(b) #align(center, $4883 = 4369(1)+514 \
4369 = 514(8)+257 \
514 = 257(2) + 0$)

Thus $gcd(4883,4369)=257$, and since by the first part of the problem we have that $257$ is prime we must have that the prime factorization of these numbers boils down to the prime factorization of their quotients when divided by $257$. Thus $4883 = 257(19)$ and $4369= 257(17)$ are the prime factorizations of these numbers.


#numbered_problem(2)[
The *extended Euclidean algorithm* uses the sequence of quotients $q_1, q_2, dots, q_(k-1)$ obtained from the Euclidean algorithm to compute two integers $x,y$ such that $a x+b y=gcd(a,b)$, by forming the two sequences:
#align(center, $x_0 = 1, x_1 = 0, x_j = -q_(j-1)x_(j-1) + x_(j-2)$)
#align(center, $y_0 = 0, y_1 = 1, y_j = -q_(j-1)y_(j-1) + y_(j-2)$)

Then $a x_k + b y_k = gcd(a,b)$.  


(a) Show that if there exist integers $x$ and $y$ such that $a x+b y=1$, then $gcd(a,b)=1$.  

(b) Show that $a$ is invertible mod $b$ if and only if $gcd(a,b)=1$. (“Invertible mod $b$” means there exists an integer $z$ space (mod $b$) such that $a z equiv 1  space (mod b)$. We denote $z space (mod b)$ by $a^(-1) space (mod b)$.)  

(c) Use the extended Euclidean algorithm to compute $x$ and $y$ such that $17x + 101y = 1$. What is $17^(-1) space (mod 101)$?  
]

(a) Let $d = gcd(a,b)$, then $d | a$ and $d | b$, or $a = d k_1$ and $b=d k_2$ for some $k_1, k_2 in ZZ$. Thus $1 = a x+b y=d k_1 x+d k_2 y=d (k_1 x+k_2 y)$, or $d | 1$. Thus $d = 1$.
#line(length: 15%)
(b) Observe that for the forward direction $a z equiv 1 space (mod $b$) ==> a z+b y=1$ for some $y in ZZ$, and hence by the previous problem $gcd(a,b)=1$. For the converse if $gcd(a,b) =1$ then by the extendend Euclidean algorithm there exists $x,y in ZZ$ such that $a x+b y=1$, and observing this relation modulo $b$ we have $a x equiv 1$ (mod $b$).
#line(length: 15%)
(c) First we compute the sequence of quotients by the Euclidean algorithm. #align(center, $101 = 17(5)+16 \ 17=16(1)+1 \ 16=1(16)+0$) Then we can use the extended Euclidean algorithm to find integers $x,y$ such that $17x+101y =1$. Since $16 = 17-1$ we have that #align(center, $101=17(5)+(17-1) ==> 101 = 17(6)-1 ==> 1 = 17(6)+101(-1)$) Then observing this relation modulo $101$ we have $17(6) equiv 1$ (mod $101$), or $17^(-1) equiv 6$ (mod $101$).

#numbered_problem(3)[
The Chinese Remainder Theorem states that if $gcd(n,m) = 1$ and $a,b$ are integers, then there is a unique solution $x$ (mod $m n$) to the simultaneous congruence,
#align(center, $
x equiv a space(mod n) \
x equiv b space (mod m)$)

(a) Show with a counterexample that the theorem is no longer true if the condition $gcd(n,m) = 1$ is dropped.  

(b) Solve the simultaneous congruence
#align(center, $x equiv 2 space (mod 17) \
x equiv 9 space (mod 101)$)

(Hint: You could start listing numbers which are congruent to $9 (mod 101)$, but here’s another approach using the work you’ve already done: Write $x = 17k+2$, and solve for $k$ in the congruence $17k+2 equiv 9 space (mod 101$))
]

(a) Observe that for $x equiv 0 space (mod 2)$ and $x equiv 0 space (mod 4)$ we have that $x equiv 4,0 space (mod 8)$ are both solutions.
#line(length: 15%)
(b) We use the hint and write $x= 17k+2$ and then solve the congruence $17k+2 equiv 9 space (mod 101)$. We have $17k equiv 7 space (mod 101)$, and by part (c) of problem $2$ we have $17^(-1) equiv space (mod 101)$. Thus we have $k equiv 42 space (mod 101)$ giving us one solution $x equiv 17(42)+2 equiv 716 space (mod 1717)$.

#numbered_problem(4)[
Recall that a *group* is a set $S$ together with a binary operation $m : S times S --> S$, such that

(i) for all $s_0,s_1,s_2 in S$, $m(s_0,m(s_1,s_2)) = m(m(s_0,s_1),s_2)$,  
(ii) there exists $s^* in S$ such that $m(s,s^*) = m(s^*,s) = s$ for all $s in S$, and  
(iii) for all $s in S$ there exists $s^(-1) in S$ such that $m(s,s^(-1)) = m(s^(-1),s) = s^*$.  

We think of $m$ as being a (not necessarily commutative!) multiplication on $S$, $s^*$ as being a multiplicative identity, and (as the notation indicates) $s^(-1)$ as being the multiplicative inverse of $s$, and will usually denote $m$ as a product. When the operation $m$ is commutative, we will sometimes denote it with $+$. In this exercise we will recall the basic properties of groups with an emphasis on examples that will be useful in this course.  

(a) Prove that the identity element in any group is unique. Prove that each element of a group has a *unique* multiplicative inverse (this justifies the notation $s^(-1)$ used above).  

(b) Let $G$ be a group and $g in G$. Show that the function $m_g : G --> G$ defined by $m_g(h) = h g$ is a bijection.  

(c) Let $G L_2(RR)$ denote the set of $2 times 2$ matrices with real entries and determinant $1$. Show that $G L_2(RR)$ is a group under multiplication. Is $G L_2(RR)$ commutative?  

(d) Let $ZZ slash p ZZ$ be the set of integers modulo $p$, i.e., the equivalence classes of the integers under the equivalence relation $a ~ b$ if and only if $p | (a-b)$. We define addition and multiplication on $ZZ slash p ZZ$ by $[a]+[b] := a+b space (mod p)$ and $[a][b] := a b space (mod p)$ (we will usually drop the brackets, but it will be understood that we are multiplying equivalence classes). Prove that $ZZ slash p ZZ$ together with the operation of addition is a group. Prove that $(ZZ slash p ZZ)^* = ZZ slash p ZZ - {[0]}$ is a group under multiplication.  

(e) Is the set $ZZ slash 15 ZZ - {[0]}$ a group under multiplication? Can you identify the maximal subset of $ZZ slash 15 ZZ$ that is a group under multiplication?  

(f) The number of integers less than or equal to $N$ that are coprime to $N$ is denoted by $phi(N)$. The function $phi$ is called ``Euler’s phi function,’’ or sometimes ``Euler’s totient function.’’ Prove that
#align(center, $phi(N) = N dot product_((p | N, p "prime")) (1 - frac(1, p))$)


(Hint: One way is to proceed as follows, first show the result when $N$ is a power of a prime. Next show that $phi(m n) = phi(m) phi(n)$ when $m$ and $n$ are relatively prime. Finally, put the two steps together for the general result.
]

(a) Let $s,s' in G$ be two identity elements. Then $s = m(s,s')=s'$. Similarly let $s_1,s_2 in G$ be two multiplicative inverses for an element $s in G$, and denote the identity element by $s^*$. Then $s_1 = m(s^*,s_1)=m(m(s_2,s),s_1)=m(s_2,m(s,s_1))=m(s_2,s^*)=s_2$.
#line(length: 15%)
(b) Observe that this function is injective, as if $m_g(h_1)=m_g(h_2)$ then $h_1 g=h_2 g$, and multiplying by $g^(-1)$ on the right on both sides gives us $h_1=h_2$. Similarly if $s in G$ then $m_g(s g^(-1))=s g^(-1) g = s$, and so this function is surjective, and hence bijective. 
#line(length: 15%)
(c) First observe that this set is certainly closed under multiplication for if $A,B in G L_2(RR)$ we have $det(A B)=det(A)det(B)=1 dot 1 =1$. Now let $A,B,C in G L_2(RR)$. Then each encodes an invertible linear map from $RR^2 --> RR^2$. Now since composition of linear maps is associative, so is matrix multiplication. Similarly for the identity element we take the identity matrix $I$ with $1$ along the diagonal and $0$ otherwise. This matrix has determinant $1$ and $A I=I A=A$ for all $A in G L_2(RR)$. Finally using the inverse matrix formula we have that if $A in G L_2(RR)$ with 

#align(center, $
A = mat(a, b; c,d)$)

#align(center, $A^(-1) = frac(1, det(A)) dot mat(d,-b;-c,a)= mat(d,-b;-c,a)$)

which has determinant $d a - b c = a d - b c = 1$.


This group is not commutative, and here is a counterexample: 

#align(center, $mat(1,1;0,1)mat(1,0;1,1) = mat(2,1;1,1) eq.not mat(1,1;1,2) = mat(1,0;1,1)mat(1,1;0,1)$)

#line(length: 15%)
(d) First we can verify that this addition is well defined. Let $[a]=[a']$, then $p|(a-a')$, and so $[a+b]=[a'+b]$ as $a+b-a'-b=a-a'$ is divisible by $p$. Now observe that this addition is associative, as $[a]+([b]+[c])=[a]+[b+c]=[a+b+c]=[a+b]+[c]=([a]+[b])+[c]$ similarly the class of $[0]$ acts as an identity element and every element is invertible as $[a]+[-a]=[a-a]=[0]$. Thus $(ZZ slash p ZZ, +)$ is a group. Now restrict that set to the numbers which are invertible moduluo $p$ under multiplication. We see that multiplication is well defined for if $[a]=[a']$ we have $p|(a-a')$, and so $[a b]=[a'b]$ as $a b-a'b=b(a-a')$ is divisible by $p$ (as $a-a'$ is). Then similarly if $a,b$ are inverible modulo $p$ then $a b$ is, as $a bb^(-1)a^(-1) equiv 1 space (mod p)$. Now observe that this multiplication is associative as $([a][b])[c]=[a b][c]=[a b c]=[a][b c]=[a]([b][c])$. Similarly every element is invertible as we restricted the set $ZZ slash p ZZ$ to just the invertible elements under multiplication. Finally $[1]$ acts as an identity element. Thus $(ZZ slash p ZZ)^*$ is a group with this multiplication.
#line(length: 15%)
(e) $ZZ slash 15 ZZ-{0}$ is not a group under multiplication, for $[3]$ is not invertible as $(3)(5) equiv 0 space (mod 15)$, and $(0)n equiv 0 space (mod 15)$ for all $n$. The maximal subset of $ZZ slash 15 ZZ-{0}$ which is a group under multiplication is the group of units $(ZZ slash 15 ZZ)^*$, as if $a,b in (ZZ slash 15 ZZ)^*$ then $(a b)b^(-1)a^(-1) equiv 1 space (mod 15)$ and so $a b in (ZZ slash 15 ZZ)^*$. Any larger subset contains elements which are not invertible, and hence that larger subset cannot be a group.
#line(length: 15%)
(f) First let $z$ be a power of a prime. Then $z=p^n$ for some $n$. Then the amount of numbers which can be coprime to $p^n$ and less than $p^n$ are exactly $p^n-$ numbers who are a multiple of $p$, and there are exactly $p^(n-1)$ such numbers ${p,2p,dots,p^2,2p^2,dots,(p-1)p^(n-1)}$, thus the amount of numbers less than and coprime to $p^n$ is exactly $p^n-p^(n-1)=p^n(1-frac(1,p))$.
    
Now observe that when $m$ and $n$ are coprime we have that they share no prime factors, and so 

#align(center, $phi(m n)=m n dot product_((p | m n, p "prime")) (1 - frac(1, p))=m n dot product_((p | m, p "prime")) (1 - frac(1, p)) product_((p | n, p "prime")) (1 - frac(1, p))= phi(m) phi(n)$) Then combining this with our previous result we have that for any $x in ZZ_(>= 2)$ we take the prime factorization $x = p_1^(alpha_1) dots p_n^(alpha_n)$ and then apply our result to split $phi$ across the prime factors (they are prime and hence coprime) and then we can apply our result to each factor as it is a power of a prime, proving the theorem. 

#numbered_problem(5)[
Euler's Theorem states that for any integer $a$ coprime to $N$, $a^(phi(N)) equiv 1 space (mod N)$.

(a) Prove Euler's Theorem. Use the group theory fact that the order of an element divides the order of the group, applied to the group of integers mod $N$ which are coprime to $N$ under multiplication, $(ZZ slash N ZZ)^*$.

(b) Compute $7^(-1) space (mod 30)$ using the extended Euclidean algorithm.

(c) Suppose for some unknown integer $m$ (mod 31), you are given the value of $m^7 space (mod 31)$. How can you find $m$? (Raise $m^7$ to a certain power mod 31 and use Euler's Theorem.)
]

(a) Let $a in ZZ$ be coprime to $N$. Then the order of $a$ in the group $(ZZ slash N ZZ)^*$ divides the order of the group itself, with the order of the group of units being $phi(N)$. Then if the order of $a$ is $n$ then $n | phi(N)$, and so $phi(N) = n k$ for some $k in ZZ$, and thus $a^(phi(N)) equiv a^(n k) equiv 1^k equiv 1 space (mod N)$.
#line(length: 15%)
(b) First we compute the sequence of quotients using the Euclidean algorithm. #align(center, $30 = 7(4)+2 \ 7 =2(3)+1 \ 2 = 1(2)+0$) Thus $gcd(30,7)=1$, and so $7$ is invertible modulo $30$. Then since $2 = 30-7(4)$ we have that #align(center, $7 =(30-7(4))(3)+1 ==> 7=30(3)-7(12)+1 ==> 1=7(13)+30(-3)$) Now observing this relation modulo $30$ we have $7(13) equiv 1 space (mod 30)$, or $7^(-1) equiv 13 space (mod 30)$. 
#line(length: 15%)
(c) Since $31$ is prime, all integers less than $31$ are coprime to it, and thus we can apply Euler's with $phi(31)=30$, and so #align(center,$(m^7)^(13) equiv m^(91) equiv m^(90)m equiv (m^(30))^3 m equiv 1^3m equiv m space (mod 31)$).

#numbered_problem(6)[
A *group homomorphism* is a function $phi : G --> H$, where $G$ and $H$ are groups, such that
#align(center, $phi(g_1 g_2) = phi(g_1) phi(g_2)$)
for all $g_1,g_2 in G$. In this question we will prove some basic facts about group homomorphisms.

(a) Let $1$ be the multiplicative identity in $G$. Prove that $phi(1)$ is the multiplicative identity in $H$.

(b) For any $g in G$, show that $phi(g^(-1)) = phi(g)^(-1)$.

(c) A subgroup of a group is a subset that is also a group under the same operation. Prove that $phi(G)$ is a subgroup of $H$.

(d) The *kernel* of a group homomorphism is the set of elements $g in G$ such that $phi(g)=1$. We denote this by $ker(phi)$. Prove that $ker(phi)$ is a subgroup of $G$ with the additional property that $g ker(phi) g^(-1) = ker(phi)$ for all $g in G$. Such a subgroup is called a *normal* subgroup of $G$.

(e) Let $G slash ker(phi)$ denote the set of equivalence classes of $G$ under the equivalence $g ~ h$ iff $g h^(-1) in ker(phi)$. Define a multiplication on $G slash ker(phi)$, and prove that your multiplication is well-defined and makes $G slash ker(phi)$ into a group.
]

(a) Let $h in Im(phi)$ then $h = phi(g)$ for some $g in G$. Then $phi(1)h =phi(1) phi(g)= phi(1 g)=h$ (and similarly for $h phi(1) = h$). Then if $1'$ is the multiplicative identity of $H$ we have $phi(1) h=1' h ==> phi(1)h h^(-1)=1' h h^(-1) ==>  phi(1)1'=1' 1' ==> phi(1)=1'$.  
#line(length: 15%)
(b) Observe that $phi(g^(-1))phi(g)=phi(g^(-1) g)=phi(1) = phi(g g^(-1))=phi(g)phi(g^(-1))$. Where $phi(1)=1' in H$. Thus $phi(g^(-1))=phi(g)^(-1)$.
#line(length: 15%)
(c) Observe that $phi(G)$ is associative under multiplication (due to its elements being part of $H$, whose elements are associative under multiplication), has an identity element ($phi(1)=1' in H$), and every element $phi(g)$ has inverse $phi(g^(-1))$ (by part b). Then it suffices to show that $phi(G)$ is closed under multiplication. Let $phi(g_1),phi(g_2) in phi(G)$, then $phi(g_1)phi(g_2)=phi(g_1g_2) in phi(G)$. 
#line(length: 15%)   
(d) Observe that $ker(phi)$ is associative under multiplication (due to its elements being part of $G$, whose elements are associative under multiplication), has an identity element $1$ (since $phi(1)=1' in H$ we have $1 in ker(phi)$), and every element $k in ker(phi)$ has inverse $k^(-1) in G$ and $phi(k^(-1))=phi(k)^(-1)=1^(-1)=1$, and hence $k^(-1) in ker(phi)$. Then it suffices to show that $ker(phi)$ is closed under multiplication. Let $k_1,k_2 in ker(phi)$, then $phi(k_1k_2)=phi(k_1)phi(k_2)=(1)(1)=1$, and hence $k_1k_2 in ker(phi)$. Thus $ker(phi)$ is a subgroup of $G$. 
    
Now fix some $g in G$ Let $k in g ker(phi)g^(-1)$ then $k=g k_1 g^(-1)$ for some $k_1 in ker(phi)$. Then $phi(k)=phi(g^(-1)k_1 g)=phi(g^(-1))phi(k_1)phi(g)=phi(g)^(-1)phi(g)=1$. Thus $k in ker(phi)$, or $g^(-1)ker(phi)g subset ker(phi)$. Now let $r in ker(phi)$. Then by the same reasoning as the previous inclusion $g^(-1)r g in ker(phi)$, and thus $g g^(-1)r g g^(-1)=r in g ker(phi) g^(-1)$, or $ker(phi) subset g ker(phi)g^(-1)$. Thus $ker(phi) = g ker(phi)g^(-1)$.
#line(length: 15%)
(e) We define multiplication of equivalence classes as $[g_1][g_2]=[g_1g_2]$. To see that this makes sense, let $[g_1]=[g_1']$ and fix $[g_2]$ then $g_1g_1'^(-1)in ker(phi)$, and $[g_1g_2]=[g_1'g_2]$, for $g_1g_2(g_1'g_2)^(-1)=g_1g_2g_2^(-1)g_1'^(-1)=g_1g_1'^(-1) in ker(phi)$. Observe that this operation is associative, as $[g_1]([g_2][g_3])=[g_1][g_2g_3]=[g_1g_2g_3]=[g_1g_2][g_3]=([g_1][g_2])[g_3]$. Similarly the identity element is $[1]$ as $[g][1]=[g]=[1][g]$. Finally every element is invertible, as $[g][g^(-1)]=[g g^(-1)]=[1]=[g^(-1)g]=[g^(-1)][g]$. Thus $G slash ker(phi)$ is a group with multiplication defined thusly.

#numbered_problem(7)[
#algo(
  title: [
    #set text(size: 15pt)
    #emph(smallcaps("Square and Multiply for Modular Exponentiation"))
  ],
  
  comment-prefix: [#sym.triangle.stroked.r ],
  comment-styles: (fill: rgb(100%, 0%, 0%)),
  indent-size: 15pt,
  indent-guides: 1pt + gray,
  row-gutter: 5pt,
  column-gutter: 5pt,
  inset: 5pt,
  stroke: 2pt + black,
  fill: none,
)[
  *Input*: Integers $x,e,n$\
  
  *Output*: $x^e space (mod n)$\
  Convert $e$ to binary: $e = (e_k e_(k-1) ... e_0)_2$\
  let result ← 1\
  \
  from $k$ down to $0$:#i\
    result ← result² mod n\
    if $e_i = 1$:#i\
      result ← (result ⋅ x) mod n#d\
    end if#d\
  \
  end for
  \
  return result
]


(a) Calculate $23^(71) space (mod 31)$ using the square-and-multiply method (showing at most 7 squarings and 4 multiplications).

(b) Given that a multiplication costs $O(n^(log 3))$ (Karatsuba), what is the expected runtime of the square-and-multiply method?
]

(a) The binary representation of $71$ is $(e_6e_5 dots e_0)_2=1000111$. Now let result = $1$. Then since $e_6=1$ we do result $<--$ result^2  = $1 space (mod 31)$ and result $<--$ result dot x = $23 space (mod 31)$. Now since $e_5,e_4,e_3 = 0$ we do result $<--$ result^2 = $2 space (mod 31)$, result $<--$ result^2 = $4 space (mod 31)$, and result $<--$ result^2 = $16 space (mod 31)$. Now since $e_2 = 1$ we do result $<--$ result^2 = $8 space (mod 31)$ and result $<--$ result dot x = $29 space (mod 31)$. Similarly since $e_1 = 1$ we do result $<--$ result^2 = $4 space (mod 31)$, and result $<--$ result dot x = $30 space (mod 31)$. Finally since $e_0 =1$ we do result $<--$ result^2 = $1 space (mod 31)$ and result $<--$ result dot x = $23 space (mod 31)$. Which gives us the result $23^(71) equiv 23 space (mod 31)$ using $7$ squarings and $4$ multiplications.
#line(length: 15%)
(b) Since multiplication costs $O(n^(log 3))$ and the maximum number of multiplications corresponds to the number of 1's in the binary expansion of the exponent $e$, which has $floor(log_2(e))+1$ entries, we must have that the time complexity of the square and multiply method is $O(n^(log 3)log_2(e))$.

#numbered_problem(8)[
Some cryptographic computations need to calculate values of the form $x^(e) y^(f) space (mod n)$. Devise an efficient algorithm (as an adaptation of Algorithm 1) that outputs $x^(e) y^(f) space (mod n)$ for given integers $x,y,e,f,n$. (Your algorithm should be able to compute, for example, $x^(22) y^(13) space (mod n)$ in at most 4 multiplications and 4 squarings, plus one precomputation).
]

#algo(
  title: [
    #set text(size: 15pt)
    #emph(smallcaps("Square and Multiply for Modular Exponentiation"))
  ],
  parameters: (),
  comment-prefix: [#sym.triangle.stroked.r ],
  comment-styles: (fill: rgb(100%, 0%, 0%)),
  indent-size: 15pt,
  indent-guides: 1pt + gray,
  row-gutter: 5pt,
  column-gutter: 5pt,
  inset: 5pt,
  stroke: 2pt + black,
  fill: none,
)[
  *Input*: Integers $x,e,y,f,n$\
  
  *Output*: $x^e y^f space (mod n)$\
  Convert $e$ and $f$  to binary: $e = (e_k e_(k-1) ... e_0)_2$, $f = (f_r f_(r-1) ... f_0)_2$\
  let result ← 1\
  \
  from $i=max{k,r}$ down to $0$:#i\
    result ← result² mod n\
    if $(e_i,f_i) = (1,1)$:#i\
      result ← (result ⋅ xy) mod n#d\

    else if $(e_i,f_i) = (1,0)$:#i\
      result ← (result ⋅ x) mod n#d\

    else if $(e_i,f_i) = (0,1)$:#i\
      result ← (result ⋅ y) mod n#d\
    end if#d\
  \
  end for \
  return result
]

You may notice that this algorithm computes $x^(22)y^(13)$ in $5$ multiplications and $5$ squarings (due to the binary expansion of $22$ being $10110$), however we can make this $4$ squarings and $4$ multiplications by including a precomputation which checks the $max{k,r}$ entry of each binary expansion (if one is of less length then its $max{k,r}$ entry is 0) and initializing result based on this entry (for example if $(e_(max{k,r}),f_(max{k,r}))=(1,1)$ we intialize result as result ← $x y space (mod n)$). Then in the main algorithm we can start at the $max{k,r}-1$ position, shortening our computation within the acceptable boundaries.
