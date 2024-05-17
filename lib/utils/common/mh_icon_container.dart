import 'package:flutter/material.dart';

class MhIconContainer extends StatelessWidget {
  const MhIconContainer({
    super.key,
    this.containerColor,
    this.icon,
    this.iconColor,
  });

  final Color? containerColor;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
