import 'package:chat_app/models/weatherModel.dart';

// Mapping weather statuses to corresponding image paths
//
// } else if (weatherStatusDay.contains("cloudy") ||
//     weatherStatusNight.contains("cloudy")) {
//   imagePath = "assets/cloudy.png";
// } else if (weatherStatusDay.contains("overcast") ||
//     weatherStatusNight.contains("overcast")) {
//   imagePath = "https://lottie.host/1bb3a5b2-054b-498c-a791-32f0ae09a0d2/WgnDTppJ3d.json";
// } else if (weatherStatusDay.contains("patchy rain possible") ||
//     weatherStatusNight.contains("patchy rain possible")) {
//   imagePath =
//       "https://lottie.host/b72e05a9-009d-4076-86fe-1fb3d392cf35/8jiVm28Ber.json";
// } else {
//   imagePath =
//       "https://lottie.host/8fe1c0d6-d1c8-4ea0-a8af-f391438fd7dc/9sSt5XFnqA.json";
// }
// https://lottie.host/d5d7b49c-d43f-4b4d-a917-0929cb18c117/MzuUN1OWVk.json
// //////////////////////////////////////////////////////////////
// ///////////////////////////////////////////////////////////
// ///

String checkWeatherStatus(WeatherModel weatherModel) {
  late String image;

  String conditionLowerCase = weatherModel
      .forecast!.forecastday![0].day!.condition!.text!
      .toLowerCase();

  if (conditionLowerCase.contains("sunny")) {
    image =
        "https://lottie.host/a68da3b2-5d2b-4f99-9137-9c813d89d90c/efzXu4bLwu.json";
  } else if (conditionLowerCase == "partly cloudy") {
    image =
        "https://lottie.host/2201c86d-95f3-49f1-9136-8a9da0565c03/mJ3WcRDEMl.json";
  } else if (conditionLowerCase.contains("cloud") ||
      conditionLowerCase.contains("overcast")) {
    image =
        "https://lottie.host/1bb3a5b2-054b-498c-a791-32f0ae09a0d2/WgnDTppJ3d.json";
  } else if (conditionLowerCase.contains("heavy rain") ||
      conditionLowerCase.contains("rain shower")) {
    image =
        "https://lottie.host/d5d7b49c-d43f-4b4d-a917-0929cb18c117/MzuUN1OWVk.json";
  } else if (conditionLowerCase.contains("patchy rain") ||
      conditionLowerCase.contains("light rain") ||
      conditionLowerCase.contains("mist") ||
      conditionLowerCase.contains("moderate rain")) {
    image =
        "https://lottie.host/b72e05a9-009d-4076-86fe-1fb3d392cf35/8jiVm28Ber.json";
  } else {
    image =
        "https://lottie.host/8fe1c0d6-d1c8-4ea0-a8af-f391438fd7dc/9sSt5XFnqA.json";
  }

  return image;
}
