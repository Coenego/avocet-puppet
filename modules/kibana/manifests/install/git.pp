class kibana::install::git ($install_config, $stats_ui_dir = '/opt/stats') {
    require ::oaeservice::deps::package::git

    $_install_config = merge({
        'source'    => 'https://github.com/elasticsearch/kibana.git',
        'revision'  => 'master'
    }, $install_config)

    # git clone https://github.com/elasticsearch/kibana
    vcsrepo { $stats_ui_dir:
        ensure    => latest,
        provider  => git,
        source    => $_install_config['source'],
        revision  => $_install_config['revision']
    }
}
