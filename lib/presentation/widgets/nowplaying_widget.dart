import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled18/logic/now_playing/cubit.dart';
import 'package:untitled18/logic/now_playing/state.dart';

class NowplayingWidget extends StatelessWidget {
  const NowplayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingStates>(
      builder: (context, state) {
        if (state is NowPlayingLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is NowPlayingSuccessState) {
          final movies = state.movieModel.results;
          return SizedBox(
            height: 370,
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final x = movies[index];
                return Stack(
                  children: [
                    /// LAYER 1
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${x.posterPath}',
                      width: 420,
                      height:370 ,
                      fit: BoxFit.cover,
                    ),

                    /// Layer 2
                    Positioned(
                      top: 320,
                      left: 100,
                      child: Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Now Playing",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.yellow),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        } else if (state is NowPlayingErrorState) {
          Center(
              child: Text(
            state.errorMessage,
            style: TextStyle(color: Colors.white),
          ));
        }
        return SizedBox();
      },
    );
  }
}
