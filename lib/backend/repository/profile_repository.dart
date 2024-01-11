import 'package:flutter_grocery_store/backend/models/user_model.dart';
import 'package:flutter_grocery_store/backend/repository/base_repository.dart';

class ProfileRepository extends BaseRepository {
  // get profile info
  Future<User> getUserInformation() async {
    var response = await dio.get("/profile");
    return User.fromJson(response.data['data']);
  }
}