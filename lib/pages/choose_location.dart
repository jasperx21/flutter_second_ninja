import 'package:flutter/material.dart';
import 'package:fluttersecondninja/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

    List<WorldTime> locations = [
      WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
      WorldTime(url: 'America/Mexico_City', location: 'Mexico', flag: 'mexico.jpg'),
      WorldTime(url: 'Europe/London', location: 'England', flag: 'england.webp')
    ];

    void updateTime(index) async{
      WorldTime instance = locations[index];
      await instance.getTime();

      //navigate to home screen
      Navigator.pop(context,{
        'location' : instance.location,
        'time' : instance.time,
        'flag' : instance.flag,
        'isDayTime' : instance.isDayTime,
      });
    }

  @override
  Widget build(BuildContext context) {
    print('Build func ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        elevation: 2.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },)
    );
  }
}
