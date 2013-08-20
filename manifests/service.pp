class php-fpm::service {
  service { 'php5-fpm':
    ensure    => running,
    provider  => 'init',
  }
}
