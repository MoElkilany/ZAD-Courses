import 'package:flutter/material.dart';

class ZadDrawerItem {
  final String title;
  final IconData? icon;
  final List<ZadDrawerItem>? children;
  final void Function()? onTap;

  ZadDrawerItem({
    required this.title,
    this.icon,
    this.children,
    this.onTap,
  });

  Widget toTile() {
    if (children == null) {
      return ListTile(
        leading: icon != null ? Icon(icon!) : null,
        title: Text(title),
        onTap: onTap ?? () {},
      );
    } else {
      return ExpansionTile(
        leading: icon != null
            ? Icon(
                icon!,
                color: Colors.white,
              )
            : null,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        collapsedIconColor: Colors.white54,
        iconColor: Colors.white,
        onExpansionChanged: (value) {},
        children: children?.map((e) => e.toTile()).toList() ?? [],
      );
    }
  }
}

class ZadDrawerSubTile extends ZadDrawerItem {
  ZadDrawerSubTile({
    required super.title,
    super.onTap,
  });
  @override
  Widget toTile() {
    return ListTile(
      title: Text(title),
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 55),
      visualDensity: VisualDensity.compact,
      dense: true,
      onTap: onTap ?? () {},
    );
  }
}
