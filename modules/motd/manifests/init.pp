class motd {
  file {'motd':
      ensure  => file,
      path    => '/etc/motd',
      mode    => 0644,
      content => "This CDOS Puppet VM's IP address is ${ipaddress}. It thinks its
        hostname is ${fqdn}, but you might not be able to reach it there
        from your host machine. It is running ${operatingsystem} ${operatingsystemrelease} and
        Puppet ${puppetversion}.
        Web console login:
          URL: https://${ipaddress_eth0}
          User: root
          Password: Cloud12345!!
        ",
    }
}
