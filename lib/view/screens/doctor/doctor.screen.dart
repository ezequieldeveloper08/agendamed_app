import 'package:flutter/material.dart';
import 'package:mediup/config/custom_colors.dart';
import 'package:mediup/view/screens/appointments/book_appointment.screen.dart';
import 'package:mediup/view/screens/doctor/widgets/card_evaluation.dart';
import 'package:mediup/view/screens/doctor/widgets/resume_doctor.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr. João Silva",
      "about":
          "Especialista em saúde do coração, com mais de 10 anos de experiência em cardiologia clínica e intervencionista.",
      "working_time": "Seg - Sex, 08:00 - 17:00",
      "location": "Hospital Santa Maria - São Paulo, SP",
      "category": "Cardiologista",
    },
    {
      "name": "Dra. Ana Oliveira",
      "about":
          "Dentista focada em odontologia estética e ortodontia, ajudando pacientes a sorrirem com confiança.",
      "working_time": "Seg - Sáb, 09:00 - 18:00",
      "location": "Clínica Sorriso Perfeito - Campinas, SP",
      "category": "Dentista",
    },
    {
      "name": "Dr. Pedro Souza",
      "about":
          "Nefrologista especializado em tratamento de doenças renais crônicas e acompanhamento de pacientes em diálise.",
      "working_time": "Seg - Qui, 07:00 - 16:00",
      "location": "Hospital do Rim - Brasília, DF",
      "category": "Nefrologista",
    },
    {
      "name": "Dra. Camila Rocha",
      "about":
          "Experiência em diagnóstico e tratamento de doenças gastrointestinais, com foco em endoscopia digestiva.",
      "working_time": "Ter - Sex, 10:00 - 19:00",
      "location": "Clínica GastroVida - Belo Horizonte, MG",
      "category": "Gastroenterologista",
    },
    {
      "name": "Dr. Ricardo Mendes",
      "about":
          "Atendimento especializado em doenças respiratórias, com ênfase em asma e doenças pulmonares crônicas.",
      "working_time": "Seg - Sex, 08:30 - 17:30",
      "location": "Instituto Pulmonar - Curitiba, PR",
      "category": "Pneumologista",
    },
    {
      "name": "Dra. Beatriz Lima",
      "about":
          "Neurologista com experiência em tratamento de enxaqueca, epilepsia e doenças neurodegenerativas.",
      "working_time": "Seg - Sex, 09:00 - 18:00",
      "location": "Clínica NeuroCenter - Porto Alegre, RS",
      "category": "Neurologista",
    },
    {
      "name": "Dr. Marcelo Torres",
      "about":
          "Psiquiatra com foco em transtornos de ansiedade e depressão, utilizando abordagens modernas e humanizadas.",
      "working_time": "Seg - Sáb, 10:00 - 20:00",
      "location": "Clínica Equilíbrio - Rio de Janeiro, RJ",
      "category": "Psiquiatra",
    },
    {
      "name": "Dra. Larissa Martins",
      "about":
          "Hepatologista especialista em doenças do fígado e acompanhamento de pacientes transplantados.",
      "working_time": "Seg - Qui, 08:00 - 16:00",
      "location": "Hospital das Clínicas - Salvador, BA",
      "category": "Hepatologista",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          doctors[0]['name'],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            ResumeDoctor(doctor: doctors[0]),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: CustomColors.cardColor,
                        ),
                        child: Icon(Icons.people, color: Colors.blueAccent),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '5.000+',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text('pacientes', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: CustomColors.cardColor,
                        ),
                        child: Icon(Icons.show_chart, color: Colors.blueAccent),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '10+',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text(
                        'anos experiência',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: CustomColors.cardColor,
                        ),
                        child: Icon(Icons.star, color: Colors.blueAccent),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text('avaliação', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: CustomColors.cardColor,
                        ),
                        child: Icon(Icons.chat, color: Colors.blueAccent),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '4.927',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text('comentários', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sobre mim',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Text(doctors[0]['about']),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Horário de trabalho',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Text(doctors[0]['working_time']),
              ],
            ),
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avaliações',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                CardEvaluation(),
                Divider(color: Colors.black12),
                CardEvaluation(),
                Divider(color: Colors.black12),
                CardEvaluation(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FilledButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookAppointmentScreen()),
          ),
          child: Text(
            'Agendar consulta',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
