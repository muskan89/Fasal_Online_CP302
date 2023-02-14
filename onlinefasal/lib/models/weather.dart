// ignore_for_file: non_constant_identifier_names

class Weather {
  final String error;
  final int City_id;
  final String Temperature;
  final String feel_like;
  final String Humidity;
  final String atm_pressure;
  final String weth_Report;
  final String wind_Speed;

  Weather(
      {required this.error,
      required this.City_id,
      required this.Temperature,
      required this.feel_like,
      required this.Humidity,
      required this.atm_pressure,
      required this.weth_Report,
      required this.wind_Speed});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        error: (json['error'] != null) ? json['error'] : "error",
        City_id: (json['City_id'] != null) ? json['City_id'] : 0,
        Temperature: (json['Temperature'] != null)
            ? json['Temperature']
            : "not available",
        feel_like:
            (json['feel_like'] != null) ? json['feel_like'] : "not available",
        Humidity:
            (json['Humidity'] != null) ? json['Humidity'] : "not available",
        atm_pressure: (json['atm_pressure'] != null)
            ? json['atm_pressure']
            : "not available",
        weth_Report: (json['weth_Report'] != null)
            ? json['weth_Report']
            : "not available",
        wind_Speed: (json['wind_Speed'] != null)
            ? json['wind_Speed']
            : "not available");
  }
}
