import 'package:blogify/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class BaseViewSkeleton extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final String? backGround;
  final bool resizeToAvoidBottomSheet;
  final bool resizeFabButton;
  final bool showAppBar;
  final bool isBGColorShow;

  const BaseViewSkeleton({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backGround,
    this.resizeToAvoidBottomSheet = true,
    this.resizeFabButton = true,
    this.showAppBar = true,
    this.isBGColorShow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: context.palette.white,
      ),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomSheet,
          appBar: appBar,
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                height: constraints.biggest.height - (floatingActionButton != null && resizeFabButton ? 100.h : 0),
                width: constraints.biggest.width,
                child: body,
              );
            },
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: floatingActionButton,
        ),
      ),
    );
  }
}
