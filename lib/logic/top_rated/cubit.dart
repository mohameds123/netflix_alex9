import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled18/data/movie_model.dart';
import 'package:untitled18/logic/top_rated/state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  Dio dio;

  TopRatedCubit(this.dio) : super(TopRatedInitialState());

  ///
  Future getTopRatedData() async {
    emit(TopRatedLoadingState());
    try {
      // json
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/top_rated?api_key=87903828b97a85b50c60fb3bbd960c55");
      if (response.statusCode == 200) {
        final topRatedJsonToDart = MovieModel.fromJson(response.data);
        emit(TopRatedSuccessState(topRatedJsonToDart));
      }
    } catch (e) {
      emit(TopRatedErrorState(e.toString()));
    }
  }
}
