import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime{
  String? location;  // location name for the UI
  String? time;     // the time in that location
  String? flag;     // url to an asset flag icon
  String? uRL;     // location url for api endpoint
  bool? isDaytime;

  WorldTime({this.location,this.flag,this.uRL});

  Future<void> getTime() async {

    try{
      //make the request
      var url = Uri.parse('http://worldtimeapi.org/api/timezone/$uRL');
      http.Response response = await http.get(url);
      Map data = convert.jsonDecode(response.body);

      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      /*print(dateTime);
       print(offset);*/

      //create DateTime object(now)
      //here we are going to change the format to am/pm by parsing;
      DateTime now = DateTime.parse(dateTime); //DateTime is one of the class names in the intl library package
      now = now.add(Duration(hours:int.parse(offset))); //parsing in hour formate

      //set the property
      isDaytime = now.hour > 6 && now.hour < 19 ? true:false ;
      time =DateFormat.jm().format(now);


    }
    catch(e){
      //print("Cought Error: $e");
      time= "Please connect to the internet`";
    }
  }

}


