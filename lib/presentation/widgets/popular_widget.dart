import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled18/logic/popular/cubit.dart';
import 'package:untitled18/logic/popular/state.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        if (state is PopularLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PopularSuccessState) {
          final movies = state.movieModel.results;
          return SizedBox(
            height: 161,
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
        } else if (state is PopularErrorState) {
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
