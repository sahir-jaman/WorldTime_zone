import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(uRL: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(uRL: 'Pacific/Nauru', location: 'Nauru', flag: 'south_korea.png'),
    WorldTime(uRL: 'Asia/Dhaka', location: 'Dhaka', flag: 'Bangladesh.png'),
    WorldTime(uRL: 'Asia/Dhaka', location: 'Saudi Arab', flag: 'saudi.png'),
    WorldTime(uRL: 'Asia/Dhaka', location: "Afganistan", flag: 'afganistan.png'),
    WorldTime(uRL: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(uRL: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(uRL: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(uRL: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(uRL: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(uRL: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(uRL: 'Asia/Jakarta', location: 'Jakarta', flag: 'greece.png'),
    ///////////////////////////////////////////////////////////////////////
    WorldTime(uRL: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(uRL: 'Asia/Dhaka', location: 'Dhaka', flag: 'Bangladesh.png'),
    WorldTime(uRL: 'Asia/Dhaka', location: 'Saudi Arab', flag: 'saudi.png'),
    WorldTime(uRL: 'Asia/Dhaka', location: "Afganistan", flag: 'afganistan.png'),
    WorldTime(uRL: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(uRL: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(uRL: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(uRL: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(uRL: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(uRL: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(uRL: 'Asia/Jakarta', location: 'Jakarta', flag: 'greece.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.1,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location.toString()),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
