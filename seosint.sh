#!/bin/bash

echo "\
                             _____         _____ 
_____________ ______ ___________(_)_______ __  /_
__  ___/_  _ \_  __ \__  ___/__  / __  __ \_  __/
_(__  ) /  __// /_/ /_(__  ) _  /  _  / / // /_  
/____/  \___/ \____/ /____/  /_/   /_/ /_/ \__/  
                                                 
Search Engine Open Source Intelligence
created by @jcesarstef
version 0.4
"
query=$(echo $1|sed -e 's\ \+\g')
if [ -z $query ]; then
    echo "Variable is null"
    echo "use ./seosint.sh domain.com"
    exit
fi

###############
#Google search
###############

echo "Looking for $1 in Google"

#If receive "Our systems have detected unusual traffic from your computer network" (fork from inurlbr)
domains="www.google.com|www.google.ac|www.google.com.om|www.google.ad|www.google.ae|www.google.com.af|www.google.com.ag|www.google.com.ai|www.google.am|www.google.it.ao|www.google.com.ar|www.google.cat|www.google.as|www.google.at|www.google.com.au|www.google.az|www.google.ba|www.google.com.bd|www.google.be|www.google.bf|www.google.bg|www.google.com.bh|www.google.bi|www.google.bj|www.google.com.bn|www.google.com.bo|www.google.com.br|www.google.bs|www.google.co.bw|www.google.com.by|www.google.com.bz|www.google.ca|www.google.com.kh|www.google.cc|www.google.cd|www.google.cf|www.google.cn|www.google.com.co|www.google.co.nz|www.google.cg|www.google.ch|www.google.ci|www.google.co.ck|www.google.cl|www.google.cm|www.google.co.cr|www.google.com.cu|www.google.cv|www.google.cz|www.google.de|www.google.nu|www.google.dj|www.google.dk|www.google.dm|www.google.com.do|www.google.dz|www.google.no|www.google.com.ec|www.google.ee|www.google.com.eg|www.google.es|www.google.com.et|www.google.com.np|www.google.fi|www.google.com.fj|www.google.fm|www.google.fr|www.google.ga|www.google.nl|www.google.ge|www.google.gf|www.google.gg|www.google.com.gh|www.google.com.gi|www.google.nr|www.google.gl|www.google.gm|www.google.gp|www.google.gr|www.google.com.gt|www.google.com.ni|www.google.gy|www.google.com.hk|www.google.hn|www.google.hr|www.google.ht|www.google.com.ng|www.google.hu|www.google.co.id|www.google.iq|www.google.ie|www.google.co.il|www.google.com.nf|www.google.im|www.google.co.in|www.google.io|www.google.is|www.google.it|www.google.ne|www.google.je|www.google.com.jm|www.google.jo|www.google.co.jp|www.google.co.ke|www.google.com.na|www.google.ki|www.google.kg|www.google.co.kr|www.google.com.kw|www.google.kz|www.google.co.mz|www.google.la|www.google.com.lb|www.google.com.lc|www.google.li|www.google.lk|www.google.com.my|www.google.co.ls|www.google.lt|www.google.lu|www.google.lv|www.google.com.ly|www.google.com.mx|www.google.co.ma|www.google.md|www.google.me|www.google.mg|www.google.mk|www.google.mw|www.google.ml|www.google.mn|www.google.ms|www.google.com.mt|www.google.mu|www.google.mv|www.google.com.pa|www.google.com.pe|www.google.com.ph|www.google.com.pk|www.google.pn|www.google.com.pr|www.google.ps|www.google.pt|www.google.com.py|www.google.com.qa|www.google.ro|www.google.rs|www.google.ru|www.google.rw|www.google.com.sa|www.google.com.sb|www.google.sc|www.google.se|www.google.com.sg|www.google.sh|www.google.si|www.google.sk|www.google.com.sl|www.google.sn|www.google.sm|www.google.so|www.google.st|www.google.com.sv|www.google.td|www.google.tg|www.google.co.th|www.google.tk|www.google.tl|www.google.tm|www.google.to|www.google.com.tn|www.google.com.tr|www.google.tt|www.google.com.tw|www.google.co.tz|www.google.com.ua|www.google.co.ug|www.google.co.uk|www.google.us|www.google.com.uy|www.google.co.uz|www.google.com.vc|www.google.co.ve|www.google.vg|www.google.co.vi|www.google.com.vn|www.google.vu|www.google.ws|www.google.co.za|www.google.co.zm|www.google.co.zw"

#List most common User Agent's
useragents="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36|Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36|Mozilla/5.0 (Windows NT 6.3; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0|4Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36|Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.1.1 Safari/603.2.4|Mozilla/5.0 (Windows NT 10.0; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0|Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36|Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36|Mozilla/5.0 (Windows NT 6.1; WOW64; rv:53.0) Gecko/20100101 Firefox/53.0|Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36|Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:53.0) Gecko/20100101 Firefox/53.0|Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36|Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36c"
blocked=0
start=0
more=1|sed -e 's\ \+\g'

domain=$(echo $domains | tr "|" "\n" | sort -R | head -1)
useragent=$(echo $useragents | tr "|" "\n" | sort -R | head -1)
echo "Using $domain"

#mkdir tmp 2> /dev/null
more="1"
n=1
while [ "$more" -eq "1" ]
do
    tmp=$(echo tmp-$query-$n.txt)
    curl -A "$useragent" "https://$domain/search?q=$query&num=100&newwindow=1&&start=$start&filter=0" -sL > $tmp
    cat $tmp | sed 's/<div class=\"g\">/\n/g'|grep "^<\!--"|sed 's/<em>//g'|sed 's/<\/em>//g'|grep -o "a href=\"\S*" | cut -d "\"" -f2
    more=$(cat $tmp | grep -o "<span style=\"display:block;margin-left:53px\">[a-zA-Z0-9_ ]*</span>" | wc -c)
    if [ "$more" -gt "0" ]; then
        start=$(($start+100))
        more="1"
    else
        more="0"
    fi
    n=$((n+1))
done
