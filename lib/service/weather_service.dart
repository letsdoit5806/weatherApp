import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/secrets.dart';

class Weatherservice {
  static Future<List<WeatherData>> weatherData() async {
    const String cityName = "London";
    List<WeatherData> weather = [];

    try {
      final res = await http.get(
        Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$openWetherAPIKey"),
      );

      final data = jsonDecode(res.body);
      
      if (data['cod'] != '200') {
        throw Exception("An unexpected error occurred: ${data['message']}");
      }

      List list = data['list'];

      for (var item in list) {
        weather.add(WeatherData.fromJson(item)); // Assuming you have a fromJson constructor
      }

      return weather;
    } catch (e) {
      throw Exception("Error fetching weather data: $e");
    }
  }
}
