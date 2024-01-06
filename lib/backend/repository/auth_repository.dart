import 'package:flutter_grocery_store/backend/repository/base_repository.dart';

class AuthRepository extends BaseRepository {
  Future<void> register(
      {required String fullName,
      required String mobile,
      required String password,
      required String confirmPassword}) async {
    final Map<String,dynamic> data = {
      "name" : fullName,
      "mobile" : mobile,
      "password" : password,
      "password_confirmation" : confirmPassword
    };
    final response = await dio.post("/register",data: data);
  }
}