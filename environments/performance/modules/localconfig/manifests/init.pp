class localconfig {

  # OS
  $user    = 'admin'
  $group   = 'staff'
  
  # App servers
  $app_hosts = ['165.225.130.148']

  # Redis
  $redis_hosts = ['127.0.0.1']
  $redis_port = 6379
  $redis_dbIndex = 0
  
  # Cassandra
  $db_keyspace = 'oae'
  $db_hosts = [ '127.0.0.1' ]
  $db_timeout = 5000
  $db_replication = 1
  $db_strategyClass = 'SimpleStrategy'

  # Install details
  $app_root = '/opt/oae'
  $app_git_user = 'sakaiproject'
  $app_git_branch = 'master'

}