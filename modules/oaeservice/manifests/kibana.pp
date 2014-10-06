class oaeservice::kibana {
  include ::oaeservice::deps::package::git

  Class['::oaeservice::deps::package::git']         -> Class['::kibana']

  # Apply the Kibana class
  class { '::kibana':

    install_method        => hiera('stats_install_method', 'git'),
    install_config        => hiera('stats_install_config', {source => 'https://github.com/elasticsearch/kibana', revision => 'master'}),

    os_user               => hiera('app_os_user'),
    os_group              => hiera('app_os_group'),
    stats_ui_dir          => hiera('stats_ui_dir', '/opt/stats')
  }
}
