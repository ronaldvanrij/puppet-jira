class jira::plugins inherits jira {
  exec { "mkdir-plugins-dir":
      user => $jira::user,
      command => "mkdir -p ${jira::homedir}/plugins/installed-plugins",
      creates => "${jira::homedir}/plugins/installed-plugins",
      require => [
        File[$jira::homedir],
      ],
  }
  jira::installplugin { $jira::installed_plugins: }
}
