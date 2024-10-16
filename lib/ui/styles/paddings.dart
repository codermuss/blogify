import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class Paddings {
  // * Note [codermuss]: All Padding
  static final EdgeInsets p1a = EdgeInsets.all(1.h);
  static final EdgeInsets p4a = EdgeInsets.all(4.h);
  static final EdgeInsets p8a = EdgeInsets.all(8.h);
  static final EdgeInsets p16a = EdgeInsets.all(16.h);
  static final EdgeInsets p32a = EdgeInsets.all(32.h);

  // * Note [codermuss]: Horizontal Padding
  static final EdgeInsets p1h = EdgeInsets.symmetric(horizontal: 1.h);
  static final EdgeInsets p4h = EdgeInsets.symmetric(horizontal: 4.h);
  static final EdgeInsets p8h = EdgeInsets.symmetric(horizontal: 8.h);
  static final EdgeInsets p16h = EdgeInsets.symmetric(horizontal: 16.h);
  static final EdgeInsets p32h = EdgeInsets.symmetric(horizontal: 32.h);

  // * Note [codermuss]: Vertical Padding
  static final EdgeInsets p1v = EdgeInsets.symmetric(vertical: 1.h);
  static final EdgeInsets p4v = EdgeInsets.symmetric(vertical: 4.h);
  static final EdgeInsets p8v = EdgeInsets.symmetric(vertical: 8.h);
  static final EdgeInsets p16v = EdgeInsets.symmetric(vertical: 16.h);
  static final EdgeInsets p32v = EdgeInsets.symmetric(vertical: 32.h);

  // * Note [codermuss]: Other Padding
  static final EdgeInsets p12v4h = EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.h);
  static final EdgeInsets p32l = EdgeInsets.only(left: 32.h);
}
