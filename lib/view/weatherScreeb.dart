import 'dart:ui';

import 'package:chat_app/components/check_weather_Status.dart';
import 'package:chat_app/components/format_time.dart';
import 'package:chat_app/components/graph.dart';
import 'package:chat_app/components/search.dart';
import 'package:chat_app/components/weatherInfoContainer.dart';
import 'package:chat_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:chat_app/models/weatherModel.dart';
import 'package:chat_app/style/color_manager.dart';
import 'package:chat_app/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${weatherModel.current?.tempC} °"
                    "5",
                    style: mainFont,
                  ),
                  Text(
                    "${weatherModel.location?.name},${weatherModel.location?.country}",
                    style: secondFont,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Last Update  ${formatTime(weatherModel.current?.lastUpdated)}",
                    style: townFont.copyWith(color: Colors.grey[700]),
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
          const Spacer(),
          Column(
            children: [
              Lottie.network(checkWeatherStatus(weatherModel),
                  width: 120, fit: BoxFit.cover),
              Text(
                "${weatherModel.forecast?.forecastday?[0].day?.condition?.text}",
                style: secondFont,
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              weatherInfoContainer(
                degreeTemp:
                    "${weatherModel.forecast?.forecastday?[0].day?.maxtempC?.round()} ",
                statusTemp: "Max Temp",
                context: context,
              ),
              weatherInfoContainer(
                degreeTemp:
                    "${weatherModel.forecast?.forecastday?[0].day?.avgtempC?.round()} ",
                statusTemp: "Avg Temp",
                context: context,
              ),
              weatherInfoContainer(
                degreeTemp:
                    "${weatherModel.forecast?.forecastday?[0].day?.mintempC?.round()} ",
                statusTemp: "Min Temp",
                context: context,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.semiTransparentWhite),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorManager.semiTransparentWhite
                              .withOpacity(0.1),
                        ),
                        child: BarChartSample1()),
                  )))
        ],
      ),
    );
  }
}
