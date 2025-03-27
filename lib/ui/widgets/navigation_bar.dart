import 'package:flutter/material.dart';

class NavigationBarInline extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<IconButton> actions;

  const NavigationBarInline({
    Key? key,
    required this.title,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleTextStyle: const TextStyle(color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
