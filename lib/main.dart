import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared/bloc_observer.dart';
import 'package:movie_app/shared/cubit/cubit.dart';
import 'package:movie_app/shared/network/local/cache_helper.dart';
import 'package:movie_app/shared/network/remote/dio_helper.dart';
import 'package:movie_app/shared/styles/theme.dart';
import 'modules/SplashScreen/splash_screen.dart';

void main() async{
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => MovieCubit()..getTopMovies()..getPopular()..getNowPlaying()),
      ],
      child: MaterialApp
        (
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        home: Directionality(textDirection: TextDirection.ltr,
        child: SplashScreen(),
        ),
      ),
    );
  }
}

