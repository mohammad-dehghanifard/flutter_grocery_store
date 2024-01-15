import 'package:flutter_grocery_store/backend/models/product.dart';
import 'package:flutter_grocery_store/backend/repository/base_repository.dart';
import 'package:flutter_grocery_store/backend/response/cart_response.dart';
import 'package:flutter_grocery_store/backend/response/category_response.dart';
import 'package:flutter_grocery_store/backend/response/dash_board_response.dart';
import 'package:flutter_grocery_store/backend/response/product_response.dart';
import 'package:flutter_grocery_store/backend/response/review_response.dart';
import 'package:flutter_grocery_store/helper/widgets/snack_bars.dart';

class ProductRepository extends BaseRepository {
  // home api
  Future<DashboardResponse> getDashboardData() async {
    var response = await dio.get("/dashboard");
    return DashboardResponse.fromJson(response.data);
  }
  // all category
  Future<CategoryResponse> getAllCategories() async {
    final response = await dio.get("/categories");
    return CategoryResponse.fromJson(response.data);
  }
  // filter product
  Future<ProductResponse> filterProducts({int? categoryId, String? keyWord,String? orderColumn,String? orderType}) async {
    Map<String,dynamic> queryPrams = {};
    //#region check queryParameters
    if(categoryId != null){
      queryPrams['category_id'] = categoryId.toString();
    }
    if(keyWord != null){
      queryPrams['keyword'] = keyWord;
    }
    if(orderColumn != null){
      queryPrams['order_column'] = orderColumn;
    }
    if(orderType != null){
      queryPrams['order_type'] = orderType;
    }
    //#endregion
    final response = await dio.get("/products",queryParameters: queryPrams);
    return ProductResponse.fromJson(response.data);
  }
  // get product detail
  Future<Product> getProductDetail({required int id}) async {
    final response = await dio.get("/products/$id");
    return Product.fromJson(response.data['data']);
  }
  // get product comments
  Future<ReviewResponse> getAllProductReviews({required int id}) async {
    final response = await dio.get("/product/$id/reviews");
    return ReviewResponse.fromJson(response.data);
  }
  // add comment for product
  Future<bool> addComment({required int productId,required int rate , required String text}) async {
    var response = await dio.post("/review",data: {
      "product_id" : productId.toString(),
      "rate" : rate.toString(),
      "comment" : text
    });
    return response.statusCode == 200;
  }
  // add product to cart
  Future<int> addProductToCartApi({required int productId,required bool increment,bool delete = false}) async {
    var response = await dio.post("/add-to-cart",data: {
      "product_id": productId.toString(),
      "increment": increment,
      "delete" : delete
    });
    if(response.statusCode != 200){
      showSnackBar(
          message: "خطایی رخ داده لطفا دوباره امتحان کنید",
          type: SnackBarType.error);
    }
    return response.data['count'] ?? 0;
  }
  // get all product in cart
  Future<CartResponse> getAllProductInCartApi() async {
    var response = await dio.get("/cart");
    if(response.statusCode != 200){
      showSnackBar(
          message: "خطایی رخ داده لطفا دوباره امتحان کنید",
          type: SnackBarType.error);
    }
    return CartResponse.fromJson(response.data);
  }
}