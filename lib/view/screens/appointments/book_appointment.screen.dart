import 'package:flutter/material.dart';
import 'package:mediup/config/custom_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  final List<String> hours = [
    "09.00 AM",
    "09.30 AM",
    "10.00 AM",
    "10.30 AM",
    "11.00 PM",
    "11.30 PM",
    "15.00 PM",
    "15.30 PM",
    "16.00 PM",
    "16.30 PM",
    "17.00 PM",
    "17.30 PM",
  ];

  String? selectedHour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Agendar consulta",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Selecione a data",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TableCalendar(
                focusedDay: focusedDay,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDay, day);
                },
                onDaySelected: (selected, focused) {
                  setState(() {
                    selectedDay = selected;
                    focusedDay = focused;
                  });
                },
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  leftChevronIcon: Icon(Icons.chevron_left, size: 20),
                  rightChevronIcon: Icon(Icons.chevron_right, size: 20),
                  titleTextStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: const TextStyle(color: Colors.black),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.black54),
                  weekendStyle: TextStyle(color: Colors.black54),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Selecione a hora",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: hours.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final hour = hours[index];
                  final isSelected = hour == selectedHour;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedHour = hour;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        color: isSelected ? Colors.blueAccent : Colors.white,
                      ),
                      child: Text(
                        hour,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.blueAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
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
            'Próximo',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
