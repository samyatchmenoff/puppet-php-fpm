class php-fpm {
  anchor { 'php-fpm::begin':
    before => Class['php-fpm::install'],
    notify => Class['php-fpm::service'],
  }
  class { 'php-fpm::install':
    notify => Class['php-fpm::service'],
  }
  class { 'php-fpm::service': }
  anchor { 'php-fpm::end':
    require => Class['php-fpm::service'],
  }
}
