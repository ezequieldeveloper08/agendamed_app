import 'package:flutter/material.dart';
import 'package:mediup/view/screens/home/widgets/grid_categories.dart';
import 'package:mediup/view/screens/home/widgets/list_appointments.dart';
import 'package:mediup/view/screens/doctor/widgets/list_doctors.dart';
import 'package:mediup/view/screens/home/widgets/search_action.dart';
import 'package:mediup/view/screens/home/widgets/user_header.dart';
import 'package:mediup/view/screens/places/widgets/list_places_near_you.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            UserHeader(),
            SearchAction(),
            ListAppointments(),
            GridCategories(),
            ListPlacesNearYou(),
            ListDoctors(title: 'Encontre médicos(as)', doctors: []),
          ],
        ),
      ),
    );
  }
}
