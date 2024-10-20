import 'package:blogify/extensions/context_extensions.dart';
import 'package:blogify/extensions/widget_extensions.dart';
import 'package:blogify/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ContentBlockType { small, large }

class ContentBlockSmall extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String time;
  final ContentBlockType type;
  const ContentBlockSmall._({required this.imageUrl, required this.title, required this.subTitle, required this.time, required this.type});

  factory ContentBlockSmall.small({required String imageUrl, required String title, required String subTitle, required String time}) => ContentBlockSmall._(
        imageUrl: imageUrl,
        title: title,
        subTitle: subTitle,
        time: time,
        type: ContentBlockType.small,
      );
  factory ContentBlockSmall.large({required String imageUrl, required String title, required String subTitle, required String time}) => ContentBlockSmall._(
        imageUrl: imageUrl,
        title: title,
        subTitle: subTitle,
        time: time,
        type: ContentBlockType.large,
      );

  @override
  Widget build(BuildContext context) {
    return type == ContentBlockType.small
        ? ListTile(
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
          ).p16a
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                height: 240.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text(
                title,
                style: AppTextStyles.bodyText1,
              ),
              Text(subTitle, style: AppTextStyles.footNote3),
              Text(time, style: AppTextStyles.small.copyWith(color: context.palette.gray03)),
            ],
          );
  }
}
