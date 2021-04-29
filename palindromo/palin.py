word=input("Digite uma palavra:")
size=len(word)


n_palin=0
for i in range(size):
    for j in range(i+1,size):
       # print("%s %s" %( word[i], word[j]))
        if word[i] == word[j]:
            word2=word[i+1:j]
            if len(word2) == 1:
                print("Achei um palindromo!: %s" %word[i:j+1])
                n_palin=n_palin+1


print("Temos %d palindromos!!" % n_palin)

