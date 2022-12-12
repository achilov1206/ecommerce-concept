import 'package:flutter/material.dart' show IconData;

class Category {
  final String id;
  final String catTitle;
  final IconData catIcon;
  Category({
    required this.id,
    required this.catTitle,
    required this.catIcon,
  });
}
