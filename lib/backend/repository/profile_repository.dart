import 'package:flutter_grocery_store/backend/models/user_model.dart';
import 'package:flutter_grocery_store/backend/repository/base_repository.dart';
import 'package:flutter_grocery_store/backend/response/perovince_response.dart';
import 'package:flutter_grocery_store/helper/widgets/snack_bars.dart';

class ProfileRepository extends BaseRepository {
  // get profile info
  Future<User> getUserInformation() async {
    var response = await dio.get("/profile");
    return User.fromJson(response.data['data']);
  }
  // update profile
  Future<bool> updateUser({required String name, String? oldPassword, String? newPassword}) async {
    final response = await dio.post("/profile",data: {
      "name" : name,
      if(oldPassword != null && oldPassword.isNotEmpty)
        "old_password" : oldPassword,
      if(newPassword != null && newPassword.isNotEmpty)
        "new_password" : newPassword,
    });
    if(response.statusCode != 200){
      showSnackBar(message: response.data['message'], type: SnackBarType.error);
    }
    return response.statusCode == 200;
  }
  // get province
  Future<ProvinceResponse> getAllProvince() async {
    var response = await dio.get("/provinces");
    print(response.data);
    return ProvinceResponse.fromJson(response.data['data']);
  }
}