import 'package:chat_app/components/errorMessage.dart';
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
          child: BlocConsumer<GetWeatherCubit, WeatherState>(
            listener: (context, state) {
              if (state is WeatherFailureState) {
                return showErrorToast("Enter Valid City Name");
              }
            },
            builder: (context, state) {
              if (state is WeatherSuccessState) {
                return const WeatherScreen();
              } else if (state is WeatherLoadingState) {
                return const Center(
                    child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.red,
                ));
              }
              return const NoWeatherScreen();
            },
          ),
        ),
      ]),
    );
  }
}
