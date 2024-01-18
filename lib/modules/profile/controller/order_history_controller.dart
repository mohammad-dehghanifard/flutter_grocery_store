import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:flutter_grocery_store/backend/response/order_response.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {

//========================= variable ===========================================
  final ProductRepository _repository = ProductRepository();
  OrderResponse? orders;

//========================= methods ============================================
  Future<void> getAllOrdersHistory() async {
    final OrderResponse result = await _repository.getAllOrdersApi();
    orders = result;
    update();
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    getAllOrdersHistory();
    super.onInit();
  }
}