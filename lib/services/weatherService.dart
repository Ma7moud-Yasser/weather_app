import 'package:dio/dio.dart';

// class WeatherService {
//   static late Dio dio;
//   final String baseUrl = "https://api.weatherapi.com/v1";
//   final String apiKey = "2dd607951b4e438e891111015230906";
//   static init() {
//     dio = Dio(BaseOptions(
//       baseUrl: "https://api.weatherapi.com/v1",
//       receiveDataWhenStatusError: true,
//     ));
//   }

//   // WeatherService(this.dio);

//   Future getCurrentWeather({
//     required String cityName,
//   }) async {
//     try {
//       Response response = await dio
//           .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");

//       if (response.statusCode == 200) {
//         // Check if the response is successful before parsing
//         WeatherModel weatherModel = WeatherModel.fromJson(response.data);
//         return weatherModel;
//       } else if (response.statusCode == 400) {
//         // Handle bad request (status code 400)
//         print("Failed to fetch data. Status code: ${response.statusCode}");
//         showErrorToast(
//             'Bad Request: Invalid City Name'); // Change the duration as needed
//       } else {
//         // Handle other non-200 status codes if needed
//         print("Failed to fetch data. Status code: ${response.statusCode}");
//       }
//     } on Exception catch (e) {
//       // Handle other exceptions
//       print(e.toString());
//     } catch (e) {
//       print(e);
//     }
//   }
// }

class ApiService {
  static late Dio _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: "https://api.weatherapi.com/v1/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future getData({
    required String cityName,
    String? token,
  }) async {
    // _dio.options.headers['Authorization'] = '$token';
    return await _dio.get("forecast.json", queryParameters: {
      'key': "2dd607951b4e438e891111015230906",
      'days': '7',
      'q': cityName,
      'aqi': "no",
      'alerts': 'no',
    });
  }

  static Future postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    // _dio.options.headers['Authorization'] = '$token';
    return _dio.post(
      url,
      data: data,
    );
  }

  static Future deleteData({
    required String url,
    String? token,
  }) async {
    // _dio.options.headers['Authorization'] = '$token';
    return _dio.delete(url);
  }
}
