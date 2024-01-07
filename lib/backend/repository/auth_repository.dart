import 'package:flutter_grocery_store/backend/repository/base_repository.dart';
import 'package:flutter_grocery_store/backend/response/register_response.dart';

class AuthRepository extends BaseRepository {
  Future<RegisterResponse> register(
      {required String fullName,
      required String mobile,
      required String password,
      required String confirmPass}) async {
    final Map<String, dynamic> data = {
      "name": fullName,
      "mobile": mobile,
      "password": password,
      "password_confirmation": confirmPass
    };
    final response = await dio.post("/register", data: data);
    return RegisterResponse.fromJson(response.data);
  }
}