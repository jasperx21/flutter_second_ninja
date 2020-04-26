import 'package:flutter/material.dart';
import 'package:fluttersecondninja/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'India', flag: 'assets/india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    print(instance.time);
    /*setState(() {
      time = instance.time;
    });*/
    Future.delayed(Duration(milliseconds: 500), (){
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location' : instance.location,
        'flag' : instance.flag,
        'time' : instance.time,
        'isDayTime' : instance.isDayTime,
      });
    });
  }

  /*void getData() async {
    Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);
  }*/


  @override
  void initState() {
    super.initState();
//    getData();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: const SpinKitRing(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
