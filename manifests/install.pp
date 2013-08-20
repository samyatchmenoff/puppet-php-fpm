class php-fpm::install {
  package { 'php5-fpm':
    ensure => present,
  }
  file { '/etc/php5/fpm/php-fpm.conf':
    ensure  => present,
    content => template('php-fpm/php-fpm.conf.erb'),
    require => Package['php5-fpm'],
  }
}
