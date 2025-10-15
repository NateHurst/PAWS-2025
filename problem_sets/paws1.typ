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
#homework_title("Problem Set 1", "PAWS 2025", "Nathaniel Hurst")


// Numbered problems with yellow boxes and circled numbers
#numbered_problem(1)[
Instead of using a shift of exactly 3 letters in Caesar’s cipher, one could also use a secret shift depending on a key $k in {0, dots, 25}$. Describe $cal(M), cal(C), K,$ *Dec* and *Enc* for this new encryption method.
]

Let $m in cal(M) = {0, dots,25}$ and $k in {0, dots, 25}$. Then  *Enc*($m$) $ = c$ where $c = m+k space (mod 26)$ and *Dec*($c$) $= c-k space (mod 26)$. In this way we have *Dec*(*Enc*($m$))=*Dec*($m+k)= m+k-k = m$ for all $m in cal(M)$

#numbered_problem(2)[
To increase the number of keys for the Caesar cipher, one may also choose a key of the form $k = (a,b)$ with $a in (ZZ slash 26 ZZ)^*, b in (ZZ slash 26 ZZ)$, and

#align(center, $"Enc"_k(m_1,dots,m_n) = (c_1,dots,c_n) "with" c_i = a m_i + b$)
The corresponding scheme is known as an affine cipher.  

(a) Describe the corresponding decryption function $"Dec"_k$. Why is it necessary that $a$ is a unit in $(ZZ slash 26 ZZ)$?

(b) You (Eve) read a cipher text starting with BMVVK and you think that it means HELLO. Is it possible that Alice and Bob used an affine cipher in their communication? Can you recover their secret key?

(c) Alice and Bob noticed that you found their secret, and chose a new private key. This time you intercept the cipher text:  
#align(center, $"IFELTKHURFENHAFEEFSFUTSVGEDNULTKFBF"$)
Can you find the plain text message?
]

(a) $"Dec"_((a,b)(c_1, dots , c_n)) = (m_1, dots , m_n)$ where $m_i = (c_i-b) dot a^(-1) space (mod 26)$. It is necessary that $a$ is a unit in $(ZZ slash 26 ZZ)$ for if it was not then it would be possible that there would be no way to find $m_i$ given $c_i-b=a m_i$ (take for example $a equiv 0 space (mod 26)$).
#line(length: 15%)

(b) Alice and Bob are using an affine cipher with the secret key $k = (5,14)$ as HELLO $=(8,5,12,12,15)$ and $"Enc"_((5,14))((8,5,12,12,15))=(2,13,22,22,11)$ which corresponds to BMVVK. This secret key was found through guess and check, as we only need to check each $a in (ZZ slash 26 ZZ)^*$ and the $b$ which solves $a(12)+b equiv 22 space (mod 26)$ (which corresponds to encrypting $L=12$ into $V = 22$) in this way we can check $12$ possible key pairs $k=(a,b)$ and deduce the key $k=(5,14)$.
#line(length: 15%)

(c) For this problem we employ SageMath. We can brute force this, but reduce the computations by only checking certain keys in which a double letter (i.e. tt) is encrypted as EE (there are only 9 such letters). Using this we find the private key $k = (a,b) = (19, 7)$ and the plaintext is LETSCHANGEOABETTERENCRYPTIONSCHEME
#figure(
  image("images/affine_ciph.png", width: 100%),
  caption: [
  "Code"
  ],
)
#figure(
  image("images/affine_ciph_sol.png", width: 100%),
  caption: [
    Results
  ],
)


#numbered_problem(3)[
How many affine ciphers are possible using the 26-letter English alphabet? How many are possible if we also allow the symbols "?" , "."  , "," and "!"?
]

