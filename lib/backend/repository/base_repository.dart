import 'package:dio/dio.dart';
import 'package:flutter_grocery_store/helper/user_helper.dart';
import 'package:get/get.dart';

class BaseRepository {
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://shop.hitaldev.ir/api',
      validateStatus: (status) {
        return status! < 500;
      },
      followRedirects: false,
      headers: {
        "Accept" : "application/json",
        "Authorization" : "Bearer ${Get.find<UserHelper>().token}"
      }
  ));

  void getMethod(){

  }
}