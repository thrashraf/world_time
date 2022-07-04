import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldTime {
  String location; //for location
  late String time; //for time
  String flag; // url to an assets flag icon
  String url; //location url for api endpoint
  late bool isDay;

  worldTime({required this.location, required this.flag, required this.url});

  Future<void> getData() async {
    try {
      //make request from world time api
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      //convert string into map
      Map data = jsonDecode(response.body);

      //get date time
      DateTime now = DateTime.parse(data['datetime']);

      //get utc and parse into int
      int utc = int.parse(data['utc_offset'].substring(1, 3));
      // print(utc);

      // add utc to datetime
      now = now.add(Duration(hours: utc));

      //ternary operator to determine is day
      isDay = now.hour > 6 && now.hour < 20 ? true : false;

      //convert to time format using intl function
      time = DateFormat.jm().format(now).toString();
    } catch (e) {
      print('error: $e');
      time = 'something went wrong';
    }
  }
}