To construct an affine cipher in a 26-character alphabet we pick $a in (ZZ slash 26 ZZ)^*$ and $b in ZZ slash 26 ZZ$ to form a pair $k=(a,b)$. Thus the number of possible keys $k$ is $phi(26) dot 26 = 12 dot 26 = 312$ (where $phi$ is Eulers totient function). Adding four more characters to our alphabet increases the size from $26$ to $30$, and thus the number of possible keys in this case is $phi(30) dot 30 = 8 dot 30 = 240$. Which is less than a $26$ character alphabet! This is due to $phi(26) > phi(30)$.
#numbered_problem(4)[
You intercepted the cipher text
#align(center, $"JIVQOJIV LEALAVQO KGOONDTV QOAELONE OAINYNGJ SOBVQODB 
CLAVQOKG OONDTJIV QOJIVLEA EIBHTBLO YBLEQPIG AA"$)

from a conversation between Alice and Bob. You know that they used a substitution cipher. Can you recover the plain text $m$? Note that the spacing is only used for readability and does not coincide with the spacing of the original text.
]

For this problem we employ frequency analysis in order to make educated guesses at the plain text $m$. Since $O$ is the most common ciphertext letter we correspond this to the most common english letter $E$, and since thew bigram $Q O$ is the most common bigram in the ciphertext we correspond this to the most common english bigram (satisfying $E <-> O$) $H E$. From here we can fill in the rest of the letters with educated guesses to recover the plaintext
#align(center, $"MATHEMATICS IS THE QUEEN OF THE SCIENCES AND 
NUMBER THEORY IS THE QUEEN OF MATHEMATICS CARL FRIEDRICH GAUSS"$)

#numbered_problem(5)[
Alice and Bob want to create a shared Diffie-Hellman key. They use setups with varying security levels. In all of these, the public parameters are a prime $p = 2q+1$, and the element $g = 4 in FF_p^*$ with order $q$. You observe the following conversations. Can you find the shared keys?

(a) $q = 4294967681 approx 2^(32), A = 5104411285, B = 7620748646.$

(b) $q = 18446744073709552109 approx 2^(64), A = 17485644247020728566, B = 17485644247020728566.$

(c) $q = 340282366920938463463374607431768219863 approx 2^(128), A = 15855669586157245378211095347605706305, B = 643791185530305885858740134964520672205.$

In SageMath, you can use the *log* function to compute discrete logarithms, i.e., $a = A.log(g)$ (provided that $g, A$ are defined as elements over $FF_p$). Further, you can use *\%time* to time your results. How does the runtime evolve for increasing values of $q$?
]

(a) First we compute $p = 2q + 1= 8589935363$. Then we compute $a = A.log(g) = 121029226$. Then we can compute the shared key $B^a equiv 3122549640 space (mod p) $. The runtime for the discrete logarithm to compute $a$ was 7.1 ms.
#line(length: 15%)
(b) First we compute $p = 2q+1 = 36893488147419104219$. Then we compute $a = A.log(g) = 17913846143021880100$. Then we can compute the shared key $B^a equiv 10647114428957721787  space (mod p) $. The runtime for the discrete logarithm to compute $a$ was $190$ ms.
#line(length: 15%)
(c) First we compute $p = 2q+1 = 680564733841876926926749214863536439727$. Then we compute $a = A.log(g) = 63361436478061474206645201191086014926$. Then we can compute the shared key $B^a equiv 214488715430712623062490308139976786604  space (mod p) $. The runtime for the discrete logarithm to compute $a$ was $54$ seconds. As seen from the evolution of the time to compute the DLP, it is clear that the DLP can get very hard when numbers get large (with current methods).

#numbered_problem(6)[
We now try to set up the ElGamal public key encryption scheme. We will start by doing that in the group $G = FF_(29)^*$.

(a) First we need to fix a generator for $G$, say $g = 2$. Check that $g$ is actually a generator of $G$. Could we have chosen $g=3$ or $g=5$?

(b) Bob chooses his secret key $b=5$, compute his public key.

(c) Bob receives the encryption $(c_1, c_2) = (7,9)$ from Alice, decrypt it and find the message. (Bonus: do you think Bob can also find $k$?)

(d) Suppose now that Alice receives the public key $B=14$ from Bob. Encrypt the message $m=23$.

(e) Suppose that Bob sets his public key to $B=28$. Do you think this is secure? Suppose Eve sees the encryption $(c_1, c_2) = (14,22)$. Can she say something about the message?
]

