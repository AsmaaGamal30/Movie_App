import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/SearchScreen/search_screen.dart';
import 'package:movie_app/shared/components/components.dart';
import 'package:movie_app/shared/cubit/cubit.dart';
import 'package:movie_app/shared/cubit/states.dart';

class HomeLayOut extends StatelessWidget
{
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<MovieCubit,MovieStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var topMovies = MovieCubit.get(context).topMovies;
        var popularMovies = MovieCubit.get(context).popular;
        var nowPlayingMovies = MovieCubit.get(context).nowPlaying;

        return Scaffold(
          key: formKey,
          appBar: AppBar(
            title: Text(
              'Watch',
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                      Icons.search_outlined
                  ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(

                children:
                [
                  Text('Top Movies',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: Colors.yellowAccent
              ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 500.0,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children:
                        [
                          MovieListBuilder(topMovies , context , height: 400.0 , width: 330.0),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Popular Movies',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.yellowAccent
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 300.0,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children:
                        [
                          MovieListBuilder(popularMovies , context , height: 200.0 , width: 200.0),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Now Playing',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.yellowAccent
                  ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 300.0,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children:
                        [
                          MovieListBuilder(nowPlayingMovies , context , height: 200.0 , width: 200.0),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        );
      }
         );
  }

}
