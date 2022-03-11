import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared/cubit/states.dart';
import 'package:movie_app/shared/network/remote/dio_helper.dart';

class MovieCubit extends Cubit<MovieStates>
{
  MovieCubit() : super(MovieInitialState());

  static MovieCubit get(context) => BlocProvider.of(context);


  List<dynamic> topMovies =[];
   void getTopMovies()
  {
    emit(MovieTopMoviesLoadingState());
    if (topMovies.length ==0)
   {
     DioHelper.getData(
         url: 'movie/top_rated?',
         query:
         {
           'api_key' : 'c135adc1a952e0dd259e0a700415d596'
         }
     ).then((value)
     {
       topMovies = value.data['results'];
       emit(MovieTopMoviesSuccessState());
     }).catchError((error)
     {
       print(error.toString(error));
       emit(MovieTopMoviesErrorState(error.toString()));
     });
   }
    else
     {
      emit(MovieTopMoviesSuccessState());
    }
   }

  List<dynamic> popular =[];
  void getPopular()
  {
    emit(MoviePopularLoadingState());
    if (popular.length ==0)
    {
      DioHelper.getData(
          url: 'movie/popular?',
          query:
          {
            'api_key' : 'c135adc1a952e0dd259e0a700415d596'
          }
      ).then((value)
      {
        popular = value.data['results'];
        emit(MoviePopularSuccessState());
      }).catchError((error)
      {
        print(error.toString(error));
        emit(MoviePopularErrorState(error.toString()));
      });
    }
    else
    {
      emit(MoviePopularSuccessState());
    }
  }

  List<dynamic> nowPlaying =[];
  void getNowPlaying()
  {
    emit(MovieNowPlayingLoadingState());
    if (nowPlaying.length ==0)
    {
      DioHelper.getData(
          url: 'movie/now_playing?',
          query:
          {
            'api_key' : 'c135adc1a952e0dd259e0a700415d596'
          }
      ).then((value)
      {
        nowPlaying = value.data['results'];
        emit(MovieNowPlayingSuccessState());
      }).catchError((error)
      {
        print(error.toString(error));
        emit(MovieNowPlayingErrorState(error.toString()));
      });
    }
    else
    {
      emit(MovieNowPlayingSuccessState());
    }
  }

  List<dynamic> search =[];
  void getSearch(String value)
  {
    emit(MovieSearchLoadingState());
    if (search.length ==0)
    {
      DioHelper.getData(
          url: 'search/movie?',
          query:
          {
            'query' : '$value',
            'api_key' : 'c135adc1a952e0dd259e0a700415d596',
            'language' : 'en-US'
          }
      ).then((value)
      {
        search = value.data['results'];
        emit(MovieSearchSuccessState());
      }).catchError((error)
      {
        print(error.toString(error));
        emit(MovieSearchErrorState(error.toString()));
      });
    }
    else
    {
      emit(MovieSearchSuccessState());
    }
  }


  }

