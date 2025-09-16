import 'package:flutter/material.dart';
import 'package:mediup/view/screens/doctor/doctor.screen.dart';

class AppointmentDoctorCard extends StatelessWidget {
  const AppointmentDoctorCard({super.key});

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
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DoctorScreen()),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Row(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/medico.png',
                    width: 64,
                    height: 64,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Imran Syahir',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Pediatrician | Mercy Hospital',
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
                  ),
                  Icon(
                    Icons.favorite_outline,
                    size: 28,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.amber.shade700,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Agendar consulta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
