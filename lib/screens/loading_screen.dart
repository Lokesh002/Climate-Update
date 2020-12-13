import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel weatherModel = WeatherModel();

  void getLocation() async {
    var decodedData = await weatherModel.getWeatherData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationData: decodedData);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SpinKitWanderingCubes(
            color: Colors.white,
            shape: BoxShape.rectangle,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
