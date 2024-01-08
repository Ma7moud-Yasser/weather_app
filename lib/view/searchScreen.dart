import 'dart:developer';
import 'package:chat_app/models/weatherModel.dart';
import 'package:chat_app/services/weatherService.dart';
import 'package:chat_app/style/color_manager.dart';
import 'package:chat_app/style/fonts.dart';
import 'package:chat_app/style/image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage(WeatherAssets.background),
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.semiTransparentWhite),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_outlined),
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage(
                          WeatherAssets.search,
                        ),
                        width: 150,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        color: ColorManager.semiTransparentBlue,
                        child: TextFormField(
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: searchController,
                          style: inputFont,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[700],
                            ),
                            filled: true,
                            hintText: "Enter City Name",
                            hintStyle: TextStyle(fontSize: 20),
                            fillColor: ColorManager.semiTransparentBlue,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: ColorManager.semiTransparentBlue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          weatherModel = await WeatherService(Dio())
                              .getCurrentWeather(
                                  cityName: searchController.text);
                          log(weatherModel!.cityName);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFCFF0FF),
                          minimumSize: const Size(150, 50),
                          maximumSize: const Size(150, 50),
                          elevation: 5,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Search",
                          style: townFont.copyWith(color: Color(0xFF7E435C)),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

WeatherModel? weatherModel;
