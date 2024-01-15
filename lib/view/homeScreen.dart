import 'package:chat_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:chat_app/cubit/get_weather_cubit/get_weather_state.dart';
import 'package:chat_app/style/image.dart';
import 'package:chat_app/view/noWeatherScreen.dart';
import 'package:chat_app/view/weatherScreeb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          child: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is InitialWeatherState) {
                return const NoWeatherScreen();
              } else if (state is WeatherLoadedState) {
                return const WeatherScreen();
              } else {
                return const Text(
                    "Oops There Was an Error , Please Try Later ");
              }
            },
          ),
        ),
      ]),
    );
  }
}
