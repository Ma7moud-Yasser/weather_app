import 'package:chat_app/style/image.dart';
import 'package:chat_app/view/noWeatherScreen.dart';
import 'package:chat_app/view/searchScreen.dart';
import 'package:chat_app/view/weatherScreeb.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(fit: StackFit.expand, children: [
        const Image(
            image: AssetImage(WeatherAssets.background), fit: BoxFit.cover),
        SafeArea(
          child: weatherModel == null
              ? const NoWeatherScreen()
              : const WeatherScreen(),
        ),
      ]),
    );
  }
}
