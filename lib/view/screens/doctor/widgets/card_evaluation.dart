import 'package:flutter/material.dart';

class CardEvaluation extends StatelessWidget {
  const CardEvaluation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Row(
          spacing: 8,
          children: [
            Image.asset('assets/images/avatar.png', width: 40, height: 40),
            Expanded(
              child: Text(
                'Charolette Hanlin',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 4,
              children: [
                Text(
                  '4.8',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Icon(
                  Icons.star_outline,
                  color: Colors.amber.shade700,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
        Text(
          'The doctor is very beautiful and the service is excelent! I like it and want to consult again.',
        ),
      ],
    );
  }
}
