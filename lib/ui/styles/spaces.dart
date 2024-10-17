import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spaces {
  // * Note [codermuss]: Vertical Spaces
  static final Widget verticalSpaceSmall = SizedBox(height: 8.h);
  static final Widget verticalSpaceMedium = SizedBox(height: 16.h);
  static final Widget verticalSpaceLarge = SizedBox(height: 32.h);

  // * Note [codermuss]: Horizontal Spaces
  static final Widget horizontalSpaceSmall = SizedBox(height: 8.w);
  static final Widget horizontalSpaceMedium = SizedBox(height: 16.w);
  static final Widget horizontalSpaceLarge = SizedBox(height: 32.w);
}
