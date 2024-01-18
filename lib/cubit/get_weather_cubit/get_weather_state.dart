class WeatherState {}

class InitialWeatherState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  // First Way To Pass Data
  // final WeatherModel weatherModel;
  // WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {}
