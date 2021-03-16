// Source: https://gist.github.com/rodydavis/2ae31e1c61a865ef2ea0bb567beb5f20

import 'package:flutter/material.dart';

const kTabletSize = Size(500, 700);
const kListWidthSize = 300.0;
const kTabletBreakpoint = 720.0;
const kDesktopBreakpoint = 1200.0;

enum DeviceSize { mobile, tablet, desktop }

extension LayoutUtils on BoxConstraints {
  DeviceSize get device {
    if (this.maxWidth >= kDesktopBreakpoint) {
      return DeviceSize.desktop;
    }
    if (this.maxWidth >= kTabletBreakpoint) {
      return DeviceSize.tablet;
    }
    return DeviceSize.mobile;
  }
}