(a) We must check that ord($g$) = 28. Now since the order of $g$ divides the order of the multiplicative group $(ZZ slash 29 ZZ)^*$ we must have that ord($g)|28$, or ord($g$) is one of $2,4,7,14,28$. Now observe that $2^2 equiv 4 equiv.not 1 space (mod 29)$, $2^4 equiv 16 equiv.not 1 space (mod 29)$, $2^7 equiv 12 equiv.not 1 space (mod 29)$, $2^14 equiv 28 equiv.not 1 space (mod 29)$. Thus we are left to conclude that ord$(g)$ = 28, or $g$ is a primitive element of $FF_(29)^*$. Similarly we can deduce that $3$ is also a primitive element and thus a valid generator, but $5$ is not a primitive element, as $5^14 equiv 1 space (mod 29)$.
#line(length: 15%)
(b) Bob's public key is $B equiv g^b equiv 2^5 equiv 3 space (mod 29)$.
#line(length: 15%)
(c) Since $7 equiv c_1 equiv 2^k space (mod 29)$ and $9 equiv c_2 equiv m dot B^k equiv m dot 3^k space (mod 29)$ we can decrypt the message as $m equiv (m B^k)dot((g^(k)^b)^(-1)) equiv 9 dot (7^2)^(-1) equiv 9 dot 16 equiv 28 space (mod 29)$. Since Bob only ever sees $k$ in the form $B^k$ and $g^k$ Bob cannot find $k$ unless he solves the discrete logarithm problem.
#line(length: 15%)
(d) We can encrypt the message by choosing $k = 5$ and computing $(c_1,c_2)=(2^5, 23 dot 14^5)=(3,2)$.
#line(length: 15%)
(e) Since $B equiv 28 equiv -1 space (mod 29)$ we have $B^k equiv 1 space (mod 29)$ if $k$ even and $B^k equiv -1 space (mod 29)$ if $k$ odd. But since $22 = m dot B^k$ we have that if $B^k equiv 1 space (mod 29)$ then $m equiv 22 space (mod 29)$ and if $B^k equiv -1 space (mod 29)$ then $m equiv -22 equiv 7 space (mod 29)$. Now since $2^k equiv 14 space (mod 29)$ we must have that since $2$ is a primitive element that $(2^14)^k equiv (-1)^k equiv 14^14 equiv 28 equiv -1 space (mod 29)$, or $(-1)^k equiv -1 space (mod 29)$ giving us that $k$ must be odd, or $m equiv 7 space (mod 29)$. 

#numbered_problem(7)[
Try now to implement the ElGamal public key encryption scheme in SageMath using prime fields. You need to implement the following functionalities:

(i) *KeyGen*, taking as input a prime $p$ and a generator $g$, returning a key pair $(s k, p k)$.

(ii) *Enc*, taking as input a prime $p$, a generator $g$, a public key $p k$ and a message $m$, returning an encryption $(c_1, c_2)$.

(iii) *Dec*, taking as input a prime $p$, a generator $g$, the secret key $s k$ and an encryption $(c_1, c_2)$, returning a message $m$.

For the prime field and the generator use the parameter set *ffdhe3072*, in which
#align(center, $p = 2^(3072) - 2^(3008) + ( ⌊2^(2942) dot e⌋ + 2625351 ) dot 2^(64) - 1$)
and $g=2$. You can find more information and the hexadecimal representation for the prime in the Appendix A and A.2 of the IETF standard Negotiated Finite Field Diffie-Hellman Ephemeral Parameters for Transport Layer Security (TLS). Try to time your implementations of *KeyGen*, *Enc* and *Dec*.

Some useful functions you can use in SageMath are the time library (load it with *import time*, then use *time.time()* to get the Unix time) the function *pow* (try to run *pow?* to see how to use it) or the constructor *GF(p)* to create the finite field $FF_p$.
]
You can also find this code in the Scripts folder on my github repo, in the file titled elgamal.ipynb

#figure(
  image("images/elgamal_1.png", width: 79%),
)
#figure(
  image("images/elgamal_2.png", width: 79%),
  caption: [
    Note that in this screenshot I leave out initializing the prime as it is a long hex string.
  ],
)

