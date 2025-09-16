import 'package:flutter/material.dart';

class RowIcon extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String content;
  const RowIcon({
    super.key,
    required this.content,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Icon(icon, color: iconColor),
        Text(content, style: TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
