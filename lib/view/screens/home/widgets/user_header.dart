import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Olá,', style: TextStyle(fontSize: 16)),
                Text(
                  'Ezequiel Pires',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Image.asset('assets/images/avatar.png', width: 56, height: 56),
          ],
        ),
      ),
    );
  }
}
