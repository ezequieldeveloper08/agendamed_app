import 'package:flutter/material.dart';
import 'package:mediup/view/screens/doctor/widgets/list_doctors.dart';
import 'package:mediup/view/screens/places/widgets/resume_place.dart';
import 'package:mediup/view/core/custom_map.dart';
import 'package:sliver_tools/sliver_tools.dart';

class DetailPlaceScreen extends StatefulWidget {
  const DetailPlaceScreen({super.key});

  @override
  State<DetailPlaceScreen> createState() => _DetailPlaceScreenState();
}

class _DetailPlaceScreenState extends State<DetailPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hospital São Nicolau',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ResumePlace(),
            ),
          ),

          /* SliverToBoxAdapter(child: SizedBox(height: 200, child: CustomMap())), */
          ListDoctors(title: 'Médicos(as)'),
        ],
      ),
    );
  }
}
