define php-fpm::pool(
  $user = 'www-data',
  $group = 'www-data',
  $listen = '127.0.0.1:9000',
  $listen_backlog = 128,
  $listen_owner = 'www-data',
  $listen_group = 'www-data',
  $listen_mode = '0666',
  $listen_allowed_clients = 'any',
  $pm = 'dynamic',
  $pm_max_children = 10,
  $pm_start_servers = 4,
  $pm_min_spare_servers = 2,
  $pm_max_spare_servers = 6,
  $pm_process_idle_timeout = '10s',
  $pm_max_requests = 500,
  $chdir = '/',
) {
  file { "/etc/php5/fpm/pool.d/${name}.conf":
    ensure  => present,
    content => template('php-fpm/pool.conf.erb'),
    notify  => Class['Php-fpm::Service'],
  }
}
