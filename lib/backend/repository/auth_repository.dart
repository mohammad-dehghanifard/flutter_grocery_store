import 'package:flutter_grocery_store/backend/repository/base_repository.dart';
import 'package:flutter_grocery_store/backend/response/auth_response.dart';
import 'package:flutter_grocery_store/helper/widgets/snack_bars.dart';

class AuthRepository extends BaseRepository {

  Future<AuthResponse?> register(
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

    if(response.statusCode == 200){
      showSnackBar(message: "ثبت نام شما با موفقیت انجام شد!",type: SnackBarType.success);
    }else{
      showSnackBar(message: response.data['message'],type: SnackBarType.error);
      return null;
    }

    return AuthResponse.fromJson(response.data);
  }
}