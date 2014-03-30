# puppet php-fpm module

A lightweight module to manage php-fpm and php-fpm pools.

## Usage

```puppet
  class { 'php-fpm': }
  php-fpm::pool { 'testing':
    listen          => '/var/run/php5-fpm-testing.sock',
    pm              => 'static',
    pm_max_children => 30,
  }
```

## Development

I/we use github as development platform:

* Project page: [https://github.com/thias/puppet-php](https://github.com/thias/puppet-php)
* Issues: [https://github.com/thias/puppet-php/issues](https://github.com/thias/puppet-php/issues)

