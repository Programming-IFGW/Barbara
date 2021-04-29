word=input("Digite uma palavra:")
size=len(word)

for i in range(size):
    for j in range(i+1,size):
        print(i)
        print(j)
        print("%s %s", % word[i], word[j])
            #if word[i] == word[j]:
             #   print("letras iguais")
