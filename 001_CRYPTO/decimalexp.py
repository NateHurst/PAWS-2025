import math
d = 25
alpha = 1903091670903924786678935

result = 0
i = 1       
while result == 0:
    guess = pow(i+(float(alpha)/pow(10,d)),2)
    i += 1
    if (math.fabs(guess - math.floor(guess))) < (1 / pow(10,d)):
        print(f"The secret key is: k = {round(guess % pow(10,d))}")
        result += 1 