#numbered_problem(8)[
Consider the following setup:
#align(center, $p = 8589935363, g = 4 in FF_p^*,$)
and assume that Bob’s public key is $B = 1865230978$.

(For readability, we chose a small prime for which the dlog can still be computed efficiently. For the sake of this exercise, assume however that you cannot compute $b = log_(g)(B)$.)  

Bob is asking some yes/no questions to Alice. Alice encrypts her answers ($Y = 25 in FF_p^*$ for yes and $N = 14 in FF_p^*$ for no) using Bob’s public key and the ElGamal encryption scheme.  

(a) Eve intercepts Alice’s answers:
#align(center, $"Answer" 1: (2456530342, 8487632028)$)
#align(center, $"Answer" 2: (2456530342, 1660697205)$)
#align(center, $"Answer" 3: (2456530342, 1660697205)$)
and immediately sees that Alice is reusing the random integer $k in ZZ$.

(i) Without doing any computations: What are the possible answers that Alice could have sent?  

(ii) With some (computationally easy) computation: What are Alice’s answers to Questions 1,2,3?

(b) Alice notices her mistake and uses different random exponents for the next answers. However she decides that it is easier to encode $Y = 1 in FF_p^*$ and $N = -1 in FF_p^*$. Now Eve intercepts the following messages:
#align(center,$"Answer" 4: (63264669601, 8569725934)$)
#align(center,$"Answer" 5: (5864877653, 1038689194)$)
#align(center,$"Answer" 6: (1841857395, 573429127)$)

Can you recover Alice’s answers to Question 4,5,6 as well?
]

(a) 

(i) Immediately we see (since the parameter $k$ was reused) that the possible answers were YNN or NYY.

(ii) It turns out we can find $m$ using only modular inverses. We endevour to find $m_1,m_2$ given by $c_1 = m_1B^k = 8487632028$ and $c_2 = m_2B^k = 1660697205$. Since $k$ was reused we can find $c_1 c_2 = m_1 m_2 B^(2k)$, and inverting $m_1 m_2$ (we know this is $25 dot 14$ as $m_1 eq.not m_2$) and find $(m_1 m_2)^(-1)(c_1 c_2) = (m_1 m_2)^(-1)(m_1 m_2 B^(2k)) = B^(2k)$. Now we can invert $B^(2k)$ and find $B^(-2k)c_1 = m_1 B^(-k)$ and $B^(-2k)c_2 = m_2 B^(-k)$. From here we can use process of elimination since we know that $m_1,m_2 in (14,25)$. We compute $25^(-1)m_1 B^(-k)$ and $14^(-1)m_1B^(-k)$. Then we find $a_1 = c_1 25^(-1)m_1 B^(-k) = m_1 25^(-1) m_1$ and $a_2 = c_1 14^(-1)m_1 B^(-k)= m_1 14^(-1) m_1$. Now one of $a_1,a_2 in (14,25)$, and the other will be some other number, whichever is in the set gives us $m_1$. Doing this computation gives us that Alice's answers are YNN. (Note all computations are done modulo $p$)
#line(length: 15%)
(b) For this problem we can use results about quadratic residues. Observe first that $p equiv 3 space (mod 4)$ and so if $a$ is a quadratic residue then $-a$ is not. Similarly we can compute if $a$ is a quadratic residue by computing if $a^(frac(p-1,2)) equiv 1 space (mod p)$. In this way we see that $B$ is a quadratic residue, and hence $B^k$ is a quadratic residue as if $a^2 equiv B space (mod p)$ then $(a^k)^2 equiv (a^2)^k equiv B^k space (mod p)$. Then to decode the message we need only to check if $m B^k$ is a quadratic residue or not, for if it is then $m =1$ and if not $m=-1$. Doing the computation gives us that Alice's answers were YYN. 

