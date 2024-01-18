import 'package:chat_app/components/errorMessage.dart';
import 'package:chat_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:chat_app/cubit/get_weather_cubit/get_weather_state.dart';
import 'package:chat_app/style/color_manager.dart';
import 'package:chat_app/style/fonts.dart';
import 'package:chat_app/style/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isInputValid(String input) {
    return input.isNotEmpty && input.trim().isNotEmpty && input != "";
  }

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
                      color: const Color.fromARGB(255, 215, 8, 8),
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
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 215, 8, 8),
                            ),
                            filled: true,
                            hintText: "Enter City Name",
                            hintStyle: const TextStyle(
                                fontSize: 20, color: Colors.white),
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
                          var getWeatherCubit = GetWeatherCubit.get(context);
                          // BlocProvider.of<GetWeatherCubit>(context);

                          if (isInputValid(searchController.text)) {
                            getWeatherCubit.getWeather(
                                cityName: searchController.text);
                            Navigator.pop(context);
                          } else {
                            // Show a toast message for invalid input
                            showErrorToast("Please enter a valid city name");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                              0xFFCFF0FF), // Adjust the disabled color as needed
                          minimumSize: const Size(150, 50),
                          maximumSize: const Size(150, 50),
                          elevation: 5,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: BlocConsumer<GetWeatherCubit, WeatherState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is WeatherLoadingState) {
                              return const Center(
                                  child: CircularProgressIndicator.adaptive());
                            } else {
                              return Text(
                                "Search",
                                style: townFont.copyWith(
                                    color:
                                        const Color.fromARGB(255, 215, 8, 8)),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
