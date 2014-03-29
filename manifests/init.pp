class php-fpm(
  $ensure = 'present',
  $pid = '/var/run/php5-fpm.pid',
  $error_log = '/var/log/php5-fpm.log',
  $syslog_facility = 'daemon',
  $syslog_ident = 'php-fpm',
  $log_level = 'notice',
  $emergency_restart_threshold = 0,
  $emergency_restart_interval = 0,
  $process_control_timeout = 0,
  $process_max = 0,
  $daemonize = yes,
  $rlimit_files = undef,
  $rlimit_core = undef,
  $events_mechanism = undef,
){
  anchor { 'php-fpm::begin':
    before => Class['php-fpm::install'],
    notify => Class['php-fpm::service'],
  }
  class { 'php-fpm::install':
    ensure => $ensure,
    notify => Class['php-fpm::service'],
  }
  class { 'php-fpm::service': }
  anchor { 'php-fpm::end':
    require => Class['php-fpm::service'],
  }
}
