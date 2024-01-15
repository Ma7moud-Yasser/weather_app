import 'package:chat_app/components/search.dart';
import 'package:chat_app/components/weatherInfoContainer.dart';
import 'package:chat_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:chat_app/models/weatherModel.dart';
import 'package:chat_app/style/color_manager.dart';
import 'package:chat_app/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${weatherModel.temp}°",
                    style: mainFont,
                  ),
                  Text(
                    weatherModel.cityName,
                    style: townFont,
                  )
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.semiTransparentWhite,
                ),
                child: searchComponent(context),
              )
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              weatherInfoContainer(
                degreeTemp: "${weatherModel.maxTemp}",
                statusTemp: "Max Temp",
              ),
              weatherInfoContainer(
                degreeTemp: "${weatherModel.avgTemp}",
                statusTemp: "avr Temp",
              ),
              weatherInfoContainer(
                degreeTemp: "${weatherModel.minTemp}",
                statusTemp: "Min Temp",
              ),
            ],
          ),
          Row()
        ],
      ),
    );
  }
}
