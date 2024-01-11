import 'package:flutter_grocery_store/backend/models/user_model.dart';
import 'package:flutter_grocery_store/backend/repository/profile_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
//========================= variable ===========================================
  final ProfileRepository _repository = ProfileRepository();
  User? user;
//========================= methods ============================================
  Future<void> getUserInformation() async {
    final response = await _repository.getUserInformation();
    user = response;
    update();
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    getUserInformation();
    super.onInit();
  }


}