import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    //catching values from loading page through arguments;
    data= data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    //print(data);

    // set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    //String bgImage = data['isDaytime'] ? 'night.png' : 'day.png';

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40,160,20,20),
            child: Column(
              children: [
                FlatButton.icon(
                  padding:EdgeInsets.all(20.0),
                    onPressed:() async{
                     dynamic result =await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data = {
                         'time' : result['time'],
                         'location': result['location'],
                         'flag': result['flag'],
                         'isDaytime': result['isDaytime'],
                       };
                     });
                    } ,
                    icon: Icon(Icons.edit_location,color: Colors.amber,size: 20,),
                    label: Text("Edit Location",style: TextStyle(color: Colors.amber,fontSize: 20),),
                ),
                const SizedBox(height: 40),
                Text(data['location'],style: TextStyle(letterSpacing: 2.0,fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                const SizedBox(height: 10),
                Text(data['time'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.white)),
                const SizedBox(height: 190),
                Text(data['isDaytime'] ? "It's Day" : "It's night",style: TextStyle(color: Colors.white,fontSize: 30),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
