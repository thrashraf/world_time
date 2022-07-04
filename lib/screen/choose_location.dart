import 'package:flutter/material.dart';
import '../services/worldTime.dart';

class chooseLocation extends StatefulWidget {
  chooseLocation({Key? key}) : super(key: key);

  @override
  State<chooseLocation> createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {
  List<worldTime> locations = [
    worldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    worldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    worldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    worldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    worldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    worldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    worldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    worldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  //update when click
  void updateTime(index) async {
    //get updated time by index
    worldTime instance = locations[index];

    await instance.getData();

    //redirect back to home
    Navigator.pop(context, {
      'time': instance.time,
      'location': instance.location,
      'flag': instance.location,
      'isDay': instance.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            print(locations[index].flag);

            return Card(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ListTile(
                  onTap: (() => updateTime(index)),
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}')),
                ),
              ),
            );
          }),
    );
  }
}