#numbered_problem(9)[
The most widely used cryptosystem is RSA. The RSA algorithm works as follows: Bob chooses two secret large primes $p$ and $q$; he computes $N = p q$, $e$ such that $gcd(e,(p-1)(q-1)) = 1$, and $d = e^(-1) space (mod (p-1)(q-1))$. Bob’s public key is $(N,e)$. Alice encrypts the message $m < N$ by computing $c = m^e space (mod N)$. To decrypt, Bob computes $c^d space (mod N)$.

(a) Suppose Bob’s public key is $(55, 3)$. Decrypt the ciphertext $c = 12$.  

(b) Why would an efficient algorithm for factoring make RSA insecure? (A fun fact: Shor’s algorithm is an algorithm which enables quantum computers to factor efficiently; finding alternatives which are believed to be secure against quantum computers is an active area of research!)
]

(a) Since $N=55$ is small we can factor it as $55 = 5 dot 11$ and hence we need only to compute $d = 3^(-1) space (mod 40)$. From here we find $d = 27$ and hence $m = c^d equiv 23 space (mod 55)$.
#line(length: 15%)
(b) An efficient algorithm for factorization would make RSA insecure as an attacker could take Bob's public key and easily compute his private key by factoring $N= p q$.

#numbered_problem(10)[
Let $p$ be a prime and $g in FF_p^*$ a primitive element. We denote 
#align(center, $p-1 = p_1^(e_1) dots p_n^(e_n)$)
for the prime factorization of $p-1$. The goal of this exercise is to show that solving the DLP in $FF_p^*$ is essentially as hard as solving the DLP in a subgroup $G subset FF_p^*$ of prime order $"ord"(G) = max{p_i | i in (1,dots,n)}$. To make this more formal, let us say that the DLP in a subgroup $G_i subset FF_p^*$ of order $p_i$ can be solved in time $O(S_i)$.  

Let $g in FF_p^*$ be a primitive element and $A in FF_p^*$ the challenge for which we want to solve the DLP, i.e., we want to find $a in ZZ$ with $g^a = A$.  

(a) Use the Chinese Remainder Theorem to translate the problem into solving $n$ smaller instances of the DLP in subgroups of order $p_i^(e_i)$ with $i in {1,dots,n}$, respectively.  

(b) Fix $i in {1,dots,n}$ and say you want to solve one of the small DLP instances on input $A_i, g_i in FF_p^*$, where $"ord"(g_i) = p_i^(e_i)$, i.e., you want to find $a_i in ZZ$ with
#align(center, $g_i^(a_i) equiv A_i space (mod p_i^(e_i))$)

Show that this can be done in time $O(e_i S_i)$. Hint: Use a $p_i$-ary representation of $a_i = alpha_0 + alpha_1 p_i + dots + alpha_(e_i-1) p_i^(e_i-1)$.  

(c) Combine the results of (a) and (b) to show that the DLP can be solved in time
#align(center, $O("polylog"(p) max { S_i })$)

]

