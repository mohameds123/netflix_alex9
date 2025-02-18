import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled18/data/movie_model.dart';
import 'package:untitled18/logic/now_playing/state.dart';

class NowPlayingCubit extends Cubit<NowPlayingStates> {
  Dio dio;

  NowPlayingCubit(this.dio) : super(NowPlayingInitialState());

  /// Function to get now playing movie data from API using dio package
  ///

  Future getNowPlayingData() async {
    emit(NowPlayingLoadingState());
    try {
      // response ==>> json
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/now_playing?api_key=87903828b97a85b50c60fb3bbd960c55");

      // 1. check statusCode
      //2. convert json data to dart to display in UI
      if (response.statusCode == 200) {
        final nowPlayingJsonToDart = MovieModel.fromJson(response.data);
        emit(NowPlayingSuccessState(nowPlayingJsonToDart));
      }
    } catch (e) {
      emit(NowPlayingErrorState(e.toString()));
    }
  }
}
