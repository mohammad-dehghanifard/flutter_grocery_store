import 'package:dio/dio.dart';

class BaseRepository {
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://shop.hitaldev.ir/api',
      validateStatus: (status) => status! < 500,
      headers: {
        "Accept" : "application/json"
      }
  ));
}