(a) By the Chinese Remainder Theorem it suffices to find $x_i$ such that $a equiv x_i space (mod p_1^(e_i)$) for all $i in {1, dots, n}$. To do this we can solve the DLP in subgroups of order $p^(e_i)$, i.e. we can find $a$ such that $g^a equiv A space (mod p^(e_i))$. Once we compute each $x_i$ a solution to the original DLP is given by employing the Extended Euclidean algorithm and the Chinese Remainder Theorem. It is given by $a = sum_(i=1)^n x_i M_i N_i$, where $N_i = product_(j eq.not i)p_j^e_j$ and $M_i$ satisfies $M_i N_i+m_i n_i = 1$ (given by the Extended Euclidean Algorithm). Now this solution $a$ is actually given modulo $p-1$ (as that is the integer we are factoring). However solutions to the DLP are only given in the range ${0, dots, p-1}$, and $0$ is a trivial solution only given when $g^a equiv 1 space (mod p)$ hence we still have the right solution.
#line(length: 15%)
(b) We want to solve $g_i^(a_i) equiv A_i space (mod p_i^(e_i))$ given that the DLP in a subgroup of order $p_i$ can be solved in time $O(S_i)$. Using the hint, we write $a_i = alpha_0 + alpha_1 p_i + dots + alpha_(e_i-1) p_i^(e_i-1)$. Then we only need to solve the DLP in $e_i$ subgroups of order $p_i$. More specifically we can solve for $alpha_0$ by writing $(g^a)^(p_i^(e_i-1)) equiv A^(p_i^(e_i-1)) space (mod p-1)$, which gives us $g^(alpha_0 p_i^(e_i-1))$, and solving the DLP for this gives us $alpha_0 p_i^(e_i-1)$, in which $alpha_0$ can be easily extracted using modular inverses. Now since $(g^a)^(p_i^(e_i-1))$ has order $p_i$ (because $(g^a)^(p_i^(e_i-1))^(p_i)equiv (g^a)^0 equiv 1 space (mod p_i^e_i)$ we know we can actually solve the DLP in $O(S_i)$ time, giving us $alpha_0$. Then we can solve $(frac(g^a,g^(alpha_0)))^(p_i^(e_i-2)) equiv (frac(A, g^alpha_0))^(p_i^(e_i-2)) space (mod p_i^e_i)$ in $O(S_i)$ time again since $(frac(g^a,g^(alpha_0)))^(p_i^(e_i-2))$ has order $p_i$ since $(frac(g^a,g^(alpha_0)))^(p_i^(e_i-2))^(p_i) equiv (frac(g^a,g^(alpha_0)))^(p_i^(e_i-1)) equiv g^0 equiv 1 space (mod p_i^e_i)$ Then solving the DLP in this subgroup gives $(a-alpha_0) dot (p_i^(e_i-2)) equiv alpha_1 p_i^(e_i-1) space (mod p_i^e_i)$ in which we can easily extract $alpha_1$ using modular inverses. Continuing in this fashion (dividing by $g^(alpha_j)$ and raising this to the $p^(e_i-(j-1))$ to solve the DLP in a subgroup of order $p_i$) we find $alpha_0, dots, alpha_(e_i-1)$, where we go through $e_i$ iterations in order to contruct $a$ the solution to the original DLP problem. Thus the time complexity of solving one of the small DLP instances $(mod p_i^e_i)$ is $O(e_i S_i)$.
#line(length: 15%)
(c) Since in (a) we found that if $p-1=p_1^(e_1) dots p_n^(e_n)$ then we can translate the problem into solving the DLP in subgroups of order $p_i^e_i$, we can use our result in (b) to say that solving the DLP for such $p$ takes $O("polylog"(p) max{S_i})$, for max${S_i}$ gives us the worst case for solving the DLP in each subgroup, and the number of such solutions we will have to compute is $product_(i=1)^n e_i$, in which each $e_i$ is given by taking logarithms of $p = p_1^(e_1) dots p_n^(e_n)$. 

#numbered_problem(11)[
To avoid the attack described above in implementations we use *safe primes*, i.e., primes $p$ so that $p-1 = 2q$ with $q$ also prime (primes as $q$ are also known as Sophie Germain primes). Try to understand if the following are safe primes or not:

#align(center, $"(a)" p_1 = 140970312865529183$)
#align(center, $"(b)" p_2 = 282481865344496003$)
#align(center, $"(c)" p_3 = 289942627069958089$)
#align(center, $"(d)" p_4 = "0x57f6fbca67731551934e21ad7372f2402eb9cce3f77dbe8e4fcce5052bee98efb"$)
#align(center, $"(e)" p_5 = "0x7404cc9709ed7d6a4e7551e85465df1c5bd4855274bff5d392da63732baa65"$)
(f) the prime from the parameter set ffdhe4096 (see the IETF standard Negotiated Finite Field Diffie-Hellman Ephemeral Parameters for Transport Layer Security (TLS))

]

