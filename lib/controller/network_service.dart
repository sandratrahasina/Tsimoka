import 'package:dio/dio.dart';

class  NetworkService {
  late Dio dio;

  String get baseUrl {
    return 'https://tsimoka.snovibox.com/';
  }
  
  Uri get baseUri {
    return Uri.parse('https://tsimoka.snovibox.com/api/');
  }

  NetworkService() {
    dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: false));
  }
}