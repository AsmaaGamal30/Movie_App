import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared/components/components.dart';
import 'package:movie_app/shared/cubit/cubit.dart';
import 'package:movie_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget
{
  var searchController = TextEditingController();


  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<MovieCubit,MovieStates>(
      listener: (context , state) {},
      builder: (context,state)
      {
        var list = MovieCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Watch',
            ),
          ),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value)
                  {
                    MovieCubit.get(context).getSearch(value);

                  },
                  validate: (String? value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(
                  child:
                  searchBuilder(list, context , isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
