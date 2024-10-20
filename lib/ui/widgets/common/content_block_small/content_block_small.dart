import 'package:blogify/extensions/context_extensions.dart';
import 'package:blogify/extensions/widget_extensions.dart';
import 'package:blogify/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ContentBlockSmall extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String time;
  const ContentBlockSmall({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.bodyText1),
          Text(time, style: AppTextStyles.small.copyWith(color: context.palette.gray03)),
        ],
      ),
      subtitle: Text(subTitle, style: AppTextStyles.footNote3),
      leading: Image.network(imageUrl),
      titleAlignment: ListTileTitleAlignment.top,
      onTap: () {},
      dense: true,
      minLeadingWidth: 0,
    ).p16a;
  }
}
