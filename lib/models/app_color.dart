import 'package:flutter/material.dart';

enum AppColor {
  primary(Color.fromARGB(255, 24, 93, 197)),
  secondary(Color.fromARGB(255, 94, 156, 255)),
  danger(Color.fromARGB(255, 220, 53, 69)),
  success(Color.fromARGB(255, 40, 167, 69)),
  warning(Color.fromARGB(255, 255, 193, 7)),
  gray(Color.fromARGB(255, 158, 158, 158));

  final Color value;
  const AppColor(this.value);
}
