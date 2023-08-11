// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app/exceptions/weather_exception.dart';
import 'package:weather_app/models/custom_error.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_api_service.dart';

class WeatherResposition {
  final WeatherApiServices weatherApiServices;
  WeatherResposition({
    required this.weatherApiServices,
  });

  Future<Weather> fetWeather(String city) async{
    try {
      final String url = await weatherApiServices.getCity(city);
      print('Ten thanh pho $url');

      final Weather weather = await weatherApiServices.getWeather(url);
      print('Thoi tiet: $weather');
      
      return weather;
    } on WeatherException catch(e) {
      throw CustomError(errMsg: e.message);
    } catch(e){
      throw CustomError(errMsg: e.toString());
    }
  }
}
