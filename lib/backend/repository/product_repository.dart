import 'package:flutter_grocery_store/backend/models/product.dart';
import 'package:flutter_grocery_store/backend/repository/base_repository.dart';
import 'package:flutter_grocery_store/backend/response/category_response.dart';
import 'package:flutter_grocery_store/backend/response/dash_board_response.dart';
import 'package:flutter_grocery_store/backend/response/product_response.dart';
import 'package:flutter_grocery_store/backend/response/review_response.dart';

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
}