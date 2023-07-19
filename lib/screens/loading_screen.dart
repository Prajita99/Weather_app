import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() { //initstate used when we have to start something as soon as the app starts running
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
        );
    
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
      )),
    );
  }

}