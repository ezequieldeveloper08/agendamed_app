import 'package:flutter/material.dart';
import 'package:mediup/view/screens/appointments/detail_appointment.screen.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      color: Colors.blueAccent,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailAppointmentScreen()),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 8,
            children: [
              Row(
                spacing: 12,
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
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'General Doctor',
                          style: TextStyle(
                            color: Colors.white.withAlpha((255 * .8).toInt()),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right, size: 32, color: Colors.white),
                ],
              ),
              Divider(color: Colors.white.withAlpha((255 * .2).toInt())),
              Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.calendar_month, color: Colors.white),
                        Text(
                          'Sunday, 12 June',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.access_time, color: Colors.white),
                        Text(
                          '11:00 - 12:00',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
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
      ),
    );
  }
}
