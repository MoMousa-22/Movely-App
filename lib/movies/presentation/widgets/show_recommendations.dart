import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/constants/api_constants.dart';
import '../../../core/utils/app_strings.dart';
import '../controller/movie_details_bloc.dart';

Widget showRecommendations() {
  return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
    builder: (context, state) {
      final recommendations = state.recommendationMovies;
      if (recommendations.isEmpty) {
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

      return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final recommendation = recommendations[index];
            return FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: CachedNetworkImage(
                  imageUrl: ApiConstants.imageUrl(
                    recommendation.backdropPath ??
                        '/b6e5Nss2QNoQM4wJv2VppChswNP.jpg',
                  ),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: 170.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          childCount: recommendations.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.7,
          crossAxisCount: 3,
        ),
      );
    },
  );
}
