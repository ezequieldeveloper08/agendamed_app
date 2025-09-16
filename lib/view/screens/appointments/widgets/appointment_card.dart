import 'package:flutter/material.dart';
import 'package:mediup/config/custom_colors.dart';
import 'package:mediup/view/screens/appointments/detail_appointment.screen.dart';
import 'package:mediup/view/screens/doctor/doctor.screen.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

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
          MaterialPageRoute(builder: (context) => DetailAppointmentScreen()),
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
                    width: 48,
                    height: 48,
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
                                Icon(Icons.calendar_month, size: 20),
                                Text(
                                  '18/08',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
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
                ],
              ),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: FilledButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.grey.shade200,
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(16),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                            color: CustomColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: FilledButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(16),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Remarcar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
