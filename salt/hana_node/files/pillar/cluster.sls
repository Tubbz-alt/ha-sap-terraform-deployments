cluster:
  name: 'hacluster'
  init: 'hana01'
  interface: 'eth1'
  watchdog:
    module: softdog
    device: /dev/watchdog
  sbd:
    device: '/dev/vdc'
  ntp: pool.ntp.org
  sshkeys:
    overwrite: true
    password: linux
  resource_agents:
    - SAPHanaSR
  configure:
    method: 'update'
    template:
      source: /root/salt/hana_node/files/config/cluster.j2
      parameters:
        sid: prd
        instance: "00"
        virtual_ip: 192.168.106.50
        virtual_ip_mask: 255.255.255.0
        platform: libvirt'
        prefer_takeover: true
        auto_register: false
