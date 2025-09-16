import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:mediup/config/custom_colors.dart';
import 'package:mediup/view/screens/appointments/appointments.screen.dart';
import 'package:mediup/view/screens/home/home.screen.dart';
import 'package:mediup/view/screens/messages/messages.screen.dart';
import 'package:mediup/view/screens/profile/profile.screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    AppointmentsScreen(),
    MessagesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((255 * .1).toInt()),
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Coolicons.home_outline, "Início", 0),
            _buildNavItem(Coolicons.calendar_event, "Agendamentos", 1),
            _buildNavItem(Coolicons.chat, "Mensagens", 2),
            _buildNavItem(Coolicons.user, "Perfil", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? CustomColors.cardColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.blueAccent : Colors.grey),
            if (isSelected) ...[
              SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
