import 'package:flutter/material.dart';
import 'package:world_time/screen/choose_location.dart';
import 'package:world_time/screen/loading.dart';
import './screen/home.dart';

void main() {
  runApp(MaterialApp(
    //? this gonna be the first widget when load up
    initialRoute: '/',

    //? this is the routes
    routes: {
      '/': (context) => loading(),
      '/home': (context) => home(),
      '/location': (context) => chooseLocation()
    },
  ));
}
