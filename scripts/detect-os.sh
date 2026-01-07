#!/usr/bin/env bash

case "$(uname -s)" in
  Linux*)  PLATFORM="linux" ;;
  Darwin*) PLATFORM="macos" ;;
  *)
    echo "Unsupported OS"
    exit 1
    ;;
esac

export PLATFORM
