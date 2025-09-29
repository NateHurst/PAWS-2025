import math
d = 16
alpha = 3426772260936412

#result = pow(4.0 + (float(alpha)), 2)
#
for i in range(int(math.floor(math.sqrt(pow(10,d))))):
    guess = pow(i+(float(alpha)/pow(10,d)),2)
    if i > 0:
        if (math.fabs(guess - math.floor(guess)-1.0)) < (1 / pow(10,d-2)):
            print(f"The secret key is: {round(guess % pow(10,d))}")



