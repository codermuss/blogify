import 'package:flutter/material.dart';

class TabItem {
  final String label;
  final Widget page;
  final Icon? icon;

  TabItem({required this.label, required this.page, this.icon});
}
