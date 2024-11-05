import 'package:blogify/localization/locale_keys.g.dart';
import 'package:blogify/ui/styles/paddings.dart';
import 'package:blogify/ui/widgets/common/locale_text/locale_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/text_styles.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final List<Widget>? trailing;
  final bool showBackButton;
  final dynamic Function()? onBack;
  const BaseAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.trailing,
    this.actions,
    this.showBackButton = false,
    this.onBack,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              /// MARK: Geri butonu

              showBackButton
                  ? IconButton(
                      onPressed: () async {
                        await onBack?.call();
                        Navigator.pop(context);
                      },
                      icon: LocaleText(LocaleKeys.back),
                    )
                  : Container(margin: Paddings.p8a),
              ...trailing ?? [],
            ],
          ),
        ),

        /// MARK: Title alanı
        Expanded(
          flex: 2,
          child: Center(
            child: LocaleText(
              title ?? "",
              style: AppTextStyles.headline1,
            ),
          ),
        ),

        /// MARK: Appbar üzerinde herhangi bir aksiyon alması durumunda
        if (actions != null)
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions!,
            ),
          )
      ],
    );
  }
}
