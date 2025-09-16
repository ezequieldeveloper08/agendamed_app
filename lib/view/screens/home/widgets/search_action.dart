import 'package:flutter/material.dart';
import 'package:mediup/view/screens/search/search.screen.dart';

class SearchAction extends StatelessWidget {
  const SearchAction({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextFormField(
          readOnly: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            );
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.grey.shade100,
            hintText: 'Encontre especialistas e clínicas',
            hintStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
