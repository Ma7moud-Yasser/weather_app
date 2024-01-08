import 'package:chat_app/components/search.dart';
import 'package:chat_app/components/weatherInfoContainer.dart';
import 'package:chat_app/style/color_manager.dart';
import 'package:chat_app/style/fonts.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    "-°",
                    style: mainFont,
                  ),
                  Text(
                    "Strowe Mountain",
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
                degreeTemp: "19",
                statusTemp: "Max Temp",
              ),
              weatherInfoContainer(
                degreeTemp: "15",
                statusTemp: "avr Temp",
              ),
              weatherInfoContainer(
                degreeTemp: "12",
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
