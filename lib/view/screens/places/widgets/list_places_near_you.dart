import 'package:flutter/material.dart';
import 'package:mediup/view/screens/places/places.screen.dart';
import 'package:mediup/view/screens/places/widgets/place_card.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ListPlacesNearYou extends StatelessWidget {
  const ListPlacesNearYou({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      sliver: MultiSliver(
        children: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 20,
                right: 20,
                top: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Locais perto de voce",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlaceScreen()),
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: 248,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Row(
                  children: [
                    if (index == 0) SizedBox(width: 20),
                    PlaceCard(),
                    if (index == 3) SizedBox(width: 20),
                  ],
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
