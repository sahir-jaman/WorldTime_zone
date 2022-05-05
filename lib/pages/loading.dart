import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Future<void> setupWorldTime() async{
    // creating an object as instance to catch WorldTime all data
    WorldTime instance = WorldTime(location: 'Dhaka',flag: 'BD.png',uRL: 'Asia/Dhaka');
    await instance.getTime(); // calling the getTime method;

    //want to pass the arguments to home page;
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,   //only true or false will come;
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: const Center(
          child:SpinKitThreeBounce(
            color: Colors.white,
            size: 100.0,
          ),
      ),
    );
  }
}
