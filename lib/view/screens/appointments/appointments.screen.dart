import 'package:flutter/material.dart';
import 'package:mediup/view/screens/appointments/widgets/appointment_card.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Meus agendamentos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  spacing: 8,
                  children: [
                    ChoiceChip(
                      selectedColor: Colors.blueAccent,
                      label: Text('Por vir'),
                      selected: selected == 1,
                      onSelected: (value) => setState(() {
                        selected = 1;
                      }),
                    ),
                    ChoiceChip(
                      selectedColor: Colors.blueAccent,
                      label: Text('Concluído'),
                      selected: selected == 2,
                      onSelected: (value) => setState(() {
                        selected = 2;
                      }),
                    ),
                    ChoiceChip(
                      selectedColor: Colors.blueAccent,
                      label: Text('Cancelado'),
                      selected: selected == 3,
                      onSelected: (value) => setState(() {
                        selected = 3;
                      }),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) => AppointmentCard(),
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
