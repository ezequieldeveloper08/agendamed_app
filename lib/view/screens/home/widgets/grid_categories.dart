import 'package:flutter/material.dart';
import 'package:mediup/view/screens/home/widgets/category_card.dart';
import 'package:sliver_tools/sliver_tools.dart';

class GridCategories extends StatelessWidget {
  const GridCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categorias",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Ver todas",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: const [
              CategoryCard(
                asset: 'assets/icons/Cadiologist.svg',
                title: 'Coração',
              ),
              CategoryCard(asset: 'assets/icons/Dentists.svg', title: 'Dente'),
              CategoryCard(
                asset: 'assets/icons/Nephrologists.svg',
                title: 'Rim',
              ),
              CategoryCard(
                asset: 'assets/icons/Gastroenterologists.svg',
                title: 'Estômago',
              ),
              CategoryCard(
                asset: 'assets/icons/Pulmonologists.svg',
                title: 'Pulmão',
              ),
              CategoryCard(
                asset: 'assets/icons/Neurologists.svg',
                title: 'Cérebro',
              ),
              CategoryCard(
                asset: 'assets/icons/Psychiatrists.svg',
                title: 'Mente',
              ),
              CategoryCard(
                asset: 'assets/icons/Hepatologists.svg',
                title: 'Fígado',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