(a) This is not a safe prime as $frac(p-1,2)$ is divisible by $7$ (factored with Sage) and hence not prime.
#line(length: 15%)
(b) This prime is also not safe as $frac(p-1,2)$ is divisible by $1783$ (factored with Sage), and hence not prime.
#line(length: 15%)
(c) This prime is not safe, as $frac(p-1,2)$ is even and greater than $2$, and hence cannot be a prime.
#line(length: 15%)
(d) This is not a safe prime as $frac(p-1,2)$ is divisible by $1061815659967$ (factored with Sage), and hence not prime.
#line(length: 15%)
(e) This is not a safe prime as $frac(p-1,2)$ is even and greater than $2$, and hence cannot be prime.
#line(length: 15%)
(f) Judging by the fact that Sage is unable to factor $frac(p-1,2)$ without timing out we can guess that this is a safe prime. A quick look at Negotiated Finite Field Diffie-Hellman Ephemeral Parameters for TLS confirms that it is such a prime.

#numbered_problem(12)[
Alice and Bob create a symmetric cipher in the following way: Their private key $k$ is a large integer and their messages are $d$-digit integers, so
#align(center, $cal(M) ={ m in ZZ : 0 <= m < 10^d}$)
To encrypt a message, Alice computes $sqrt(k)$ to $d$ decimal places and lets $alpha$ be the $d$-digit number to the right of the decimal place. (For example, if $k=87$ and $d=6$ then $sqrt(87) = 9.32737905 dots$ and $alpha = 327379$.)

Alice encrypts $m$ as $c equiv m + alpha space (mod 10^d)$. Bob decrypts $c$ by computing $m equiv c - alpha space (mod 10^d)$.

(a) Alice and Bob choose the secret key $k=11$ and use $d=6$. Bob wants to send Alice the message $m=328973$. What is the ciphertext that he sends?

(b) Alice and Bob choose the secret key $k=23$ and use it to encrypt $8$-digit integers. Alice receives $c=78183903$. What is the plaintext $m$?

(c) Show that
#align(center, $alpha = ⌊10^d (sqrt(k) - ⌊sqrt(k)⌋ ) ⌋$)

(d) (Challenge!) If Eve steals a plaintext/ciphertext pair $(m,c)$, then she can easily compute $alpha equiv c-m space (mod 10^d)$. If $10^d$ is large compared to $k$, can she also recover $k$? (This would be useful if $k$ is reused as a secret key, for greater values of $d$.)
]

(a) First we compute $alpha$ as the first $6$ digits of the decimal expansion of $sqrt(11) = 3.31662479036...$ giving us $alpha=316624$. Then we encrypt $c equiv m + alpha equiv 328973+316624 equiv 645597 space (mod 10^6)$.
#line(length: 15%)
(b) First we compute $alpha$ as the first $8$ digits of the decimal expansion of $sqrt(23) = 4.79583152331...$ giving us $alpha = 79583152$. Then to decrypt we do $m equiv c - alpha equiv 78183903 - 79583152 equiv 98600751 space (mod 10^8)$.
#line(length: 15%)
(c) Observe that $⌊sqrt(k)⌋$ gives the decimal expansion of $sqrt(k)$ including only digits to the left of the decimal point. Then $sqrt(k)- ⌊sqrt(k)⌋$ gives $0.D_1D_2 dots$, where $D_1 D_2 dots$ is the decimal expansion of $sqrt(k)$ only including digits to the right of the decimal point. Then $10^d (sqrt(k) - ⌊sqrt(k)⌋ )$ gives us $D_1 D_2 dots D_d. D_(d+1) dots$ (i.e. the previous number shifted $D$ places to the left. Finally adding the floor function cuts off all digits to the right of the decimal point. Thus we are left with exactly the first $d$ decimal places of the decimal expansion of $sqrt(k)$, which is $alpha$.
#line(length: 15%)
(d) Since we have the stipulation that $10^d$ is large compared to $k$, we can brute force $k$ given $alpha$ with relative ease. More specifically we assume that $k << 10^d$ in order to say that $sqrt(k)$'s decimal expansion is unique when considered against the other numbers up to $k$ (so we will always find the right number - this tends to be true in practice, I tried a lot of numbers!). We employ the following algorithm (on the next page):
#figure(
  image("images/sqrt_brute_force.png", width: 79%),
  caption: [
    This code can be found in the scripts folder on my github repo in the file named decimalexp.py. Try it out by square-rooting your favorite number and inputing the first d digit of its decimal expansion as alpha!
  ],
)