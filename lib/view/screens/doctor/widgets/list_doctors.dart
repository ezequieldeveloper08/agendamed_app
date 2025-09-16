import 'package:flutter/material.dart';
import 'package:mediup/view/screens/doctor/widgets/doctor_card.dart';
import 'package:mediup/view/screens/search/search.screen.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ListDoctors extends StatelessWidget {
  final String title;
  final List doctors;
  const ListDoctors({super.key, required this.doctors, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    ),
                    child: Text(
                      "Ver mais",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) => DoctorCard(),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: 4,
          ),
        ],
      ),
    );
  }
}
