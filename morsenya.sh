#!/bin/sh
enc_list=('--.--' '.-' '..-' '-.---' '.-...' '.-..' '-.-..' '...-' '-.--' '----' '-.-.-' '--.-.' '---.-' '.---.' '---.' '-.' '..-.' '.--.' '.-.--' '..-..' '.-.' '-.-.' '....' '--.-' '..--' '-...' '--..-' '--..' '.' '-..' '-..-' '..-.-' '-' '-...-' '-..-.' '.--' '-..--' '--' '...' '--.' '-.--.' '---' '.-.-' '-.-' '.---' '.-.-.' '..' '..--.' '.----' '..---' '...--' '....-' '.....' '-....' '--...' '---..' '----.' '-----' '.--.-' '.-.-- ..')
dec_list=('あ' 'い' 'う' 'え' 'お' 'か' 'き' 'く' 'け' 'こ' 'さ' 'し' 'す' 'せ' 'そ' 'た' 'ち' 'つ' 'て' 'と' 'な' 'に' 'ぬ' 'ね' 'の' 'は' 'ひ' 'ふ' 'へ' 'ほ' 'ま' 'み' 'む' 'め' 'も' 'や' 'ゆ' 'よ' 'ら' 'り' 'る' 'れ' 'ろ' 'わ' 'を' 'ん' '゛' '゜' '１' '２' '３' '４' '５' '６' '７' '８' '９' '０' 'ー' 'で')

mode=$1
rule=(`echo $2 | tr ',' ' '`)
result=""
if [ $mode = "dec" ]; then
    read code
    code=${code//${rule[0]}/"-"};
    code=${code//${rule[1]}/"."};
    code=(`echo $code | tr ' ' ' '`)
    for ((i=0 ; i<${#code[*]} ; i++)) do
        n=""
        for ((j=0 ; j<60 ; j++)) do
            if [ "${enc_list[$j]}" = "${code[$i]}" ]; then
                n=$j;
                break;
            fi
        done
        if [ "$n" != "" ]; then
            result="$result${dec_list[$n]}"
        else
            result="$result?"
        fi
    done
    echo $result
elif [ $mode = "enc" ]; then
    read code
    for ((i=0 ; i<${#code} ; i++)) do
        n=""
        for ((j=0 ; j<60 ; j++)) do
            if [ "${dec_list[$j]}" = "${code:$i:1}" ]; then
                n=$j
                break
            fi
        done
        if [ "$n" != "" ]; then
            result="$result ${enc_list[$n]}"
        else
            result="$result ?"
        fi
    done
    result=${result//"-"/${rule[0]}};
    result=${result//"."/${rule[1]}};
    echo $result
else
    echo "command defind"
fi
