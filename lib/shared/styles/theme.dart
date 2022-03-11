import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData (
  fontFamily: 'NunitoSans',
  primarySwatch: Colors.yellow,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: Colors.black,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.yellowAccent,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
    iconTheme: IconThemeData(
      color: Colors.yellowAccent,
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.yellowAccent,
  ),
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedIconTheme: IconThemeData(
      color: Colors.yellowAccent,

    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.grey,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.yellowAccent),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        )),
    labelStyle: TextStyle(
      color: Colors.yellowAccent,
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
    enabledBorder:  OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.yellowAccent,
      ),
    )
  ),
);