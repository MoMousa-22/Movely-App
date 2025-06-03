import 'package:flutter/material.dart';

import '../../../core/utils/app_strings.dart';

class EmptyMovieDetails extends StatelessWidget {
  const EmptyMovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Icon(Icons.movie_filter_outlined,
                  size: 50, color: Colors.grey),
              const SizedBox(height: 8),
              Text(
                AppStrings.noRecommendationsAvailableForThisMovie,
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
