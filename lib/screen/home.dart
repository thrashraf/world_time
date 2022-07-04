import 'package:flutter/material.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  dynamic data = {};

  @override
  Widget build(BuildContext context) {
    //get data from routes
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments;

    //to display bg image
    String bgImage = data['isDay'] ? 'day.png' : 'night.png';

    //to change color based on isDay
    dynamic isDarkMode = data['isDay'] ? Colors.grey[200] : Colors.grey[400];

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 125, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                  onPressed: () async {
                    dynamic res =
                        await Navigator.pushNamed(context, '/location');

                    setState(() {
                      data = {
                        'time': res['time'],
                        'location': res['location'],
                        'flag': res['location'],
                        'isDay': res['isDay']
                      };
                    });

                    print(res);
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: isDarkMode,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: isDarkMode,
                    ),
                  )),
              Center(
                child: Column(
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 25,
                        color: isDarkMode,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 66,
                        color: isDarkMode,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
