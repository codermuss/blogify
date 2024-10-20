import 'package:blogify/extensions/context_extensions.dart';
import 'package:blogify/ui/components/navigation/tab_item.dart';
import 'package:blogify/ui/styles/radiuses.dart';
import 'package:blogify/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class AppTabBar extends StatefulWidget {
  const AppTabBar({
    super.key,
    required this.tabs,
    this.onTabChanged,
    this.height,
    this.initialIndex = 0,
  });

  final List<TabItem> tabs;
  final void Function(int)? onTabChanged;
  final double? height;
  final int initialIndex;

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> {
  late final ValueNotifier<int> _selectedIndex = ValueNotifier(widget.initialIndex);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _selectedIndex.dispose();
  }

  @override
  void didUpdateWidget(covariant AppTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialIndex != widget.initialIndex) {
      _selectedIndex.value = widget.initialIndex;
    }
  }

  void _onTabChanged(int index) {
    _selectedIndex.value = index;
    widget.onTabChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedIndex,
      builder: (context, value, child) => SizedBox(
        height: widget.height?.h ?? 360.h,
        child: Column(
          children: [
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: context.palette.gray01,
                borderRadius: Radiuses.b32r,
                border: Border.all(color: context.palette.gray02),
              ),
              child: Row(
                children: List.generate(widget.tabs.length, (index) {
                  return Expanded(
                    child: InkWell(
                      onTap: () => _onTabChanged(index),
                      child: AnimatedSwitcher(
                        duration: Durations.long2,
                        switchInCurve: Curves.easeInOut,
                        switchOutCurve: Curves.easeInOut,
                        child: Stack(
                          children: [
                            Container(
                              key: ValueKey<int>(_selectedIndex.value),
                              decoration: BoxDecoration(
                                borderRadius: Radiuses.b32r,
                                color: (_selectedIndex.value == index) ? context.palette.white : null,
                              ),
                              child: Center(
                                child: DefaultTextStyle(
                                  style: (_selectedIndex.value == index)
                                      ? AppTextStyles.bodyText1.copyWith(color: context.palette.greenPrimary)
                                      : AppTextStyles.bodyText1.copyWith(color: context.palette.gray03),
                                  child: Text(widget.tabs[index].label),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            widget.tabs[_selectedIndex.value].page,
          ],
        ),
      ),
    );
  }
}
