import 'dart:ffi';

import 'package:flutter/material.dart';

class MenuModel {
  final String title;
  final List<MenuModel> tiles;
  final bool isRoot; // Thêm cờ kiểm tra root
  final IconData? icon; // Icon có thể null
  final Widget? route;
  const MenuModel({
    required this.title,
    this.tiles = const [],
    this.isRoot = false, // Mặc định không phải root
    this.icon,
    this.route,
  });
}
