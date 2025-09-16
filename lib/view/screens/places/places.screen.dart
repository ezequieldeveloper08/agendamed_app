import 'package:flutter/material.dart';
import 'package:mediup/view/screens/doctor/widgets/doctor_card.dart';
import 'package:mediup/view/screens/places/widgets/place_h_card.dart';

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({super.key});

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  final List<String> medicalSpecialties = [
    "Todos",
    "Cardiologista",
    "Dentista",
    "Nefrologista",
    "Gastroenterologista",
    "Pneumologista",
    "Neurologista",
    "Psiquiatra",
    "Hepatologista",
    "Dermatologista",
    "Oftalmologista",
    "Ortopedista",
    "Pediatra",
    "Endocrinologista",
    "Ginecologista",
    "Urologista",
    "Otorrinolaringologista",
  ];
  String? selected = 'Todos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          focusColor: Colors.blueAccent.shade100,
                          hoverColor: Colors.blueAccent.shade100,
                          hintText: 'Pesquisar um local',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.filter_list,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 48,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        if (index == 0) SizedBox(width: 20),
                        ChoiceChip(
                          selectedColor: Colors.blueAccent,
                          label: Text(medicalSpecialties[index]),
                          selected: medicalSpecialties[index] == selected,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          onSelected: (value) => setState(() {
                            selected = medicalSpecialties[index];
                          }),
                        ),
                        if (index == (medicalSpecialties.length - 1))
                          SizedBox(width: 20),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                  itemCount: medicalSpecialties.length,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList.separated(
                itemBuilder: (context, index) => PlaceHCard(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
