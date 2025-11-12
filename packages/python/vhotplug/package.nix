# SPDX-FileCopyrightText: 2022-2026 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
{
  buildPythonApplication,
  fetchFromGitHub,
  qemu-qmp,
  pyudev,
  psutil,
  inotify-simple,
  setuptools, # Required for legacy setup.py in external repo
  hatchling,
  uv,
  lib,
}:
buildPythonApplication {
  pname = "vhotplug";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tiiuae";
    repo = "vhotplug";
    rev = "7ffacc014b7565a102eee3eb7adc7a28740e6944";
    hash = "sha256-fMh0IwuXeTMUZjuvEz5CjbVnAtEDrFYMWXE+yrQebGI=";
  };

  build-system = [
    setuptools # Required for legacy setup.py in external repo
    hatchling
    uv
  ];

  dependencies = [
    pyudev
    psutil
    inotify-simple
    qemu-qmp
  ];

  doCheck = false;

  meta = {
    description = "Virtio Hotplug - Virtual device hotplug management for QEMU";
    license = lib.licenses.asl20;
    platforms = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    mainProgram = "vhotplug";
  };
}
