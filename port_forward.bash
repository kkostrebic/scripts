interface=$1
port_type=$2
port=$3
ip_from=$4
ip_to=$5

echo $interface $port_type $port $ip_from $ip_to
iptables -t nat -A PREROUTING -i $interface -p $port_type -d $ip_from --dport $port -j DNAT --to $ip_to:$port
iptables -A FORWARD -p $port_type -i $interface -d $ip_to --dport $port -j ACCEPT
