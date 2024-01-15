class WeatherState {}

class InitialWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  // First Way To Pass Data
  // final WeatherModel weatherModel;
  // WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {}
