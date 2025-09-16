import 'package:flutter/material.dart';
import 'package:mediup/view/screens/home/widgets/appointment_card.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ListAppointments extends StatelessWidget {
  const ListAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Próximo agendamento",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) => AppointmentCard(),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: 1,
          ),
        ],
      ),
    );
  }
}
