def second_entry(x):
    return x[1]+ temp

def letter2number(x):
    return ord(x) - 65

frequency = "ETAOINSRHDLUCMFYWGPBVKXQJZ"
frequency_global = [letter2number(p) for p in frequency]
ctext = "JIVQOJIVLEALAVQOKGOONDTVQOAELONEOAINYNGJSOBVQODBCLAVQOKGOONDTJIVQOJIVLEAEIBHTBLOYBLEQPIGAA"
num = [letter2number(c) for c in ctext]

# temp > 0 returns random shift between [-temp,temp]
temp = 2

result = 0
bigram_c = []

for i in range(len(num)):
    bigram_c.append([num[i],num[(i+1) % 26]])

unique = []
for c in bigram_c:
    if c not in unique:
        unique.append(c)
       
freq_c = [] 
for u in unique:
    for b in bigram_c:
        if u == b:
            result += 1
    
    freq_c.append([u,result])
    result = 0

freq_c = sorted(freq_c, key=second_entry, reverse=True)
print(freq_c)

