#~/.bash_aliases

readGrailsVersion() {
  local action="$1"
  shift
  local path=$PWD"/$*";
  path="$(dirname $path)/$(basename $path)/application.properties"
  if [ -f "$path" ]; then
    echo -e "\033[32mDetectando version de grails. Actualizando entorno...\033[0m"
    local GRAILS_VERSION=$(grep 'grails.version' $path | cut -f2 -d=);
    sdk use grails $GRAILS_VERSION;
  fi
  $action $*
}

meliVPN() {
  local current="$PWD"
  cd /home/local/B-VISION/spiano/development/repo/MELI/vpn/VPN-Linux-FINAL;
  sudo ./jvpn-meli.pl -c jvpn.ini
  cd $current
}

alias cd='readGrailsVersion cd';
alias json="python -mjson.tool";
alias meliVPN='meliVPN';
alias tunnel_mongo="ssh -fN -L 8081:e-00003455.melicloud.com:27017 $USER@batman";
alias tunnel_internal="ssh -fN -L 35000:internal.mercadolibre.com:80 $USER@batman";
alias batman='ssh smpiano@10.100.41.3'
