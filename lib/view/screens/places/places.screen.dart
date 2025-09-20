import 'package:flutter/material.dart';
import 'package:mediup/domain/entities/location.dart';
import 'package:mediup/injection/app_injec.dart';
import 'package:mediup/view/screens/places/widgets/place_h_card.dart';
import 'package:mediup/view/screens/places/widgets/place_h_card_skeleton.dart';
import 'package:mediup/view/view_models/location.view_model.dart';

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({super.key});

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  final List<String> medicalSpecialties = [
    "Todos",
    "Hospital",
    "Clínica",
    "Laboratório",
    "Consultório",
    "Pronto-Socorro",
    "Posto de Saúde",
    "Centro de Diagnóstico",
    "Unidade Básica de Saúde",
    "Policlínica",
    "Outro",
  ];
  String? selected = 'Todos';
  final LocationViewModel viewModel = injec();

  @override
  void initState() {
    super.initState();
    viewModel.findAll.execute({});
  }

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
            ListenableBuilder(
              listenable: viewModel.findAll,
              builder: (context, child) {
                if (viewModel.findAll.running) {
                  return SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverList.separated(
                      itemBuilder: (context, index) => PlaceHCardSkeleton(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: 4,
                    ),
                  );
                }

                List<Location> locations = viewModel.locations;

                return SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList.separated(
                    itemBuilder: (context, index) =>
                        PlaceHCard(location: locations[index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: locations.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
