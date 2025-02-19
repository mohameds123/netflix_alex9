import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled18/logic/top_rated/cubit.dart';
import 'package:untitled18/logic/top_rated/state.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedCubit, TopRatedState>(
      builder: (context, state) {
        if (state is TopRatedLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TopRatedSuccessState) {
          final movies = state.movieModel.results;
          return SizedBox(
            height: 162,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: movies.length,
              itemBuilder: (context, index) {
                final x = movies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${x.posterPath}',
                  ),
                );
              },
            ),
          );
        } else if (state is TopRatedErrorState) {
          return Center(
              child: Text(
            state.em,
            style: TextStyle(color: Colors.white),
          ));
        }
        return SizedBox();
      },
    );
  }
}
