import random

def second_entry(x):
    return x[1]+ temp

def letter2number(x):
    return ord(x) - 65

frequency = "ETAOINSRHDLUCMFYWGPBVKXQJZ"
frequency_global = [letter2number(p) for p in frequency]
ctext = "JIVQOJIVLEA"
# ctext = "JIVQOJIVLEALAVQOKGOONDTVQOAELONEOAINYNGJSOBVQODBCLAVQOKGOONDTJIVQOJIVLEAEIBHTBLOYBLEQPIGAA"
num = [letter2number(c) for c in ctext]

# temp > 0 returns random shift between [-temp,temp]
temp = 2

result = 0
freq_c = []
for j in range(26):
    for i in range(len(num)):
        if num[i] == j:
            result += 1
    
    freq_c.append([j,result])
    result = 0

for i in range(len(freq_c)):
    (freq_c[i][1]) = (freq_c[i][1]) + random.randint(-temp,temp)
freq_c = sorted(freq_c, key=second_entry, reverse=True)

cipher_ranks = []
for c in freq_c:
    cipher_ranks.append(c[0])
    

plain = []
for n in num:
    rank = cipher_ranks.index(n)
    plain.append(frequency_global[rank])
    
for p in plain:
    print(chr(p + 65), end= '')




