#!/bin/bash

################################################################################
# A framework for detecting, and building logic around data
# from the underlaying operating system and distribution.
# Written by Viktor Petersson (@vpetersson).
################################################################################

################################################################################
# Fetch system data (via Python)
################################################################################

## Returns 'Linux', 'Windows' etc.
OS=$(python -c 'import platform; print platform.system()')

## Returns 'Debian', 'Ubuntu', 'Fedora' etc.
DIST=$(python -c 'import platform; dist = platform.linux_distribution()[0]; print dist[0].upper() + dist[1:]')

## Returns the distribution version.
DISTVER=$(python -c 'import platform; print platform.linux_distribution()[1]')

## Returns '32bit' or '64bit'
ARCH=$(python -c 'import platform; print platform.architecture()[0]')

################################################################################
# Functions for various situations
################################################################################

## Generic Linux
function linux {
  echo "This will be executed on all Linux systems."
}

## Debian
function debian {
  echo "This will only be executed on a Debian systems."
}

## Ubuntu
function ubuntu {
  echo "This will only be executed on an Ubuntu systems."
}

## CentOS
function centos {
  echo "This will only be executed on a CentOS system."
}

## Fedora
function fedora {
  echo "This will only be executed on a Fedora system."
}

################################################################################
# No need for making changes below here
################################################################################

if [ $OS == 'Linux' ]; then

  # Run on all Linux systems.
  linux

  # Debian
  if [ $DIST == 'Debian' ]; then
    debian
  # Ubuntu
  elif  [ $DIST = 'Ubuntu' ]; then
    ubuntu
  # CentOS
  elif [ $DIST = 'CentOS' ]; then
    centos
  # RedHat Enterprise Linux
  elif [ $DIST = 'RedHat' ]; then
    redhat
  # Fedora
  elif [ $DIST = 'Fedora' ]; then
    fedora
  else
    echo "$DIST is an unsupported Linux distribution"
    exit 1
  fi

else
  echo "$OS is an unsupported platform"
  exit 1
fi

