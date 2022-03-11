import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/modules/DetailesScreen/details.dart';
import '../../modules/SearchScreen/search_screen.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.red,
  required VoidCallback function,
  required String text,
  bool isUpperCase = true,
  double borderRadius = 10.0,
}) => Container(
      width: width,
      height: 45.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
    );



Widget defaultTextButton({
  required String text,
  required VoidCallback? function,
}) => TextButton(
      onPressed: function,
      child: Text(text.toUpperCase()),
    );


void navigateTo(context , widget) => Navigator.push(context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);



void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (Route<dynamic> route) => false,
);

Widget myDivider() => Padding(
  padding: const EdgeInsets.all(5.0),
  child:   Divider(
    height: 10,
    thickness: 2,
    indent: 20,
    endIndent: 20,
  ),
);

Widget buildMovieItem(movie , context , { required double height ,required double width}) => InkWell(
  onTap: ()
  {
    navigateTo(context, DetailsScreen(movie));
  },
  child:   Column(
    children: [
      Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.yellowAccent),
          image: DecorationImage(
            image: NetworkImage("https://image.tmdb.org/t/p/original${movie['poster_path']}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(height: 10,),
      Container(
        width: 200.0,
        child: Column(
          children:
          [
            Text("${movie['title']}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget MovieListBuilder(list ,context , {required double width , required double height})=> ListView.separated(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    physics: BouncingScrollPhysics(),
    itemBuilder: (context , index)=> buildMovieItem(list[index],context, width:width , height: height),
    separatorBuilder: (context , index) => SizedBox(width: 15,),
    itemCount: list.length,
);

Widget defaultFormField ({
  required TextEditingController controller,
  required TextInputType type,
  bool isPssword = false,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  bool isClickable = true,
  required  FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,


}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPssword,
  onFieldSubmitted: onSubmit ,

  onChanged: onChange ,
  onTap: onTap,
  enabled: isClickable,
  validator: validate,
  decoration: InputDecoration(
    labelStyle:TextStyle(
      color: Colors.yellowAccent
    ) ,
    labelText: label ,
    prefixIcon:Icon(
      prefix,
    ),
    suffixIcon: IconButton(
      onPressed :suffixPressed,
      icon: Icon(
          suffix
      ),
    ),
  ),
);


Widget buildSearchItem(movie,context ) => InkWell(
  onTap: ()
  {
    navigateTo(context, SearchScreen());
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage("https://image.tmdb.org/t/p/original${movie['poster_path']}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Expanded(

                  child: Text(
                    "${movie['title']}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget searchBuilder (list , context , {isSearch = false} ) => BuildCondition(
  condition: list.length > 0 ,
  builder:(context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context ,index) => buildSearchItem(list[index] , context),
    separatorBuilder: (context , index) => myDivider(),
    itemCount: 15,
  ),
  fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()) ,
);


