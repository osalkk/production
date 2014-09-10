# == Class: tree
#
# Installs (or removes) Tree
#
# === Parameters
#
# Document parameters here.
#
# [*ensure*]
#   Any of the typical $ensure values for a Package: present, absent,
#   latest, etc.
#
# === Examples
#
#  class { 'tree':
#    ensure => latest,
#  }
#
# === Authors
#
# Rick Fletcher <fletch@pobox.com>
#
# === Copyright
#
# Copyright 2014 Rick Fletcher
#
class tree (
  $ensure = 'present',
) {
  package { 'tree':
    ensure => $ensure,
  }
}
