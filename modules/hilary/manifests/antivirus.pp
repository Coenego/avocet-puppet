class hilary::antivirus (

    $scan_directory,

    # Location of the ClamAV scan log
    $log_path='/var/log/clamav.log') {


    ##################
    ## INSTALLATION ##
    ##################

    package { 'clamav':
        ensure => 'installed'
    }

    ###################
    ## CONFIGURATION ##
    ###################

    # Register cronjob
    cron { 'antivirus':
        ensure  => present,
        command => "${scripts_dir}/antivirus.sh >> ${log_path} 2>> ${log_path}",
        user    => 'root',
        target  => 'root',
        hour    => ['0-23']
        minute  => 0
    }
}
