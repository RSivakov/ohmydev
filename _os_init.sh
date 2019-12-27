#!/bin/sh
# This is simple script for getting OS name and it's version
# Script outputs the string in the format: dist_name-dist_version
# e.g. fedora-14

os=$(uname -s)
dist_name='unknown'
dist_version='unknown'

case "${os}" in
    'Linux')
	lsb_release_path=$(which lsb_release 2> /dev/null)
	if [ "${lsb_release_path}x" != "x" ]; then
	    dist_name=$(${lsb_release_path} -i | cut -d ':' -f2 )
	    dist_version=$(${lsb_release_path} -r | cut -d ':' -f2 | sed 's/\t *//g')
	else
	    if [ -r '/etc/debian_version' ]; then
		if [ -r '/etc/dpkg/origins/ubuntu' ]; then
		    dist_name='ubuntu'
		else
		    dist_name='debian'
		fi
		dist_version=$(cat /etc/debian_version | sed s/.*\///)
	    elif [ -r '/etc/mandrake-release' ]; then
                dist_name=$(cat /etc/mandrake-release | sed s/.*\(// | sed s/\)//)
		dist_version=$(cat /etc/mandrake-release | sed 's/.*release\ //' | sed 's/\ .*//')
	    elif [ -r '/etc/redhat-release' ]; then
		if [ -r '/etc/asplinux-release' ]; then
		    dist_name='asplinux'
		    dist_version=$(cat /etc/asplinux-release | sed 's/.*release\ //' | sed 's/\ .*//' )
		elif [ -r '/etc/altlinux-release' ]; then
		    dist_name='altlinux'
		    dist_version=$(cat /etc/altlinux-release | sed 's/.*Linux\ //' | sed 's/\ .*//')
		else
		    if [ "$(cat /etc/redhat-release | grep -i 'Red Hat Enterprise')x" != "x" ]; then
                        dist_name='rhel'
		    else
		        dist_name=$(cat /etc/redhat-release | cut -d ' ' -f1)
		    fi
		    dist_version=$(cat /etc/redhat-release | sed 's/.*release\ //' | sed 's/\ .*//' )
		fi
	    elif [ -r '/etc/arch-release' ]; then
                dist_name='archlinux'
		dist_version=$(cat /etc/arch-release)
	    elif [ -r '/etc/SuSe-release' ]; then
		dist_name='opensuse'
		dist_version=$(cat /etc/SuSe-release | grep 'VERSION' | sed 's/.*=\ //')
	    elif [ -r '/etc/sles-release' ]; then
		dist_name='sles'
		dist_version=$(cat /etc/SuSe-release | grep 'VERSION' | sed 's/.*=\ //')
	    elif [ -r '/etc/slackware-version' ]; then
		if [ -r '/etc/zenwalk-version' ]; then
		    dist_name='zenwalk'
		    dist_version=$(cat /etc/zenwalk-version)
		elif [ -r '/etc/slax-version' ]; then
		    dist_name='slax'
		    dist_version=$(cat /etc/slax-version | cut -d ' ' -f2)
		else
		    dist_name=$(cat /etc/slackware-version | cut -d ' ' -f1)
		    dist_version=$(cat /etc/slackware-version | cut -d ' ' -f2)
		fi
	    elif [ -r /etc/puppyversion ]; then
		dist_name='puppy'
		dist_version=$(cat /etc/puppyversion)
	    fi
	fi
    ;;
    'OpenBSD'|'NetBSD'|'FreeBSD'|'SunOS')
	dist_name=$os
        if [ "$dist_name" = "SunOS" ]; then
	    dist_name='solaris'
	fi
	dist_version=$(uname -r | sed 's/-.*//')
    ;;
    'Darwin')
	dist_name='macos'
        dist_version=$(sw_vers -productVersion)
    ;;
esac

dist_name=$(echo $dist_name | tr '[:upper:]' '[:lower:]')
echo "$dist_name-$dist_version"