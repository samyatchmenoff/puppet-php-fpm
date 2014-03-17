class php-fpm(
  $pid = '/var/run/php5-fpm.pid',
  $error_log = '/var/log/php5-fpm.log',
  $syslog_facility = 'daemon',
  $syslog_ident = 'php-fpm',
  $log_level = 'notice',
  $emergency_restart_threshold = 0,
  $emergency_restart_interval = 0,
  $process_control_timeout = 0,
  $process_max = 128,
  $daemonize = yes,
  $rlimit_files = 1024,
  $rlimit_core = 0,
  $events_mechanism = false,
){
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
