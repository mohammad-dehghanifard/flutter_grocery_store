import 'package:dio/dio.dart';

class BaseRepository {
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://shop.hitaldev.ir/api',
      validateStatus: (status) {
        return status! < 500;
      },
      followRedirects: false,
      headers: {
        "Accept" : "application/json"
      }
  ));
}