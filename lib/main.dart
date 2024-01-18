import 'package:chat_app/bloc_observe.dart';
import 'package:chat_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:chat_app/services/weatherService.dart';
import 'package:chat_app/style/color_manager.dart';
import 'package:chat_app/view/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = MyBlocObserver();
  ApiService.init();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: ColorManager.semiTransparentWhite),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
