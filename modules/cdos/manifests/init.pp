  
class cdos {
  class { git::clone: repo => 'c3' }

  class {'::mongodb::globals':
    manage_package_repo => true,
   }->

   class {'::mongodb::server': }->
   class {'::mongodb::client': }
}

class git::clone ($repo, $username='root') {
  $group = $username

  group { $username:
      ensure  => present,
      gid     => 2000,
  }

  file { '/opt/code' :
      ensure  => directory,
      group   => $group,
      owner   => $username,
      mode    => 0755,
  }

  file { '/home/${username}':
      ensure  => directory,
      group   => $group,
      owner   => $username,
      mode    => 0700,
  }

  package { 'git':
      ensure => installed,
  }

  vcsrepo { "/root/${repo}":
      ensure   => latest,
      owner    => $owner,
      group    => $owner,
      provider => git,
      require  => [ Package["git"] ],
      source   => "https://github.com/diogogmt/c3-sdk-js.git",
      revision => 'master',
  }
}
