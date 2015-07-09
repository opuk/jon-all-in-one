service { 'firewalld':
  ensure  => stopped,
  enabled => false,
}
