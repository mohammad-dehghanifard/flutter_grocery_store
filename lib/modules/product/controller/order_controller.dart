import 'package:flutter_grocery_store/backend/models/address.dart';
import 'package:flutter_grocery_store/backend/repository/product_repository.dart';
import 'package:flutter_grocery_store/backend/repository/profile_repository.dart';
import 'package:flutter_grocery_store/backend/response/address_response.dart';
import 'package:flutter_grocery_store/helper/widgets/snack_bars.dart';
import 'package:flutter_grocery_store/modules/product/controller/cart_controller.dart';
import 'package:flutter_grocery_store/modules/product/pages/payment_page.dart';
import 'package:flutter_grocery_store/modules/product/widgets/shipping_radio_button_widget.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
//========================= variable ===========================================
  final ProfileRepository _repository = ProfileRepository();
  final ProductRepository _productRepository = ProductRepository();
  AddressResponse? addressResponse;
  ShippingMethod? shippingMethod;
  Address? selectedAddress;

//========================= methods ============================================

  Future<void> getAllAddress() async {
    var response = await _repository.getAllAddress();
    addressResponse = response;
    update();
  }

  Future<void> deleteAddress({required int id}) async {
    var response = await _repository.deleteAddress(id: id);
    if(response){
      addressResponse!.data!.removeWhere((address) => address.id == id );
      update();
      showSnackBar(message: "آدرس با موفقیت حذف شد!", type: SnackBarType.success);
    }
  }

  Future<void> navigateToPaymentPage() async {
    if(selectedAddress != null && shippingMethod != null ){
      final paymentLink = await _productRepository.getPaymentUrlApi(addressId: selectedAddress!.id!, shippingMethod: shippingMethod!.value);
      Get.to(PaymentPage(url: paymentLink));
    } else {
      showSnackBar(message: "لطفا آدرس و شیوه ارسال را انتخاب کنید", type: SnackBarType.error);
    }
  }

  void onChangeShippingMethod(ShippingMethod value) {
    shippingMethod = value;
    update();
  }

  void onChangeAddress(Address value) {
    selectedAddress = value;
    update();
  }

  String calculateTotalPrice() {
    var totalPrice = Get.find<CartController>().cartResponse!.totalPrice;
    var total = int.parse(totalPrice!.replaceAll(",", ""));
    int shoppingPrice = 0;
    if(shippingMethod != null){
      shoppingPrice = int.parse(shippingMethod!.price.replaceAll(",", ""));
    }
    return (total + shoppingPrice).toString();
  }

//========================= life cycle =========================================
  @override
  void onInit() {
    getAllAddress();
    super.onInit();
  }
}