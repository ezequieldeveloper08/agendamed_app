import 'package:flutter/material.dart';
import 'package:mediup/config/custom_colors.dart';
import 'package:mediup/view/screens/doctor/widgets/resume_doctor.dart';
import 'package:mediup/view/screens/places/widgets/resume_place.dart';
import 'package:mediup/view/core/row_icon.dart';
import 'package:mediup/view/core/row_text.dart';

class DetailAppointmentScreen extends StatefulWidget {
  const DetailAppointmentScreen({super.key});

  @override
  State<DetailAppointmentScreen> createState() =>
      _DetailAppointmentScreenState();
}

class _DetailAppointmentScreenState extends State<DetailAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meu agendamento',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            ResumePlace(),
            ResumeDoctor(
              doctor: {
                "name": "Dr. João Silva",
                "about":
                    "Especialista em saúde do coração, com mais de 10 anos de experiência em cardiologia clínica e intervencionista.",
                "working_time": "Seg - Sex, 08:00 - 17:00",
                "location": "Hospital Santa Maria - São Paulo, SP",
                "category": "Cardiologista",
              },
            ),
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Consulta Agendada',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                RowIcon(
                  content: 'Segunda-feira, 08 de setembro de 2025',
                  icon: Icons.calendar_month,
                  iconColor: Colors.amber.shade600,
                ),
                RowIcon(
                  content: '16:00 - 16:30 (30 minutos)',
                  icon: Icons.access_time,
                  iconColor: Colors.amber.shade600,
                ),
              ],
            ),
            Divider(color: Colors.black.withAlpha((255 * .05).toInt())),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  'Informações do Paciente',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                RowText(content: 'Ezequiel Pires', label: 'Nome'),
                RowText(content: 'Masculino', label: 'Gênero'),
                RowText(content: '24 anos', label: 'Idade'),
                RowText(
                  content:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
                  label: 'Problema',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
