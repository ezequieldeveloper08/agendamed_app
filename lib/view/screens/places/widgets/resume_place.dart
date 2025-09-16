import 'package:flutter/material.dart';
import 'package:mediup/view/screens/places/detail_place.screen.dart';

class ResumePlace extends StatelessWidget {
  const ResumePlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: EdgeInsets.zero,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            Row(
              spacing: 4,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.only(
                      bottomLeft: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/hospital01.webp',
                      fit: BoxFit.cover,
                      height: 120,
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.only(
                      bottomRight: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/hospital01.webp',
                      fit: BoxFit.cover,
                      height: 120,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hospital São Nicolau',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Hospital em Catalão, Goiás',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Text(
                          '4.8',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.star_outline,
                          color: Colors.amber.shade700,
                          size: 20,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        spacing: 4,
                        children: [
                          Icon(Icons.access_time, size: 16),
                          Text(
                            '08:00 - 18:00',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
