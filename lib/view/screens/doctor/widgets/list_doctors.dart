import 'package:flutter/material.dart';
import 'package:mediup/domain/entities/professional.dart';
import 'package:mediup/injection/app_injec.dart';
import 'package:mediup/view/screens/doctor/widgets/doctor_card.dart';
import 'package:mediup/view/screens/doctor/widgets/doctor_card_skeleton.dart';
import 'package:mediup/view/screens/search/search.screen.dart';
import 'package:mediup/view/view_models/professional.view_model.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ListDoctors extends StatefulWidget {
  final String? title;
  const ListDoctors({super.key, this.title});

  @override
  State<ListDoctors> createState() => _ListDoctorsState();
}

class _ListDoctorsState extends State<ListDoctors> {
  final ProfessionalViewModel viewModel = injec();

  @override
  void initState() {
    super.initState();
    viewModel.findAll.execute({});
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: MultiSliver(
        children: [
          if (widget.title != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title!,
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
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ListenableBuilder(
            listenable: viewModel,
            builder: (context, child) {
              if (viewModel.findAll.running) {
                return SliverList.separated(
                  itemBuilder: (context, index) => DoctorCardSkeleton(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: 4,
                );
              }

              List<Professional> professionals = viewModel.professionals;

              return SliverList.separated(
                itemBuilder: (context, index) =>
                    DoctorCard(professional: professionals[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: professionals.length,
              );
            },
          ),
        ],
      ),
    );
  }
}
