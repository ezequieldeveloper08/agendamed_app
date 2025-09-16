import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String asset;
  const CategoryCard({super.key, required this.asset, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      surfaceTintColor: Colors.white,
      color: Color(0xffF0F4FC),
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            SvgPicture.asset(
              asset,
              colorFilter: ColorFilter.mode(Color(0xff33384B), BlendMode.srcIn),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xff33384B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
