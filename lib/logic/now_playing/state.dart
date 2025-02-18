import 'package:untitled18/data/movie_model.dart';

class NowPlayingStates {}

class NowPlayingInitialState extends NowPlayingStates {}

class NowPlayingLoadingState extends NowPlayingStates {}

class NowPlayingSuccessState extends NowPlayingStates {
  final MovieModel movieModel;
  NowPlayingSuccessState(this.movieModel);
}

class NowPlayingErrorState extends NowPlayingStates {
  final String errorMessage;
  NowPlayingErrorState(this.errorMessage);
}