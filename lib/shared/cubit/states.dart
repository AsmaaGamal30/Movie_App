abstract class MovieStates {}

class MovieInitialState extends MovieStates {}

class MovieTopMoviesLoadingState extends MovieStates {}

class MovieTopMoviesSuccessState extends MovieStates {}

class MovieTopMoviesErrorState extends MovieStates
{
  final String error;

  MovieTopMoviesErrorState(this.error);

}

class MoviePopularLoadingState extends MovieStates {}

class MoviePopularSuccessState extends MovieStates {}

class MoviePopularErrorState extends MovieStates
{
  final String error;

  MoviePopularErrorState(this.error);

}

class MovieNowPlayingLoadingState extends MovieStates {}

class MovieNowPlayingSuccessState extends MovieStates {}

class MovieNowPlayingErrorState extends MovieStates
{
  final String error;

  MovieNowPlayingErrorState(this.error);

}

class MovieSearchLoadingState extends MovieStates {}

class MovieSearchSuccessState extends MovieStates {}

class MovieSearchErrorState extends MovieStates
{
  final String error;

  MovieSearchErrorState(this.error);

}

class MovieDetailsLoadingState extends MovieStates {}

class MovieDetailsSuccessState extends MovieStates {}

class MovieDetailsErrorState extends MovieStates
{
  final String error;

  MovieDetailsErrorState(this.error);

}




