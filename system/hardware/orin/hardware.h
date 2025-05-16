#pragma once

#include <cstdlib>
#include <fstream>

#include "common/util.h"
#include "system/hardware/base.h"

class HardwareOrin: public HardwareNone {
public:
  static bool Orin() { return true; }
  static std::string get_os_version() {
    return util::read_file("/usr/local/etc/version.txt");
  };
  static std::string get_name() { return "ORIN"; };

  static void reboot() { std::system("sudo reboot"); };
  static void poweroff() { std::system("sudo poweroff"); };
};
