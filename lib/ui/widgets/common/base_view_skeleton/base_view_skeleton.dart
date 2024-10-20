import 'package:flutter/material.dart';

class BaseViewSkeleton extends StatelessWidget {
  const BaseViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
