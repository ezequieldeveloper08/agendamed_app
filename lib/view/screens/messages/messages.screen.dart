import 'package:flutter/material.dart';
import 'package:mediup/config/custom_colors.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/shortly.png', width: 300),
            Text(
              'Em breve!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: CustomColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
