#!/usr/bin/env bash

case $1 in
	darwin|Darwin|mac|macos|osx)
		ln -s $(pwd)/darwin/* ~/.nixpkgs/
	;;

	hm|home|home-manager)
		# mkdir -p ~/.config/nixpkgs
		ln -s $(pwd)/nixpkgs ~/.config/
	;;

	# nixos|os)
	*)
		echo 'sorry, please choose an option'
	;;
esac


