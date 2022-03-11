import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic movie;

  const DetailsScreen(this.movie);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit,MovieStates>(
      listener: (context , state){},
      builder: (context, state)
      {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children:
              [
                ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children:
                  [
                    Card(
                      color: Colors.black,
                      elevation: 5,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shadowColor: Colors.yellowAccent,
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        children:
                        [
                          Image(
                            height: 400.0,
                            width: double.infinity,
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/original${movie['poster_path']}",
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${movie['overview']}",
                              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: Colors.white,
                                fontSize: 15.0
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children:
                            [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Icon(
                                      Icons.star,
                                      color: Colors.yellowAccent,
                                      size:20.0 ,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        '${movie['popularity']}',
                                        style: Theme.of(context).textTheme.caption?.copyWith(
                                            color: Colors.yellowAccent[100]
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.yellowAccent[300]?.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20.0,),
                                  ),
                                  height: 60.0,
                                  width: 50.0,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.language,
                                        color: Colors.yellowAccent,
                                        size:20.0 ,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        '${movie['original_language']}',
                                        style: Theme.of(context).textTheme.caption?.copyWith(
                                      color: Colors.yellowAccent[100]
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.yellowAccent[300]?.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20.0,),
                                  ),
                                  height: 60.0,
                                  width: 50.0,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.date_range,
                                        color: Colors.yellowAccent,
                                        size:20.0 ,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        '${movie['release_date']}',
                                        style: Theme.of(context).textTheme.caption?.copyWith(
                                            color: Colors.yellowAccent[100]
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.yellowAccent[300]?.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20.0,),
                                  ),
                                  height: 60.0,
                                  width: 50.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ]
            ),
          ),
        );
      },
    );
  }
}
