import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/exceptions/weather_exception.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/other/api_key.dart';
import 'package:weather_app/services/http_error_handle.dart';


class WeatherApiServices {
  final http.Client httpClient;
  
  WeatherApiServices({
    required this.httpClient,
  });


Future<String> getCity(String city) async{
  final Uri uri = Uri(
    scheme: 'https',
    host: kHost,
    path: '/search.json?key=${ApiKey}&',
    queryParameters: {
      'q': city,
    }
  );

  try {
    final http.Response response = await http.get(uri);
  
    if(response.statusCode != 200){
      throw Exception(httpErrorHandler(response));
    }

    final responseBody = json.decode(response.body);
    if(responseBody.isEmpty){
      throw WeatherException('Cannot get the city name of $city');
    }

    if(responseBody.length > 1){
      throw Exception('There are multiple candidates for $city \nPlease specify furthur');
    }
    
    return responseBody[0]['url'];

  } catch (e) {
    rethrow;
  } 
}
 Future<Weather> getWeather(String url) async{
    final Uri uri = Uri(
    scheme: 'https',
    host: kHost,
    path: '/current.json?key=${ApiKey}&q=$url',
    
  );
  try {
    final http.Response response = await http.get(uri);

    if(response.statusCode != 200){
      throw Exception(httpErrorHandler(response));
    }

    final weatherJson = json.decode(response.body);
    final Weather weather = Weather.fromJson(weatherJson);
    print(weather);

    return weather;
  } catch (e) {
    rethrow;
  }
  }
}