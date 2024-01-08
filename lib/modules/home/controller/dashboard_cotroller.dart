import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:flutter_grocery_store/backend/response/dash_board_response.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
//========================= variable ===========================================
  final ProductRepository _productRepository = ProductRepository();
  DashboardResponse? dashboardData;

//========================= methods ============================================
  Future<void> fetchDashboardData() async {
    dashboardData = await _productRepository.getDashboardData();
    update();
  }

//========================= life cycle =========================================

@override
  void onInit() {
    fetchDashboardData();
    super.onInit();
  }

}