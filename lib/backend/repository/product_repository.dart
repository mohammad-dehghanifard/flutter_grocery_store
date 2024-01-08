import 'package:flutter_grocery_store/backend/repository/base_repository.dart';
import 'package:flutter_grocery_store/backend/response/category_response.dart';
import 'package:flutter_grocery_store/backend/response/dash_board_response.dart';

class ProductRepository extends BaseRepository {

  Future<DashboardResponse> getDashboardData() async {
    var response = await dio.get("/dashboard");
    return DashboardResponse.fromJson(response.data);
  }

  Future<CategoryResponse> getAllCategories() async {
    final response = await dio.get("/categories");
    return CategoryResponse.fromJson(response.data);
  }

}