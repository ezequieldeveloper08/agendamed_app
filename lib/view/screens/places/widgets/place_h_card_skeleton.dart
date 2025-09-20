import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceHCardSkeleton extends StatelessWidget {
  const PlaceHCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(16),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagens
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Nome do local
              Container(height: 16, width: 180, color: Colors.white),
              const SizedBox(height: 8),

              // Localização
              Container(height: 14, width: 220, color: Colors.white),
              const SizedBox(height: 12),

              // Avaliação + horário
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 14, width: 40, color: Colors.white),
                  Container(height: 14, width: 80, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
