#
# Valid options for install_method and install_config are enumerated in ::kibana::install namespace documentation
#
class kibana (
  $install_method     = 'git',
  $install_config     = {'source' => 'https://github.com/elasticsearch/kibana.git', 'revision' => 'master'},
  $os_user,
  $os_group,
  $stats_ui_dir       = '/opt/stats') {

  class { "::kibana::install::${install_method}":
    install_config  => $install_config,
    stats_ui_dir    => $stats_ui_dir
  }
}
