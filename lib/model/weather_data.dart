class WeatherData {
  DateTime dateTime;
  String icon;
  double temp; // Changed to double

  WeatherData({
    required this.dateTime,
    required this.icon,
    required this.temp, // Now expecting a double for temp
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
      icon: json['weather'][0]['icon'],
      temp: json['main']['temp'].toDouble(), // Convert the temp to double here
    );
  }

  void display(){
    print("date :$dateTime");
    print("icon :$icon");
    print("temp :$temp");
    print("\n\n");
  }
}
