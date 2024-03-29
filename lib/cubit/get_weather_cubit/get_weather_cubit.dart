// use to manage state
import 'package:chat_app/cubit/get_weather_cubit/get_weather_state.dart';
import 'package:chat_app/models/weatherModel.dart';
import 'package:chat_app/services/weatherService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialWeatherState());
  static GetWeatherCubit get(context) => BlocProvider.of(context);
  late WeatherModel weatherModel;

  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      // Await the response directly and handle errors using catch
      await ApiService.getData(cityName: cityName).then((value) {
        weatherModel = WeatherModel.fromJson(value.data);
        print(value.data);
        emit(WeatherSuccessState());
      });
    } catch (e) {
      print('Error in getWeather: $e');
      emit(WeatherFailureState());
    }
  }
}
