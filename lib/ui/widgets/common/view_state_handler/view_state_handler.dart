import 'package:blogify/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../localization/locale_keys.g.dart';
import '../../../../models/base/view_state.dart';
import '../locale_text/locale_text.dart';

/// MARK: [View State Handler]
//* NOTE(mustafayilmazdev): Responsible with interpreting view model logic
//* NOTE(mustafayilmazdev): Rendering different states of the view.
class ViewStateHandler<T> extends StatelessWidget {
  final ViewState viewState;
  final Widget? busyChild;
  final double busyHeight;
  final Widget Function(T data) dataBuilder;
  final Widget? emptyChild;
  final Widget Function(String error)? errorBuilder;

  //* NOTE(mustafayilmazdev):  Creates a [View State Handler] with the given view state and child widgets.
  const ViewStateHandler({
    super.key,
    required this.viewState,
    this.busyChild,
    this.busyHeight = 100,
    required this.dataBuilder,
    this.emptyChild,
    this.errorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return viewState.when(
      busy: () =>
          busyChild ??
          const Center(
            child: CircularProgressIndicator(),
          ),
      data: (data) => dataBuilder(data),
      empty: () =>
          emptyChild ??
          //const SizedBox.shrink(),
          SizedBox(
            height: 250.h,
            width: 250.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(child: Text('Empty Image')),
                Expanded(
                  child: LocaleText(
                    LocaleKeys.thereIsNothingInhHere,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ).p16h,
          ),
      error: (error) =>
          errorBuilder?.call(error) ??
          //Text(error),
          SizedBox(
            height: 250.h,
            width: 250.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(child: Text('Error Image')),
                Expanded(
                  child: LocaleText(
                    LocaleKeys.somethingWentWrong,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ).p16h,
          ),
    );
  }
}
