import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled18/data/movie_model.dart';
import 'package:untitled18/logic/popular/state.dart';

class PopularCubit extends Cubit <PopularState> {
  Dio dio;

  PopularCubit(this.dio) : super(PopularInitialState());

  Future getPopularDate() async {
    emit(PopularLoadingState());
    try {
      final response = await dio.get(
          "https://api.themoviedb.org/3/movie/popular?api_key=87903828b97a85b50c60fb3bbd960c55");
      if (response.statusCode == 200) {
        final popularJsonToDart = MovieModel.fromJson(response.data);
        emit(PopularSuccessState(popularJsonToDart));
      }
    } catch (e) {
      emit(PopularErrorState(e.toString()));
    }
  }
}