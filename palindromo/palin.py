word=input("Digite uma palavra:")
size=len(word)


n_palin=0
for i in range(size):
    for j in range(i+1,size):
       # print("%s %s" %( word[i], word[j]))
        if word[i] == word[j]:
            word2=word[i:j+1]
            print(word2)
            print(len(word2))
            if len(word2) == 3:
                print("Achei um palindromo de %d letras!: %s" % (len(word2), word2))
                n_palin=n_palin+1
            if len(word2) == 2:
                print("Achei um palindromo de %d letras!: %s" % (len(word2), word2))
            else:
                if word[i+1] == word[j-1]:
                    word2=word[i+2:j-1]
                    print(word2)


print("Temos %d palindromos!!" % n_palin)


def check(word2):
    if len(word2) == 3:
        print("Achei um palindromo de %d letras!: %s" % (len(word2), word2))
        n_palin=n_palin+1
    if len(word2) == 2:
        print("Achei um palindromo de %d letras!: %s" % (len(word2), word2))


