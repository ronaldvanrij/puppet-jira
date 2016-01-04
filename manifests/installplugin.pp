define jira::installplugin ($plugin=$title) {
  exec { "install_${plugin}":
    user => $jira::user,
    command => "curl -f -L -o ${jira::homedir}/plugins/installed-plugins/${plugin}.jar https://marketplace.atlassian.com/download/plugins/${plugin}",
    creates => "${jira::homedir}/plugins/installed-plugins/${plugin}.jar",
    timeout => 1800,
    require => [Exec["mkdir-plugins-dir"]]
  }
}
