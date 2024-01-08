import 'dart:developer';

import 'package:chat_app/components/errorMessage.dart';
import 'package:chat_app/models/weatherModel.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "2dd607951b4e438e891111015230906";
  WeatherService(this.dio);
  Future<WeatherModel?> getCurrentWeather({
    required String cityName,
  }) async {
    try {
      Response response =
          await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&day=1");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]['message'] ??
          "Oops There Was an error, try later";
      showErrorToast(errorMessage);
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops There Was an error, try later");
    }
  }
}
