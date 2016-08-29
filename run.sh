#!/bin/sh

ionic="ionic"

main() {
  display_info

  if [ -z "$WERCKER_IONIC_PACKAGE_BUILD_PLATFORM" ]; then
    fail "ionic-package-build: platform argument cannot be empty"
  fi

	# Command
  cmd="package build"

  # Command arguments
  args=

	# platform
  if [ -n "$WERCKER_IONIC_PACKAGE_BUILD_PLATFORM" ]; then
    args="$args --platform \"$WERCKER_IONIC_PACKAGE_BUILD_PLATFORM\""
  fi

	# release
  if [ "$WERCKER_IONIC_PACKAGE_BUILD_RELEASE" = "true" ]; then
    args="$args --release"
  fi

	# profile
  if [ -n "$WERCKER_IONIC_PACKAGE_BUILD_PROFILE" ]; then
    args="$args --profile \"$WERCKER_IONIC_PACKAGE_BUILD_PROFILE\""
  fi

	# Check if running in debug mode
  info "Running ionic command"
  if [ "$WERCKER_IONIC_PACKAGE_BUILD_DEBUG" = "true" ]; then
    info "$cli $cmd $args"
  fi

  eval "$cli" "$cmd" "$args"
}

display_info() {
  info "Running ionic info:"
  "$cli" info
  echo ""
}

main;
