#!/bin/bash
#Based off of script from @thecybermentor
#needs lots of improvement and less hard coding
#to-do: a lot of work

url=$1
if  [ ! -d "$url" ]; then
	mkdir $url
fi

if [ ! -d "$url/recon" ]; then
	mkdir $url/recon
fi

echo "[+] Harvesting subdomains with assetfinder..."
assetfinder $url >> $url/recon/assets.txt
cat $url/recon/assets.txt | grep $1 >> $url/recon/finalSubList.txt
rm $url/recon/assets.txt
echo "[+] you can find the asset list at $url/recon/findSubList.txt"
echo " "
#echo "[+] Harvesting subdomains with Amass..."
#amass enum -d $url >> $url/recon/f.txt
#sor -u $url/recon/f.txt >> $url/recon/finalAmass.txt
#rm $url/recon/f.txt

echo "[+] Probing for alive web hosts..."
cat $url/recon/finalSubList.txt | sort -u | httprobe | sed 's/https\?:\/\///' | sort -u >> $url/recon/alive.txt
echo "alive web hosts can be found at $url/recon/alive.txt"
echo ""
