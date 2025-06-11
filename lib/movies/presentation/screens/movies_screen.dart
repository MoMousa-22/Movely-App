import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/movies/presentation/components/now_playing_component.dart';
import 'package:movies_app/movies/presentation/components/popular_component.dart';
import 'package:movies_app/movies/presentation/components/top_rated_component.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_state.dart';
import 'package:movies_app/movies/presentation/screens/type_movies_screen.dart';
import 'package:movies_app/movies/presentation/widgets/section_header.dart';

import '../../../core/services/services_locator.dart';
import '../controller/movies_bloc/movies_events.dart';

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
              BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) => SectionHeader(
                  title: AppStrings.popular,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TypeMoviesScreen(
                            movies: state.popularMovies,
                            moviesType: AppStrings.popular)));
                  },
                ),
              ),
              const PopularComponent(),
              BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) => SectionHeader(
                    title: AppStrings.topRated,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TypeMoviesScreen(
                              movies: state.topRatedMovies,
                              moviesType: AppStrings.topRated)));
                    }),
              ),
              const TopRatedComponent(),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
