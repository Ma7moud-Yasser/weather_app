class WeatherModel {
  final String cityName;
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String weatherStatus;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.weatherStatus,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      date: json["current"]["last_updated"],
      temp: json["current"]["temp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      weatherStatus: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
