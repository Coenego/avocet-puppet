class rabbitmq (
    $listen_address   = false,
    $listen_port      = '5672',
    $owner            = 'rabbitmq',
    $group            = 'rabbitmq',
  ) {

  ##########################
  ## PACKAGE DEPENDENCIES ##
  ##########################

  package { 'rabbitmq-server=2.7.1-0ubuntu4': ensure => installed, alias => 'rabbitmq-server' }

  file { '/etc/rabbitmq/rabbitmq.config':
    ensure  => present,
    mode    => 0640,
    owner   => $owner,
    group   => $group,
    content => template('rabbitmq/rabbitmq.config.erb'),
    require => Package['rabbitmq-server'],
  }

  service { 'rabbitmq-server':
    ensure  => running,
    require => File['/etc/rabbitmq/rabbitmq.config'],
  }
}