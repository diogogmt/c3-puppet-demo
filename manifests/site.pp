node 'master.cs1cloud.internal' {
  include motd
  include ntp
  include cdos
  class { 'redis':
    version => '2.6.5',
  }
}

node /^.*bidder.*\.cs1cloud\.internal$/ {
  include motd
  include ntp
  include cdos
}
