import requests

result = requests.get("https://www.random.org/integers/?num=20&min=1&max=100&format=plain&col=1&base=10")
result_set = result.content.decode().split('\n')

print (result_set)
members = ['A', 'B', 'C']

Group_A = {}
Group_B = {}

i=0

for member in members:
    if int(result_set[i]) > 50:
        Group_A[member] = int(result_set[i])
    else:
        Group_B[member] = int(result_set[i])
    i += 1


print('Group A : \n ')
print(Group_A)
print('Group B :  \n')
print(Group_B)
