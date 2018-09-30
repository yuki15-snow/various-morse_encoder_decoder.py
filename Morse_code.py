m,dot,s = input('-¥.¥ : ').split('¥')
encode = '--.--¥.-¥..-¥-.---¥.-...¥.-..¥-.-..¥...-¥-.--¥----¥-.-.-¥--.-.¥---.-¥.---.¥---.¥-.¥..-.¥.--.¥.-.--¥..-..¥.-.¥-.-.¥....¥--.-¥..--¥-...¥--..-¥--..¥.¥-..¥-..-¥..-.-¥-¥-...-¥-..-.¥.--¥-..--¥--¥...¥--.¥-.--.¥---¥.-.-¥-.-¥.---¥.-.-.¥..¥..--.¥.----¥..---¥...--¥....-¥.....¥-....¥--...¥---..¥----.¥-----¥.--.-¥.--.-¥.-.-- ..¥.--¥-..--¥--'.split('¥')
decode = list('あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん゛゜１２３４５６７８９０ー-でゃゅょ')

def result_de(x):
    return I[x].replace(m,'-',len(I[x])).replace(dot,'.',len(I[x]))
def result_en(x):
    return x.replace('-',m,len(x)).replace('.',dot,len(x))

while True:
    IN = input("mode: ")
    if IN == 'decode': # morse code
        I = input("decode code: ").split(s)
        print(''.join([decode[encode.index(result_de(i))] for i in range(len(I))]))
    elif IN == 'encode':
        I = list(input("encode code: "))
        print(str(s).join([result_en(encode[decode.index(I[i])]) for i in range(len(I)) for j in range(len(I[i]))]))
    elif IN == 'exit()':
        break