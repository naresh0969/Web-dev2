list=[12,4,2,1]
list2=[]
list2=list.copy()
list2.reverse()
if(list2==list):
    print("Palindrome list")
    print("list1 ",list)
    print("list2 ",list2)
else:
    print("not palindrome list")
    print("list1 ",list)
    print("list2 ",list2)

list=["r","k","y"]
list.sort()
print("straight sort:",list)
list.sort(reverse=True)
print("reverse ",list)
print(list[1:3])