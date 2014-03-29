class php-fpm::install($ensure) {
  package { 'php5-fpm':
    ensure => $ensure,
  }
  file { '/etc/php5/fpm/php-fpm.conf':
    ensure  => $ensure,
    content => template('php-fpm/php-fpm.conf.erb'),
    require => Package['php5-fpm'],
    notify  => Service['php5-fpm'],
  }
}
