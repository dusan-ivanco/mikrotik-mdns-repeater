/system device-mode update container=yes
/container config set ram-high=256 registry-url=https://registry-1.docker.io tmpdir=usb1-part1/tmp

/interface veth add name=veth1 gateway=172.17.0.1 address=172.17.0.2/24
/interface bridge port add bridge=LAN interface=veth1

/container envs add name=mdns key=MAC value=02:42:ac:11:00:02
/container envs add name=mdns key=VLAN value=1001,1002,1003

/container add file=usb1-part1/opt/container/mdns_arm32.tar root-dir=usb1-part1/run/container/mdns envlist=mdns hostname=mdns interface=veth1 logging=yes start-on-boot=yes
