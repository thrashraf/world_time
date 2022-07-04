import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  //new instance of world time class
  void setupWorldTime() async {
    worldTime instance = worldTime(
        location: 'Malaysia', flag: 'malaysia.png', url: 'Asia/Kuala_Lumpur');

    await instance.getData();

    //redirect user to home screen and pass data
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': instance.time,
      'location': instance.location,
      'flag': instance.location,
      'isDay': instance.isDay
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 50,
          ),
        ));
  }
}
