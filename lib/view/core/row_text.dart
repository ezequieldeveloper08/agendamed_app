import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  final String label;
  final String content;
  const RowText({super.key, required this.content, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        SizedBox(
          width: 100,
          child: Text(label, style: TextStyle(fontWeight: FontWeight.w700)),
        ),
        Text(':', style: TextStyle(fontWeight: FontWeight.w700)),
        Expanded(
          child: Text(content, style: TextStyle(fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}
