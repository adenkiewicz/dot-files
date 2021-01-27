function extract {
  echo Extracting $1 ...
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xjf $1  ;;
          *.tar.gz)    tar xzf $1  ;;
          *.bz2)       bunzip2 $1  ;;
          *.rar)       unrar x $1    ;;
          *.gz)        gunzip $1   ;;
          *.tar)       tar xf $1   ;;
          *.tbz2)      tar xjf $1  ;;
          *.tgz)       tar xzf $1  ;;
          *.zip)       unzip $1   ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1  ;;
          *)        echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
}

function no_proxy {
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset ALL_PROXY
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset all_proxy
}

function scan_shodan_from_file () {
    # perform IP extension on given file
    ips=($(nmap -sL -n -iL $1 | grep 'Nmap scan report for' | cut -f 5 -d ' '))
    for i in $ips; do
        nmap --script shodan-api -sn -Pn -n $i 
    done
}

function scan_headers () {
    export host=`echo $1 | awk "-F[/:]" '{print $4}'`
    echo Scanning $1, results will be saved to ${host}_headers.xml
    python3 /opt/securityheaders/securityheaders.py $1 --formatter json --flatten | python3 /opt/PTCC/Canopy/SecurityHeaders2Canopy.py > "${host}_headers.xml"
}

function scan_headers_from_file () {
    for host in `cat "$1"`; scan_headers $host
}

function scan_tls () {
    echo Scanning $1, results will be saved to ${1}_testssl.xml
    /opt/testssl.sh/testssl.sh --jsonfile "${1}_testssl.json" $1 ; python3 /opt/PTCC/Canopy/Testssl2Canopy.py "${1}_testssl.json" "${1}_testssl.xml"
}

function scan_tls_from_file () {
    for host in `cat "$1"`; scan_tls $host
}
