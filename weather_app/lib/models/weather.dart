
import 'package:equatable/equatable.dart';

class Weather extends Equatable{
  final String conditionText;
  final String conditionIcon;
  final String date;
  // final double minTempC;
  // final double maxTempC;
  final double theTemp;
  final String nameCity;
  final String url;
  final DateTime lastUpdated;
  Weather({
    required this.conditionText,
    required this.conditionIcon,
    required this.date,
    // required this.minTempC,
    // required this.maxTempC,
    required this.theTemp,
    required this.url,
    required this.nameCity,

    required this.lastUpdated,
  });

  factory Weather.fromJson(Map<String, dynamic> json){
    final consolidatedWeather = json['consolidatedWeather'][0];

    return Weather(
      conditionText: consolidatedWeather['condition:text'], 
      conditionIcon: consolidatedWeather['condition:icon'], 
      date: consolidatedWeather['date'], 
      // minTempC: consolidatedWeather['mintemp_c'], 
      // maxTempC: consolidatedWeather['maxtemp_c'],  
      theTemp: consolidatedWeather['temp_c'],
      nameCity: json['name'], 
      url: consolidatedWeather['url'],
      lastUpdated: DateTime.now(),
    );
  }
  
  factory Weather.initial() => Weather(
    conditionText: '', 
    conditionIcon: '', 
    date: '', 
    // minTempC: 100.0, 
    // maxTempC: 100.0, 
    theTemp: 100.0,
    nameCity: '', 
    url: '',
    lastUpdated: DateTime(1999)
  );

  @override
  List<Object?> get props {
    return[
      conditionText,
      conditionIcon,
      date,
      // minTempC,
      // maxTempC,
      nameCity,
      url,
      lastUpdated
    ];
  }
}
