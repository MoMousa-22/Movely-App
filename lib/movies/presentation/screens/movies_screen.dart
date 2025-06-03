import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/movies/presentation/components/now_playing_component.dart';
import 'package:movies_app/movies/presentation/components/popular_component.dart';
import 'package:movies_app/movies/presentation/components/top_rated_component.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_events.dart';
import 'package:movies_app/movies/presentation/widgets/section_header.dart';

import '../../../core/services/services_locator.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return sl<MoviesBloc>()
          ..add(GetNowPlayingMoviesEvent())
          ..add(GetPopularMoviesEvent())
          ..add(GetTopRatedMoviesEvent());
      },
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
              SectionHeader(
                  title: AppStrings.popular,
                  onTap: () {
                    /// TODO : NAVIGATION TO POPULAR SCREEN
                  }),
              const PopularComponent(),
              SectionHeader(
                  title: AppStrings.topRated,
                  onTap: () {
                    /// TODO : NAVIGATION TO Top Rated Movies Screen
                  }),
              const TopRatedComponent(),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
